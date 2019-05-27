    LD  VA, 2  ; Set left player X coord.
    LD  VB, 12 ; Set left player Y coord.
    LD  VC, 63 ; Set right player X coord.
    LD  VD, 12 ; Set right player Y coord.

    LD  I,  80 ; Get address of paddle sprite
    DRW VA, VB, 6  ; Draw left paddle
    DRW VC, VD, 6  ; Draw right paddle

    LD  VE, 0       ; Set score to 00
    CALL Draw_Score ; Draw score

    LD  V6, 3 ; Set X coord. of ball to 3
    LD  V8, 2 ; Set ball X direction to right


Big_Loop:

    LD  V0, 0x60 ; Set V0=delay before ball launch
    LD  DT, V0  ; Set delay timer to V0
	
DT_Loop:        ;
    LD  V0, DT  ; Read delay timer into V0
    SE  V0, 0   ; Skip next instruction if V0=0
    JP  DT_Loop ; Read again delay timer if not 0

    RND V7, 23  ; Set Y coord. to rand # AND 23 (0...23)
    ADD V7, 8   ; And adjust it to is 8...31

    LD  V9, 0xFF   ; Set ball Y direction to up
    LD  I, 08   ; Get address of ball sprite
    DRW V6, V7, 1 ; Draw ball

Padl_Loop:
    LD  I, 80 ; Get address of paddle sprite
    DRW VA, VB, 6 ; Draw left paddle
    DRW VC, VD, 6 ; Draw right paddle

    LD  V0, 1   ; Set V0 to KEY 1
    SKNP V0     ; Skip next instruction if KEY in 1 is not pressed
    ADD VB, 0xFE ; Subtract 2 from Y coord. of left paddle

    LD  V0, 4   ; Set V0 to KEY 4
    SKNP V0     ; Skip next instruction if KEY in 4 is not pressed
    ADD VB, 2   ; Add 2 to Y coord. of left paddle

    LD  V0, 31    ; Set V0 to max Y coord.  | These three lines are here to
    AND VB, V0    ; AND VB with V0          | adjust the paddle position if
    DRW VA, VB, 6 ; Draw left paddle        | it is out of the screen

    LD  V0, 0x0C ; Set V0 to KEY C
    SKNP V0     ; Skip next instruction if KEY in C is not pressed
    ADD VD, 0xFE ; Subtract 2 from Y coord. of right paddle

    LD  V0, 0x0D ; Set V0 to KEY D
    SKNP V0     ; Skip next instruction if KEY in D is not pressed 
    ADD VD, 2   ; Add 2 to Y coord. of right paddle

    LD  V0, 31    ; Set V0 to max Y coord.  | These three lines are here to
    AND VD, V0    ; AND VD with V0          | adjust the paddle position if
    DRW VC, VD, 6 ; Draw right paddle       | it is out of the screen

    LD  I, 08   ; Get address of ball sprite
    DRW V6, V7, 1 ; Draw ball

    ADD V6, V8  ; Compute next X coord of the ball
    ADD V7, V9  ; Compute next Y coord of the ball

    LD  V0, 63  ; Set V0 to max X location
    AND V6, V0  ; AND V6 with V0

    LD  V1, 31  ; Set V1 to max Y location
    AND V7, V1  ; AND V7 with V1

    SNE V6, 2      ; Skip next instruction if ball not at left
    JP  Left_Side  ;

    SNE V6, 63     ; Skip next instruction if ball not at right
    JP  Right_Side ; 

Ball_Loop:
    SNE V7, 31  ; Skip next instruction if ball not at bottom
    LD  V9, 0xFF ; Set Y direction to up

    SNE V7, 0   ; Skip next instruction if ball not at top
    LD  V9, 1   ; Set Y direction to down

    DRW V6, V7, 1 ; Draw ball
    JP  Padl_Loop ;

Left_Side:
    LD  V8, 2    ; Set X direction to right
    LD  V3, 1    ; Set V3 to 1 in case left player misses ball
    LD  V0, V7   ; Set V0 to V7 Y coord. of ball
    SUB V0, VB   ; Subtract position of paddle from ball
    JP  Pad_Coll ; Check for collision

Right_Side:
    LD  V8, 254  ; Set X direction to left
    LD  V3, 10   ; Set V3 to 10 in case right player misses ball
    LD  V0, V7   ; Set V0 to V7 Y coord. of ball
    SUB V0, VD   ; Subtract position of paddle from ball

Pad_Coll:
    SE  VF, 1     ; Skip next instruction if ball not above paddle
    JP  Ball_Lost ;

    LD  V1, 2    ; Set V1 to 02
    SUB V0, V1   ; Subtract V1 from V0
    SE  VF, 1    ; Skip next instr. if ball not at top of paddle
    JP  Ball_Top ; Ball at top of paddle

    SUB V0, V1   ; Subtract another 2 from V0
    SE  VF, 1    ; Skip next instr. if ball not at middle of paddle
    JP  Pad_Hit  ; Ball in middle of paddle

    SUB V0, V1   ; Subtract another 2 from V0
    SE  VF, 1    ; Skip next instr. if ball not at bottom of paddle
    JP  Ball_Bot ; Ball at bottom of paddle

Ball_Lost:
    LD  V0, 32  ; Set lost ball beep delay
    LD  ST, V0  ; Beep for lost ball

    CALL Draw_Score ; Erase previous score
    ADD VE, V3      ; Add 1 or 10 to score depending on V3
    CALL Draw_Score ; Write new score

    LD  V6, 62  ; Set ball X coord. to right side
    SE  V3, 1   ; Skip next instr. if right player got point
    LD  V6, 3   ; Set ball X coord. to left side
    LD  V8, 0xFE ; Set direction to left
    SE  V3, 1   ; Skip next instr. if right player got point
    LD  V8, 2   ; Set direction to right
    JP Big_Loop ;

Ball_Top:
    ADD V9, 0xFF ; Subtract 1 from V9, ball Y direction
    SNE V9, 0xFE ; Skip next instr. if V9 != FE (-2)
    LD  V9, 0xFF ; Set V9=FF (-1)
    JP  Pad_Hit

Ball_Bot:
    ADD V9, 1   ; Add 1 to V9, ball Y direction
    SNE V9, 2   ; Skip next instr. if V9 != 02
    LD  V9, 1   ; Set V9=01

Pad_Hit:
    LD  V0, 4   ; Set beep for paddle hit
    LD  ST, V0  ; Sound beep

    ADD V6, 1   ;
    SNE V6, 64  ;
    ADD V6, 254 ;

    JP  Ball_Loop

Draw_Score:
    LD  I,  00   ; Get address of Score
    LD  B,  VE      ; Stores in memory BCD representation of VE
    LD  V2, [I]     ; Reads V0...V2 in memory, so the score
    LD  F,  V1      ; I points to hex char in V1, so the 1st score char
    LD  V4, 14     ; Set V4 to the X coord. to draw 1st score char
    LD  V5, 0       ; Set V5 to the Y coord. to draw 1st score char
    DRW V4, V5, 5   ; Draw 8*5 sprite at (V4,V5) from M[I], so char V1
    ADD V4, 15     ; Set X to the X coord. of 2nd score char
    LD  F, V2       ; I points to hex char in V2, so 2nd score char
    DRW V4, V5, 5   ; Draw 8*5 sprite at (V4,V5) from M[I], so char V2
    RET             ; Return
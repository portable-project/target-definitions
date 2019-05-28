
lb $r1, 0x0($r9)
lh $r2, 0x1($r10)
lw $r3, 0x2($r11)
lbu $r7, 0x2($r11)
lhu $r8, 0x3($r12)
lb $r17, 0x7($r9)
lh $r18, 0x8($r10)
lw $r19, 0x0($r11)
lw $r20, 0x4($r12)

add $r13, $r1, $r11
sub $r14, $r12, $r2
mul $r15, $r3, $r4
muh $r16, $r5, $r6
mulu $r17, $r7, $r8
muhu $r18, $r9, $r10

sb $r1, 0x1($r9)
sh $r2, 0x1($r10)
sw $r3, 0x1($r11)
sb $r17, 0x1($r9)
sh $r18, 0x1($r10)
sw $r19, 0x1($r11)
sw $r20, 0x1($r12)

wrpgpr $r11, $r12

AND $r1, $r3, $r5
OR $r7, $r9, $r11
XOR $r2, $r4, $r6
rotrv $r8, $r10, $r12
seleqz $r1, $r3, $r5
selnez $r7, $r9, $r11
slt $r2, $r4, $r6
sltu $r8, $r10, $r12
sllv $r1, $r3, $r5
srlv $r7, $r9, $r11
srav $r2, $r4, $r6

lui $r5, 10
auipc $r1, 0x123

crc32b $r12, $r11
crc32h $r11, $r10
crc32w $r10, $r12

crc32cb $r9, $r8
crc32ch $r8, $r7
crc32cw $r7, $r9

b 420

bal 0x1111
beq $r13, $r12, 0x1111

bal 0x1111
balc 200
bc 280
beq $r1, $r2, 150
bgez $r1, 50
bgtzalc $r4, 110
beqzalc $r5, 120
bnezalc $r6, 130
blezalc $r7, 140
blezc $r8, 200
bgtzc $r9, 210
beqzc $r10, 220
bnezc $r11, 230
bgtz $r12, 300
blez $r13, 310
bltz $r14, 320
bne $r15, $r16, 400
j 500
jal 600
jalr $r15
jalr $r15, $r16
jalrhb $r17
jalrhb $r17, $r18
jialc $r20, 700
jic $r21, 750
jr $r22
jrhb $r23

di
ei
BREAK
deret
di $r28
ei $r29
dvp $r27
evp $r26
ehb
eret
eretnc
pause
sdbbp 20
sigrie 30
sync
sync 8
syscall

wait
teq $r4, $r5
tge $r6, $r7
tgeu $r8, $r9
tlt $r10, $r11
tltu $r12, $r13
tne $r14, $r15

align $r10, $r11, $r12, 3
aluipc $r19, 200
bitswap $r18, $r20

clo $r16, $r17
clz $r16, $r17
ext $r18, $r19, 20, 18
ins $r18, $r19, 16, 5
seb $r22, $r23
seh $r24, $r25
wsbh $r11, $r21

cache 7, 100($r5)
cachee 9, 120($r8)
ginvi $r3
ginvt $r10, 12
pref 2, 50($r1)
prefe 4, 100($r9)
tlbinv
tlbinvf
tlbp
tlbr
tlbwi
tlbwr
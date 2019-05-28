;~~~~~~~~~~~~~~VALID~~~~~~~~~~~~~~~~~;
start:
.test:
	aaa
;	aad 
	aad 255
;	aam 
	aam 7
	aas
	adc AX, [EAX]
	adc AH, [EAX]
	adc EAX, [EAX + 100]
	adc [EAX], EAX
	adc [100 + EAX+EAX*8], EAX
	adc [100 + EAX+EAX*8], AX
;	adc [100], EAX
	adc [EAX * 8], EDX
	add EAX, EAX
	add EAX, [EBP]
	add EDX, [100 + EAX + EAX *8]
;	add EAX,            [      1000]
;	add EAX, [ 1000 + EAX]
	add EAX, [EAX]
	add EAX, [EAX*8]
	add EAX, [ EAX + 8] ; parser can't understand if it's 8 or 32 bit num
	add EAX, [EDX + EAX]                                                             
	add EAX, [EAX + EAX]
	add EAX, [EDX + EAX * 8]
	add EAX, [ EDX + EDX ]
	add EAX, [ EDX + EAX ]
	add EAX, [EAX + EAX]
;	add EAX, [ 100 + EDX]
	add EAX, [EAX+EAX*4]
	add EAX, [EAX+EAX*8]
	AND EAX, EAX
	AND AX, [EAX]
	AND AH, [EAX]
	AND EAX, [EAX + 100]
	AND [EAX], EAX
	AND [100 + EAX+EAX*8], EAX
	AND [100 + EAX+EAX*8], AX
;	AND [100], EAX
	AND [EAX * 8], EDX
;	AND EAX, [1000]
;	AND EAX, [ 1000 + EAX]
	AND EAX, [EAX]
	AND EAX, [EAX*8]
	AND EAX, [ EAX + 8] ; parser can't understand if it's 8 or 32 bit num
	AND EAX, [EDX + EAX]                                                             
	AND EAX, [EAX + EAX]
	AND EAX, [EDX + EAX * 8]
	AND EAX, [ EDX + EDX ]
	AND EAX, [ EDX + EAX ]
	AND EAX, [EAX + EAX]
	AND EAX, [ 100 + EDX]

	adcx EAX, [EAX*8]
	adcx EAX, EAX
	adcx EDX, EAX
	adox EAX,EAX
	adox EAX, [EAX*4]
	add EAX, .test
	arpl AX, DX
	arpl [EAX], AX
	bound EAX, [EAX]
	bound AX, [EAX]
	bsf AX,AX
	bsf EAX,EAX
	bsf EAX, [EAX*8]
        bsr AX,AX
	bsr EAX,EAX
	bsr EAX, [EAX*8]
	bt [EAX], EAX
;	bt EDX, 100
	bt [EDX *8],EAX 
	bt EAX, EBX
	bt AX, AX
;	bt 20000, 100
	bts [EAX], EAX
;	bts EDX, 100
	bts [EDX *8], EAX
	bts EAX, EBX
	bts AX, AX
	btr [EAX], EAX
;	btr EDX, 100
	btr [EDX *8], EAX
	btr EAX, EBX
	btr AX, AX
	btc [EAX], EAX
;	btc EDX, 100
	btc [EDX *8], EAX
	btc EAX, EBX
	btc AX, AX

 
	bswap EAX
	bswap ECX
	bswap EDX
	bswap EBX
	cwd
	cdq		
	cbw  ; here's smth wrong with mnemonics
	cwde  ; here's smth wrong with mnemonics
        clc
	cld
	cli
	clts
	cmc
	cpuid
	cwde
	daa
	das		
	dec EDX
	dec DX
	dec DL
	hlt
	int3
	int 8 
	in AL, 22
	in AX, 22
	in EAX, 22
	in AL, DX
	in AX, DX
	in EAX, DX
	into
	invd    	
	out 22, AL
	out 22, AX
	out 22, EAX
	out DX, AL
	out DX, AX
	out DX, EAX
	pusha
	;pushad 
	pushf
	;pushfd
        
	rdmsr
	rdpmc   
	rdtsc
	rdtscp
	ret
	ret 22
	rsm
	sahf



;cmova eax, [10000 + ecx + eax * 8]
;cmova eax, eax
;jmp [100]
;jmp 100
;jmp EAX
;jmp [EAX + 200]
;add EAX, 333
;add AX, 200
;add AL, 100
;add EAX, -333
;add EDX, 333
;add EDX, -333
;add EAX, EAX
;add AX,AX
;add AL, AL
;add EDX, 1000
;add EDX, -1000
;add EDX, 8
;add EDX, 256
;add EDX, -8
;add DL, 8
;add EAX, [EBP]
;add [EBP], EAX
;add EAX, [EBP]
;add EAX, [100+AL+EAX*4]
;add EAX, [100+ EBP+EAX] 
;add EAX, [EAX+100+EAX*8] 
;add EAX, [100 + EAX*8]
;	add word [EAX*8], 8
;	add dword [EAX*8], 1000
;	add EDX, 8
;	add EDX, 1000

;	call [EAX]
;	call [EAX*8]
;	call .kk
;	call 2000




;add EAX, [8 + EAX + EAX * 4]
;add EAX, [8 + EAX + EAX * 8]
;add EAX, [ EAX+8 + EAX * 4]
;add EAX, [ EAX+8 + EAX * 4]
;check 8

;adc edx, edx
;adc edx, 1
;adc edx, 500
;adc eax, 1
;adcx eax, eax
;add EAX, [EAX * 4]
;add EAX, [EDX]
;add ECX, [222 + 4]
;add EAX, [222 + EAX]
;add EAX, [222]
;add ECX, [EBX*1]
;add ECX, [EBX]

;add EAX, [EAX + EAX * 4]
;add ECX, [EBP * 4]
;add ECX, [EBP + EAX]
;add ECX, [EDX + EAX]
;add EBX, [EBP]
;add ECX, [EDX + EAX]
;add ECX, [333+EBX]
;add ECX, [EBX*2]
;add ECX, [EBX+EBX*1]
;add ECX, [EBX+EBX]
;add ECX, [333+EBX*2]
;add ECX, [333 + EBX + EDX*2]

;add EAX, [EAX * 4]
;add ECX, [EBX*8]
;add ECX, [ebx + 333]
;add ECX, [ebx + ecx]
;add EAX, [EBX]       
;add AX, [BX]        
;add AH, [EBX]        
;add AL, [EBX]
;add EAX, [ BX + AX]
;		add [EAX], EBX
;		add [EAX], BX
;		add [EAX], BH
;		add [EAX], BL

;		add EBP,[EBX]
;		add EAX, [ESI + EAX]
;		add EAX, [ESI + 1000000]
;		add EBP, [ 10000000+EAX*1]
;add EDX, [100000000]


;add eax, [ebx]        
;	add eax, 0x32
;		add AX, AX
;	add ecx, 0x32
;		and eax, 8
;		and eax, 255
;		and edx, 8
	
;		nop
;check EAX, [EBX *4]
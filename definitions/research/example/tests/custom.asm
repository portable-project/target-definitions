
#	db  4+2;

	[section pram, code]

	ldc r0, 0x10
	ldc r1, 0xabcd
	store d[r0], r1
	store c[r0], r1

	load r2, d[r0]
	load r3, c[r0]

	add r0, -5

	sjmp lab
	
	db 0x56, 0x78
	cjmp 0x12
	db 0xab, 0xcd
#db 0x12
# dq 0x1231535
#ldc	r0, 0x123
#ldc	r3, 0x456
#add r0, 0x789
#add r0, r1


	db 0x12, 0x34
	fff_a
	db 0x12, 0x34
	
lab: ; comment
	rb
	ldc r2, lab ; comment
	ldc r2, 0x66
	wb
	hlt

    times 16 db -3
	resb 8+8
	db 0x12, 0x34

	incbin 0


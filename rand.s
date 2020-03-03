init_rand:
	call system_time
	mov [randq], rax
	xor rcx, rcx
.loop:
	call next_rand
	inc rcx
	cmp rcx, 64
	jl .loop
	ret

next_rand:
	mov rax, [randq]
	shl rax, 1
	inc rax
	xor rdx, rdx
	mov r10, PRIME
	div r10
	mov rax, rdx
	mov [randq], rax
	ret


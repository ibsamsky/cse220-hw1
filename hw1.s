	.text
	.intel_syntax noprefix
	.file	"hw1.c"
	.globl	itopos                          # -- Begin function itopos
	.p2align	4, 0x90
	.type	itopos,@function
itopos:                                 # @itopos
	.cfi_startproc
# %bb.0:
	mov	eax, edi
	cdq
	idiv	esi
	shl	eax, 4
	or	eax, edx
                                        # kill: def $al killed $al killed $eax
	ret
.Lfunc_end0:
	.size	itopos, .Lfunc_end0-itopos
	.cfi_endproc
                                        # -- End function
	.globl	strnmatch                       # -- Begin function strnmatch
	.p2align	4, 0x90
	.type	strnmatch,@function
strnmatch:                              # @strnmatch
	.cfi_startproc
# %bb.0:
	test	edi, edi
	jle	.LBB1_1
# %bb.3:
	push	r15
	.cfi_def_cfa_offset 16
	push	r14
	.cfi_def_cfa_offset 24
	push	r12
	.cfi_def_cfa_offset 32
	push	rbx
	.cfi_def_cfa_offset 40
	push	rax
	.cfi_def_cfa_offset 48
	.cfi_offset rbx, -40
	.cfi_offset r12, -32
	.cfi_offset r14, -24
	.cfi_offset r15, -16
	mov	rbx, rdx
	mov	r14, rsi
	movsxd	r15, edi
	mov	r12d, 1
	.p2align	4, 0x90
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	movsx	edi, byte ptr [r14 + r12 - 1]
	call	rbx
	test	al, al
	je	.LBB1_6
# %bb.5:                                #   in Loop: Header=BB1_4 Depth=1
	lea	rcx, [r12 + 1]
	cmp	r12, r15
	mov	r12, rcx
	jl	.LBB1_4
.LBB1_6:
	add	rsp, 8
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	.cfi_restore rbx
	.cfi_restore r12
	.cfi_restore r14
	.cfi_restore r15
	ret
.LBB1_1:
	mov	al, 1
	ret
.Lfunc_end1:
	.size	strnmatch, .Lfunc_end1-strnmatch
	.cfi_endproc
                                        # -- End function
	.globl	char_in_range                   # -- Begin function char_in_range
	.p2align	4, 0x90
	.type	char_in_range,@function
char_in_range:                          # @char_in_range
	.cfi_startproc
# %bb.0:
	cmp	dil, sil
	setge	cl
	cmp	dil, dl
	setle	al
	and	al, cl
	ret
.Lfunc_end2:
	.size	char_in_range, .Lfunc_end2-char_in_range
	.cfi_endproc
                                        # -- End function
	.globl	valid_state                     # -- Begin function valid_state
	.p2align	4, 0x90
	.type	valid_state,@function
valid_state:                            # @valid_state
	.cfi_startproc
# %bb.0:
	mov	al, 1
	cmp	dil, 45
	je	.LBB3_2
# %bb.1:
	movzx	eax, byte ptr [rip + length]
	add	al, 48
	cmp	dil, 49
	setge	cl
	cmp	al, dil
	setge	al
	and	al, cl
.LBB3_2:
	ret
.Lfunc_end3:
	.size	valid_state, .Lfunc_end3-valid_state
	.cfi_endproc
                                        # -- End function
	.globl	valid_key                       # -- Begin function valid_key
	.p2align	4, 0x90
	.type	valid_key,@function
valid_key:                              # @valid_key
	.cfi_startproc
# %bb.0:
	movzx	eax, byte ptr [rip + length]
	add	al, 48
	cmp	dil, 48
	setge	cl
	cmp	al, dil
	setge	al
	and	al, cl
	ret
.Lfunc_end4:
	.size	valid_key, .Lfunc_end4-valid_key
	.cfi_endproc
                                        # -- End function
	.globl	print_board                     # -- Begin function print_board
	.p2align	4, 0x90
	.type	print_board,@function
print_board:                            # @print_board
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	push	rax
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	lea	rdi, [rip + .L.str]
	xor	eax, eax
	call	printf@PLT
	cmp	dword ptr [rip + length], 0
	jle	.LBB5_3
# %bb.1:
	lea	r14, [rip + top_key]
	lea	rbx, [rip + .L.str.1]
	xor	r15d, r15d
	.p2align	4, 0x90
.LBB5_2:                                # =>This Inner Loop Header: Depth=1
	mov	esi, dword ptr [r14]
	mov	rdi, rbx
	xor	eax, eax
	call	printf@PLT
	inc	r15
	movsxd	rax, dword ptr [rip + length]
	add	r14, 4
	cmp	r15, rax
	jl	.LBB5_2
.LBB5_3:
	lea	rdi, [rip + .L.str.2]
	xor	eax, eax
	call	printf@PLT
	cmp	dword ptr [rip + length], 0
	jle	.LBB5_12
# %bb.4:
	lea	rbx, [rip + .L.str.3]
	xor	ebp, ebp
	.p2align	4, 0x90
.LBB5_5:                                # =>This Inner Loop Header: Depth=1
	mov	rdi, rbx
	xor	eax, eax
	call	printf@PLT
	inc	ebp
	mov	eax, dword ptr [rip + length]
	cmp	ebp, eax
	jl	.LBB5_5
# %bb.6:
	test	eax, eax
	jle	.LBB5_12
# %bb.7:
	lea	r12, [rip + board]
	lea	r14, [rip + .L.str.5]
	lea	rbp, [rip + right_key]
	lea	r15, [rip + .L.str.6]
	xor	r13d, r13d
	jmp	.LBB5_8
	.p2align	4, 0x90
.LBB5_11:                               #   in Loop: Header=BB5_8 Depth=1
	mov	esi, dword ptr [rbp + 4*r13]
	mov	rdi, r15
	xor	eax, eax
	call	printf@PLT
	inc	r13
	movsxd	rax, dword ptr [rip + length]
	add	r12, 8
	cmp	r13, rax
	jge	.LBB5_12
.LBB5_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_10 Depth 2
	lea	rax, [rip + left_key]
	mov	esi, dword ptr [rax + 4*r13]
	lea	rdi, [rip + .L.str.4]
	xor	eax, eax
	call	printf@PLT
	cmp	dword ptr [rip + length], 0
	jle	.LBB5_11
# %bb.9:                                #   in Loop: Header=BB5_8 Depth=1
	xor	ebx, ebx
	.p2align	4, 0x90
.LBB5_10:                               #   Parent Loop BB5_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsx	esi, byte ptr [r12 + rbx]
	mov	rdi, r14
	xor	eax, eax
	call	printf@PLT
	inc	rbx
	movsxd	rax, dword ptr [rip + length]
	cmp	rbx, rax
	jl	.LBB5_10
	jmp	.LBB5_11
.LBB5_12:
	lea	rdi, [rip + .L.str.2]
	xor	eax, eax
	call	printf@PLT
	cmp	dword ptr [rip + length], 0
	jle	.LBB5_15
# %bb.13:
	lea	rbx, [rip + .L.str.7]
	xor	ebp, ebp
	.p2align	4, 0x90
.LBB5_14:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, rbx
	xor	eax, eax
	call	printf@PLT
	inc	ebp
	cmp	ebp, dword ptr [rip + length]
	jl	.LBB5_14
.LBB5_15:
	lea	rdi, [rip + .L.str.2]
	xor	eax, eax
	call	printf@PLT
	cmp	dword ptr [rip + length], 0
	jle	.LBB5_18
# %bb.16:
	lea	r14, [rip + bottom_key]
	lea	rbx, [rip + .L.str.1]
	xor	r15d, r15d
	.p2align	4, 0x90
.LBB5_17:                               # =>This Inner Loop Header: Depth=1
	mov	esi, dword ptr [r14]
	mov	rdi, rbx
	xor	eax, eax
	call	printf@PLT
	inc	r15
	movsxd	rax, dword ptr [rip + length]
	add	r14, 4
	cmp	r15, rax
	jl	.LBB5_17
.LBB5_18:
	mov	edi, 10
	add	rsp, 8
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT                     # TAILCALL
.Lfunc_end5:
	.size	print_board, .Lfunc_end5-print_board
	.cfi_endproc
                                        # -- End function
	.globl	read_int_range                  # -- Begin function read_int_range
	.p2align	4, 0x90
	.type	read_int_range,@function
read_int_range:                         # @read_int_range
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r12
	.cfi_def_cfa_offset 40
	push	rbx
	.cfi_def_cfa_offset 48
	sub	rsp, 48
	.cfi_def_cfa_offset 96
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	ebp, edx
	mov	r14d, esi
	mov	rbx, rdi
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rsp + 40], rax
	mov	dword ptr [rsp + 12], 0
	lea	rdi, [rip + .L.str.9]
	xor	r15d, r15d
	lea	r12, [rsp + 31]
	lea	rdx, [rsp + 12]
	mov	rsi, r12
	xor	eax, eax
	call	__isoc99_scanf@PLT
	test	eax, eax
	jle	.LBB6_8
# %bb.1:
	lea	rsi, [rsp + 16]
	mov	rdi, r12
	mov	edx, 10
	call	strtol@PLT
	cmp	qword ptr [rsp + 16], r12
	je	.LBB6_4
# %bb.2:
	mov	r15, rax
	call	__errno_location@PLT
	cmp	dword ptr [rax], 34
	sete	al
	cmp	r15, 2147483647
	setg	cl
	or	cl, al
	jne	.LBB6_4
# %bb.5:
	cmp	r15d, r14d
	setl	al
	cmp	r15d, ebp
	setg	cl
	or	cl, al
	je	.LBB6_7
.LBB6_4:
	xor	r15d, r15d
.LBB6_8:
	mov	rax, qword ptr fs:[40]
	cmp	rax, qword ptr [rsp + 40]
	jne	.LBB6_10
.LBB6_9:
	mov	eax, r15d
	add	rsp, 48
	.cfi_def_cfa_offset 48
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB6_7:
	.cfi_def_cfa_offset 96
	mov	dword ptr [rbx], r15d
	mov	r15b, 1
	mov	rax, qword ptr fs:[40]
	cmp	rax, qword ptr [rsp + 40]
	je	.LBB6_9
.LBB6_10:
	call	__stack_chk_fail@PLT
.Lfunc_end6:
	.size	read_int_range, .Lfunc_end6-read_int_range
	.cfi_endproc
                                        # -- End function
	.globl	parse_int_range                 # -- Begin function parse_int_range
	.p2align	4, 0x90
	.type	parse_int_range,@function
parse_int_range:                        # @parse_int_range
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r12
	.cfi_def_cfa_offset 40
	push	rbx
	.cfi_def_cfa_offset 48
	sub	rsp, 16
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	ebp, ecx
	mov	r14d, edx
	mov	r12, rsi
	mov	rbx, rdi
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rsp + 8], rax
	mov	rsi, rsp
	mov	rdi, r12
	mov	edx, 10
	call	strtol@PLT
	cmp	qword ptr [rsp], r12
	je	.LBB7_3
# %bb.1:
	mov	r15, rax
	call	__errno_location@PLT
	cmp	dword ptr [rax], 34
	sete	al
	cmp	r15, 2147483647
	setg	cl
	or	cl, al
	jne	.LBB7_3
# %bb.4:
	cmp	r15d, r14d
	setl	al
	cmp	r15d, ebp
	setg	cl
	or	cl, al
	je	.LBB7_6
.LBB7_3:
	xor	eax, eax
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rsp + 8]
	jne	.LBB7_9
.LBB7_8:
                                        # kill: def $al killed $al killed $eax
	add	rsp, 16
	.cfi_def_cfa_offset 48
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB7_6:
	.cfi_def_cfa_offset 64
	mov	dword ptr [rbx], r15d
	mov	al, 1
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rsp + 8]
	je	.LBB7_8
.LBB7_9:
	call	__stack_chk_fail@PLT
.Lfunc_end7:
	.size	parse_int_range, .Lfunc_end7-parse_int_range
	.cfi_endproc
                                        # -- End function
	.globl	get_move                        # -- Begin function get_move
	.p2align	4, 0x90
	.type	get_move,@function
get_move:                               # @get_move
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 56
	.cfi_def_cfa_offset 112
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rsp + 48], rax
	lea	rbx, [rip + .L.str.10]
	lea	r14, [rip + .L.str.11]
	lea	r15, [rsp + 30]
	lea	r13, [rip + .L.str.13]
	jmp	.LBB8_1
	.p2align	4, 0x90
.LBB8_7:                                #   in Loop: Header=BB8_1 Depth=1
	mov	rdi, r13
	xor	eax, eax
	call	printf@PLT
	test	eax, eax
	jle	.LBB8_8
.LBB8_1:                                # =>This Inner Loop Header: Depth=1
	mov	esi, dword ptr [rip + length]
	mov	rdi, rbx
	xor	eax, eax
	call	printf@PLT
	mov	rdi, r14
	mov	rsi, r15
	xor	eax, eax
	call	__isoc99_scanf@PLT
	cmp	word ptr [rsp + 30], 113
	je	.LBB8_2
# %bb.3:                                #   in Loop: Header=BB8_1 Depth=1
	movzx	r12d, byte ptr [rsp + 30]
	cmp	r12b, 45
	je	.LBB8_4
# %bb.5:                                #   in Loop: Header=BB8_1 Depth=1
	cmp	r12b, 49
	jl	.LBB8_7
# %bb.6:                                #   in Loop: Header=BB8_1 Depth=1
	movzx	eax, byte ptr [rip + length]
	add	al, 48
	cmp	al, r12b
	jl	.LBB8_7
	jmp	.LBB8_9
.LBB8_2:
	mov	ebx, 2
	jmp	.LBB8_33
.LBB8_4:
	mov	r12b, 45
	jmp	.LBB8_9
.LBB8_8:
	movzx	r12d, byte ptr [rsp + 30]
.LBB8_9:
	lea	rbx, [rsp + 39]
	lea	r13, [rsp + 12]
	lea	rbp, [rip + .L.str.13]
	jmp	.LBB8_10
	.p2align	4, 0x90
.LBB8_15:                               #   in Loop: Header=BB8_10 Depth=1
	mov	rdi, rbp
	xor	eax, eax
	call	printf@PLT
                                        # implicit-def: $r14d
	test	eax, eax
	jle	.LBB8_16
.LBB8_10:                               # =>This Inner Loop Header: Depth=1
	mov	esi, dword ptr [rip + length]
	dec	esi
	lea	rdi, [rip + .L.str.14]
	xor	eax, eax
	call	printf@PLT
	mov	r15d, dword ptr [rip + length]
	mov	dword ptr [rsp + 12], 0
	lea	rdi, [rip + .L.str.9]
	mov	rsi, rbx
	mov	rdx, r13
	xor	eax, eax
	call	__isoc99_scanf@PLT
	test	eax, eax
	jle	.LBB8_15
# %bb.11:                               #   in Loop: Header=BB8_10 Depth=1
	mov	rdi, rbx
	lea	rsi, [rsp + 16]
	mov	edx, 10
	call	strtol@PLT
	cmp	qword ptr [rsp + 16], rbx
	je	.LBB8_15
# %bb.12:                               #   in Loop: Header=BB8_10 Depth=1
	mov	r14, rax
	call	__errno_location@PLT
	cmp	dword ptr [rax], 34
	sete	al
	cmp	r14, 2147483647
	setg	cl
	or	cl, al
	jne	.LBB8_15
# %bb.13:                               #   in Loop: Header=BB8_10 Depth=1
	test	r14d, r14d
	js	.LBB8_15
# %bb.14:                               #   in Loop: Header=BB8_10 Depth=1
	cmp	r15d, r14d
	jle	.LBB8_15
.LBB8_16:
	lea	rbp, [rip + .L.str.13]
	jmp	.LBB8_17
	.p2align	4, 0x90
.LBB8_22:                               #   in Loop: Header=BB8_17 Depth=1
	mov	rdi, rbp
	xor	eax, eax
	call	printf@PLT
                                        # implicit-def: $r15d
	test	eax, eax
	jle	.LBB8_23
.LBB8_17:                               # =>This Inner Loop Header: Depth=1
	mov	esi, dword ptr [rip + length]
	dec	esi
	lea	rdi, [rip + .L.str.15]
	xor	eax, eax
	call	printf@PLT
	mov	r13d, dword ptr [rip + length]
	mov	dword ptr [rsp + 12], 0
	lea	rdi, [rip + .L.str.9]
	mov	rsi, rbx
	lea	rdx, [rsp + 12]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	test	eax, eax
	jle	.LBB8_22
# %bb.18:                               #   in Loop: Header=BB8_17 Depth=1
	mov	rdi, rbx
	lea	rsi, [rsp + 16]
	mov	edx, 10
	call	strtol@PLT
	cmp	qword ptr [rsp + 16], rbx
	je	.LBB8_22
# %bb.19:                               #   in Loop: Header=BB8_17 Depth=1
	mov	r15, rax
	call	__errno_location@PLT
	cmp	dword ptr [rax], 34
	sete	al
	cmp	r15, 2147483647
	setg	cl
	or	cl, al
	jne	.LBB8_22
# %bb.20:                               #   in Loop: Header=BB8_17 Depth=1
	test	r15d, r15d
	js	.LBB8_22
# %bb.21:                               #   in Loop: Header=BB8_17 Depth=1
	cmp	r13d, r15d
	jle	.LBB8_22
.LBB8_23:
	movsxd	rax, r14d
	movsxd	r13, r15d
	lea	rcx, [rip + board]
	lea	rbp, [rcx + 8*rax]
	mov	ebx, 16
	lea	r15, [rip + .Lstr.26]
	cmp	byte ptr [r13 + rbp], 45
	jne	.LBB8_32
# %bb.24:
	add	rbp, r13
	mov	byte ptr [rbp], r12b
	mov	edi, r14d
	call	check_row
	mov	r14, rax
	mov	edi, r13d
	call	check_col
	mov	rbx, rax
	or	rbx, r14
	cmp	rbx, 4
	jae	.LBB8_25
# %bb.26:
	mov	rax, rbx
	or	rax, 32
	dec	dword ptr [rip + remaining]
	cmove	rbx, rax
	test	bl, 16
	je	.LBB8_28
	jmp	.LBB8_32
.LBB8_25:
	mov	byte ptr [rbp], 45
	test	bl, 16
	jne	.LBB8_32
.LBB8_28:
	test	bl, 4
	jne	.LBB8_29
# %bb.30:
	test	bl, 8
	je	.LBB8_33
# %bb.31:
	lea	r15, [rip + .Lstr]
	jmp	.LBB8_32
.LBB8_29:
	lea	r15, [rip + .Lstr.25]
.LBB8_32:
	mov	rdi, r15
	call	puts@PLT
.LBB8_33:
	mov	rax, qword ptr fs:[40]
	cmp	rax, qword ptr [rsp + 48]
	jne	.LBB8_35
# %bb.34:
	mov	rax, rbx
	add	rsp, 56
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB8_35:
	.cfi_def_cfa_offset 112
	call	__stack_chk_fail@PLT
.Lfunc_end8:
	.size	get_move, .Lfunc_end8-get_move
	.cfi_endproc
                                        # -- End function
	.globl	try_move                        # -- Begin function try_move
	.p2align	4, 0x90
	.type	try_move,@function
try_move:                               # @try_move
	.cfi_startproc
# %bb.0:
	push	r15
	.cfi_def_cfa_offset 16
	push	r14
	.cfi_def_cfa_offset 24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset rbx, -32
	.cfi_offset r14, -24
	.cfi_offset r15, -16
	movsxd	rax, esi
	movsxd	rbx, edx
	lea	rcx, [rip + board]
	lea	r15, [rcx + 8*rax]
	mov	eax, 16
	cmp	byte ptr [rbx + r15], 45
	jne	.LBB9_4
# %bb.1:
	add	r15, rbx
	mov	byte ptr [r15], dil
	mov	edi, esi
	call	check_row
	mov	r14, rax
	mov	edi, ebx
	call	check_col
	or	rax, r14
	cmp	rax, 4
	jae	.LBB9_2
# %bb.3:
	mov	rcx, rax
	or	rcx, 32
	dec	dword ptr [rip + remaining]
	cmove	rax, rcx
.LBB9_4:
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.LBB9_2:
	.cfi_def_cfa_offset 32
	mov	byte ptr [r15], 45
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end9:
	.size	try_move, .Lfunc_end9-try_move
	.cfi_endproc
                                        # -- End function
	.globl	check_dupes_col                 # -- Begin function check_dupes_col
	.p2align	4, 0x90
	.type	check_dupes_col,@function
check_dupes_col:                        # @check_dupes_col
	.cfi_startproc
# %bb.0:
	movsxd	rcx, dword ptr [rip + length]
	mov	eax, 1
	test	rcx, rcx
	jle	.LBB10_6
# %bb.1:
	movsxd	rdx, edi
	xor	esi, esi
	lea	rdi, [rip + board]
	mov	r8d, 1
	xor	r9d, r9d
	jmp	.LBB10_3
	.p2align	4, 0x90
.LBB10_2:                               #   in Loop: Header=BB10_3 Depth=1
	inc	rsi
	cmp	rcx, rsi
	je	.LBB10_6
.LBB10_3:                               # =>This Inner Loop Header: Depth=1
	lea	r10, [rdx + 8*rsi]
	movsx	r10d, byte ptr [rdi + r10]
	cmp	r10d, 45
	je	.LBB10_2
# %bb.4:                                #   in Loop: Header=BB10_3 Depth=1
	add	r10b, -49
	shlx	r10d, r8d, r10d
	movzx	r11d, r9b
	movzx	r9d, r10b
	or	r9d, r11d
	cmp	r9d, r11d
	jne	.LBB10_2
# %bb.5:
	mov	eax, 4
.LBB10_6:
	ret
.Lfunc_end10:
	.size	check_dupes_col, .Lfunc_end10-check_dupes_col
	.cfi_endproc
                                        # -- End function
	.globl	check_dupes_row                 # -- Begin function check_dupes_row
	.p2align	4, 0x90
	.type	check_dupes_row,@function
check_dupes_row:                        # @check_dupes_row
	.cfi_startproc
# %bb.0:
	movsxd	rcx, dword ptr [rip + length]
	mov	eax, 1
	test	rcx, rcx
	jle	.LBB11_6
# %bb.1:
	movsxd	rdx, edi
	shl	rdx, 3
	xor	esi, esi
	lea	rdi, [rip + board]
	mov	r8d, 1
	xor	r9d, r9d
	jmp	.LBB11_3
	.p2align	4, 0x90
.LBB11_2:                               #   in Loop: Header=BB11_3 Depth=1
	inc	rsi
	cmp	rcx, rsi
	je	.LBB11_6
.LBB11_3:                               # =>This Inner Loop Header: Depth=1
	lea	r10, [rdx + rsi]
	movsx	r10d, byte ptr [rdi + r10]
	cmp	r10d, 45
	je	.LBB11_2
# %bb.4:                                #   in Loop: Header=BB11_3 Depth=1
	add	r10b, -49
	shlx	r10d, r8d, r10d
	movzx	r11d, r9b
	movzx	r9d, r10b
	or	r9d, r11d
	cmp	r9d, r11d
	jne	.LBB11_2
# %bb.5:
	mov	eax, 4
.LBB11_6:
	ret
.Lfunc_end11:
	.size	check_dupes_row, .Lfunc_end11-check_dupes_row
	.cfi_endproc
                                        # -- End function
	.globl	nvisible                        # -- Begin function nvisible
	.p2align	4, 0x90
	.type	nvisible,@function
nvisible:                               # @nvisible
	.cfi_startproc
# %bb.0:
	test	edi, edi
	jle	.LBB12_1
# %bb.2:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r10d, edi
	lea	rcx, [rsi + r10]
	mov	eax, r10d
	and	eax, 3
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	cmp	edi, 4
	jae	.LBB12_9
# %bb.3:
	mov	r8b, 48
	xor	r9d, r9d
	mov	dil, 48
	xor	ebx, ebx
	xor	eax, eax
.LBB12_4:
	mov	r14, qword ptr [rsp - 16]       # 8-byte Reload
	test	r14, r14
	je	.LBB12_7
# %bb.5:
	add	rsi, r9
	not	r9
	add	rcx, r9
	xor	r9d, r9d
	.p2align	4, 0x90
.LBB12_6:                               # =>This Inner Loop Header: Depth=1
	movzx	edx, byte ptr [rsi + r9]
	movzx	r10d, byte ptr [rcx]
	cmp	dl, r8b
	setg	r11b
	movzx	r8d, r8b
	cmovg	r8d, edx
	add	al, r11b
	cmp	r10b, dil
	setg	dl
	movzx	edi, dil
	cmovg	edi, r10d
	add	bl, dl
	inc	r9
	dec	rcx
	cmp	r14, r9
	jne	.LBB12_6
.LBB12_7:
	shl	al, 4
	or	al, bl
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	.cfi_restore rbx
	.cfi_restore r12
	.cfi_restore r13
	.cfi_restore r14
	.cfi_restore r15
	.cfi_restore rbp
                                        # kill: def $al killed $al killed $eax
	ret
.LBB12_1:
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	ret
.LBB12_9:
	.cfi_def_cfa_offset 56
	.cfi_offset rbx, -56
	.cfi_offset rbp, -16
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	eax, r10d
	and	eax, 2147483644
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	dec	r10
	mov	r8b, 48
	xor	r9d, r9d
	mov	dil, 48
	xor	r14d, r14d
	xor	eax, eax
	jmp	.LBB12_10
	.p2align	4, 0x90
.LBB12_12:                              #   in Loop: Header=BB12_10 Depth=1
	add	al, bpl
	add	al, r13b
	add	al, r11b
	add	al, bl
	add	r14b, byte ptr [rsp - 17]       # 1-byte Folded Reload
	add	r14b, r12b
	add	r14b, dl
	mov	rdx, r9
	xor	rdx, -4
	movzx	edx, byte ptr [rcx + rdx]
	cmp	dl, dil
	setg	bl
	cmovg	edi, edx
	add	bl, r14b
	add	r9, 4
	add	r10, -4
	mov	r14d, ebx
	cmp	qword ptr [rsp - 8], r9         # 8-byte Folded Reload
	je	.LBB12_4
.LBB12_10:                              # =>This Inner Loop Header: Depth=1
	movzx	edx, byte ptr [rsi + r9]
	cmp	dl, r8b
	setg	bpl
	movzx	r11d, byte ptr [rsi + r10]
	movzx	r15d, r8b
	cmovg	r15d, edx
	cmp	r11b, dil
	setg	byte ptr [rsp - 17]             # 1-byte Folded Spill
	movzx	edi, dil
	cmovg	edi, r11d
	movzx	edx, byte ptr [rsi + r9 + 1]
	mov	r8, r9
	xor	r8, -2
	movzx	r8d, byte ptr [rcx + r8]
	cmp	dl, r15b
	setg	r13b
	cmovg	r15d, edx
	cmp	r8b, dil
	setg	r12b
	cmovg	edi, r8d
	movzx	edx, byte ptr [rsi + r9 + 2]
	mov	r8, r9
	xor	r8, -3
	movzx	r8d, byte ptr [rcx + r8]
	cmp	dl, r15b
	setg	r11b
	cmovg	r15d, edx
	cmp	r8b, dil
	setg	dl
	cmovg	edi, r8d
	movzx	r8d, byte ptr [rsi + r9 + 3]
	cmp	r8b, r15b
	setg	bl
	jg	.LBB12_12
# %bb.11:                               #   in Loop: Header=BB12_10 Depth=1
	mov	r8d, r15d
	jmp	.LBB12_12
.Lfunc_end12:
	.size	nvisible, .Lfunc_end12-nvisible
	.cfi_endproc
                                        # -- End function
	.globl	check_row                       # -- Begin function check_row
	.p2align	4, 0x90
	.type	check_row,@function
check_row:                              # @check_row
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	movsxd	rbx, dword ptr [rip + length]
	movsxd	r14, edi
	test	rbx, rbx
	jle	.LBB13_14
# %bb.1:
	lea	rax, [8*r14]
	xor	ecx, ecx
	lea	r15, [rip + board]
	mov	edx, 1
	xor	esi, esi
	jmp	.LBB13_3
	.p2align	4, 0x90
.LBB13_2:                               #   in Loop: Header=BB13_3 Depth=1
	inc	rcx
	cmp	rbx, rcx
	je	.LBB13_6
.LBB13_3:                               # =>This Inner Loop Header: Depth=1
	lea	rdi, [rax + rcx]
	movsx	edi, byte ptr [r15 + rdi]
	cmp	edi, 45
	je	.LBB13_2
# %bb.4:                                #   in Loop: Header=BB13_3 Depth=1
	add	dil, -49
	shlx	edi, edx, edi
	movzx	r8d, sil
	movzx	esi, dil
	or	esi, r8d
	cmp	esi, r8d
	jne	.LBB13_2
# %bb.5:
	mov	eax, 4
	jmp	.LBB13_19
.LBB13_6:
	lea	r12, [r15 + 8*r14]
	mov	rdi, r12
	mov	esi, 45
	mov	rdx, rbx
	call	memchr@PLT
	mov	rcx, rax
	mov	eax, 1
	test	rcx, rcx
	jne	.LBB13_19
# %bb.7:
	test	ebx, ebx
	jle	.LBB13_16
# %bb.8:
	mov	eax, ebx
	and	eax, 3
	mov	qword ptr [rsp + 16], rax       # 8-byte Spill
	cmp	ebx, 4
	mov	qword ptr [rsp + 24], r14       # 8-byte Spill
	jae	.LBB13_20
# %bb.9:
	mov	r15b, 48
	xor	edi, edi
	mov	dl, 48
	xor	r11d, r11d
	xor	ecx, ecx
.LBB13_10:
	mov	r12, qword ptr [rsp + 16]       # 8-byte Reload
	test	r12, r12
	mov	r14, qword ptr [rsp + 24]       # 8-byte Reload
	je	.LBB13_13
# %bb.11:
	lea	r8, [rbx + 8*r14]
	lea	r9, [rdi + 8*r14]
	not	rdi
	lea	rax, [rip + board]
	add	r8, rax
	add	r8, rdi
	add	r9, rax
	xor	edi, edi
	.p2align	4, 0x90
.LBB13_12:                              # =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [r9 + rdi]
	movzx	esi, byte ptr [r8]
	cmp	al, r15b
	setg	r10b
	movzx	r15d, r15b
	cmovg	r15d, eax
	add	cl, r10b
	cmp	sil, dl
	setg	al
	movzx	edx, dl
	cmovg	edx, esi
	add	r11b, al
	inc	rdi
	dec	r8
	cmp	r12, rdi
	jne	.LBB13_12
.LBB13_13:
	shl	cl, 4
	or	cl, r11b
	movzx	ecx, cl
	lea	rax, [rip + left_key]
	mov	edx, dword ptr [rax + 4*r14]
	test	edx, edx
	jne	.LBB13_17
	jmp	.LBB13_18
.LBB13_14:
	lea	rax, [rip + board]
	lea	rdi, [rax + 8*r14]
	mov	esi, 45
	mov	rdx, rbx
	call	memchr@PLT
	mov	rcx, rax
	mov	eax, 1
	test	rcx, rcx
	jne	.LBB13_19
.LBB13_16:
	xor	ecx, ecx
	lea	rax, [rip + left_key]
	mov	edx, dword ptr [rax + 4*r14]
	test	edx, edx
	je	.LBB13_18
.LBB13_17:
	mov	esi, ecx
	shr	esi, 4
	mov	eax, 8
	cmp	esi, edx
	jne	.LBB13_19
.LBB13_18:
	and	ecx, 7
	lea	rax, [rip + right_key]
	mov	edx, dword ptr [rax + 4*r14]
	cmp	ecx, edx
	mov	ecx, 1
	mov	eax, 8
	cmove	rax, rcx
	test	edx, edx
	cmove	rax, rcx
.LBB13_19:
	add	rsp, 40
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB13_20:
	.cfi_def_cfa_offset 96
	mov	eax, ebx
	and	eax, 2147483644
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	lea	r9, [r15 + 8*r14]
	add	r9, 3
	lea	r10, [rbx + r12]
	dec	r10
	add	r12, rbx
	mov	r15b, 48
	xor	edi, edi
	mov	dl, 48
	xor	r13d, r13d
	xor	ecx, ecx
	jmp	.LBB13_22
	.p2align	4, 0x90
.LBB13_21:                              #   in Loop: Header=BB13_22 Depth=1
	add	cl, byte ptr [rsp + 14]         # 1-byte Folded Reload
	add	cl, r8b
	add	cl, r14b
	add	cl, r11b
	add	r13b, byte ptr [rsp + 15]       # 1-byte Folded Reload
	add	r13b, al
	add	r13b, r12b
	mov	rax, rdi
	xor	rax, -4
	mov	r12, rbp
	movzx	eax, byte ptr [rbp + rax]
	cmp	al, dl
	setg	r11b
	cmovg	edx, eax
	add	r11b, r13b
	add	rdi, 4
	add	r10, -4
	mov	r13d, r11d
	cmp	qword ptr [rsp + 32], rdi       # 8-byte Folded Reload
	je	.LBB13_10
.LBB13_22:                              # =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [r9 + rdi - 3]
	cmp	al, r15b
	setg	byte ptr [rsp + 14]             # 1-byte Folded Spill
	movzx	r8d, byte ptr [r10]
	movzx	esi, r15b
	cmovg	esi, eax
	cmp	r8b, dl
	setg	byte ptr [rsp + 15]             # 1-byte Folded Spill
	movzx	edx, dl
	cmovg	edx, r8d
	movzx	eax, byte ptr [r9 + rdi - 2]
	mov	r8, rdi
	xor	r8, -2
	movzx	r11d, byte ptr [r12 + r8]
	cmp	al, sil
	setg	r8b
	cmovg	esi, eax
	cmp	r11b, dl
	setg	al
	cmovg	edx, r11d
	movzx	r11d, byte ptr [r9 + rdi - 1]
	mov	r14, rdi
	xor	r14, -3
	mov	rbp, r12
	movzx	r15d, byte ptr [r12 + r14]
	cmp	r11b, sil
	setg	r14b
	cmovg	esi, r11d
	cmp	r15b, dl
	setg	r12b
	cmovg	edx, r15d
	movzx	r15d, byte ptr [r9 + rdi]
	cmp	r15b, sil
	setg	r11b
	jg	.LBB13_21
# %bb.23:                               #   in Loop: Header=BB13_22 Depth=1
	mov	r15d, esi
	jmp	.LBB13_21
.Lfunc_end13:
	.size	check_row, .Lfunc_end13-check_row
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function check_col
.LCPI14_0:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI14_1:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI14_2:
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI14_3:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI14_4:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	4                               # 0x4
	.long	6                               # 0x6
.LCPI14_5:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
.LCPI14_6:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.section	.rodata,"a",@progbits
	.p2align	1, 0x0
.LCPI14_7:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.section	.rodata.cst8,"aM",@progbits,8
.LCPI14_8:
	.byte	0                               # 0x0
	.byte	2                               # 0x2
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	0                               # 0x0
	.byte	2                               # 0x2
	.byte	4                               # 0x4
	.byte	6                               # 0x6
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI14_9:
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.text
	.globl	check_col
	.p2align	4, 0x90
	.type	check_col,@function
check_col:                              # @check_col
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 72
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 48], rax
	mov	eax, dword ptr [rip + length]
	movsxd	rbx, edi
	test	eax, eax
	jle	.LBB14_6
# %bb.1:
	xor	ecx, ecx
	lea	rdx, [rip + board]
	mov	esi, 1
	xor	edi, edi
	jmp	.LBB14_3
	.p2align	4, 0x90
.LBB14_2:                               #   in Loop: Header=BB14_3 Depth=1
	inc	rcx
	cmp	rax, rcx
	je	.LBB14_6
.LBB14_3:                               # =>This Inner Loop Header: Depth=1
	lea	r8, [rbx + 8*rcx]
	movsx	r8d, byte ptr [rdx + r8]
	cmp	r8d, 45
	je	.LBB14_2
# %bb.4:                                #   in Loop: Header=BB14_3 Depth=1
	add	r8b, -49
	shlx	r8d, esi, r8d
	movzx	r9d, dil
	movzx	edi, r8b
	or	edi, r9d
	cmp	edi, r9d
	jne	.LBB14_2
# %bb.5:
	mov	eax, 4
	jmp	.LBB14_32
.LBB14_6:
	mov	r14, rsp
	mov	r15, rsp
	add	rax, 15
	and	rax, -16
	sub	r15, rax
	mov	rsp, r15
	movsxd	r12, dword ptr [rip + length]
	test	r12, r12
	jle	.LBB14_9
# %bb.7:
	cmp	r12d, 17
	jae	.LBB14_11
# %bb.8:
	xor	eax, eax
	jmp	.LBB14_18
.LBB14_9:
	mov	rdi, r15
	mov	esi, 45
	mov	rdx, r12
	call	memchr@PLT
	mov	rcx, rax
	mov	eax, 1
	test	rcx, rcx
	jne	.LBB14_31
	jmp	.LBB14_28
.LBB14_11:
	cmp	r12d, 33
	jae	.LBB14_13
# %bb.12:
	xor	eax, eax
	jmp	.LBB14_16
.LBB14_13:
	mov	eax, r12d
	and	eax, 31
	mov	ecx, 32
	cmovne	rcx, rax
	mov	rax, r12
	sub	rax, rcx
	xor	edx, edx
	lea	rsi, [rip + board]
	vpbroadcastw	xmm0, word ptr [rip + .LCPI14_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI14_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI14_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI14_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpmovsxbd	ymm4, qword ptr [rip + .LCPI14_8] # ymm4 = [0,2,2,3,0,2,4,6]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI14_9] # ymm5 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI14_9] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	.p2align	4, 0x90
.LBB14_14:                              # =>This Inner Loop Header: Depth=1
	lea	rdi, [rbx + 8*rdx]
	vmovdqu	xmm7, xmmword ptr [rsi + rdi + 112]
	vpshufb	xmm7, xmm7, xmm0
	vmovdqu	xmm8, xmmword ptr [rsi + rdi + 96]
	vpshufb	xmm8, xmm8, xmm0
	vpunpcklwd	xmm7, xmm8, xmm7        # xmm7 = xmm8[0],xmm7[0],xmm8[1],xmm7[1],xmm8[2],xmm7[2],xmm8[3],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [rsi + rdi + 80]
	vpshufb	xmm8, xmm8, xmm1
	vmovdqu	xmm9, xmmword ptr [rsi + rdi + 64]
	vpshufb	xmm9, xmm9, xmm1
	vpunpcklwd	xmm8, xmm9, xmm8        # xmm8 = xmm9[0],xmm8[0],xmm9[1],xmm8[1],xmm9[2],xmm8[2],xmm9[3],xmm8[3]
	vpblendd	xmm7, xmm8, xmm7, 8             # xmm7 = xmm8[0,1,2],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [rsi + rdi]
	vmovdqu	xmm9, xmmword ptr [rsi + rdi + 16]
	vmovdqu	xmm10, xmmword ptr [rsi + rdi + 32]
	vmovdqu	xmm11, xmmword ptr [rsi + rdi + 48]
	vpshufb	xmm11, xmm11, xmm2
	vpshufb	xmm10, xmm10, xmm2
	vpunpcklwd	xmm10, xmm10, xmm11     # xmm10 = xmm10[0],xmm11[0],xmm10[1],xmm11[1],xmm10[2],xmm11[2],xmm10[3],xmm11[3]
	vpshufb	xmm9, xmm9, xmm3
	vpshufb	xmm8, xmm8, xmm3
	vpunpcklwd	xmm8, xmm8, xmm9        # xmm8 = xmm8[0],xmm9[0],xmm8[1],xmm9[1],xmm8[2],xmm9[2],xmm8[3],xmm9[3]
	vpblendd	xmm8, xmm8, xmm10, 2            # xmm8 = xmm8[0],xmm10[1],xmm8[2,3]
	vpblendd	xmm7, xmm8, xmm7, 12            # xmm7 = xmm8[0,1],xmm7[2,3]
	vxorps	xmm8, xmm8, xmm8
	vpermd	ymm8, ymm4, ymmword ptr [rsi + rdi + 224]
	vpshufb	ymm8, ymm8, ymm5
	vxorps	xmm9, xmm9, xmm9
	vpermd	ymm9, ymm4, ymmword ptr [rsi + rdi + 192]
	vpshufb	ymm9, ymm9, ymm5
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [rsi + rdi + 160]
	vpblendd	ymm8, ymm9, ymm8, 128           # ymm8 = ymm9[0,1,2,3,4,5,6],ymm8[7]
	vpshufb	ymm9, ymm10, ymm6
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [rsi + rdi + 128]
	vpshufb	ymm10, ymm10, ymm6
	vpblendd	ymm9, ymm10, ymm9, 32           # ymm9 = ymm10[0,1,2,3,4],ymm9[5],ymm10[6,7]
	vpblendd	ymm8, ymm9, ymm8, 192           # ymm8 = ymm9[0,1,2,3,4,5],ymm8[6,7]
	vpblendd	ymm7, ymm8, ymm7, 15            # ymm7 = ymm7[0,1,2,3],ymm8[4,5,6,7]
	vmovdqu	ymmword ptr [r15 + rdx], ymm7
	add	rdx, 32
	cmp	rax, rdx
	jne	.LBB14_14
# %bb.15:
	cmp	ecx, 16
	jbe	.LBB14_18
.LBB14_16:
	mov	rdi, rax
	mov	eax, r12d
	and	eax, 15
	mov	ecx, 16
	cmovne	rcx, rax
	mov	rax, r12
	sub	rax, rcx
	lea	rdx, [rbx + 8*rdi]
	lea	rcx, [rip + board]
	add	rcx, rdx
	lea	rdx, [r15 + rdi]
	mov	rsi, rax
	sub	rsi, rdi
	xor	edi, edi
	vpbroadcastw	xmm0, word ptr [rip + .LCPI14_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI14_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI14_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI14_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB14_17:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm4, xmmword ptr [rcx + 8*rdi + 112]
	vpshufb	xmm4, xmm4, xmm0
	vmovdqu	xmm5, xmmword ptr [rcx + 8*rdi + 96]
	vpshufb	xmm5, xmm5, xmm0
	vpunpcklwd	xmm4, xmm5, xmm4        # xmm4 = xmm5[0],xmm4[0],xmm5[1],xmm4[1],xmm5[2],xmm4[2],xmm5[3],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rcx + 8*rdi + 80]
	vpshufb	xmm5, xmm5, xmm1
	vmovdqu	xmm6, xmmword ptr [rcx + 8*rdi + 64]
	vpshufb	xmm6, xmm6, xmm1
	vpunpcklwd	xmm5, xmm6, xmm5        # xmm5 = xmm6[0],xmm5[0],xmm6[1],xmm5[1],xmm6[2],xmm5[2],xmm6[3],xmm5[3]
	vpblendd	xmm4, xmm5, xmm4, 8             # xmm4 = xmm5[0,1,2],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rcx + 8*rdi]
	vmovdqu	xmm6, xmmword ptr [rcx + 8*rdi + 16]
	vmovdqu	xmm7, xmmword ptr [rcx + 8*rdi + 32]
	vmovdqu	xmm8, xmmword ptr [rcx + 8*rdi + 48]
	vpshufb	xmm8, xmm8, xmm2
	vpshufb	xmm7, xmm7, xmm2
	vpunpcklwd	xmm7, xmm7, xmm8        # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1],xmm7[2],xmm8[2],xmm7[3],xmm8[3]
	vpshufb	xmm6, xmm6, xmm3
	vpshufb	xmm5, xmm5, xmm3
	vpunpcklwd	xmm5, xmm5, xmm6        # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1],xmm5[2],xmm6[2],xmm5[3],xmm6[3]
	vpblendd	xmm5, xmm5, xmm7, 2             # xmm5 = xmm5[0],xmm7[1],xmm5[2,3]
	vpblendd	xmm4, xmm5, xmm4, 12            # xmm4 = xmm5[0,1],xmm4[2,3]
	vmovdqu	xmmword ptr [rdx + rdi], xmm4
	add	rdi, 16
	cmp	rsi, rdi
	jne	.LBB14_17
.LBB14_18:
	lea	rcx, [r15 + rax]
	lea	rsi, [rbx + 8*rax]
	lea	rdx, [rip + board]
	add	rdx, rsi
	mov	rsi, r12
	sub	rsi, rax
	xor	eax, eax
	.p2align	4, 0x90
.LBB14_19:                              # =>This Inner Loop Header: Depth=1
	movzx	edi, byte ptr [rdx + 8*rax]
	mov	byte ptr [rcx + rax], dil
	inc	rax
	cmp	rsi, rax
	jne	.LBB14_19
# %bb.20:
	mov	rdi, r15
	mov	esi, 45
	mov	rdx, r12
	vzeroupper
	call	memchr@PLT
	mov	rcx, rax
	mov	eax, 1
	test	rcx, rcx
	jne	.LBB14_31
# %bb.21:
	test	r12d, r12d
	jle	.LBB14_28
# %bb.22:
	mov	qword ptr [rbp - 88], r14       # 8-byte Spill
	mov	qword ptr [rbp - 96], rbx       # 8-byte Spill
	mov	eax, r12d
	and	eax, 3
	mov	qword ptr [rbp - 80], rax       # 8-byte Spill
	cmp	r12d, 4
	mov	qword ptr [rbp - 64], r15       # 8-byte Spill
	mov	qword ptr [rbp - 72], r12       # 8-byte Spill
	jae	.LBB14_34
# %bb.23:
	mov	al, 48
	xor	edi, edi
	mov	dl, 48
	xor	r11d, r11d
	xor	ecx, ecx
.LBB14_24:
	mov	r14, qword ptr [rbp - 80]       # 8-byte Reload
	test	r14, r14
	mov	rbx, qword ptr [rbp - 64]       # 8-byte Reload
	je	.LBB14_27
# %bb.25:
	mov	r8, rdi
	not	r8
	add	r8, qword ptr [rbp - 72]        # 8-byte Folded Reload
	add	r8, rbx
	add	rbx, rdi
	xor	edi, edi
	.p2align	4, 0x90
.LBB14_26:                              # =>This Inner Loop Header: Depth=1
	movzx	esi, byte ptr [rbx + rdi]
	movzx	r9d, byte ptr [r8]
	cmp	sil, al
	setg	r10b
	movzx	eax, al
	cmovg	eax, esi
	add	cl, r10b
	cmp	r9b, dl
	setg	sil
	movzx	edx, dl
	cmovg	edx, r9d
	add	r11b, sil
	inc	rdi
	dec	r8
	cmp	r14, rdi
	jne	.LBB14_26
.LBB14_27:
	shl	cl, 4
	or	cl, r11b
	movzx	ecx, cl
	mov	rbx, qword ptr [rbp - 96]       # 8-byte Reload
	mov	r14, qword ptr [rbp - 88]       # 8-byte Reload
	lea	rax, [rip + top_key]
	mov	edx, dword ptr [rax + 4*rbx]
	test	edx, edx
	jne	.LBB14_29
	jmp	.LBB14_30
.LBB14_28:
	xor	ecx, ecx
	lea	rax, [rip + top_key]
	mov	edx, dword ptr [rax + 4*rbx]
	test	edx, edx
	je	.LBB14_30
.LBB14_29:
	mov	esi, ecx
	shr	esi, 4
	mov	eax, 8
	cmp	esi, edx
	jne	.LBB14_31
.LBB14_30:
	and	ecx, 7
	lea	rax, [rip + bottom_key]
	mov	edx, dword ptr [rax + 4*rbx]
	cmp	ecx, edx
	mov	ecx, 1
	mov	eax, 8
	cmove	rax, rcx
	test	edx, edx
	cmove	rax, rcx
.LBB14_31:
	mov	rsp, r14
.LBB14_32:
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	jne	.LBB14_38
# %bb.33:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB14_34:
	.cfi_def_cfa rbp, 16
	lea	rbx, [r15 + r12]
	mov	eax, r12d
	and	eax, 2147483644
	mov	qword ptr [rbp - 104], rax      # 8-byte Spill
	lea	r10, [r12 - 1]
	mov	al, 48
	xor	edi, edi
	mov	dl, 48
	xor	r13d, r13d
	xor	ecx, ecx
	jmp	.LBB14_36
	.p2align	4, 0x90
.LBB14_35:                              #   in Loop: Header=BB14_36 Depth=1
	add	cl, byte ptr [rbp - 49]         # 1-byte Folded Reload
	add	cl, r9b
	add	cl, r8b
	add	cl, bl
	add	r13b, byte ptr [rbp - 50]       # 1-byte Folded Reload
	add	r13b, r14b
	add	r13b, r15b
	mov	rsi, rdi
	xor	rsi, -4
	mov	rbx, r12
	movzx	esi, byte ptr [r12 + rsi]
	cmp	sil, dl
	setg	r11b
	cmovg	edx, esi
	add	r11b, r13b
	add	rdi, 4
	add	r10, -4
	mov	r13d, r11d
	cmp	qword ptr [rbp - 104], rdi      # 8-byte Folded Reload
	je	.LBB14_24
.LBB14_36:                              # =>This Inner Loop Header: Depth=1
	mov	r11, qword ptr [rbp - 64]       # 8-byte Reload
	mov	r8d, dword ptr [r11 + rdi]
	cmp	r8b, al
	setg	byte ptr [rbp - 49]             # 1-byte Folded Spill
	movzx	r9d, byte ptr [r11 + r10]
	movzx	esi, al
	cmovg	esi, r8d
	cmp	r9b, dl
	setg	byte ptr [rbp - 50]             # 1-byte Folded Spill
	movzx	edx, dl
	cmovg	edx, r9d
	movzx	eax, byte ptr [r11 + rdi + 1]
	mov	r8, rdi
	xor	r8, -2
	movzx	r8d, byte ptr [rbx + r8]
	cmp	al, sil
	setg	r9b
	cmovg	esi, eax
	cmp	r8b, dl
	setg	r14b
	cmovg	edx, r8d
	movzx	eax, byte ptr [r11 + rdi + 2]
	mov	r8, rdi
	xor	r8, -3
	mov	r12, rbx
	movzx	ebx, byte ptr [rbx + r8]
	cmp	al, sil
	setg	r8b
	cmovg	esi, eax
	cmp	bl, dl
	setg	r15b
	cmovg	edx, ebx
	movzx	eax, byte ptr [r11 + rdi + 3]
	cmp	al, sil
	setg	bl
	jg	.LBB14_35
# %bb.37:                               #   in Loop: Header=BB14_36 Depth=1
	mov	eax, esi
	jmp	.LBB14_35
.LBB14_38:
	call	__stack_chk_fail@PLT
.Lfunc_end14:
	.size	check_col, .Lfunc_end14-check_col
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function initialize_board
.LCPI15_0:
	.long	4294967248                      # 0xffffffd0
	.text
	.globl	initialize_board
	.p2align	4, 0x90
	.type	initialize_board,@function
initialize_board:                       # @initialize_board
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 24
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 48], rax
	mov	dword ptr [rip + length], edx
	test	edx, edx
	je	.LBB15_21
# %bb.1:
	mov	ebx, edx
	mov	eax, edx
	imul	eax, eax
	lea	ecx, [rbx + 48]
	xor	edx, edx
	jmp	.LBB15_3
	.p2align	4, 0x90
.LBB15_2:                               #   in Loop: Header=BB15_3 Depth=1
	inc	rdx
	cmp	rdx, rax
	jge	.LBB15_7
.LBB15_3:                               # =>This Inner Loop Header: Depth=1
	movzx	r8d, byte ptr [rdi + rdx]
	cmp	r8b, 45
	je	.LBB15_2
# %bb.4:                                #   in Loop: Header=BB15_3 Depth=1
	cmp	r8b, 49
	jl	.LBB15_6
# %bb.5:                                #   in Loop: Header=BB15_3 Depth=1
	cmp	cl, r8b
	jge	.LBB15_2
.LBB15_6:
	lea	rdi, [rip + .Lstr.29]
	call	puts@PLT
	xor	eax, eax
	jmp	.LBB15_24
.LBB15_7:
	test	ebx, ebx
	je	.LBB15_21
# %bb.8:
	mov	r8d, dword ptr [rip + remaining]
	mov	r9d, 1
	cmp	eax, 2
	cmovae	r9d, eax
	jae	.LBB15_26
# %bb.9:
	xor	ecx, ecx
.LBB15_10:
	test	r9b, 1
	je	.LBB15_14
# %bb.11:
	movzx	edi, byte ptr [rdi + rcx]
	cmp	dil, 45
	jne	.LBB15_13
# %bb.12:
	inc	r8d
	mov	dword ptr [rip + remaining], r8d
.LBB15_13:
	mov	eax, ecx
	cdq
	idiv	ebx
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	and	edx, 7
	shr	eax
	and	eax, 120
	lea	rcx, [rip + board]
	add	rcx, rax
	mov	byte ptr [rdx + rcx], dil
.LBB15_14:
	test	ebx, ebx
	jle	.LBB15_21
# %bb.15:
	lea	ecx, [4*rbx]
	movsxd	rax, ecx
	lea	edx, [rbx + 48]
	xor	edi, edi
	.p2align	4, 0x90
.LBB15_16:                              # =>This Inner Loop Header: Depth=1
	movzx	r8d, byte ptr [rsi + rdi]
	cmp	r8b, 48
	jl	.LBB15_6
# %bb.17:                               #   in Loop: Header=BB15_16 Depth=1
	cmp	dl, r8b
	jl	.LBB15_6
# %bb.18:                               #   in Loop: Header=BB15_16 Depth=1
	inc	rdi
	cmp	rdi, rax
	jl	.LBB15_16
# %bb.19:
	mov	r12, rsp
	mov	eax, ecx
	mov	r14, rsp
	lea	rax, [4*rax + 15]
	and	rax, -16
	sub	r14, rax
	mov	rsp, r14
	cmp	ecx, 2
	mov	eax, 1
	cmovge	eax, ecx
	cmp	ecx, 31
	jg	.LBB15_32
# %bb.20:
	xor	ecx, ecx
	jmp	.LBB15_35
.LBB15_21:
	mov	r12, rsp
.LBB15_22:
	mov	r15b, 1
.LBB15_23:
	mov	rsp, r12
	movzx	eax, r15b
.LBB15_24:
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	jne	.LBB15_43
# %bb.25:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB15_26:
	.cfi_def_cfa rbp, 16
	mov	r10d, r9d
	and	r10d, -4
	xor	ecx, ecx
	lea	r11, [rip + board]
	jmp	.LBB15_28
	.p2align	4, 0x90
.LBB15_27:                              #   in Loop: Header=BB15_28 Depth=1
	lea	eax, [rcx + 1]
	cdq
	idiv	ebx
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	and	edx, 7
	shr	eax
	and	eax, 120
	add	rax, r11
	mov	byte ptr [rdx + rax], r14b
	add	rcx, 2
	cmp	rcx, r10
	je	.LBB15_10
.LBB15_28:                              # =>This Inner Loop Header: Depth=1
	movzx	r14d, byte ptr [rdi + rcx]
	cmp	r14b, 45
	jne	.LBB15_30
# %bb.29:                               #   in Loop: Header=BB15_28 Depth=1
	inc	r8d
	mov	dword ptr [rip + remaining], r8d
.LBB15_30:                              #   in Loop: Header=BB15_28 Depth=1
	mov	eax, ecx
	cdq
	idiv	ebx
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	and	edx, 7
	shr	eax
	and	eax, 120
	add	rax, r11
	mov	byte ptr [rdx + rax], r14b
	movzx	r14d, byte ptr [rdi + rcx + 1]
	cmp	r14b, 45
	jne	.LBB15_27
# %bb.31:                               #   in Loop: Header=BB15_28 Depth=1
	inc	r8d
	mov	dword ptr [rip + remaining], r8d
	jmp	.LBB15_27
.LBB15_32:
	mov	ecx, eax
	and	ecx, 2147483616
	xor	edx, edx
	vpbroadcastd	ymm0, dword ptr [rip + .LCPI15_0] # ymm0 = [4294967248,4294967248,4294967248,4294967248,4294967248,4294967248,4294967248,4294967248]
	.p2align	4, 0x90
.LBB15_33:                              # =>This Inner Loop Header: Depth=1
	vpmovsxbd	ymm1, qword ptr [rsi + rdx]
	vpmovsxbd	ymm2, qword ptr [rsi + rdx + 8]
	vpmovsxbd	ymm3, qword ptr [rsi + rdx + 16]
	vpmovsxbd	ymm4, qword ptr [rsi + rdx + 24]
	vpaddd	ymm1, ymm1, ymm0
	vpaddd	ymm2, ymm2, ymm0
	vpaddd	ymm3, ymm3, ymm0
	vpaddd	ymm4, ymm4, ymm0
	vmovdqu	ymmword ptr [r14 + 4*rdx], ymm1
	vmovdqu	ymmword ptr [r14 + 4*rdx + 32], ymm2
	vmovdqu	ymmword ptr [r14 + 4*rdx + 64], ymm3
	vmovdqu	ymmword ptr [r14 + 4*rdx + 96], ymm4
	add	rdx, 32
	cmp	rcx, rdx
	jne	.LBB15_33
# %bb.34:
	cmp	ecx, eax
	je	.LBB15_36
	.p2align	4, 0x90
.LBB15_35:                              # =>This Inner Loop Header: Depth=1
	movsx	edx, byte ptr [rsi + rcx]
	add	edx, -48
	mov	dword ptr [r14 + 4*rcx], edx
	inc	rcx
	cmp	rax, rcx
	jne	.LBB15_35
.LBB15_36:
	mov	r13d, ebx
	lea	eax, [rbx + rbx]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	lea	eax, [rbx + 2*rbx]
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	lea	r15, [4*r13]
	lea	rdi, [rip + top_key]
	mov	rsi, r14
	mov	rdx, r15
	vzeroupper
	call	memcpy@PLT
	lea	rsi, [r14 + 4*r13]
	lea	rdi, [rip + bottom_key]
	mov	rdx, r15
	call	memcpy@PLT
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	lea	rsi, [r14 + 4*rax]
	lea	rdi, [rip + left_key]
	mov	rdx, r15
	call	memcpy@PLT
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	lea	rsi, [r14 + 4*rax]
	lea	rdi, [rip + right_key]
	mov	rdx, r15
	call	memcpy@PLT
	xor	r15d, r15d
	xor	edi, edi
	call	check_row
	mov	r14, rax
	xor	edi, edi
	call	check_col
	or	rax, r14
	cmp	rax, 3
	ja	.LBB15_41
# %bb.37:
	mov	r14d, 1
	.p2align	4, 0x90
.LBB15_38:                              # =>This Inner Loop Header: Depth=1
	cmp	ebx, r14d
	je	.LBB15_22
# %bb.39:                               #   in Loop: Header=BB15_38 Depth=1
	mov	edi, r14d
	call	check_row
	mov	r15, rax
	mov	edi, r14d
	call	check_col
	or	rax, r15
	inc	r14d
	cmp	rax, 4
	jb	.LBB15_38
# %bb.40:
	dec	r14d
	cmp	r14d, ebx
	setge	r15b
.LBB15_41:
	lea	rdi, [rip + .Lstr.29]
	call	puts@PLT
	jmp	.LBB15_23
.LBB15_43:
	call	__stack_chk_fail@PLT
.Lfunc_end15:
	.size	initialize_board, .Lfunc_end15-initialize_board
	.cfi_endproc
                                        # -- End function
	.globl	piece_to_bit                    # -- Begin function piece_to_bit
	.p2align	4, 0x90
	.type	piece_to_bit,@function
piece_to_bit:                           # @piece_to_bit
	.cfi_startproc
# %bb.0:
	add	dil, -49
	mov	eax, 1
	shlx	eax, eax, edi
                                        # kill: def $al killed $al killed $eax
	ret
.Lfunc_end16:
	.size	piece_to_bit, .Lfunc_end16-piece_to_bit
	.cfi_endproc
                                        # -- End function
	.globl	bit_to_piece                    # -- Begin function bit_to_piece
	.p2align	4, 0x90
	.type	bit_to_piece,@function
bit_to_piece:                           # @bit_to_piece
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	lea	eax, [rdi - 1]
	mov	ecx, edi
	xor	cl, al
	cmp	cl, al
	jbe	.LBB17_2
# %bb.1:
	movzx	eax, dil
	tzcnt	eax, eax
	add	al, 49
	test	dil, dil
	movzx	ecx, al
	mov	eax, 48
	cmovne	eax, ecx
                                        # kill: def $al killed $al killed $eax
	ret
.LBB17_2:
	push	rax
	.cfi_def_cfa_offset 16
	lea	rdi, [rip + .L.str.20]
	lea	rsi, [rip + .L.str.21]
	lea	rcx, [rip + .L__PRETTY_FUNCTION__.bit_to_piece]
	mov	edx, 328
	call	__assert_fail@PLT
.Lfunc_end17:
	.size	bit_to_piece, .Lfunc_end17-bit_to_piece
	.cfi_endproc
                                        # -- End function
	.globl	single                          # -- Begin function single
	.p2align	4, 0x90
	.type	single,@function
single:                                 # @single
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	lea	eax, [rdi - 1]
	xor	dil, al
	cmp	dil, al
	seta	al
	ret
.Lfunc_end18:
	.size	single, .Lfunc_end18-single
	.cfi_endproc
                                        # -- End function
	.globl	popcnt                          # -- Begin function popcnt
	.p2align	4, 0x90
	.type	popcnt,@function
popcnt:                                 # @popcnt
	.cfi_startproc
# %bb.0:
	popcnt	eax, edi
	ret
.Lfunc_end19:
	.size	popcnt, .Lfunc_end19-popcnt
	.cfi_endproc
                                        # -- End function
	.globl	nbsf                            # -- Begin function nbsf
	.p2align	4, 0x90
	.type	nbsf,@function
nbsf:                                   # @nbsf
	.cfi_startproc
# %bb.0:
	test	esi, esi
	sete	al
	test	edi, edi
	sete	cl
	or	cl, al
	jne	.LBB20_4
# %bb.1:
	mov	eax, 1
	.p2align	4, 0x90
.LBB20_2:                               # =>This Inner Loop Header: Depth=1
	mov	ecx, esi
	lea	esi, [rcx - 1]
	and	sil, cl
	je	.LBB20_4
# %bb.3:                                #   in Loop: Header=BB20_2 Depth=1
	lea	ecx, [rax + 1]
	cmp	eax, edi
	mov	eax, ecx
	jb	.LBB20_2
.LBB20_4:
	movzx	ecx, sil
	tzcnt	edx, ecx
	xor	eax, eax
	cmp	cl, 1
	sbb	eax, eax
	or	eax, edx
	ret
.Lfunc_end20:
	.size	nbsf, .Lfunc_end20-nbsf
	.cfi_endproc
                                        # -- End function
	.globl	place_singles                   # -- Begin function place_singles
	.p2align	4, 0x90
	.type	place_singles,@function
place_singles:                          # @place_singles
	.cfi_startproc
# %bb.0:
	mov	ecx, dword ptr [rip + length]
	test	ecx, ecx
	je	.LBB21_15
# %bb.1:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	push	rax
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	xor	ebx, ebx
	lea	r12, [rip + con]
	mov	ebp, 1
	lea	r13, [rip + board]
	jmp	.LBB21_2
.LBB21_12:                              #   in Loop: Header=BB21_2 Depth=1
	add	rax, r14
	mov	byte ptr [rax], cl
	call	place_singles
	.p2align	4, 0x90
.LBB21_13:                              #   in Loop: Header=BB21_2 Depth=1
	inc	ebx
	mov	ecx, dword ptr [rip + length]
	mov	eax, ecx
	imul	eax, ecx
	cmp	ebx, eax
	jae	.LBB21_14
.LBB21_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB21_8 Depth 2
                                        #     Child Loop BB21_11 Depth 2
	mov	eax, ebx
	cdq
	idiv	ecx
	mov	r14d, edx
	mov	r15d, eax
	shl	r15d, 4
	or	r15d, edx
	shr	r15d, 4
	and	r15d, 15
	and	r14d, 7
	mov	edi, r15d
	mov	esi, r14d
	call	apply_process_of_elimination
	lea	rax, [r12 + 8*r15]
	movzx	ecx, byte ptr [r14 + rax]
	lea	edx, [rcx - 1]
	mov	esi, ecx
	xor	sil, dl
	cmp	sil, dl
	jbe	.LBB21_13
# %bb.3:                                #   in Loop: Header=BB21_2 Depth=1
	movzx	edx, byte ptr [r15 + r12 + 64]
	bt	edx, r14d
	jb	.LBB21_13
# %bb.4:                                #   in Loop: Header=BB21_2 Depth=1
	shlx	esi, ebp, r14d
	movzx	edi, cl
	tzcnt	edi, edi
	add	dil, 49
	test	cl, cl
	movzx	ecx, dil
	mov	edi, 48
	cmove	ecx, edi
	lea	rdi, [8*r15]
	add	rdi, r13
	mov	byte ptr [r14 + rdi], cl
	or	sil, dl
	mov	byte ptr [r15 + r12 + 64], sil
	add	cl, -49
	shlx	ecx, ebp, ecx
	movsxd	rdx, dword ptr [rip + length]
	test	rdx, rdx
	jle	.LBB21_12
# %bb.5:                                #   in Loop: Header=BB21_2 Depth=1
	mov	esi, ecx
	not	sil
	cmp	edx, 4
	jae	.LBB21_7
# %bb.6:                                #   in Loop: Header=BB21_2 Depth=1
	xor	edi, edi
	jmp	.LBB21_9
.LBB21_7:                               #   in Loop: Header=BB21_2 Depth=1
	mov	r8d, edx
	and	r8d, 2147483644
	lea	r9, [r12 + 8*r15]
	add	r9, 3
	lea	r10, [r14 + r12]
	add	r10, 24
	xor	edi, edi
	.p2align	4, 0x90
.LBB21_8:                               #   Parent Loop BB21_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	and	byte ptr [r9 + rdi - 3], sil
	and	byte ptr [r10 + 8*rdi - 24], sil
	and	byte ptr [r9 + rdi - 2], sil
	and	byte ptr [r10 + 8*rdi - 16], sil
	and	byte ptr [r9 + rdi - 1], sil
	and	byte ptr [r10 + 8*rdi - 8], sil
	and	byte ptr [r9 + rdi], sil
	and	byte ptr [r10 + 8*rdi], sil
	add	rdi, 4
	cmp	r8, rdi
	jne	.LBB21_8
.LBB21_9:                               #   in Loop: Header=BB21_2 Depth=1
	and	edx, 3
	je	.LBB21_12
# %bb.10:                               #   in Loop: Header=BB21_2 Depth=1
	lea	r8, [r14 + 8*rdi]
	add	r8, r12
	lea	rdi, [rdi + 8*r15]
	add	rdi, r12
	xor	r9d, r9d
	.p2align	4, 0x90
.LBB21_11:                              #   Parent Loop BB21_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	and	byte ptr [rdi + r9], sil
	and	byte ptr [r8 + 8*r9], sil
	inc	r9
	cmp	rdx, r9
	jne	.LBB21_11
	jmp	.LBB21_12
.LBB21_14:
	add	rsp, 8
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	.cfi_restore rbx
	.cfi_restore r12
	.cfi_restore r13
	.cfi_restore r14
	.cfi_restore r15
	.cfi_restore rbp
.LBB21_15:
	ret
.Lfunc_end21:
	.size	place_singles, .Lfunc_end21-place_singles
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function apply_process_of_elimination
.LCPI22_0:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI22_1:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI22_2:
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI22_3:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI22_4:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	4                               # 0x4
	.long	6                               # 0x6
.LCPI22_5:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
.LCPI22_6:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.section	.rodata,"a",@progbits
	.p2align	1, 0x0
.LCPI22_7:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.section	.rodata.cst8,"aM",@progbits,8
.LCPI22_8:
	.byte	0                               # 0x0
	.byte	2                               # 0x2
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	0                               # 0x0
	.byte	2                               # 0x2
	.byte	4                               # 0x4
	.byte	6                               # 0x6
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI22_9:
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.text
	.globl	apply_process_of_elimination
	.p2align	4, 0x90
	.type	apply_process_of_elimination,@function
apply_process_of_elimination:           # @apply_process_of_elimination
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 24
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 48], rax
	mov	eax, dword ptr [rip + length]
	mov	rdx, rsp
	lea	rcx, [rax + 15]
	and	rcx, -16
	sub	rdx, rcx
	mov	rsp, rdx
	test	eax, eax
	jle	.LBB22_37
# %bb.1:
	movsxd	rcx, esi
	cmp	eax, 17
	jae	.LBB22_3
# %bb.2:
	xor	r8d, r8d
	jmp	.LBB22_10
.LBB22_3:
	cmp	eax, 33
	jae	.LBB22_7
# %bb.4:
	xor	r8d, r8d
	jmp	.LBB22_5
.LBB22_7:
	mov	r8d, eax
	and	r8d, 31
	mov	esi, 32
	cmovne	rsi, r8
	mov	r8, rax
	sub	r8, rsi
	xor	r9d, r9d
	lea	r10, [rip + con]
	vpbroadcastw	xmm0, word ptr [rip + .LCPI22_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI22_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI22_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI22_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpmovsxbd	ymm4, qword ptr [rip + .LCPI22_8] # ymm4 = [0,2,2,3,0,2,4,6]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI22_9] # ymm5 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI22_9] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	.p2align	4, 0x90
.LBB22_8:                               # =>This Inner Loop Header: Depth=1
	lea	r11, [rcx + 8*r9]
	vmovdqu	xmm7, xmmword ptr [r10 + r11 + 112]
	vpshufb	xmm7, xmm7, xmm0
	vmovdqu	xmm8, xmmword ptr [r10 + r11 + 96]
	vpshufb	xmm8, xmm8, xmm0
	vpunpcklwd	xmm7, xmm8, xmm7        # xmm7 = xmm8[0],xmm7[0],xmm8[1],xmm7[1],xmm8[2],xmm7[2],xmm8[3],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r10 + r11 + 80]
	vpshufb	xmm8, xmm8, xmm1
	vmovdqu	xmm9, xmmword ptr [r10 + r11 + 64]
	vpshufb	xmm9, xmm9, xmm1
	vpunpcklwd	xmm8, xmm9, xmm8        # xmm8 = xmm9[0],xmm8[0],xmm9[1],xmm8[1],xmm9[2],xmm8[2],xmm9[3],xmm8[3]
	vpblendd	xmm7, xmm8, xmm7, 8             # xmm7 = xmm8[0,1,2],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r10 + r11]
	vmovdqu	xmm9, xmmword ptr [r10 + r11 + 16]
	vmovdqu	xmm10, xmmword ptr [r10 + r11 + 32]
	vmovdqu	xmm11, xmmword ptr [r10 + r11 + 48]
	vpshufb	xmm11, xmm11, xmm2
	vpshufb	xmm10, xmm10, xmm2
	vpunpcklwd	xmm10, xmm10, xmm11     # xmm10 = xmm10[0],xmm11[0],xmm10[1],xmm11[1],xmm10[2],xmm11[2],xmm10[3],xmm11[3]
	vpshufb	xmm9, xmm9, xmm3
	vpshufb	xmm8, xmm8, xmm3
	vpunpcklwd	xmm8, xmm8, xmm9        # xmm8 = xmm8[0],xmm9[0],xmm8[1],xmm9[1],xmm8[2],xmm9[2],xmm8[3],xmm9[3]
	vpblendd	xmm8, xmm8, xmm10, 2            # xmm8 = xmm8[0],xmm10[1],xmm8[2,3]
	vpblendd	xmm7, xmm8, xmm7, 12            # xmm7 = xmm8[0,1],xmm7[2,3]
	vxorps	xmm8, xmm8, xmm8
	vpermd	ymm8, ymm4, ymmword ptr [r10 + r11 + 224]
	vpshufb	ymm8, ymm8, ymm5
	vxorps	xmm9, xmm9, xmm9
	vpermd	ymm9, ymm4, ymmword ptr [r10 + r11 + 192]
	vpshufb	ymm9, ymm9, ymm5
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r10 + r11 + 160]
	vpblendd	ymm8, ymm9, ymm8, 128           # ymm8 = ymm9[0,1,2,3,4,5,6],ymm8[7]
	vpshufb	ymm9, ymm10, ymm6
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r10 + r11 + 128]
	vpshufb	ymm10, ymm10, ymm6
	vpblendd	ymm9, ymm10, ymm9, 32           # ymm9 = ymm10[0,1,2,3,4],ymm9[5],ymm10[6,7]
	vpblendd	ymm8, ymm9, ymm8, 192           # ymm8 = ymm9[0,1,2,3,4,5],ymm8[6,7]
	vpblendd	ymm7, ymm8, ymm7, 15            # ymm7 = ymm7[0,1,2,3],ymm8[4,5,6,7]
	vmovdqu	ymmword ptr [rdx + r9], ymm7
	add	r9, 32
	cmp	r8, r9
	jne	.LBB22_8
# %bb.9:
	cmp	esi, 16
	jbe	.LBB22_10
.LBB22_5:
	mov	r11, r8
	mov	esi, eax
	and	esi, 15
	mov	r9d, 16
	cmovne	r9, rsi
	mov	r8, rax
	sub	r8, r9
	lea	r9, [rcx + 8*r11]
	lea	rsi, [rip + con]
	add	rsi, r9
	lea	r9, [rdx + r11]
	mov	r10, r8
	sub	r10, r11
	xor	r11d, r11d
	vpbroadcastw	xmm0, word ptr [rip + .LCPI22_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI22_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI22_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI22_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB22_6:                               # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm4, xmmword ptr [rsi + 8*r11 + 112]
	vpshufb	xmm4, xmm4, xmm0
	vmovdqu	xmm5, xmmword ptr [rsi + 8*r11 + 96]
	vpshufb	xmm5, xmm5, xmm0
	vpunpcklwd	xmm4, xmm5, xmm4        # xmm4 = xmm5[0],xmm4[0],xmm5[1],xmm4[1],xmm5[2],xmm4[2],xmm5[3],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rsi + 8*r11 + 80]
	vpshufb	xmm5, xmm5, xmm1
	vmovdqu	xmm6, xmmword ptr [rsi + 8*r11 + 64]
	vpshufb	xmm6, xmm6, xmm1
	vpunpcklwd	xmm5, xmm6, xmm5        # xmm5 = xmm6[0],xmm5[0],xmm6[1],xmm5[1],xmm6[2],xmm5[2],xmm6[3],xmm5[3]
	vpblendd	xmm4, xmm5, xmm4, 8             # xmm4 = xmm5[0,1,2],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rsi + 8*r11]
	vmovdqu	xmm6, xmmword ptr [rsi + 8*r11 + 16]
	vmovdqu	xmm7, xmmword ptr [rsi + 8*r11 + 32]
	vmovdqu	xmm8, xmmword ptr [rsi + 8*r11 + 48]
	vpshufb	xmm8, xmm8, xmm2
	vpshufb	xmm7, xmm7, xmm2
	vpunpcklwd	xmm7, xmm7, xmm8        # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1],xmm7[2],xmm8[2],xmm7[3],xmm8[3]
	vpshufb	xmm6, xmm6, xmm3
	vpshufb	xmm5, xmm5, xmm3
	vpunpcklwd	xmm5, xmm5, xmm6        # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1],xmm5[2],xmm6[2],xmm5[3],xmm6[3]
	vpblendd	xmm5, xmm5, xmm7, 2             # xmm5 = xmm5[0],xmm7[1],xmm5[2,3]
	vpblendd	xmm4, xmm5, xmm4, 12            # xmm4 = xmm5[0,1],xmm4[2,3]
	vmovdqu	xmmword ptr [r9 + r11], xmm4
	add	r11, 16
	cmp	r10, r11
	jne	.LBB22_6
.LBB22_10:
	lea	r9, [rdx + r8]
	lea	r10, [rcx + 8*r8]
	lea	rsi, [rip + con]
	add	r10, rsi
	mov	r11, rax
	sub	r11, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB22_11:                              # =>This Inner Loop Header: Depth=1
	movzx	ebx, byte ptr [r10 + 8*r8]
	mov	byte ptr [r9 + r8], bl
	inc	r8
	cmp	r11, r8
	jne	.LBB22_11
# %bb.12:
	test	eax, eax
	jle	.LBB22_37
# %bb.13:
	movsxd	rdi, edi
	mov	r10d, eax
	and	r10d, 7
	cmp	eax, 8
	jae	.LBB22_15
# %bb.14:
	xor	r11d, r11d
	xor	r8d, r8d
	xor	r9d, r9d
	jmp	.LBB22_17
.LBB22_15:
	mov	ebx, eax
	and	ebx, 2147483640
	lea	r14, [rsi + 8*rdi]
	add	r14, 7
	xor	r11d, r11d
	xor	r15d, r15d
	xor	r9d, r9d
	.p2align	4, 0x90
.LBB22_16:                              # =>This Inner Loop Header: Depth=1
	movzx	r8d, byte ptr [r14 + r11 - 7]
	movzx	r12d, byte ptr [r14 + r11 - 6]
	mov	r13d, r8d
	and	r13b, r15b
	or	r13b, r9b
	or	r8b, r15b
	mov	r9d, r12d
	and	r9b, r8b
	or	r9b, r13b
	or	r8b, r12b
	movzx	r15d, byte ptr [r14 + r11 - 5]
	mov	r12d, r15d
	and	r12b, r8b
	or	r12b, r9b
	or	r8b, r15b
	movzx	r9d, byte ptr [r14 + r11 - 4]
	mov	r15d, r9d
	and	r15b, r8b
	or	r15b, r12b
	or	r8b, r9b
	movzx	r9d, byte ptr [r14 + r11 - 3]
	mov	r12d, r9d
	and	r12b, r8b
	or	r12b, r15b
	or	r8b, r9b
	movzx	r9d, byte ptr [r14 + r11 - 2]
	mov	r15d, r9d
	and	r15b, r8b
	or	r15b, r12b
	or	r8b, r9b
	movzx	r9d, byte ptr [r14 + r11 - 1]
	mov	r12d, r9d
	and	r12b, r8b
	or	r12b, r15b
	movzx	r15d, byte ptr [r14 + r11]
	or	r8b, r9b
	mov	r9d, r15d
	and	r9b, r8b
	or	r9b, r12b
	or	r8b, r15b
	add	r11, 8
	mov	r15d, r8d
	cmp	rbx, r11
	jne	.LBB22_16
.LBB22_17:
	test	r10, r10
	je	.LBB22_20
# %bb.18:
	lea	r11, [r11 + 8*rdi]
	add	r11, rsi
	xor	ebx, ebx
	.p2align	4, 0x90
.LBB22_19:                              # =>This Inner Loop Header: Depth=1
	movzx	r14d, byte ptr [r11 + rbx]
	mov	r15d, r14d
	and	r15b, r8b
	or	r9b, r15b
	or	r8b, r14b
	inc	rbx
	cmp	r10, rbx
	jne	.LBB22_19
.LBB22_20:
	mov	qword ptr [rbp - 56], rdi       # 8-byte Spill
	mov	r11d, eax
	and	r11d, 7
	cmp	eax, 8
	jae	.LBB22_22
# %bb.21:
	xor	r14d, r14d
	xor	ebx, ebx
	xor	r10d, r10d
	jmp	.LBB22_24
.LBB22_22:
	mov	r15d, eax
	and	r15d, 2147483640
	xor	r14d, r14d
	xor	r12d, r12d
	xor	r10d, r10d
	.p2align	4, 0x90
.LBB22_23:                              # =>This Inner Loop Header: Depth=1
	movzx	ebx, byte ptr [rdx + r14]
	movzx	r13d, byte ptr [rdx + r14 + 1]
	mov	edi, ebx
	and	dil, r12b
	or	dil, r10b
	or	bl, r12b
	mov	r10d, r13d
	and	r10b, bl
	or	r10b, dil
	or	bl, r13b
	movzx	edi, byte ptr [rdx + r14 + 2]
	mov	r12d, edi
	and	r12b, bl
	or	r12b, r10b
	or	bl, dil
	movzx	edi, byte ptr [rdx + r14 + 3]
	mov	r10d, edi
	and	r10b, bl
	or	r10b, r12b
	or	bl, dil
	movzx	edi, byte ptr [rdx + r14 + 4]
	mov	r12d, edi
	and	r12b, bl
	or	r12b, r10b
	or	bl, dil
	movzx	edi, byte ptr [rdx + r14 + 5]
	mov	r10d, edi
	and	r10b, bl
	or	r10b, r12b
	or	bl, dil
	movzx	edi, byte ptr [rdx + r14 + 6]
	mov	r12d, edi
	and	r12b, bl
	or	r12b, r10b
	movzx	r13d, byte ptr [rdx + r14 + 7]
	or	bl, dil
	mov	r10d, r13d
	and	r10b, bl
	or	r10b, r12b
	or	bl, r13b
	add	r14, 8
	mov	r12d, ebx
	cmp	r15, r14
	jne	.LBB22_23
.LBB22_24:
	not	r9b
	test	r11, r11
	je	.LBB22_27
# %bb.25:
	add	rdx, r14
	xor	r14d, r14d
	.p2align	4, 0x90
.LBB22_26:                              # =>This Inner Loop Header: Depth=1
	movzx	edi, byte ptr [rdx + r14]
	mov	r15d, edi
	and	r15b, bl
	or	r10b, r15b
	or	bl, dil
	inc	r14
	cmp	r11, r14
	jne	.LBB22_26
.LBB22_27:
	test	eax, eax
	setle	dl
	and	r8b, r9b
	not	r10b
	and	r10b, bl
	cmp	r8b, -1
	sete	dil
	or	dil, dl
	jne	.LBB22_32
# %bb.28:
	mov	rdx, qword ptr [rbp - 56]       # 8-byte Reload
	lea	r9, [8*rdx]
	xor	edx, edx
	.p2align	4, 0x90
.LBB22_30:                              # =>This Inner Loop Header: Depth=1
	lea	rdi, [r9 + rdx]
	movzx	edi, byte ptr [rsi + rdi]
	mov	r11d, edi
	and	r11b, r8b
	lea	ebx, [r11 - 1]
	mov	r14d, r11d
	xor	r14b, bl
	cmp	r14b, bl
	setbe	bl
	lea	r14d, [rdi - 1]
	xor	dil, r14b
	cmp	dil, r14b
	seta	dil
	or	dil, bl
	je	.LBB22_31
# %bb.29:                               #   in Loop: Header=BB22_30 Depth=1
	inc	rdx
	cmp	rax, rdx
	jne	.LBB22_30
	jmp	.LBB22_32
.LBB22_31:
	mov	rdi, qword ptr [rbp - 56]       # 8-byte Reload
	lea	rdi, [rsi + 8*rdi]
	mov	byte ptr [rdx + rdi], r11b
.LBB22_32:
	test	eax, eax
	setle	dl
	cmp	r10b, -1
	sete	dil
	or	dil, dl
	jne	.LBB22_37
# %bb.33:
	xor	edx, edx
	.p2align	4, 0x90
.LBB22_35:                              # =>This Inner Loop Header: Depth=1
	lea	rdi, [rcx + 8*rdx]
	movzx	r8d, byte ptr [rsi + rdi]
	mov	edi, r8d
	and	dil, r10b
	lea	r9d, [rdi - 1]
	mov	r11d, edi
	xor	r11b, r9b
	cmp	r11b, r9b
	setbe	r9b
	lea	r11d, [r8 - 1]
	xor	r8b, r11b
	cmp	r8b, r11b
	seta	r8b
	or	r8b, r9b
	je	.LBB22_36
# %bb.34:                               #   in Loop: Header=BB22_35 Depth=1
	inc	rdx
	cmp	rax, rdx
	jne	.LBB22_35
	jmp	.LBB22_37
.LBB22_36:
	add	rsi, rcx
	mov	byte ptr [rsi + 8*rdx], dil
.LBB22_37:
	mov	rax, qword ptr fs:[40]
	cmp	rax, qword ptr [rbp - 48]
	jne	.LBB22_39
# %bb.38:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa rsp, 8
	vzeroupper
	ret
.LBB22_39:
	.cfi_def_cfa rbp, 16
	vzeroupper
	call	__stack_chk_fail@PLT
.Lfunc_end22:
	.size	apply_process_of_elimination, .Lfunc_end22-apply_process_of_elimination
	.cfi_endproc
                                        # -- End function
	.globl	apply_constraint_propagation    # -- Begin function apply_constraint_propagation
	.p2align	4, 0x90
	.type	apply_constraint_propagation,@function
apply_constraint_propagation:           # @apply_constraint_propagation
	.cfi_startproc
# %bb.0:
	add	dl, -49
	mov	eax, 1
	shlx	ecx, eax, edx
	movsxd	r9, dword ptr [rip + length]
	movsxd	rdx, edi
	movsxd	rsi, esi
	test	r9, r9
	jle	.LBB23_1
# %bb.3:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	edi, ecx
	not	dil
	cmp	r9d, 1
	jne	.LBB23_11
# %bb.4:
	xor	r8d, r8d
	xor	eax, eax
.LBB23_5:
	test	r9b, 1
	je	.LBB23_10
# %bb.6:
	lea	r9, [rip + con]
	lea	r10, [r9 + 8*rdx]
	movzx	r11d, byte ptr [r8 + r10]
	lea	ebx, [r11 - 1]
	mov	ebp, r11d
	xor	bpl, bl
	cmp	bpl, bl
	seta	bl
	lea	r14, [r9 + 8*r8]
	movzx	r9d, byte ptr [rsi + r14]
	and	r11b, dil
	mov	byte ptr [r8 + r10], r11b
	and	dil, byte ptr [rsi + r14]
	mov	byte ptr [rsi + r14], dil
	movzx	r8d, byte ptr [r8 + r10]
	lea	r10d, [r8 - 1]
	xor	r8b, r10b
	cmp	r8b, r10b
	setbe	r8b
	or	r8b, bl
	cmp	r8b, 1
	jne	.LBB23_9
# %bb.7:
	lea	r8d, [rdi - 1]
	xor	dil, r8b
	cmp	dil, r8b
	jbe	.LBB23_10
# %bb.8:
	movzx	edi, r9b
	popcnt	edi, edi
	cmp	dil, 1
	je	.LBB23_10
.LBB23_9:
	mov	al, 1
.LBB23_10:
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	.cfi_restore rbx
	.cfi_restore r12
	.cfi_restore r13
	.cfi_restore r14
	.cfi_restore r15
	.cfi_restore rbp
	jmp	.LBB23_2
.LBB23_1:
	xor	eax, eax
.LBB23_2:
	lea	rdi, [rip + con]
	lea	rdx, [rdi + 8*rdx]
	mov	byte ptr [rsi + rdx], cl
	and	al, 1
                                        # kill: def $al killed $al killed $eax
	ret
.LBB23_11:
	.cfi_def_cfa_offset 56
	.cfi_offset rbx, -56
	.cfi_offset rbp, -16
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r10d, r9d
	and	r10d, 2147483646
	lea	rax, [rip + con]
	lea	r11, [rax + 8*rdx]
	inc	r11
	lea	rbx, [rsi + rax]
	add	rbx, 8
	xor	r8d, r8d
	xor	eax, eax
	jmp	.LBB23_12
	.p2align	4, 0x90
.LBB23_19:                              #   in Loop: Header=BB23_12 Depth=1
	mov	al, 1
.LBB23_20:                              #   in Loop: Header=BB23_12 Depth=1
	add	r8, 2
	cmp	r10, r8
	je	.LBB23_5
.LBB23_12:                              # =>This Inner Loop Header: Depth=1
	movzx	r14d, byte ptr [r11 + r8 - 1]
	lea	ebp, [r14 - 1]
	mov	r15d, r14d
	xor	r15b, bpl
	cmp	r15b, bpl
	seta	r15b
	movzx	ebp, byte ptr [rbx + 8*r8 - 8]
	and	r14b, dil
	mov	byte ptr [r11 + r8 - 1], r14b
	movzx	r14d, byte ptr [rbx + 8*r8 - 8]
	and	r14b, dil
	mov	byte ptr [rbx + 8*r8 - 8], r14b
	movzx	r12d, byte ptr [r11 + r8 - 1]
	lea	r13d, [r12 - 1]
	xor	r12b, r13b
	cmp	r12b, r13b
	setbe	r12b
	or	r12b, r15b
	cmp	r12b, 1
	jne	.LBB23_15
# %bb.13:                               #   in Loop: Header=BB23_12 Depth=1
	lea	r15d, [r14 - 1]
	xor	r14b, r15b
	cmp	r14b, r15b
	jbe	.LBB23_16
# %bb.14:                               #   in Loop: Header=BB23_12 Depth=1
	movzx	ebp, bpl
	popcnt	ebp, ebp
	cmp	bpl, 1
	je	.LBB23_16
.LBB23_15:                              #   in Loop: Header=BB23_12 Depth=1
	mov	al, 1
.LBB23_16:                              #   in Loop: Header=BB23_12 Depth=1
	movzx	r14d, byte ptr [r11 + r8]
	lea	ebp, [r14 - 1]
	mov	r15d, r14d
	xor	r15b, bpl
	cmp	r15b, bpl
	seta	r15b
	movzx	ebp, byte ptr [rbx + 8*r8]
	and	r14b, dil
	mov	byte ptr [r11 + r8], r14b
	movzx	r14d, byte ptr [rbx + 8*r8]
	and	r14b, dil
	mov	byte ptr [rbx + 8*r8], r14b
	movzx	r12d, byte ptr [r11 + r8]
	lea	r13d, [r12 - 1]
	xor	r12b, r13b
	cmp	r12b, r13b
	setbe	r12b
	or	r12b, r15b
	cmp	r12b, 1
	jne	.LBB23_19
# %bb.17:                               #   in Loop: Header=BB23_12 Depth=1
	lea	r15d, [r14 - 1]
	xor	r14b, r15b
	cmp	r14b, r15b
	jbe	.LBB23_20
# %bb.18:                               #   in Loop: Header=BB23_12 Depth=1
	movzx	ebp, bpl
	popcnt	ebp, ebp
	cmp	bpl, 1
	jne	.LBB23_19
	jmp	.LBB23_20
.Lfunc_end23:
	.size	apply_constraint_propagation, .Lfunc_end23-apply_constraint_propagation
	.cfi_endproc
                                        # -- End function
	.globl	edge_constraint                 # -- Begin function edge_constraint
	.p2align	4, 0x90
	.type	edge_constraint,@function
edge_constraint:                        # @edge_constraint
	.cfi_startproc
# %bb.0:
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset rbx, -16
	mov	r8d, dword ptr [rip + length]
	movsxd	rax, esi
	lea	rsi, [rip + top_key]
	lea	r9, [rip + bottom_key]
	movsxd	rcx, edi
	lea	rdi, [rip + left_key]
	lea	rdx, [rip + right_key]
	lea	r10d, [r8 + rcx]
	inc	r10d
	sub	r10d, dword ptr [rsi + 4*rax]
	mov	esi, -1
	shlx	r10d, esi, r10d
	lea	r11d, [r8 + rax]
	inc	r11d
                                        # kill: def $r8d killed $r8d killed $r8
	add	r8d, r8d
	mov	r9d, dword ptr [r9 + 4*rax]
	add	r9d, ecx
	mov	ebx, r8d
	sub	ebx, r9d
	shlx	r9d, esi, ebx
	or	r9d, r10d
	sub	r11d, dword ptr [rdi + 4*rcx]
	add	eax, dword ptr [rdx + 4*rcx]
	shlx	ecx, esi, r11d
	sub	r8d, eax
	shlx	eax, esi, r8d
	or	eax, ecx
	or	eax, r9d
	not	al
                                        # kill: def $al killed $al killed $eax
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end24:
	.size	edge_constraint, .Lfunc_end24-edge_constraint
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0                          # -- Begin function edge_clue_initialization
.LCPI25_0:
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	10                              # 0xa
	.long	11                              # 0xb
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	14                              # 0xe
	.long	15                              # 0xf
.LCPI25_1:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
.LCPI25_7:
	.long	24                              # 0x18
	.long	25                              # 0x19
	.long	26                              # 0x1a
	.long	27                              # 0x1b
	.long	28                              # 0x1c
	.long	29                              # 0x1d
	.long	30                              # 0x1e
	.long	31                              # 0x1f
.LCPI25_8:
	.long	16                              # 0x10
	.long	17                              # 0x11
	.long	18                              # 0x12
	.long	19                              # 0x13
	.long	20                              # 0x14
	.long	21                              # 0x15
	.long	22                              # 0x16
	.long	23                              # 0x17
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI25_2:
	.long	822083584                       # 0x31000000
.LCPI25_3:
	.long	4294967247                      # 0xffffffcf
.LCPI25_4:
	.long	1                               # 0x1
.LCPI25_5:
	.long	16                              # 0x10
.LCPI25_6:
	.long	8                               # 0x8
.LCPI25_9:
	.byte	255                             # 0xff
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
.LCPI25_10:
	.long	32                              # 0x20
	.section	.rodata.cst8,"aM",@progbits,8
.LCPI25_11:
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	4                               # 0x4
	.byte	5                               # 0x5
	.byte	6                               # 0x6
	.byte	7                               # 0x7
.LCPI25_12:
	.byte	8                               # 0x8
	.byte	9                               # 0x9
	.byte	10                              # 0xa
	.byte	11                              # 0xb
	.byte	12                              # 0xc
	.byte	13                              # 0xd
	.byte	14                              # 0xe
	.byte	15                              # 0xf
.LCPI25_13:
	.byte	16                              # 0x10
	.byte	17                              # 0x11
	.byte	18                              # 0x12
	.byte	19                              # 0x13
	.byte	20                              # 0x14
	.byte	21                              # 0x15
	.byte	22                              # 0x16
	.byte	23                              # 0x17
.LCPI25_14:
	.byte	24                              # 0x18
	.byte	25                              # 0x19
	.byte	26                              # 0x1a
	.byte	27                              # 0x1b
	.byte	28                              # 0x1c
	.byte	29                              # 0x1d
	.byte	30                              # 0x1e
	.byte	31                              # 0x1f
	.text
	.globl	edge_clue_initialization
	.p2align	4, 0x90
	.type	edge_clue_initialization,@function
edge_clue_initialization:               # @edge_clue_initialization
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	movsxd	rsi, dword ptr [rip + length]
	test	rsi, rsi
	jle	.LBB25_17
# %bb.1:
	lea	eax, [rsi + 48]
	mov	ecx, esi
	and	ecx, 2147483632
	mov	qword ptr [rsp - 16], rcx       # 8-byte Spill
	mov	r10d, esi
	and	r10d, 2147483640
	mov	dword ptr [rsp - 4], eax        # 4-byte Spill
	vmovd	xmm0, eax
	vpbroadcastd	ymm0, xmm0
	mov	r11d, esi
	and	r11d, 2147483616
	mov	ebx, esi
	shr	ebx, 4
	and	ebx, 134217727
	shl	rbx, 7
	lea	r14, [rip + con+120]
	lea	r15, [rip + con+32]
	lea	r12, [rip + con]
	xor	r13d, r13d
	mov	ebp, 1
	vpmovsxbd	ymm1, qword ptr [rip + .LCPI25_11] # ymm1 = [0,1,2,3,4,5,6,7]
	vpbroadcastd	ymm2, dword ptr [rip + .LCPI25_2] # ymm2 = [822083584,822083584,822083584,822083584,822083584,822083584,822083584,822083584]
	vpbroadcastd	ymm3, dword ptr [rip + .LCPI25_3] # ymm3 = [4294967247,4294967247,4294967247,4294967247,4294967247,4294967247,4294967247,4294967247]
	vpbroadcastd	ymm4, dword ptr [rip + .LCPI25_4] # ymm4 = [1,1,1,1,1,1,1,1]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI25_6] # ymm5 = [8,8,8,8,8,8,8,8]
	vpmovsxbd	ymm6, qword ptr [rip + .LCPI25_12] # ymm6 = [8,9,10,11,12,13,14,15]
	mov	rax, r12
	jmp	.LBB25_2
	.p2align	4, 0x90
.LBB25_72:                              #   in Loop: Header=BB25_2 Depth=1
	inc	r13
	inc	r14
	inc	r15
	inc	rax
	add	r12, 8
	cmp	r13, rsi
	je	.LBB25_5
.LBB25_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB25_23 Depth 2
                                        #     Child Loop BB25_27 Depth 2
                                        #     Child Loop BB25_30 Depth 2
                                        #     Child Loop BB25_36 Depth 2
                                        #     Child Loop BB25_40 Depth 2
                                        #     Child Loop BB25_43 Depth 2
                                        #     Child Loop BB25_50 Depth 2
                                        #     Child Loop BB25_54 Depth 2
                                        #     Child Loop BB25_57 Depth 2
                                        #     Child Loop BB25_64 Depth 2
                                        #     Child Loop BB25_68 Depth 2
                                        #     Child Loop BB25_71 Depth 2
	lea	rcx, [rip + top_key]
	cmp	dword ptr [rcx + 4*r13], esi
	jne	.LBB25_31
# %bb.3:                                #   in Loop: Header=BB25_2 Depth=1
	cmp	esi, 8
	jae	.LBB25_21
# %bb.4:                                #   in Loop: Header=BB25_2 Depth=1
	xor	r8d, r8d
	jmp	.LBB25_29
	.p2align	4, 0x90
.LBB25_21:                              #   in Loop: Header=BB25_2 Depth=1
	xor	ecx, ecx
	cmp	esi, 16
	jae	.LBB25_22
.LBB25_26:                              #   in Loop: Header=BB25_2 Depth=1
	vmovd	xmm9, ecx
	vpbroadcastd	ymm9, xmm9
	vpor	ymm9, ymm9, ymm1
	.p2align	4, 0x90
.LBB25_27:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpslld	ymm10, ymm9, 24
	vpaddd	ymm10, ymm10, ymm2
	vpsrad	ymm10, ymm10, 24
	vpaddd	ymm10, ymm10, ymm3
	vpsllvd	ymm10, ymm4, ymm10
	vextracti128	xmm11, ymm10, 1
	vpextrb	byte ptr [r15 + 8*rcx - 32], xmm10, 0
	vpextrb	byte ptr [r15 + 8*rcx - 24], xmm10, 4
	vpextrb	byte ptr [r15 + 8*rcx - 16], xmm10, 8
	vpextrb	byte ptr [r15 + 8*rcx - 8], xmm10, 12
	vpextrb	byte ptr [r15 + 8*rcx], xmm11, 0
	vpextrb	byte ptr [r15 + 8*rcx + 8], xmm11, 4
	vpextrb	byte ptr [r15 + 8*rcx + 16], xmm11, 8
	vpextrb	byte ptr [r15 + 8*rcx + 24], xmm11, 12
	add	rcx, 8
	vpaddd	ymm9, ymm9, ymm5
	cmp	r10, rcx
	jne	.LBB25_27
# %bb.28:                               #   in Loop: Header=BB25_2 Depth=1
	mov	r8, r10
	cmp	r10, rsi
	jne	.LBB25_29
	jmp	.LBB25_31
.LBB25_22:                              #   in Loop: Header=BB25_2 Depth=1
	vmovdqa	ymm9, ymm1
	vmovdqa	ymm10, ymm6
	.p2align	4, 0x90
.LBB25_23:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpslld	ymm11, ymm9, 24
	vpslld	ymm12, ymm10, 24
	vpaddd	ymm12, ymm12, ymm2
	vpaddd	ymm11, ymm11, ymm2
	vpsrad	ymm11, ymm11, 24
	vpsrad	ymm12, ymm12, 24
	vpaddd	ymm12, ymm12, ymm3
	vpaddd	ymm11, ymm11, ymm3
	vpsllvd	ymm11, ymm4, ymm11
	vpsllvd	ymm12, ymm4, ymm12
	vextracti128	xmm13, ymm12, 1
	vextracti128	xmm14, ymm11, 1
	vpextrb	byte ptr [r14 + rcx - 120], xmm11, 0
	vpextrb	byte ptr [r14 + rcx - 112], xmm11, 4
	vpextrb	byte ptr [r14 + rcx - 104], xmm11, 8
	vpextrb	byte ptr [r14 + rcx - 96], xmm11, 12
	vpextrb	byte ptr [r14 + rcx - 88], xmm14, 0
	vpextrb	byte ptr [r14 + rcx - 80], xmm14, 4
	vpextrb	byte ptr [r14 + rcx - 72], xmm14, 8
	vpextrb	byte ptr [r14 + rcx - 64], xmm14, 12
	vpextrb	byte ptr [r14 + rcx - 56], xmm12, 0
	vpextrb	byte ptr [r14 + rcx - 48], xmm12, 4
	vpextrb	byte ptr [r14 + rcx - 40], xmm12, 8
	vpextrb	byte ptr [r14 + rcx - 32], xmm12, 12
	vpextrb	byte ptr [r14 + rcx - 24], xmm13, 0
	vpextrb	byte ptr [r14 + rcx - 16], xmm13, 4
	vpextrb	byte ptr [r14 + rcx - 8], xmm13, 8
	vpextrb	byte ptr [r14 + rcx], xmm13, 12
	vpbroadcastd	ymm11, dword ptr [rip + .LCPI25_5] # ymm11 = [16,16,16,16,16,16,16,16]
	vpaddd	ymm9, ymm9, ymm11
	vpaddd	ymm10, ymm10, ymm11
	sub	rcx, -128
	cmp	rbx, rcx
	jne	.LBB25_23
# %bb.24:                               #   in Loop: Header=BB25_2 Depth=1
	cmp	qword ptr [rsp - 16], rsi       # 8-byte Folded Reload
	je	.LBB25_31
# %bb.25:                               #   in Loop: Header=BB25_2 Depth=1
	mov	r8, qword ptr [rsp - 16]        # 8-byte Reload
	mov	rcx, r8
	test	sil, 8
	jne	.LBB25_26
	.p2align	4, 0x90
.LBB25_29:                              #   in Loop: Header=BB25_2 Depth=1
	mov	edx, r8d
	shl	edx, 24
	add	edx, 822083584
	lea	rdi, [rax + 8*r8]
	mov	r9, rsi
	sub	r9, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB25_30:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	ecx, edx
	shr	ecx, 24
	add	cl, -49
	shlx	ecx, ebp, ecx
	mov	byte ptr [rdi + 8*r8], cl
	add	edx, 16777216
	inc	r8
	cmp	r9, r8
	jne	.LBB25_30
.LBB25_31:                              #   in Loop: Header=BB25_2 Depth=1
	lea	rcx, [rip + bottom_key]
	cmp	dword ptr [rcx + 4*r13], esi
	jne	.LBB25_44
# %bb.32:                               #   in Loop: Header=BB25_2 Depth=1
	cmp	esi, 8
	jae	.LBB25_34
# %bb.33:                               #   in Loop: Header=BB25_2 Depth=1
	xor	r8d, r8d
	jmp	.LBB25_42
	.p2align	4, 0x90
.LBB25_34:                              #   in Loop: Header=BB25_2 Depth=1
	xor	ecx, ecx
	cmp	esi, 16
	jae	.LBB25_35
.LBB25_39:                              #   in Loop: Header=BB25_2 Depth=1
	vmovd	xmm9, ecx
	vpbroadcastd	ymm9, xmm9
	vpor	ymm9, ymm9, ymm1
	.p2align	4, 0x90
.LBB25_40:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpsubd	ymm10, ymm0, ymm9
	vpslld	ymm10, ymm10, 24
	vpsrad	ymm10, ymm10, 24
	vpaddd	ymm10, ymm10, ymm3
	vpsllvd	ymm10, ymm4, ymm10
	vextracti128	xmm11, ymm10, 1
	vpextrb	byte ptr [r15 + 8*rcx - 32], xmm10, 0
	vpextrb	byte ptr [r15 + 8*rcx - 24], xmm10, 4
	vpextrb	byte ptr [r15 + 8*rcx - 16], xmm10, 8
	vpextrb	byte ptr [r15 + 8*rcx - 8], xmm10, 12
	vpextrb	byte ptr [r15 + 8*rcx], xmm11, 0
	vpextrb	byte ptr [r15 + 8*rcx + 8], xmm11, 4
	vpextrb	byte ptr [r15 + 8*rcx + 16], xmm11, 8
	vpextrb	byte ptr [r15 + 8*rcx + 24], xmm11, 12
	add	rcx, 8
	vpaddd	ymm9, ymm9, ymm5
	cmp	r10, rcx
	jne	.LBB25_40
# %bb.41:                               #   in Loop: Header=BB25_2 Depth=1
	mov	r8, r10
	cmp	r10, rsi
	jne	.LBB25_42
	jmp	.LBB25_44
.LBB25_35:                              #   in Loop: Header=BB25_2 Depth=1
	vmovdqa	ymm9, ymm1
	vmovdqa	ymm10, ymm6
	.p2align	4, 0x90
.LBB25_36:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpsubd	ymm11, ymm0, ymm10
	vpsubd	ymm12, ymm0, ymm9
	vpslld	ymm12, ymm12, 24
	vpsrad	ymm12, ymm12, 24
	vpslld	ymm11, ymm11, 24
	vpsrad	ymm11, ymm11, 24
	vpaddd	ymm11, ymm11, ymm3
	vpaddd	ymm12, ymm12, ymm3
	vpsllvd	ymm12, ymm4, ymm12
	vpsllvd	ymm11, ymm4, ymm11
	vextracti128	xmm13, ymm11, 1
	vextracti128	xmm14, ymm12, 1
	vpextrb	byte ptr [r14 + rcx - 120], xmm12, 0
	vpextrb	byte ptr [r14 + rcx - 112], xmm12, 4
	vpextrb	byte ptr [r14 + rcx - 104], xmm12, 8
	vpextrb	byte ptr [r14 + rcx - 96], xmm12, 12
	vpextrb	byte ptr [r14 + rcx - 88], xmm14, 0
	vpextrb	byte ptr [r14 + rcx - 80], xmm14, 4
	vpextrb	byte ptr [r14 + rcx - 72], xmm14, 8
	vpextrb	byte ptr [r14 + rcx - 64], xmm14, 12
	vpextrb	byte ptr [r14 + rcx - 56], xmm11, 0
	vpextrb	byte ptr [r14 + rcx - 48], xmm11, 4
	vpextrb	byte ptr [r14 + rcx - 40], xmm11, 8
	vpextrb	byte ptr [r14 + rcx - 32], xmm11, 12
	vpextrb	byte ptr [r14 + rcx - 24], xmm13, 0
	vpextrb	byte ptr [r14 + rcx - 16], xmm13, 4
	vpextrb	byte ptr [r14 + rcx - 8], xmm13, 8
	vpextrb	byte ptr [r14 + rcx], xmm13, 12
	vpbroadcastd	ymm11, dword ptr [rip + .LCPI25_5] # ymm11 = [16,16,16,16,16,16,16,16]
	vpaddd	ymm9, ymm9, ymm11
	vpaddd	ymm10, ymm10, ymm11
	sub	rcx, -128
	cmp	rbx, rcx
	jne	.LBB25_36
# %bb.37:                               #   in Loop: Header=BB25_2 Depth=1
	cmp	qword ptr [rsp - 16], rsi       # 8-byte Folded Reload
	je	.LBB25_44
# %bb.38:                               #   in Loop: Header=BB25_2 Depth=1
	mov	r8, qword ptr [rsp - 16]        # 8-byte Reload
	mov	rcx, r8
	test	sil, 8
	jne	.LBB25_39
	.p2align	4, 0x90
.LBB25_42:                              #   in Loop: Header=BB25_2 Depth=1
	mov	ecx, dword ptr [rsp - 4]        # 4-byte Reload
	sub	ecx, r8d
	shl	ecx, 24
	lea	rdi, [rax + 8*r8]
	mov	r9, rsi
	sub	r9, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB25_43:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	edx, ecx
	shr	edx, 24
	add	dl, -49
	shlx	edx, ebp, edx
	mov	byte ptr [rdi + 8*r8], dl
	add	ecx, -16777216
	inc	r8
	cmp	r9, r8
	jne	.LBB25_43
.LBB25_44:                              #   in Loop: Header=BB25_2 Depth=1
	lea	rcx, [rip + left_key]
	cmp	dword ptr [rcx + 4*r13], esi
	jne	.LBB25_58
# %bb.45:                               #   in Loop: Header=BB25_2 Depth=1
	cmp	esi, 16
	jae	.LBB25_47
# %bb.46:                               #   in Loop: Header=BB25_2 Depth=1
	xor	r8d, r8d
	jmp	.LBB25_56
	.p2align	4, 0x90
.LBB25_47:                              #   in Loop: Header=BB25_2 Depth=1
	cmp	esi, 32
	jae	.LBB25_49
# %bb.48:                               #   in Loop: Header=BB25_2 Depth=1
	xor	edi, edi
.LBB25_53:                              #   in Loop: Header=BB25_2 Depth=1
	vmovd	xmm7, edi
	vpbroadcastd	ymm7, xmm7
	vpor	ymm9, ymm7, ymm6
	vpor	ymm10, ymm7, ymm1
	lea	rcx, [r12 + rdi]
	mov	r9, qword ptr [rsp - 16]        # 8-byte Reload
	sub	r9, rdi
	xor	edi, edi
	.p2align	4, 0x90
.LBB25_54:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpslld	ymm7, ymm9, 24
	vpslld	ymm8, ymm10, 24
	vpaddd	ymm8, ymm8, ymm2
	vpaddd	ymm7, ymm7, ymm2
	vpsrad	ymm7, ymm7, 24
	vpsrad	ymm8, ymm8, 24
	vpaddd	ymm8, ymm8, ymm3
	vpaddd	ymm7, ymm7, ymm3
	vpsllvd	ymm7, ymm4, ymm7
	vpsllvd	ymm8, ymm4, ymm8
	vpbroadcastd	ymm11, dword ptr [rip + .LCPI25_9] # ymm11 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	vpand	ymm8, ymm8, ymm11
	vpand	ymm7, ymm11, ymm7
	vpackusdw	ymm7, ymm8, ymm7
	vextracti128	xmm8, ymm7, 1
	vpackuswb	xmm7, xmm7, xmm8
	vpshufd	xmm7, xmm7, 216                 # xmm7 = xmm7[0,2,1,3]
	vmovdqu	xmmword ptr [rcx + rdi], xmm7
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI25_5] # ymm7 = [16,16,16,16,16,16,16,16]
	vpaddd	ymm10, ymm10, ymm7
	vpaddd	ymm9, ymm9, ymm7
	add	rdi, 16
	cmp	r9, rdi
	jne	.LBB25_54
# %bb.55:                               #   in Loop: Header=BB25_2 Depth=1
	mov	rcx, qword ptr [rsp - 16]       # 8-byte Reload
	mov	r8, rcx
	cmp	rcx, rsi
	jne	.LBB25_56
	jmp	.LBB25_58
.LBB25_49:                              #   in Loop: Header=BB25_2 Depth=1
	xor	ecx, ecx
	vmovdqa	ymm9, ymm1
	vmovdqa	ymm10, ymm6
	vpmovsxbd	ymm11, qword ptr [rip + .LCPI25_13] # ymm11 = [16,17,18,19,20,21,22,23]
	vpmovsxbd	ymm12, qword ptr [rip + .LCPI25_14] # ymm12 = [24,25,26,27,28,29,30,31]
	.p2align	4, 0x90
.LBB25_50:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpslld	ymm13, ymm12, 24
	vpslld	ymm14, ymm11, 24
	vpslld	ymm15, ymm10, 24
	vpslld	ymm7, ymm9, 24
	vpaddd	ymm7, ymm7, ymm2
	vpaddd	ymm15, ymm15, ymm2
	vpaddd	ymm14, ymm14, ymm2
	vpaddd	ymm13, ymm13, ymm2
	vpsrad	ymm13, ymm13, 24
	vpsrad	ymm14, ymm14, 24
	vpsrad	ymm15, ymm15, 24
	vpsrad	ymm7, ymm7, 24
	vpaddd	ymm7, ymm7, ymm3
	vpaddd	ymm15, ymm15, ymm3
	vpaddd	ymm14, ymm14, ymm3
	vpaddd	ymm13, ymm13, ymm3
	vpsllvd	ymm13, ymm4, ymm13
	vpsllvd	ymm14, ymm4, ymm14
	vpsllvd	ymm15, ymm4, ymm15
	vpsllvd	ymm7, ymm4, ymm7
	vpbroadcastd	ymm8, dword ptr [rip + .LCPI25_9] # ymm8 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	vpand	ymm7, ymm8, ymm7
	vpand	ymm15, ymm15, ymm8
	vpackusdw	ymm7, ymm7, ymm15
	vpermq	ymm7, ymm7, 216                 # ymm7 = ymm7[0,2,1,3]
	vpand	ymm14, ymm14, ymm8
	vpand	ymm8, ymm13, ymm8
	vpackusdw	ymm8, ymm14, ymm8
	vpermq	ymm8, ymm8, 216                 # ymm8 = ymm8[0,2,1,3]
	vpackuswb	ymm7, ymm7, ymm8
	vpermq	ymm7, ymm7, 216                 # ymm7 = ymm7[0,2,1,3]
	vmovdqu	ymmword ptr [r12 + rcx], ymm7
	add	rcx, 32
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI25_10] # ymm7 = [32,32,32,32,32,32,32,32]
	vpaddd	ymm9, ymm9, ymm7
	vpaddd	ymm10, ymm10, ymm7
	vpaddd	ymm11, ymm11, ymm7
	vpaddd	ymm12, ymm12, ymm7
	cmp	r11, rcx
	jne	.LBB25_50
# %bb.51:                               #   in Loop: Header=BB25_2 Depth=1
	cmp	r11, rsi
	je	.LBB25_58
# %bb.52:                               #   in Loop: Header=BB25_2 Depth=1
	mov	rdi, r11
	mov	r8, r11
	test	sil, 16
	jne	.LBB25_53
	.p2align	4, 0x90
.LBB25_56:                              #   in Loop: Header=BB25_2 Depth=1
	mov	ecx, r8d
	shl	ecx, 24
	add	ecx, 822083584
	lea	rdi, [r12 + r8]
	mov	r9, rsi
	sub	r9, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB25_57:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	edx, ecx
	shr	edx, 24
	add	dl, -49
	shlx	edx, ebp, edx
	mov	byte ptr [rdi + r8], dl
	add	ecx, 16777216
	inc	r8
	cmp	r9, r8
	jne	.LBB25_57
.LBB25_58:                              #   in Loop: Header=BB25_2 Depth=1
	lea	rcx, [rip + right_key]
	cmp	dword ptr [rcx + 4*r13], esi
	jne	.LBB25_72
# %bb.59:                               #   in Loop: Header=BB25_2 Depth=1
	cmp	esi, 16
	jae	.LBB25_61
# %bb.60:                               #   in Loop: Header=BB25_2 Depth=1
	xor	r8d, r8d
	jmp	.LBB25_70
	.p2align	4, 0x90
.LBB25_61:                              #   in Loop: Header=BB25_2 Depth=1
	cmp	esi, 32
	jae	.LBB25_63
# %bb.62:                               #   in Loop: Header=BB25_2 Depth=1
	xor	edi, edi
.LBB25_67:                              #   in Loop: Header=BB25_2 Depth=1
	vmovd	xmm7, edi
	vpbroadcastd	ymm7, xmm7
	vpor	ymm9, ymm7, ymm6
	vpor	ymm10, ymm7, ymm1
	lea	rcx, [r12 + rdi]
	mov	r9, qword ptr [rsp - 16]        # 8-byte Reload
	sub	r9, rdi
	xor	edi, edi
	.p2align	4, 0x90
.LBB25_68:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpsubd	ymm7, ymm0, ymm10
	vpsubd	ymm8, ymm0, ymm9
	vpslld	ymm8, ymm8, 24
	vpsrad	ymm8, ymm8, 24
	vpslld	ymm7, ymm7, 24
	vpsrad	ymm7, ymm7, 24
	vpaddd	ymm7, ymm7, ymm3
	vpaddd	ymm8, ymm8, ymm3
	vpsllvd	ymm8, ymm4, ymm8
	vpsllvd	ymm7, ymm4, ymm7
	vpbroadcastd	ymm11, dword ptr [rip + .LCPI25_9] # ymm11 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	vpand	ymm7, ymm11, ymm7
	vpand	ymm8, ymm8, ymm11
	vpackusdw	ymm7, ymm7, ymm8
	vextracti128	xmm8, ymm7, 1
	vpackuswb	xmm7, xmm7, xmm8
	vpshufd	xmm7, xmm7, 216                 # xmm7 = xmm7[0,2,1,3]
	vmovdqu	xmmword ptr [rcx + rdi], xmm7
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI25_5] # ymm7 = [16,16,16,16,16,16,16,16]
	vpaddd	ymm10, ymm10, ymm7
	vpaddd	ymm9, ymm9, ymm7
	add	rdi, 16
	cmp	r9, rdi
	jne	.LBB25_68
# %bb.69:                               #   in Loop: Header=BB25_2 Depth=1
	mov	rcx, qword ptr [rsp - 16]       # 8-byte Reload
	mov	r8, rcx
	cmp	rcx, rsi
	je	.LBB25_72
	jmp	.LBB25_70
.LBB25_63:                              #   in Loop: Header=BB25_2 Depth=1
	xor	ecx, ecx
	vmovdqa	ymm9, ymm1
	vmovdqa	ymm10, ymm6
	vpmovsxbd	ymm11, qword ptr [rip + .LCPI25_13] # ymm11 = [16,17,18,19,20,21,22,23]
	vpmovsxbd	ymm12, qword ptr [rip + .LCPI25_14] # ymm12 = [24,25,26,27,28,29,30,31]
	.p2align	4, 0x90
.LBB25_64:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpsubd	ymm7, ymm0, ymm9
	vpsubd	ymm8, ymm0, ymm10
	vpsubd	ymm13, ymm0, ymm11
	vpsubd	ymm14, ymm0, ymm12
	vpslld	ymm14, ymm14, 24
	vpsrad	ymm14, ymm14, 24
	vpslld	ymm13, ymm13, 24
	vpsrad	ymm13, ymm13, 24
	vpslld	ymm8, ymm8, 24
	vpsrad	ymm8, ymm8, 24
	vpslld	ymm7, ymm7, 24
	vpsrad	ymm7, ymm7, 24
	vpaddd	ymm7, ymm7, ymm3
	vpaddd	ymm8, ymm8, ymm3
	vpaddd	ymm13, ymm13, ymm3
	vpaddd	ymm14, ymm14, ymm3
	vpsllvd	ymm14, ymm4, ymm14
	vpsllvd	ymm13, ymm4, ymm13
	vpsllvd	ymm8, ymm4, ymm8
	vpsllvd	ymm7, ymm4, ymm7
	vpbroadcastd	ymm15, dword ptr [rip + .LCPI25_9] # ymm15 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	vpand	ymm7, ymm15, ymm7
	vpand	ymm8, ymm8, ymm15
	vpackusdw	ymm7, ymm7, ymm8
	vpermq	ymm7, ymm7, 216                 # ymm7 = ymm7[0,2,1,3]
	vpand	ymm8, ymm13, ymm15
	vpand	ymm13, ymm14, ymm15
	vpackusdw	ymm8, ymm8, ymm13
	vpermq	ymm8, ymm8, 216                 # ymm8 = ymm8[0,2,1,3]
	vpackuswb	ymm7, ymm7, ymm8
	vpermq	ymm7, ymm7, 216                 # ymm7 = ymm7[0,2,1,3]
	vmovdqu	ymmword ptr [r12 + rcx], ymm7
	add	rcx, 32
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI25_10] # ymm7 = [32,32,32,32,32,32,32,32]
	vpaddd	ymm9, ymm9, ymm7
	vpaddd	ymm10, ymm10, ymm7
	vpaddd	ymm11, ymm11, ymm7
	vpaddd	ymm12, ymm12, ymm7
	cmp	r11, rcx
	jne	.LBB25_64
# %bb.65:                               #   in Loop: Header=BB25_2 Depth=1
	cmp	r11, rsi
	je	.LBB25_72
# %bb.66:                               #   in Loop: Header=BB25_2 Depth=1
	mov	rdi, r11
	mov	r8, r11
	test	sil, 16
	jne	.LBB25_67
	.p2align	4, 0x90
.LBB25_70:                              #   in Loop: Header=BB25_2 Depth=1
	mov	ecx, dword ptr [rsp - 4]        # 4-byte Reload
	sub	ecx, r8d
	shl	ecx, 24
	lea	rdi, [r12 + r8]
	mov	r9, rsi
	sub	r9, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB25_71:                              #   Parent Loop BB25_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	edx, ecx
	shr	edx, 24
	add	dl, -49
	shlx	edx, ebp, edx
	mov	byte ptr [rdi + r8], dl
	add	ecx, -16777216
	inc	r8
	cmp	r9, r8
	jne	.LBB25_71
	jmp	.LBB25_72
.LBB25_5:
	test	esi, esi
	jle	.LBB25_17
# %bb.6:
	mov	eax, esi
	shl	eax, 24
	add	eax, 805306368
	shr	eax, 24
	add	al, -49
	mov	ecx, 1
	shlx	eax, ecx, eax
	lea	r8d, [rsi - 1]
	cmp	esi, 1
	jne	.LBB25_73
# %bb.7:
	xor	r9d, r9d
.LBB25_8:
	test	sil, 1
	je	.LBB25_17
# %bb.9:
	lea	rcx, [rip + top_key]
	cmp	dword ptr [rcx + 4*r9], 1
	je	.LBB25_10
# %bb.11:
	lea	rcx, [rip + bottom_key]
	cmp	dword ptr [rcx + 4*r9], 1
	je	.LBB25_12
.LBB25_13:
	lea	rcx, [rip + left_key]
	cmp	dword ptr [rcx + 4*r9], 1
	je	.LBB25_14
.LBB25_15:
	lea	rcx, [rip + right_key]
	cmp	dword ptr [rcx + 4*r9], 1
	jne	.LBB25_17
.LBB25_16:
	lea	rcx, [rip + con]
	lea	rcx, [rcx + 8*r9]
	mov	byte ptr [r8 + rcx], al
.LBB25_17:
	test	esi, esi
	je	.LBB25_20
# %bb.18:
	mov	edi, esi
	imul	edi, esi
	lea	r8d, [rsi + 1]
	lea	r11d, [rsi + rsi]
	cmp	edi, 1
	adc	edi, 0
	xor	ecx, ecx
	lea	rbx, [rip + left_key]
	lea	r14, [rip + right_key]
	mov	ebp, -1
	lea	r15, [rip + con]
	.p2align	4, 0x90
.LBB25_19:                              # =>This Inner Loop Header: Depth=1
	mov	eax, ecx
	cdq
	idiv	esi
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	shr	eax, 4
	and	eax, 15
	and	edx, 7
	lea	r12d, [4*rdx]
	lea	r13d, [4*rax]
	mov	r10d, r8d
	lea	r9, [rip + top_key]
	sub	r10d, dword ptr [r12 + r9]
	add	r10d, eax
	shlx	r10d, ebp, r10d
	lea	r9, [rip + bottom_key]
	mov	r12d, dword ptr [r12 + r9]
	add	r12d, eax
	mov	r9d, r11d
	sub	r9d, r12d
	shlx	r9d, ebp, r9d
	or	r9d, r10d
	lea	r10d, [rdx + r8]
	sub	r10d, dword ptr [r13 + rbx]
	mov	r12d, edx
	add	r12d, dword ptr [r13 + r14]
	shlx	r10d, ebp, r10d
	or	r10d, r9d
	mov	r9d, r11d
	sub	r9d, r12d
	shlx	r9d, ebp, r9d
	or	r9d, r10d
	not	r9b
	lea	rax, [r15 + 8*rax]
	and	byte ptr [rdx + rax], r9b
	inc	ecx
	cmp	edi, ecx
	jne	.LBB25_19
.LBB25_20:
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	vzeroupper
	jmp	place_singles                   # TAILCALL
.LBB25_73:
	.cfi_def_cfa_offset 56
	mov	r10d, esi
	and	r10d, 2147483646
	lea	r11, [rip + con]
	lea	rbx, [r11 + 8*r8]
	inc	rbx
	lea	r14, [r8 + r11]
	add	r14, 8
	xor	r9d, r9d
	jmp	.LBB25_74
	.p2align	4, 0x90
.LBB25_90:                              #   in Loop: Header=BB25_74 Depth=1
	add	r9, 2
	cmp	r10, r9
	je	.LBB25_8
.LBB25_74:                              # =>This Inner Loop Header: Depth=1
	lea	rcx, [rip + top_key]
	cmp	dword ptr [rcx + 4*r9], 1
	je	.LBB25_75
# %bb.76:                               #   in Loop: Header=BB25_74 Depth=1
	lea	rcx, [rip + bottom_key]
	cmp	dword ptr [rcx + 4*r9], 1
	je	.LBB25_77
.LBB25_78:                              #   in Loop: Header=BB25_74 Depth=1
	lea	rcx, [rip + left_key]
	cmp	dword ptr [rcx + 4*r9], 1
	je	.LBB25_79
.LBB25_80:                              #   in Loop: Header=BB25_74 Depth=1
	lea	rcx, [rip + right_key]
	cmp	dword ptr [rcx + 4*r9], 1
	je	.LBB25_81
.LBB25_82:                              #   in Loop: Header=BB25_74 Depth=1
	lea	rcx, [rip + top_key]
	cmp	dword ptr [rcx + 4*r9 + 4], 1
	je	.LBB25_83
.LBB25_84:                              #   in Loop: Header=BB25_74 Depth=1
	lea	rcx, [rip + bottom_key]
	cmp	dword ptr [rcx + 4*r9 + 4], 1
	je	.LBB25_85
.LBB25_86:                              #   in Loop: Header=BB25_74 Depth=1
	lea	rcx, [rip + left_key]
	cmp	dword ptr [rcx + 4*r9 + 4], 1
	je	.LBB25_87
.LBB25_88:                              #   in Loop: Header=BB25_74 Depth=1
	lea	rcx, [rip + right_key]
	cmp	dword ptr [rcx + 4*r9 + 4], 1
	jne	.LBB25_90
	jmp	.LBB25_89
	.p2align	4, 0x90
.LBB25_75:                              #   in Loop: Header=BB25_74 Depth=1
	mov	byte ptr [r9 + r11], al
	lea	rcx, [rip + bottom_key]
	cmp	dword ptr [rcx + 4*r9], 1
	jne	.LBB25_78
.LBB25_77:                              #   in Loop: Header=BB25_74 Depth=1
	mov	byte ptr [rbx + r9 - 1], al
	lea	rcx, [rip + left_key]
	cmp	dword ptr [rcx + 4*r9], 1
	jne	.LBB25_80
.LBB25_79:                              #   in Loop: Header=BB25_74 Depth=1
	mov	byte ptr [r11 + 8*r9], al
	lea	rcx, [rip + right_key]
	cmp	dword ptr [rcx + 4*r9], 1
	jne	.LBB25_82
.LBB25_81:                              #   in Loop: Header=BB25_74 Depth=1
	mov	byte ptr [r14 + 8*r9 - 8], al
	lea	rcx, [rip + top_key]
	cmp	dword ptr [rcx + 4*r9 + 4], 1
	jne	.LBB25_84
.LBB25_83:                              #   in Loop: Header=BB25_74 Depth=1
	mov	byte ptr [r9 + r11 + 1], al
	lea	rcx, [rip + bottom_key]
	cmp	dword ptr [rcx + 4*r9 + 4], 1
	jne	.LBB25_86
.LBB25_85:                              #   in Loop: Header=BB25_74 Depth=1
	mov	byte ptr [rbx + r9], al
	lea	rcx, [rip + left_key]
	cmp	dword ptr [rcx + 4*r9 + 4], 1
	jne	.LBB25_88
.LBB25_87:                              #   in Loop: Header=BB25_74 Depth=1
	mov	byte ptr [r11 + 8*r9 + 8], al
	lea	rcx, [rip + right_key]
	cmp	dword ptr [rcx + 4*r9 + 4], 1
	jne	.LBB25_90
.LBB25_89:                              #   in Loop: Header=BB25_74 Depth=1
	mov	byte ptr [r14 + 8*r9], al
	jmp	.LBB25_90
.LBB25_10:
	lea	rcx, [rip + con]
	mov	byte ptr [r9 + rcx], al
	lea	rcx, [rip + bottom_key]
	cmp	dword ptr [rcx + 4*r9], 1
	jne	.LBB25_13
.LBB25_12:
	lea	rcx, [rip + con]
	lea	rcx, [rcx + 8*r8]
	mov	byte ptr [r9 + rcx], al
	lea	rcx, [rip + left_key]
	cmp	dword ptr [rcx + 4*r9], 1
	jne	.LBB25_15
.LBB25_14:
	lea	rcx, [rip + con]
	mov	byte ptr [rcx + 8*r9], al
	lea	rcx, [rip + right_key]
	cmp	dword ptr [rcx + 4*r9], 1
	je	.LBB25_16
	jmp	.LBB25_17
.Lfunc_end25:
	.size	edge_clue_initialization, .Lfunc_end25-edge_clue_initialization
	.cfi_endproc
                                        # -- End function
	.globl	unique_bits                     # -- Begin function unique_bits
	.p2align	4, 0x90
	.type	unique_bits,@function
unique_bits:                            # @unique_bits
	.cfi_startproc
# %bb.0:
	test	edi, edi
	jle	.LBB26_1
# %bb.2:
	mov	r8d, edi
	mov	ecx, r8d
	and	ecx, 7
	cmp	edi, 8
	jae	.LBB26_9
# %bb.3:
	xor	edi, edi
	xor	edx, edx
	xor	eax, eax
	jmp	.LBB26_4
.LBB26_1:
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	ret
.LBB26_9:
	and	r8d, 2147483640
	xor	edi, edi
	xor	r9d, r9d
	xor	eax, eax
	.p2align	4, 0x90
.LBB26_10:                              # =>This Inner Loop Header: Depth=1
	movzx	edx, byte ptr [rsi + rdi]
	movzx	r10d, byte ptr [rsi + rdi + 1]
	mov	r11d, edx
	and	r11b, r9b
	or	r11b, al
	or	dl, r9b
	mov	eax, r10d
	and	al, dl
	or	al, r11b
	or	dl, r10b
	movzx	r9d, byte ptr [rsi + rdi + 2]
	mov	r10d, r9d
	and	r10b, dl
	or	r10b, al
	or	dl, r9b
	movzx	eax, byte ptr [rsi + rdi + 3]
	mov	r9d, eax
	and	r9b, dl
	or	r9b, r10b
	or	dl, al
	movzx	eax, byte ptr [rsi + rdi + 4]
	mov	r10d, eax
	and	r10b, dl
	or	r10b, r9b
	or	dl, al
	movzx	eax, byte ptr [rsi + rdi + 5]
	mov	r9d, eax
	and	r9b, dl
	or	r9b, r10b
	or	dl, al
	movzx	eax, byte ptr [rsi + rdi + 6]
	mov	r10d, eax
	and	r10b, dl
	or	r10b, r9b
	movzx	r9d, byte ptr [rsi + rdi + 7]
	or	dl, al
	mov	eax, r9d
	and	al, dl
	or	al, r10b
	or	dl, r9b
	add	rdi, 8
	mov	r9d, edx
	cmp	r8, rdi
	jne	.LBB26_10
.LBB26_4:
	test	rcx, rcx
	je	.LBB26_7
# %bb.5:
	add	rsi, rdi
	xor	edi, edi
	.p2align	4, 0x90
.LBB26_6:                               # =>This Inner Loop Header: Depth=1
	movzx	r8d, byte ptr [rsi + rdi]
	mov	r9d, r8d
	and	r9b, dl
	or	al, r9b
	or	dl, r8b
	inc	rdi
	cmp	rcx, rdi
	jne	.LBB26_6
.LBB26_7:
	not	al
	and	al, dl
                                        # kill: def $al killed $al killed $eax
	ret
.Lfunc_end26:
	.size	unique_bits, .Lfunc_end26-unique_bits
	.cfi_endproc
                                        # -- End function
	.globl	pp_constraints                  # -- Begin function pp_constraints
	.p2align	4, 0x90
	.type	pp_constraints,@function
pp_constraints:                         # @pp_constraints
	.cfi_startproc
# %bb.0:
	ret
.Lfunc_end27:
	.size	pp_constraints, .Lfunc_end27-pp_constraints
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0                          # -- Begin function solver_win
.LCPI28_0:
	.zero	1
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI28_1:
	.zero	1
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.section	.rodata,"a",@progbits
.LCPI28_2:
	.byte	255                             # 0xff
	.text
	.globl	solver_win
	.p2align	4, 0x90
	.type	solver_win,@function
solver_win:                             # @solver_win
	.cfi_startproc
# %bb.0:
	movsxd	rcx, dword ptr [rip + length]
	mov	eax, -1
	shlx	eax, eax, ecx
	not	al
	mov	esi, eax
	test	rcx, rcx
	jle	.LBB28_8
# %bb.1:
	cmp	ecx, 16
	jae	.LBB28_3
# %bb.2:
	xor	edx, edx
	mov	esi, eax
	jmp	.LBB28_13
.LBB28_3:
	cmp	ecx, 128
	jae	.LBB28_9
# %bb.4:
	xor	edx, edx
	mov	esi, eax
	jmp	.LBB28_5
.LBB28_9:
	mov	edx, ecx
	and	edx, 2147483520
	vpbroadcastb	ymm0, byte ptr [rip + .LCPI28_2] # ymm0 = [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
	vpinsrb	xmm1, xmm0, eax, 0
	vpblendd	ymm0, ymm0, ymm1, 15            # ymm0 = ymm1[0,1,2,3],ymm0[4,5,6,7]
	vpcmpeqd	ymm1, ymm1, ymm1
	xor	esi, esi
	lea	rdi, [rip + con]
	vpcmpeqd	ymm2, ymm2, ymm2
	vpcmpeqd	ymm3, ymm3, ymm3
	.p2align	4, 0x90
.LBB28_10:                              # =>This Inner Loop Header: Depth=1
	vpand	ymm0, ymm0, ymmword ptr [rsi + rdi + 64]
	vpand	ymm1, ymm1, ymmword ptr [rsi + rdi + 96]
	vpand	ymm2, ymm2, ymmword ptr [rsi + rdi + 128]
	vpand	ymm3, ymm3, ymmword ptr [rsi + rdi + 160]
	sub	rsi, -128
	cmp	rdx, rsi
	jne	.LBB28_10
# %bb.11:
	vpand	ymm0, ymm1, ymm0
	vpand	ymm1, ymm3, ymm2
	vpand	ymm0, ymm1, ymm0
	vextracti128	xmm1, ymm0, 1
	vpand	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 238                 # xmm1 = xmm0[2,3,2,3]
	vpand	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 85                  # xmm1 = xmm0[1,1,1,1]
	vpand	xmm0, xmm0, xmm1
	vpsrld	xmm1, xmm0, 16
	vpand	xmm0, xmm0, xmm1
	vpsrlw	xmm1, xmm0, 8
	vpand	xmm0, xmm0, xmm1
	vmovd	esi, xmm0
	cmp	rdx, rcx
	je	.LBB28_8
# %bb.12:
	test	cl, 112
	je	.LBB28_13
.LBB28_5:
	mov	rdi, rdx
	mov	edx, ecx
	and	edx, 2147483632
	vpbroadcastb	xmm0, byte ptr [rip + .LCPI28_2] # xmm0 = [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
	vpinsrb	xmm0, xmm0, esi, 0
	lea	rsi, [rip + con]
	.p2align	4, 0x90
.LBB28_6:                               # =>This Inner Loop Header: Depth=1
	vpand	xmm0, xmm0, xmmword ptr [rdi + rsi + 64]
	add	rdi, 16
	cmp	rdx, rdi
	jne	.LBB28_6
# %bb.7:
	vpshufd	xmm1, xmm0, 238                 # xmm1 = xmm0[2,3,2,3]
	vpand	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 85                  # xmm1 = xmm0[1,1,1,1]
	vpand	xmm0, xmm0, xmm1
	vpsrld	xmm1, xmm0, 16
	vpand	xmm0, xmm0, xmm1
	vpsrlw	xmm1, xmm0, 8
	vpand	xmm0, xmm0, xmm1
	vmovd	esi, xmm0
	cmp	rdx, rcx
	je	.LBB28_8
.LBB28_13:
	lea	rdi, [rip + con]
	.p2align	4, 0x90
.LBB28_14:                              # =>This Inner Loop Header: Depth=1
	and	sil, byte ptr [rdx + rdi + 64]
	inc	rdx
	cmp	rcx, rdx
	jne	.LBB28_14
.LBB28_8:
	cmp	sil, al
	sete	al
	vzeroupper
	ret
.Lfunc_end28:
	.size	solver_win, .Lfunc_end28-solver_win
	.cfi_endproc
                                        # -- End function
	.globl	swap                            # -- Begin function swap
	.p2align	4, 0x90
	.type	swap,@function
swap:                                   # @swap
	.cfi_startproc
# %bb.0:
	movzx	eax, byte ptr [rdi]
	movzx	ecx, byte ptr [rsi]
	mov	byte ptr [rdi], cl
	mov	byte ptr [rsi], al
	ret
.Lfunc_end29:
	.size	swap, .Lfunc_end29-swap
	.cfi_endproc
                                        # -- End function
	.globl	permutations                    # -- Begin function permutations
	.p2align	4, 0x90
	.type	permutations,@function
permutations:                           # @permutations
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	push	rax
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rbx, rdx
	mov	ebp, esi
	mov	r14, rdi
	cmp	ecx, 1
	jne	.LBB30_1
# %bb.6:
	movsxd	rax, dword ptr [rip + sequence_pos]
	lea	rdi, [r14 + 8*rax]
	movsxd	rdx, ebp
	mov	rsi, rbx
	call	memcpy@PLT
	inc	dword ptr [rip + sequence_pos]
	jmp	.LBB30_7
.LBB30_1:
	jl	.LBB30_7
# %bb.2:
	mov	r12d, ecx
	lea	r15d, [r12 - 1]
	test	r12b, 1
	jne	.LBB30_5
# %bb.3:
	mov	r12d, r12d
	xor	r13d, r13d
	.p2align	4, 0x90
.LBB30_4:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, r14
	mov	esi, ebp
	mov	rdx, rbx
	mov	ecx, r15d
	call	permutations
	movzx	eax, byte ptr [rbx + r13]
	movzx	ecx, byte ptr [rbx + r15]
	mov	byte ptr [rbx + r13], cl
	mov	byte ptr [rbx + r15], al
	inc	r13
	cmp	r12, r13
	jne	.LBB30_4
	jmp	.LBB30_7
	.p2align	4, 0x90
.LBB30_5:                               # =>This Inner Loop Header: Depth=1
	mov	rdi, r14
	mov	esi, ebp
	mov	rdx, rbx
	mov	ecx, r15d
	call	permutations
	movzx	eax, byte ptr [rbx]
	movzx	ecx, byte ptr [rbx + r15]
	mov	byte ptr [rbx], cl
	mov	byte ptr [rbx + r15], al
	dec	r12d
	jne	.LBB30_5
.LBB30_7:
	add	rsp, 8
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end30:
	.size	permutations, .Lfunc_end30-permutations
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function generate_valid_sequences
.LCPI31_0:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI31_1:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI31_2:
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI31_3:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI31_4:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	4                               # 0x4
	.long	6                               # 0x6
.LCPI31_5:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
.LCPI31_6:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.section	.rodata,"a",@progbits
	.p2align	1, 0x0
.LCPI31_7:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.section	.rodata.cst8,"aM",@progbits,8
.LCPI31_8:
	.byte	0                               # 0x0
	.byte	2                               # 0x2
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	0                               # 0x0
	.byte	2                               # 0x2
	.byte	4                               # 0x4
	.byte	6                               # 0x6
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI31_9:
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.text
	.globl	generate_valid_sequences
	.p2align	4, 0x90
	.type	generate_valid_sequences,@function
generate_valid_sequences:               # @generate_valid_sequences
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r12
	.cfi_def_cfa_offset 40
	push	rbx
	.cfi_def_cfa_offset 48
	sub	rsp, 16
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rsp + 8], rax
	test	esi, esi
	je	.LBB31_1
# %bb.25:
	movsxd	rax, edi
	lea	rcx, [rip + con]
	lea	rsi, [rcx + 8*rax]
	mov	ebx, dword ptr [rip + length]
	movsxd	rdx, ebx
	mov	rdi, rsp
	call	memcpy@PLT
	jmp	.LBB31_13
.LBB31_1:
	movsxd	rax, dword ptr [rip + length]
	mov	ebx, eax
	test	rax, rax
	jle	.LBB31_13
# %bb.2:
	movsxd	rcx, edi
	cmp	ebx, 17
	jae	.LBB31_4
# %bb.3:
	xor	edx, edx
	jmp	.LBB31_11
.LBB31_4:
	cmp	ebx, 33
	jae	.LBB31_8
# %bb.5:
	xor	edx, edx
	jmp	.LBB31_6
.LBB31_8:
	mov	edx, eax
	and	edx, 31
	mov	esi, 32
	cmovne	rsi, rdx
	mov	rdx, rax
	sub	rdx, rsi
	xor	edi, edi
	lea	r8, [rip + con]
	vpbroadcastw	xmm0, word ptr [rip + .LCPI31_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI31_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI31_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI31_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpmovsxbd	ymm4, qword ptr [rip + .LCPI31_8] # ymm4 = [0,2,2,3,0,2,4,6]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI31_9] # ymm5 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI31_9] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	.p2align	4, 0x90
.LBB31_9:                               # =>This Inner Loop Header: Depth=1
	lea	r9, [rcx + 8*rdi]
	vmovdqu	xmm7, xmmword ptr [r8 + r9 + 112]
	vpshufb	xmm7, xmm7, xmm0
	vmovdqu	xmm8, xmmword ptr [r8 + r9 + 96]
	vpshufb	xmm8, xmm8, xmm0
	vpunpcklwd	xmm7, xmm8, xmm7        # xmm7 = xmm8[0],xmm7[0],xmm8[1],xmm7[1],xmm8[2],xmm7[2],xmm8[3],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r8 + r9 + 80]
	vpshufb	xmm8, xmm8, xmm1
	vmovdqu	xmm9, xmmword ptr [r8 + r9 + 64]
	vpshufb	xmm9, xmm9, xmm1
	vpunpcklwd	xmm8, xmm9, xmm8        # xmm8 = xmm9[0],xmm8[0],xmm9[1],xmm8[1],xmm9[2],xmm8[2],xmm9[3],xmm8[3]
	vpblendd	xmm7, xmm8, xmm7, 8             # xmm7 = xmm8[0,1,2],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r8 + r9]
	vmovdqu	xmm9, xmmword ptr [r8 + r9 + 16]
	vmovdqu	xmm10, xmmword ptr [r8 + r9 + 32]
	vmovdqu	xmm11, xmmword ptr [r8 + r9 + 48]
	vpshufb	xmm11, xmm11, xmm2
	vpshufb	xmm10, xmm10, xmm2
	vpunpcklwd	xmm10, xmm10, xmm11     # xmm10 = xmm10[0],xmm11[0],xmm10[1],xmm11[1],xmm10[2],xmm11[2],xmm10[3],xmm11[3]
	vpshufb	xmm9, xmm9, xmm3
	vpshufb	xmm8, xmm8, xmm3
	vpunpcklwd	xmm8, xmm8, xmm9        # xmm8 = xmm8[0],xmm9[0],xmm8[1],xmm9[1],xmm8[2],xmm9[2],xmm8[3],xmm9[3]
	vpblendd	xmm8, xmm8, xmm10, 2            # xmm8 = xmm8[0],xmm10[1],xmm8[2,3]
	vpblendd	xmm7, xmm8, xmm7, 12            # xmm7 = xmm8[0,1],xmm7[2,3]
	vxorps	xmm8, xmm8, xmm8
	vpermd	ymm8, ymm4, ymmword ptr [r8 + r9 + 224]
	vpshufb	ymm8, ymm8, ymm5
	vxorps	xmm9, xmm9, xmm9
	vpermd	ymm9, ymm4, ymmword ptr [r8 + r9 + 192]
	vpshufb	ymm9, ymm9, ymm5
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r8 + r9 + 160]
	vpblendd	ymm8, ymm9, ymm8, 128           # ymm8 = ymm9[0,1,2,3,4,5,6],ymm8[7]
	vpshufb	ymm9, ymm10, ymm6
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r8 + r9 + 128]
	vpshufb	ymm10, ymm10, ymm6
	vpblendd	ymm9, ymm10, ymm9, 32           # ymm9 = ymm10[0,1,2,3,4],ymm9[5],ymm10[6,7]
	vpblendd	ymm8, ymm9, ymm8, 192           # ymm8 = ymm9[0,1,2,3,4,5],ymm8[6,7]
	vpblendd	ymm7, ymm8, ymm7, 15            # ymm7 = ymm7[0,1,2,3],ymm8[4,5,6,7]
	vmovdqu	ymmword ptr [rsp + rdi], ymm7
	add	rdi, 32
	cmp	rdx, rdi
	jne	.LBB31_9
# %bb.10:
	cmp	esi, 16
	jbe	.LBB31_11
.LBB31_6:
	mov	r9, rdx
	mov	edx, eax
	and	edx, 15
	mov	esi, 16
	cmovne	rsi, rdx
	mov	rdx, rax
	sub	rdx, rsi
	lea	rdi, [rcx + 8*r9]
	lea	rsi, [rip + con]
	add	rsi, rdi
	lea	rdi, [rsp + r9]
	mov	r8, rdx
	sub	r8, r9
	xor	r9d, r9d
	vpbroadcastw	xmm0, word ptr [rip + .LCPI31_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI31_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI31_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI31_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB31_7:                               # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm4, xmmword ptr [rsi + 8*r9 + 112]
	vpshufb	xmm4, xmm4, xmm0
	vmovdqu	xmm5, xmmword ptr [rsi + 8*r9 + 96]
	vpshufb	xmm5, xmm5, xmm0
	vpunpcklwd	xmm4, xmm5, xmm4        # xmm4 = xmm5[0],xmm4[0],xmm5[1],xmm4[1],xmm5[2],xmm4[2],xmm5[3],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rsi + 8*r9 + 80]
	vpshufb	xmm5, xmm5, xmm1
	vmovdqu	xmm6, xmmword ptr [rsi + 8*r9 + 64]
	vpshufb	xmm6, xmm6, xmm1
	vpunpcklwd	xmm5, xmm6, xmm5        # xmm5 = xmm6[0],xmm5[0],xmm6[1],xmm5[1],xmm6[2],xmm5[2],xmm6[3],xmm5[3]
	vpblendd	xmm4, xmm5, xmm4, 8             # xmm4 = xmm5[0,1,2],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rsi + 8*r9]
	vmovdqu	xmm6, xmmword ptr [rsi + 8*r9 + 16]
	vmovdqu	xmm7, xmmword ptr [rsi + 8*r9 + 32]
	vmovdqu	xmm8, xmmword ptr [rsi + 8*r9 + 48]
	vpshufb	xmm8, xmm8, xmm2
	vpshufb	xmm7, xmm7, xmm2
	vpunpcklwd	xmm7, xmm7, xmm8        # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1],xmm7[2],xmm8[2],xmm7[3],xmm8[3]
	vpshufb	xmm6, xmm6, xmm3
	vpshufb	xmm5, xmm5, xmm3
	vpunpcklwd	xmm5, xmm5, xmm6        # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1],xmm5[2],xmm6[2],xmm5[3],xmm6[3]
	vpblendd	xmm5, xmm5, xmm7, 2             # xmm5 = xmm5[0],xmm7[1],xmm5[2,3]
	vpblendd	xmm4, xmm5, xmm4, 12            # xmm4 = xmm5[0,1],xmm4[2,3]
	vmovdqu	xmmword ptr [rdi + r9], xmm4
	add	r9, 16
	cmp	r8, r9
	jne	.LBB31_7
.LBB31_11:
	lea	rsi, [rsp + rdx]
	lea	rdi, [rcx + 8*rdx]
	lea	rcx, [rip + con]
	add	rcx, rdi
	sub	rax, rdx
	xor	edx, edx
	.p2align	4, 0x90
.LBB31_12:                              # =>This Inner Loop Header: Depth=1
	movzx	edi, byte ptr [rcx + 8*rdx]
	mov	byte ptr [rsi + rdx], dil
	inc	rdx
	cmp	rax, rdx
	jne	.LBB31_12
.LBB31_13:
	movsxd	rdx, ebx
	xor	r14d, r14d
	mov	rax, qword ptr [rip + all_sequences]
	mov	ebp, 1
	lea	r12, [rip + .Lconstinit.24]
	xor	r15d, r15d
	jmp	.LBB31_14
	.p2align	4, 0x90
.LBB31_19:                              #   in Loop: Header=BB31_14 Depth=1
	movsxd	r15, r15d
	lea	rdi, [8*r15]
	add	rdi, qword ptr [rip + valid_sequences]
	lea	rsi, [rax + 8*r14]
	vzeroupper
	call	memcpy@PLT
	inc	r15d
	mov	ebx, dword ptr [rip + length]
	mov	rax, qword ptr [rip + all_sequences]
.LBB31_23:                              #   in Loop: Header=BB31_14 Depth=1
	inc	r14
	movsxd	rdx, ebx
	mov	ecx, dword ptr [r12 + 4*rdx]
	cmp	r14, rcx
	jae	.LBB31_20
.LBB31_14:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB31_16 Depth 2
	test	ebx, ebx
	jle	.LBB31_19
# %bb.15:                               #   in Loop: Header=BB31_14 Depth=1
	mov	ecx, ebx
	mov	r8b, 1
	lea	rsi, [rax + 8*r14]
	xor	edi, edi
	jmp	.LBB31_16
	.p2align	4, 0x90
.LBB31_22:                              #   in Loop: Header=BB31_16 Depth=2
	inc	rdi
	xor	r8d, r8d
	cmp	rdi, rcx
	je	.LBB31_23
.LBB31_16:                              #   Parent Loop BB31_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	test	r8b, 1
	je	.LBB31_22
# %bb.17:                               #   in Loop: Header=BB31_16 Depth=2
	movzx	r8d, byte ptr [rdi + rsi]
	add	r8b, -49
	shlx	r9d, ebp, r8d
	and	r9b, byte ptr [rsp + rdi]
	setne	r8b
	inc	rdi
	cmp	rdi, rcx
	jne	.LBB31_16
# %bb.18:                               #   in Loop: Header=BB31_14 Depth=1
	test	r9b, r9b
	jne	.LBB31_19
	jmp	.LBB31_23
.LBB31_20:
	mov	rax, qword ptr fs:[40]
	cmp	rax, qword ptr [rsp + 8]
	jne	.LBB31_24
# %bb.21:
	movsxd	rax, r15d
	add	rsp, 16
	.cfi_def_cfa_offset 48
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	vzeroupper
	ret
.LBB31_24:
	.cfi_def_cfa_offset 64
	vzeroupper
	call	__stack_chk_fail@PLT
.Lfunc_end31:
	.size	generate_valid_sequences, .Lfunc_end31-generate_valid_sequences
	.cfi_endproc
                                        # -- End function
	.globl	generate_filtered_sequences     # -- Begin function generate_filtered_sequences
	.p2align	4, 0x90
	.type	generate_filtered_sequences,@function
generate_filtered_sequences:            # @generate_filtered_sequences
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 104
	.cfi_def_cfa_offset 160
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	qword ptr [rsp + 96], rdi       # 8-byte Spill
	test	rdi, rdi
	je	.LBB32_1
# %bb.2:
	movsxd	rax, esi
	mov	qword ptr [rsp + 88], rax       # 8-byte Spill
	mov	r9d, dword ptr [rip + length]
	mov	r14, qword ptr [rip + valid_sequences]
	mov	r15d, 3
	mov	r12, -1
	xor	r13d, r13d
	test	dl, dl
	je	.LBB32_3
# %bb.6:
	mov	qword ptr [rsp + 16], 0         # 8-byte Folded Spill
	xor	ebp, ebp
	jmp	.LBB32_7
	.p2align	4, 0x90
.LBB32_22:                              #   in Loop: Header=BB32_7 Depth=1
	inc	rbp
	add	r15, 8
	add	r12, 8
	add	r13, 8
	cmp	rbp, qword ptr [rsp + 96]       # 8-byte Folded Reload
	je	.LBB32_23
.LBB32_7:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB32_12 Depth 2
                                        #     Child Loop BB32_17 Depth 2
	lea	rsi, [r14 + 8*rbp]
	test	r9d, r9d
	jle	.LBB32_8
# %bb.9:                                #   in Loop: Header=BB32_7 Depth=1
	mov	qword ptr [rsp + 40], rbp       # 8-byte Spill
	mov	qword ptr [rsp + 48], r13       # 8-byte Spill
	mov	edx, r9d
	mov	dword ptr [rsp + 28], r9d       # 4-byte Spill
	cmp	r9d, 4
	mov	qword ptr [rsp + 72], r14       # 8-byte Spill
	mov	qword ptr [rsp + 64], r15       # 8-byte Spill
	mov	qword ptr [rsp + 56], r12       # 8-byte Spill
	mov	qword ptr [rsp + 32], rsi       # 8-byte Spill
	jae	.LBB32_11
# %bb.10:                               #   in Loop: Header=BB32_7 Depth=1
	mov	bpl, 48
	xor	edi, edi
	mov	r10b, 48
	xor	r9d, r9d
	xor	r8d, r8d
.LBB32_15:                              #   in Loop: Header=BB32_7 Depth=1
	mov	eax, edx
	and	eax, 3
	mov	r14, qword ptr [rsp + 72]       # 8-byte Reload
	mov	r12, qword ptr [rsp + 56]       # 8-byte Reload
	mov	r13, qword ptr [rsp + 48]       # 8-byte Reload
	je	.LBB32_18
# %bb.16:                               #   in Loop: Header=BB32_7 Depth=1
	add	rdx, r12
	sub	rdx, rdi
	add	rdx, r14
	add	rdi, r13
	add	rdi, r14
	xor	ecx, ecx
	.p2align	4, 0x90
.LBB32_17:                              #   Parent Loop BB32_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzx	esi, byte ptr [rdi + rcx]
	movzx	r11d, byte ptr [rdx]
	cmp	sil, bpl
	setg	bl
	movzx	ebp, bpl
	cmovg	ebp, esi
	add	r8b, bl
	cmp	r11b, r10b
	setg	sil
	movzx	r10d, r10b
	cmovg	r10d, r11d
	add	r9b, sil
	inc	rcx
	dec	rdx
	cmp	rax, rcx
	jne	.LBB32_17
.LBB32_18:                              #   in Loop: Header=BB32_7 Depth=1
	shl	r8b, 4
	or	r8b, r9b
	mov	r9d, dword ptr [rsp + 28]       # 4-byte Reload
	mov	r15, qword ptr [rsp + 64]       # 8-byte Reload
	mov	rbp, qword ptr [rsp + 40]       # 8-byte Reload
	mov	rsi, qword ptr [rsp + 32]       # 8-byte Reload
	jmp	.LBB32_19
	.p2align	4, 0x90
.LBB32_8:                               #   in Loop: Header=BB32_7 Depth=1
	xor	r8d, r8d
.LBB32_19:                              #   in Loop: Header=BB32_7 Depth=1
	movzx	ecx, r8b
	mov	eax, ecx
	shr	eax, 4
	and	ecx, 7
	mov	rdi, qword ptr [rsp + 88]       # 8-byte Reload
	lea	rdx, [rip + left_key]
	mov	edx, dword ptr [rdx + 4*rdi]
	test	edx, edx
	sete	r8b
	cmp	eax, edx
	sete	dl
	or	dl, r8b
	lea	rax, [rip + right_key]
	mov	edi, dword ptr [rax + 4*rdi]
	test	edi, edi
	sete	al
	cmp	ecx, edi
	sete	cl
	cmp	dl, 1
	jne	.LBB32_22
# %bb.20:                               #   in Loop: Header=BB32_7 Depth=1
	or	al, cl
	je	.LBB32_22
# %bb.21:                               #   in Loop: Header=BB32_7 Depth=1
	mov	rbx, qword ptr [rsp + 16]       # 8-byte Reload
	lea	rdi, [8*rbx]
	add	rdi, qword ptr [rip + filtered_sequences]
	movsxd	rdx, r9d
	call	memcpy@PLT
	inc	rbx
	mov	qword ptr [rsp + 16], rbx       # 8-byte Spill
	mov	r9d, dword ptr [rip + length]
	mov	r14, qword ptr [rip + valid_sequences]
	jmp	.LBB32_22
	.p2align	4, 0x90
.LBB32_11:                              #   in Loop: Header=BB32_7 Depth=1
	lea	rax, [rsi + rdx]
	mov	ecx, edx
	and	ecx, 2147483644
	mov	qword ptr [rsp + 80], rcx       # 8-byte Spill
	lea	rcx, [r14 + r15]
	mov	r15, rax
	lea	rsi, [r12 + rdx]
	add	rsi, r14
	mov	bpl, 48
	xor	edi, edi
	mov	r10b, 48
	xor	r9d, r9d
	xor	r8d, r8d
	jmp	.LBB32_12
	.p2align	4, 0x90
.LBB32_14:                              #   in Loop: Header=BB32_12 Depth=2
	add	r8b, byte ptr [rsp + 14]        # 1-byte Folded Reload
	add	r8b, bl
	add	r8b, r14b
	add	r8b, al
	add	r9b, byte ptr [rsp + 15]        # 1-byte Folded Reload
	add	r9b, r13b
	add	r9b, r15b
	mov	rax, rdi
	xor	rax, -4
	mov	r15, r12
	movzx	eax, byte ptr [r12 + rax]
	cmp	al, r10b
	setg	r11b
	cmovg	r10d, eax
	add	r9b, r11b
	add	rdi, 4
	add	rsi, -4
	cmp	qword ptr [rsp + 80], rdi       # 8-byte Folded Reload
	je	.LBB32_15
.LBB32_12:                              #   Parent Loop BB32_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzx	eax, byte ptr [rcx + rdi - 3]
	cmp	al, bpl
	setg	byte ptr [rsp + 14]             # 1-byte Folded Spill
	movzx	ebx, byte ptr [rsi]
	movzx	r11d, bpl
	cmovg	r11d, eax
	cmp	bl, r10b
	setg	byte ptr [rsp + 15]             # 1-byte Folded Spill
	movzx	r10d, r10b
	cmovg	r10d, ebx
	movzx	eax, byte ptr [rcx + rdi - 2]
	mov	rbx, rdi
	xor	rbx, -2
	movzx	ebp, byte ptr [r15 + rbx]
	cmp	al, r11b
	setg	bl
	cmovg	r11d, eax
	cmp	bpl, r10b
	setg	r13b
	cmovg	r10d, ebp
	movzx	eax, byte ptr [rcx + rdi - 1]
	mov	r14, rdi
	xor	r14, -3
	mov	r12, r15
	movzx	ebp, byte ptr [r15 + r14]
	cmp	al, r11b
	setg	r14b
	cmovg	r11d, eax
	cmp	bpl, r10b
	setg	r15b
	cmovg	r10d, ebp
	movzx	ebp, byte ptr [rcx + rdi]
	cmp	bpl, r11b
	setg	al
	jg	.LBB32_14
# %bb.13:                               #   in Loop: Header=BB32_12 Depth=2
	mov	ebp, r11d
	jmp	.LBB32_14
.LBB32_1:
	mov	qword ptr [rsp + 16], 0         # 8-byte Folded Spill
.LBB32_23:
	mov	rax, qword ptr [rsp + 16]       # 8-byte Reload
	add	rsp, 104
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.LBB32_3:
	.cfi_def_cfa_offset 160
	mov	qword ptr [rsp + 16], 0         # 8-byte Folded Spill
	xor	ebp, ebp
	jmp	.LBB32_4
	.p2align	4, 0x90
.LBB32_33:                              #   in Loop: Header=BB32_4 Depth=1
	inc	rbp
	add	r15, 8
	add	r12, 8
	add	r13, 8
	cmp	rbp, qword ptr [rsp + 96]       # 8-byte Folded Reload
	je	.LBB32_23
.LBB32_4:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB32_35 Depth 2
                                        #     Child Loop BB32_28 Depth 2
	lea	rsi, [r14 + 8*rbp]
	test	r9d, r9d
	jle	.LBB32_5
# %bb.24:                               #   in Loop: Header=BB32_4 Depth=1
	mov	qword ptr [rsp + 40], rbp       # 8-byte Spill
	mov	qword ptr [rsp + 48], r13       # 8-byte Spill
	mov	edx, r9d
	mov	dword ptr [rsp + 28], r9d       # 4-byte Spill
	cmp	r9d, 4
	mov	qword ptr [rsp + 72], r14       # 8-byte Spill
	mov	qword ptr [rsp + 64], r15       # 8-byte Spill
	mov	qword ptr [rsp + 56], r12       # 8-byte Spill
	mov	qword ptr [rsp + 32], rsi       # 8-byte Spill
	jae	.LBB32_34
# %bb.25:                               #   in Loop: Header=BB32_4 Depth=1
	mov	bpl, 48
	xor	edi, edi
	mov	r9b, 48
	xor	eax, eax
	xor	r8d, r8d
.LBB32_26:                              #   in Loop: Header=BB32_4 Depth=1
	mov	ecx, edx
	and	ecx, 3
	mov	r14, qword ptr [rsp + 72]       # 8-byte Reload
	mov	r12, qword ptr [rsp + 56]       # 8-byte Reload
	mov	r13, qword ptr [rsp + 48]       # 8-byte Reload
	je	.LBB32_29
# %bb.27:                               #   in Loop: Header=BB32_4 Depth=1
	add	rdx, r12
	sub	rdx, rdi
	add	rdx, r14
	add	rdi, r13
	add	rdi, r14
	xor	esi, esi
	.p2align	4, 0x90
.LBB32_28:                              #   Parent Loop BB32_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzx	r10d, byte ptr [rdi + rsi]
	movzx	r11d, byte ptr [rdx]
	cmp	r10b, bpl
	setg	bl
	movzx	ebp, bpl
	cmovg	ebp, r10d
	add	r8b, bl
	cmp	r11b, r9b
	setg	r10b
	movzx	r9d, r9b
	cmovg	r9d, r11d
	add	al, r10b
	inc	rsi
	dec	rdx
	cmp	rcx, rsi
	jne	.LBB32_28
.LBB32_29:                              #   in Loop: Header=BB32_4 Depth=1
	shl	r8b, 4
	or	r8b, al
	mov	r9d, dword ptr [rsp + 28]       # 4-byte Reload
	mov	r15, qword ptr [rsp + 64]       # 8-byte Reload
	mov	rbp, qword ptr [rsp + 40]       # 8-byte Reload
	mov	rsi, qword ptr [rsp + 32]       # 8-byte Reload
	jmp	.LBB32_30
	.p2align	4, 0x90
.LBB32_5:                               #   in Loop: Header=BB32_4 Depth=1
	xor	r8d, r8d
.LBB32_30:                              #   in Loop: Header=BB32_4 Depth=1
	movzx	ecx, r8b
	mov	eax, ecx
	shr	eax, 4
	and	ecx, 7
	mov	rdi, qword ptr [rsp + 88]       # 8-byte Reload
	lea	rdx, [rip + top_key]
	mov	edx, dword ptr [rdx + 4*rdi]
	test	edx, edx
	sete	r8b
	cmp	eax, edx
	sete	dl
	or	dl, r8b
	lea	rax, [rip + bottom_key]
	mov	edi, dword ptr [rax + 4*rdi]
	test	edi, edi
	sete	al
	cmp	ecx, edi
	sete	cl
	cmp	dl, 1
	jne	.LBB32_33
# %bb.31:                               #   in Loop: Header=BB32_4 Depth=1
	or	al, cl
	je	.LBB32_33
# %bb.32:                               #   in Loop: Header=BB32_4 Depth=1
	mov	rbx, qword ptr [rsp + 16]       # 8-byte Reload
	lea	rdi, [8*rbx]
	add	rdi, qword ptr [rip + filtered_sequences]
	movsxd	rdx, r9d
	call	memcpy@PLT
	inc	rbx
	mov	qword ptr [rsp + 16], rbx       # 8-byte Spill
	mov	r9d, dword ptr [rip + length]
	mov	r14, qword ptr [rip + valid_sequences]
	jmp	.LBB32_33
	.p2align	4, 0x90
.LBB32_34:                              #   in Loop: Header=BB32_4 Depth=1
	lea	rax, [rsi + rdx]
	mov	ecx, edx
	and	ecx, 2147483644
	mov	qword ptr [rsp + 80], rcx       # 8-byte Spill
	add	r15, r14
	lea	rcx, [r12 + rdx]
	add	rcx, r14
	mov	r14, rax
	mov	bpl, 48
	xor	edi, edi
	mov	r9b, 48
	xor	esi, esi
	xor	r8d, r8d
	jmp	.LBB32_35
	.p2align	4, 0x90
.LBB32_37:                              #   in Loop: Header=BB32_35 Depth=2
	add	r8b, byte ptr [rsp + 14]        # 1-byte Folded Reload
	add	r8b, bl
	add	r8b, r11b
	add	r8b, al
	add	sil, byte ptr [rsp + 15]        # 1-byte Folded Reload
	add	sil, r13b
	add	sil, r14b
	mov	rax, rdi
	xor	rax, -4
	mov	r14, r12
	movzx	r10d, byte ptr [r12 + rax]
	cmp	r10b, r9b
	setg	al
	cmovg	r9d, r10d
	add	al, sil
	add	rdi, 4
	add	rcx, -4
	mov	esi, eax
	cmp	qword ptr [rsp + 80], rdi       # 8-byte Folded Reload
	je	.LBB32_26
.LBB32_35:                              #   Parent Loop BB32_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzx	eax, byte ptr [r15 + rdi - 3]
	cmp	al, bpl
	setg	byte ptr [rsp + 14]             # 1-byte Folded Spill
	movzx	r11d, byte ptr [rcx]
	movzx	r10d, bpl
	cmovg	r10d, eax
	cmp	r11b, r9b
	setg	byte ptr [rsp + 15]             # 1-byte Folded Spill
	movzx	r9d, r9b
	cmovg	r9d, r11d
	movzx	eax, byte ptr [r15 + rdi - 2]
	mov	r11, rdi
	xor	r11, -2
	movzx	r11d, byte ptr [r14 + r11]
	cmp	al, r10b
	setg	bl
	cmovg	r10d, eax
	cmp	r11b, r9b
	setg	r13b
	cmovg	r9d, r11d
	movzx	eax, byte ptr [r15 + rdi - 1]
	mov	r11, rdi
	xor	r11, -3
	mov	r12, r14
	movzx	ebp, byte ptr [r14 + r11]
	cmp	al, r10b
	setg	r11b
	cmovg	r10d, eax
	cmp	bpl, r9b
	setg	r14b
	cmovg	r9d, ebp
	movzx	ebp, byte ptr [r15 + rdi]
	cmp	bpl, r10b
	setg	al
	jg	.LBB32_37
# %bb.36:                               #   in Loop: Header=BB32_35 Depth=2
	mov	ebp, r10d
	jmp	.LBB32_37
.Lfunc_end32:
	.size	generate_filtered_sequences, .Lfunc_end32-generate_filtered_sequences
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function sequence_filtration
.LCPI33_0:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI33_1:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI33_2:
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI33_3:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI33_15:
	.zero	16,1
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI33_4:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	4                               # 0x4
	.long	6                               # 0x6
.LCPI33_5:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
.LCPI33_6:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI33_10:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
.LCPI33_11:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI33_12:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI33_13:
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI33_14:
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI33_7:
	.long	4294967247                      # 0xffffffcf
.LCPI33_8:
	.long	1                               # 0x1
.LCPI33_9:
	.byte	255                             # 0xff
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
.LCPI33_18:
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.section	.rodata,"a",@progbits
	.p2align	1, 0x0
.LCPI33_16:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.section	.rodata.cst8,"aM",@progbits,8
.LCPI33_17:
	.byte	0                               # 0x0
	.byte	2                               # 0x2
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	0                               # 0x0
	.byte	2                               # 0x2
	.byte	4                               # 0x4
	.byte	6                               # 0x6
	.text
	.globl	sequence_filtration
	.p2align	4, 0x90
	.type	sequence_filtration,@function
sequence_filtration:                    # @sequence_filtration
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 152
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 48], rax
	test	esi, esi
	mov	dword ptr [rbp - 96], edi       # 4-byte Spill
	mov	dword ptr [rbp - 128], esi      # 4-byte Spill
	je	.LBB33_2
# %bb.1:
	movsxd	rax, edi
	lea	rcx, [rip + con]
	lea	rsi, [rcx + 8*rax]
	mov	ebx, dword ptr [rip + length]
	movsxd	rdx, ebx
	lea	rdi, [rbp - 56]
	call	memcpy@PLT
	jmp	.LBB33_14
.LBB33_2:
	movsxd	rax, dword ptr [rip + length]
	mov	ebx, eax
	test	rax, rax
	jle	.LBB33_14
# %bb.3:
	movsxd	rcx, edi
	cmp	ebx, 17
	jae	.LBB33_5
# %bb.4:
	xor	edx, edx
	jmp	.LBB33_12
.LBB33_5:
	cmp	ebx, 33
	jae	.LBB33_7
# %bb.6:
	xor	edx, edx
	jmp	.LBB33_10
.LBB33_7:
	mov	edx, eax
	and	edx, 31
	mov	r11d, 32
	cmovne	r11, rdx
	mov	rdx, rax
	sub	rdx, r11
	xor	r10d, r10d
	lea	r8, [rip + con]
	vpbroadcastw	xmm0, word ptr [rip + .LCPI33_16] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI33_16] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI33_16] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI33_16] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpmovsxbd	ymm4, qword ptr [rip + .LCPI33_17] # ymm4 = [0,2,2,3,0,2,4,6]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI33_18] # ymm5 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI33_18] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	.p2align	4, 0x90
.LBB33_8:                               # =>This Inner Loop Header: Depth=1
	lea	r9, [rcx + 8*r10]
	vmovdqu	xmm7, xmmword ptr [r8 + r9 + 112]
	vpshufb	xmm7, xmm7, xmm0
	vmovdqu	xmm8, xmmword ptr [r8 + r9 + 96]
	vpshufb	xmm8, xmm8, xmm0
	vpunpcklwd	xmm7, xmm8, xmm7        # xmm7 = xmm8[0],xmm7[0],xmm8[1],xmm7[1],xmm8[2],xmm7[2],xmm8[3],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r8 + r9 + 80]
	vpshufb	xmm8, xmm8, xmm1
	vmovdqu	xmm9, xmmword ptr [r8 + r9 + 64]
	vpshufb	xmm9, xmm9, xmm1
	vpunpcklwd	xmm8, xmm9, xmm8        # xmm8 = xmm9[0],xmm8[0],xmm9[1],xmm8[1],xmm9[2],xmm8[2],xmm9[3],xmm8[3]
	vpblendd	xmm7, xmm8, xmm7, 8             # xmm7 = xmm8[0,1,2],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r8 + r9]
	vmovdqu	xmm9, xmmword ptr [r8 + r9 + 16]
	vmovdqu	xmm10, xmmword ptr [r8 + r9 + 32]
	vmovdqu	xmm11, xmmword ptr [r8 + r9 + 48]
	vpshufb	xmm11, xmm11, xmm2
	vpshufb	xmm10, xmm10, xmm2
	vpunpcklwd	xmm10, xmm10, xmm11     # xmm10 = xmm10[0],xmm11[0],xmm10[1],xmm11[1],xmm10[2],xmm11[2],xmm10[3],xmm11[3]
	vpshufb	xmm9, xmm9, xmm3
	vpshufb	xmm8, xmm8, xmm3
	vpunpcklwd	xmm8, xmm8, xmm9        # xmm8 = xmm8[0],xmm9[0],xmm8[1],xmm9[1],xmm8[2],xmm9[2],xmm8[3],xmm9[3]
	vpblendd	xmm8, xmm8, xmm10, 2            # xmm8 = xmm8[0],xmm10[1],xmm8[2,3]
	vpblendd	xmm7, xmm8, xmm7, 12            # xmm7 = xmm8[0,1],xmm7[2,3]
	vxorps	xmm8, xmm8, xmm8
	vpermd	ymm8, ymm4, ymmword ptr [r8 + r9 + 224]
	vpshufb	ymm8, ymm8, ymm5
	vxorps	xmm9, xmm9, xmm9
	vpermd	ymm9, ymm4, ymmword ptr [r8 + r9 + 192]
	vpshufb	ymm9, ymm9, ymm5
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r8 + r9 + 160]
	vpblendd	ymm8, ymm9, ymm8, 128           # ymm8 = ymm9[0,1,2,3,4,5,6],ymm8[7]
	vpshufb	ymm9, ymm10, ymm6
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r8 + r9 + 128]
	vpshufb	ymm10, ymm10, ymm6
	vpblendd	ymm9, ymm10, ymm9, 32           # ymm9 = ymm10[0,1,2,3,4],ymm9[5],ymm10[6,7]
	vpblendd	ymm8, ymm9, ymm8, 192           # ymm8 = ymm9[0,1,2,3,4,5],ymm8[6,7]
	vpblendd	ymm7, ymm8, ymm7, 15            # ymm7 = ymm7[0,1,2,3],ymm8[4,5,6,7]
	vmovdqu	ymmword ptr [rbp + r10 - 56], ymm7
	add	r10, 32
	cmp	rdx, r10
	jne	.LBB33_8
# %bb.9:
	cmp	r11d, 16
	jbe	.LBB33_12
.LBB33_10:
	mov	r9, rdx
	mov	edx, eax
	and	edx, 15
	mov	r8d, 16
	cmovne	r8, rdx
	mov	rdx, rax
	sub	rdx, r8
	lea	r8, [rcx + 8*r9]
	lea	r11, [rip + con]
	add	r11, r8
	lea	r10, [r9 + rbp]
	add	r10, -56
	mov	r8, rdx
	sub	r8, r9
	xor	r9d, r9d
	vpbroadcastw	xmm0, word ptr [rip + .LCPI33_16] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI33_16] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI33_16] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI33_16] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB33_11:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm4, xmmword ptr [r11 + 8*r9 + 112]
	vpshufb	xmm4, xmm4, xmm0
	vmovdqu	xmm5, xmmword ptr [r11 + 8*r9 + 96]
	vpshufb	xmm5, xmm5, xmm0
	vpunpcklwd	xmm4, xmm5, xmm4        # xmm4 = xmm5[0],xmm4[0],xmm5[1],xmm4[1],xmm5[2],xmm4[2],xmm5[3],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [r11 + 8*r9 + 80]
	vpshufb	xmm5, xmm5, xmm1
	vmovdqu	xmm6, xmmword ptr [r11 + 8*r9 + 64]
	vpshufb	xmm6, xmm6, xmm1
	vpunpcklwd	xmm5, xmm6, xmm5        # xmm5 = xmm6[0],xmm5[0],xmm6[1],xmm5[1],xmm6[2],xmm5[2],xmm6[3],xmm5[3]
	vpblendd	xmm4, xmm5, xmm4, 8             # xmm4 = xmm5[0,1,2],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [r11 + 8*r9]
	vmovdqu	xmm6, xmmword ptr [r11 + 8*r9 + 16]
	vmovdqu	xmm7, xmmword ptr [r11 + 8*r9 + 32]
	vmovdqu	xmm8, xmmword ptr [r11 + 8*r9 + 48]
	vpshufb	xmm8, xmm8, xmm2
	vpshufb	xmm7, xmm7, xmm2
	vpunpcklwd	xmm7, xmm7, xmm8        # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1],xmm7[2],xmm8[2],xmm7[3],xmm8[3]
	vpshufb	xmm6, xmm6, xmm3
	vpshufb	xmm5, xmm5, xmm3
	vpunpcklwd	xmm5, xmm5, xmm6        # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1],xmm5[2],xmm6[2],xmm5[3],xmm6[3]
	vpblendd	xmm5, xmm5, xmm7, 2             # xmm5 = xmm5[0],xmm7[1],xmm5[2,3]
	vpblendd	xmm4, xmm5, xmm4, 12            # xmm4 = xmm5[0,1],xmm4[2,3]
	vmovdqu	xmmword ptr [r10 + r9], xmm4
	add	r9, 16
	cmp	r8, r9
	jne	.LBB33_11
.LBB33_12:
	sub	rax, rdx
	lea	r9, [rdx + rbp]
	add	r9, -56
	lea	rdx, [rcx + 8*rdx]
	lea	rcx, [rip + con]
	add	rcx, rdx
	xor	edx, edx
	.p2align	4, 0x90
.LBB33_13:                              # =>This Inner Loop Header: Depth=1
	movzx	r8d, byte ptr [rcx + 8*rdx]
	mov	byte ptr [r9 + rdx], r8b
	inc	rdx
	cmp	rax, rdx
	jne	.LBB33_13
.LBB33_14:
	movsxd	rdx, ebx
	xor	r12d, r12d
	mov	rax, qword ptr [rip + all_sequences]
	mov	r13d, 1
	lea	r14, [rip + .Lconstinit.24]
	xor	r15d, r15d
	jmp	.LBB33_17
	.p2align	4, 0x90
.LBB33_15:                              #   in Loop: Header=BB33_17 Depth=1
	movsxd	r15, r15d
	lea	rdi, [8*r15]
	add	rdi, qword ptr [rip + valid_sequences]
	lea	rsi, [rax + 8*r12]
	vzeroupper
	call	memcpy@PLT
	inc	r15d
	mov	ebx, dword ptr [rip + length]
	mov	rax, qword ptr [rip + all_sequences]
.LBB33_16:                              #   in Loop: Header=BB33_17 Depth=1
	inc	r12
	movsxd	rdx, ebx
	mov	ecx, dword ptr [r14 + 4*rdx]
	cmp	r12, rcx
	jae	.LBB33_23
.LBB33_17:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB33_20 Depth 2
	test	ebx, ebx
	jle	.LBB33_15
# %bb.18:                               #   in Loop: Header=BB33_17 Depth=1
	mov	ecx, ebx
	mov	r8b, 1
	lea	rsi, [rax + 8*r12]
	xor	edi, edi
	jmp	.LBB33_20
	.p2align	4, 0x90
.LBB33_19:                              #   in Loop: Header=BB33_20 Depth=2
	inc	rdi
	xor	r8d, r8d
	cmp	rdi, rcx
	je	.LBB33_16
.LBB33_20:                              #   Parent Loop BB33_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	test	r8b, 1
	je	.LBB33_19
# %bb.21:                               #   in Loop: Header=BB33_20 Depth=2
	movzx	r8d, byte ptr [rdi + rsi]
	add	r8b, -49
	shlx	r9d, r13d, r8d
	and	r9b, byte ptr [rbp + rdi - 56]
	setne	r8b
	inc	rdi
	cmp	rdi, rcx
	jne	.LBB33_20
# %bb.22:                               #   in Loop: Header=BB33_17 Depth=1
	test	r9b, r9b
	jne	.LBB33_15
	jmp	.LBB33_16
.LBB33_23:
	movsxd	rdi, r15d
	mov	r15d, dword ptr [rbp - 128]     # 4-byte Reload
	movzx	edx, r15b
	mov	r14d, dword ptr [rbp - 96]      # 4-byte Reload
	mov	esi, r14d
	vzeroupper
	call	generate_filtered_sequences
	mov	r12, rax
	movsxd	rdx, dword ptr [rip + length]
	mov	r13d, edx
	mov	rbx, rsp
	lea	rax, [r13 + 15]
	and	rax, -16
	sub	rbx, rax
	mov	rsp, rbx
	mov	rdi, rbx
	xor	esi, esi
	call	memset@PLT
	test	r12, r12
	je	.LBB33_36
# %bb.24:
	test	r13d, r13d
	jle	.LBB33_36
# %bb.25:
	mov	rax, qword ptr [rip + filtered_sequences]
	mov	ecx, r13d
	and	ecx, 2147483616
	mov	edx, r13d
	and	edx, 2147483632
	xor	esi, esi
	mov	edi, 1
	vpbroadcastd	ymm0, dword ptr [rip + .LCPI33_7] # ymm0 = [4294967247,4294967247,4294967247,4294967247,4294967247,4294967247,4294967247,4294967247]
	vpbroadcastd	ymm1, dword ptr [rip + .LCPI33_8] # ymm1 = [1,1,1,1,1,1,1,1]
	vpbroadcastd	ymm2, dword ptr [rip + .LCPI33_9] # ymm2 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	jmp	.LBB33_27
	.p2align	4, 0x90
.LBB33_26:                              #   in Loop: Header=BB33_27 Depth=1
	inc	rsi
	add	rax, 8
	cmp	rsi, r12
	je	.LBB33_36
.LBB33_27:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB33_32 Depth 2
                                        #     Child Loop BB33_30 Depth 2
                                        #     Child Loop BB33_35 Depth 2
	cmp	r13d, 16
	jae	.LBB33_29
# %bb.28:                               #   in Loop: Header=BB33_27 Depth=1
	xor	r9d, r9d
	jmp	.LBB33_35
	.p2align	4, 0x90
.LBB33_29:                              #   in Loop: Header=BB33_27 Depth=1
	xor	r8d, r8d
	cmp	r13d, 32
	jae	.LBB33_32
	.p2align	4, 0x90
.LBB33_30:                              #   Parent Loop BB33_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpmovsxbd	ymm3, qword ptr [rax + r8]
	vpmovsxbd	ymm4, qword ptr [rax + r8 + 8]
	vpaddd	ymm4, ymm4, ymm0
	vpaddd	ymm3, ymm3, ymm0
	vpsllvd	ymm3, ymm1, ymm3
	vpsllvd	ymm4, ymm1, ymm4
	vpand	ymm4, ymm4, ymm2
	vpand	ymm3, ymm3, ymm2
	vpackusdw	ymm3, ymm3, ymm4
	vextracti128	xmm4, ymm3, 1
	vpackuswb	xmm3, xmm3, xmm4
	vpshufd	xmm3, xmm3, 216                 # xmm3 = xmm3[0,2,1,3]
	vpor	xmm3, xmm3, xmmword ptr [rbx + r8]
	vmovdqa	xmmword ptr [rbx + r8], xmm3
	add	r8, 16
	cmp	rdx, r8
	jne	.LBB33_30
# %bb.31:                               #   in Loop: Header=BB33_27 Depth=1
	mov	r9, rdx
	cmp	edx, r13d
	jne	.LBB33_35
	jmp	.LBB33_26
	.p2align	4, 0x90
.LBB33_32:                              #   Parent Loop BB33_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpmovsxbd	ymm3, qword ptr [rax + r8]
	vpmovsxbd	ymm4, qword ptr [rax + r8 + 8]
	vpmovsxbd	ymm5, qword ptr [rax + r8 + 16]
	vpmovsxbd	ymm6, qword ptr [rax + r8 + 24]
	vpaddd	ymm6, ymm6, ymm0
	vpaddd	ymm5, ymm5, ymm0
	vpaddd	ymm4, ymm4, ymm0
	vpaddd	ymm3, ymm3, ymm0
	vpsllvd	ymm3, ymm1, ymm3
	vpsllvd	ymm4, ymm1, ymm4
	vpsllvd	ymm5, ymm1, ymm5
	vpsllvd	ymm6, ymm1, ymm6
	vpand	ymm6, ymm6, ymm2
	vpand	ymm5, ymm5, ymm2
	vpackusdw	ymm5, ymm5, ymm6
	vpermq	ymm5, ymm5, 216                 # ymm5 = ymm5[0,2,1,3]
	vpand	ymm4, ymm4, ymm2
	vpand	ymm3, ymm3, ymm2
	vpackusdw	ymm3, ymm3, ymm4
	vpermq	ymm3, ymm3, 216                 # ymm3 = ymm3[0,2,1,3]
	vpackuswb	ymm3, ymm3, ymm5
	vpermq	ymm3, ymm3, 216                 # ymm3 = ymm3[0,2,1,3]
	vpor	ymm3, ymm3, ymmword ptr [rbx + r8]
	vmovdqu	ymmword ptr [rbx + r8], ymm3
	add	r8, 32
	cmp	rcx, r8
	jne	.LBB33_32
# %bb.33:                               #   in Loop: Header=BB33_27 Depth=1
	cmp	ecx, r13d
	je	.LBB33_26
# %bb.34:                               #   in Loop: Header=BB33_27 Depth=1
	mov	r8, rcx
	mov	r9, rcx
	test	r13b, 16
	jne	.LBB33_30
	.p2align	4, 0x90
.LBB33_35:                              #   Parent Loop BB33_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzx	r8d, byte ptr [rax + r9]
	add	r8b, -49
	shlx	r8d, edi, r8d
	or	byte ptr [rbx + r9], r8b
	inc	r9
	cmp	r13, r9
	jne	.LBB33_35
	jmp	.LBB33_26
.LBB33_36:
	test	r15b, r15b
	je	.LBB33_40
# %bb.37:
	test	r13d, r13d
	jle	.LBB33_44
# %bb.38:
	movsxd	rcx, r14d
	cmp	r13d, 16
	jae	.LBB33_45
# %bb.39:
	xor	edx, edx
	xor	eax, eax
	jmp	.LBB33_56
.LBB33_40:
	test	r13d, r13d
	jle	.LBB33_44
# %bb.41:
	movsxd	rcx, r14d
	cmp	r13d, 17
	jae	.LBB33_47
# %bb.42:
	xor	edx, edx
	xor	eax, eax
	jmp	.LBB33_64
.LBB33_44:
	xor	eax, eax
	jmp	.LBB33_66
.LBB33_45:
	cmp	r13d, 128
	jae	.LBB33_49
# %bb.46:
	xor	eax, eax
	xor	edx, edx
	jmp	.LBB33_53
.LBB33_47:
	cmp	r13d, 129
	jae	.LBB33_58
# %bb.48:
	xor	eax, eax
	xor	edx, edx
	jmp	.LBB33_61
.LBB33_49:
	mov	edx, r13d
	and	edx, 2147483520
	lea	rax, [rip + con]
	lea	rax, [rax + 8*rcx]
	add	rax, 96
	vpxor	xmm0, xmm0, xmm0
	xor	esi, esi
	vpcmpeqd	ymm1, ymm1, ymm1
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	vpxor	xmm4, xmm4, xmm4
	.p2align	4, 0x90
.LBB33_50:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	ymm5, ymmword ptr [rax + rsi - 96]
	vmovdqu	ymm6, ymmword ptr [rax + rsi - 64]
	vmovdqu	ymm7, ymmword ptr [rax + rsi - 32]
	vmovdqu	ymm8, ymmword ptr [rax + rsi]
	vpand	ymm9, ymm5, ymmword ptr [rbx + rsi]
	vpand	ymm10, ymm6, ymmword ptr [rbx + rsi + 32]
	vpand	ymm11, ymm7, ymmword ptr [rbx + rsi + 64]
	vpand	ymm12, ymm8, ymmword ptr [rbx + rsi + 96]
	vpcmpeqb	ymm5, ymm9, ymm5
	vpxor	ymm5, ymm5, ymm1
	vpor	ymm0, ymm0, ymm5
	vpcmpeqb	ymm5, ymm10, ymm6
	vpxor	ymm5, ymm5, ymm1
	vpor	ymm2, ymm2, ymm5
	vpcmpeqb	ymm5, ymm11, ymm7
	vpxor	ymm5, ymm5, ymm1
	vpor	ymm3, ymm3, ymm5
	vpcmpeqb	ymm5, ymm12, ymm8
	vpxor	ymm5, ymm5, ymm1
	vpor	ymm4, ymm4, ymm5
	vmovdqu	ymmword ptr [rax + rsi - 96], ymm9
	vmovdqu	ymmword ptr [rax + rsi - 64], ymm10
	vmovdqu	ymmword ptr [rax + rsi - 32], ymm11
	vmovdqu	ymmword ptr [rax + rsi], ymm12
	sub	rsi, -128
	cmp	rdx, rsi
	jne	.LBB33_50
# %bb.51:
	vpor	ymm0, ymm2, ymm0
	vpor	ymm0, ymm3, ymm0
	vpor	ymm0, ymm4, ymm0
	vgf2p8affineqb	ymm0, ymm0, ymmword ptr [rip + .LCPI33_14], 0
	vpmovmskb	eax, ymm0
	test	eax, eax
	setne	al
	cmp	edx, r13d
	je	.LBB33_66
# %bb.52:
	test	r13b, 112
	je	.LBB33_56
.LBB33_53:
	mov	r8, rdx
	mov	edx, r13d
	and	edx, 2147483632
	vmovd	xmm0, eax
	vpbroadcastb	xmm0, xmm0
	lea	rsi, [r8 + 8*rcx]
	lea	rax, [rip + con]
	add	rax, rsi
	lea	rsi, [rbx + r8]
	mov	rdi, rdx
	sub	rdi, r8
	xor	r8d, r8d
	vpcmpeqd	xmm1, xmm1, xmm1
	.p2align	4, 0x90
.LBB33_54:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm2, xmmword ptr [rax + r8]
	vpand	xmm3, xmm2, xmmword ptr [rsi + r8]
	vpcmpeqb	xmm2, xmm3, xmm2
	vpxor	xmm2, xmm2, xmm1
	vpor	xmm0, xmm0, xmm2
	vmovdqu	xmmword ptr [rax + r8], xmm3
	add	r8, 16
	cmp	rdi, r8
	jne	.LBB33_54
# %bb.55:
	vptest	xmm0, xmmword ptr [rip + .LCPI33_15]
	setne	al
	cmp	edx, r13d
	je	.LBB33_66
.LBB33_56:
	add	rbx, rdx
	lea	rsi, [rdx + 8*rcx]
	lea	rcx, [rip + con]
	add	rcx, rsi
	sub	r13, rdx
	xor	edx, edx
	.p2align	4, 0x90
.LBB33_57:                              # =>This Inner Loop Header: Depth=1
	movzx	esi, byte ptr [rcx + rdx]
	movzx	edi, byte ptr [rbx + rdx]
	and	dil, sil
	cmp	dil, sil
	setne	sil
	or	al, sil
	mov	byte ptr [rcx + rdx], dil
	inc	rdx
	cmp	r13, rdx
	jne	.LBB33_57
	jmp	.LBB33_66
.LBB33_58:
	mov	eax, r13d
	and	eax, 127
	mov	esi, 128
	cmovne	rsi, rax
	mov	rdx, r13
	sub	rdx, rsi
	lea	rax, [rip + con]
	add	rax, rcx
	vpxor	xmm0, xmm0, xmm0
	xor	edi, edi
	vpmovsxbd	ymm1, qword ptr [rip + .LCPI33_17] # ymm1 = [0,2,2,3,0,2,4,6]
	vpxor	xmm4, xmm4, xmm4
	vpxor	xmm6, xmm6, xmm6
	vpxor	xmm3, xmm3, xmm3
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI33_18] # ymm7 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm8, dword ptr [rip + .LCPI33_18] # ymm8 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm9, dword ptr [rip + .LCPI33_18] # ymm9 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastw	xmm11, word ptr [rip + .LCPI33_16] # xmm11 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm12, word ptr [rip + .LCPI33_16] # xmm12 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm13, word ptr [rip + .LCPI33_16] # xmm13 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB33_59:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	ymmword ptr [rbp - 96], ymm3    # 32-byte Spill
	vmovdqu	ymmword ptr [rbp - 160], ymm6   # 32-byte Spill
	vmovdqu	ymmword ptr [rbp - 192], ymm4   # 32-byte Spill
	vmovdqu	ymmword ptr [rbp - 128], ymm0   # 32-byte Spill
	vxorps	xmm2, xmm2, xmm2
	vpermd	ymm2, ymm1, ymmword ptr [rax + 8*rdi + 224]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI33_18] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpshufb	ymm2, ymm2, ymm6
	vxorps	xmm3, xmm3, xmm3
	vpermd	ymm3, ymm1, ymmword ptr [rax + 8*rdi + 192]
	vpshufb	ymm3, ymm3, ymm7
	vxorps	xmm4, xmm4, xmm4
	vpermd	ymm4, ymm1, ymmword ptr [rax + 8*rdi + 160]
	vpblendd	ymm2, ymm3, ymm2, 128           # ymm2 = ymm3[0,1,2,3,4,5,6],ymm2[7]
	vpshufb	ymm3, ymm4, ymm8
	vxorps	xmm4, xmm4, xmm4
	vpermd	ymm4, ymm1, ymmword ptr [rax + 8*rdi + 128]
	vpshufb	ymm4, ymm4, ymm9
	vpblendd	ymm3, ymm4, ymm3, 32            # ymm3 = ymm4[0,1,2,3,4],ymm3[5],ymm4[6,7]
	vpblendd	ymm2, ymm3, ymm2, 192           # ymm2 = ymm3[0,1,2,3,4,5],ymm2[6,7]
	vmovdqu	xmm3, xmmword ptr [rax + 8*rdi + 112]
	vpbroadcastw	xmm0, word ptr [rip + .LCPI33_16] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpshufb	xmm3, xmm3, xmm0
	vmovdqu	xmm4, xmmword ptr [rax + 8*rdi + 96]
	vpshufb	xmm4, xmm4, xmm0
	vpunpcklwd	xmm3, xmm4, xmm3        # xmm3 = xmm4[0],xmm3[0],xmm4[1],xmm3[1],xmm4[2],xmm3[2],xmm4[3],xmm3[3]
	vmovdqu	xmm4, xmmword ptr [rax + 8*rdi + 80]
	vpshufb	xmm4, xmm4, xmm11
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 64]
	vpshufb	xmm14, xmm14, xmm11
	vpunpcklwd	xmm4, xmm14, xmm4       # xmm4 = xmm14[0],xmm4[0],xmm14[1],xmm4[1],xmm14[2],xmm4[2],xmm14[3],xmm4[3]
	vpblendd	xmm3, xmm4, xmm3, 8             # xmm3 = xmm4[0,1,2],xmm3[3]
	vmovdqu	xmm4, xmmword ptr [rax + 8*rdi]
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 16]
	vmovdqu	xmm15, xmmword ptr [rax + 8*rdi + 32]
	vmovdqu	xmm5, xmmword ptr [rax + 8*rdi + 48]
	vpshufb	xmm5, xmm5, xmm12
	vpshufb	xmm15, xmm15, xmm12
	vpunpcklwd	xmm5, xmm15, xmm5       # xmm5 = xmm15[0],xmm5[0],xmm15[1],xmm5[1],xmm15[2],xmm5[2],xmm15[3],xmm5[3]
	vpshufb	xmm14, xmm14, xmm13
	vpshufb	xmm4, xmm4, xmm13
	vpunpcklwd	xmm4, xmm4, xmm14       # xmm4 = xmm4[0],xmm14[0],xmm4[1],xmm14[1],xmm4[2],xmm14[2],xmm4[3],xmm14[3]
	vpblendd	xmm4, xmm4, xmm5, 2             # xmm4 = xmm4[0],xmm5[1],xmm4[2,3]
	vpblendd	xmm3, xmm4, xmm3, 12            # xmm3 = xmm4[0,1],xmm3[2,3]
	vpblendd	ymm3, ymm2, ymm3, 15            # ymm3 = ymm3[0,1,2,3],ymm2[4,5,6,7]
	vxorps	xmm2, xmm2, xmm2
	vpermd	ymm2, ymm1, ymmword ptr [rax + 8*rdi + 480]
	vpshufb	ymm2, ymm2, ymm6
	vxorps	xmm4, xmm4, xmm4
	vpermd	ymm4, ymm1, ymmword ptr [rax + 8*rdi + 448]
	vpshufb	ymm4, ymm4, ymm7
	vpblendd	ymm2, ymm4, ymm2, 128           # ymm2 = ymm4[0,1,2,3,4,5,6],ymm2[7]
	vxorps	xmm4, xmm4, xmm4
	vpermd	ymm4, ymm1, ymmword ptr [rax + 8*rdi + 416]
	vxorps	xmm5, xmm5, xmm5
	vpermd	ymm5, ymm1, ymmword ptr [rax + 8*rdi + 384]
	vpshufb	ymm4, ymm4, ymm8
	vpshufb	ymm5, ymm5, ymm9
	vpblendd	ymm4, ymm5, ymm4, 32            # ymm4 = ymm5[0,1,2,3,4],ymm4[5],ymm5[6,7]
	vpblendd	ymm2, ymm4, ymm2, 192           # ymm2 = ymm4[0,1,2,3,4,5],ymm2[6,7]
	vmovdqu	xmm4, xmmword ptr [rax + 8*rdi + 368]
	vpshufb	xmm4, xmm4, xmm0
	vmovdqu	xmm5, xmmword ptr [rax + 8*rdi + 352]
	vpshufb	xmm5, xmm5, xmm0
	vpunpcklwd	xmm4, xmm5, xmm4        # xmm4 = xmm5[0],xmm4[0],xmm5[1],xmm4[1],xmm5[2],xmm4[2],xmm5[3],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rax + 8*rdi + 336]
	vpshufb	xmm5, xmm5, xmm11
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 320]
	vpshufb	xmm14, xmm14, xmm11
	vpunpcklwd	xmm5, xmm14, xmm5       # xmm5 = xmm14[0],xmm5[0],xmm14[1],xmm5[1],xmm14[2],xmm5[2],xmm14[3],xmm5[3]
	vpblendd	xmm4, xmm5, xmm4, 8             # xmm4 = xmm5[0,1,2],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rax + 8*rdi + 304]
	vpshufb	xmm5, xmm5, xmm12
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 288]
	vpshufb	xmm14, xmm14, xmm12
	vpunpcklwd	xmm5, xmm14, xmm5       # xmm5 = xmm14[0],xmm5[0],xmm14[1],xmm5[1],xmm14[2],xmm5[2],xmm14[3],xmm5[3]
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 272]
	vpshufb	xmm14, xmm14, xmm13
	vmovdqu	xmm15, xmmword ptr [rax + 8*rdi + 256]
	vpshufb	xmm15, xmm15, xmm13
	vpunpcklwd	xmm14, xmm15, xmm14     # xmm14 = xmm15[0],xmm14[0],xmm15[1],xmm14[1],xmm15[2],xmm14[2],xmm15[3],xmm14[3]
	vpblendd	xmm5, xmm14, xmm5, 2            # xmm5 = xmm14[0],xmm5[1],xmm14[2,3]
	vpblendd	xmm4, xmm5, xmm4, 12            # xmm4 = xmm5[0,1],xmm4[2,3]
	vpblendd	ymm2, ymm2, ymm4, 15            # ymm2 = ymm4[0,1,2,3],ymm2[4,5,6,7]
	vxorps	xmm4, xmm4, xmm4
	vpermd	ymm4, ymm1, ymmword ptr [rax + 8*rdi + 736]
	vpshufb	ymm4, ymm4, ymm6
	vxorps	xmm5, xmm5, xmm5
	vpermd	ymm5, ymm1, ymmword ptr [rax + 8*rdi + 704]
	vpshufb	ymm5, ymm5, ymm7
	vxorps	xmm14, xmm14, xmm14
	vpermd	ymm14, ymm1, ymmword ptr [rax + 8*rdi + 672]
	vpblendd	ymm4, ymm5, ymm4, 128           # ymm4 = ymm5[0,1,2,3,4,5,6],ymm4[7]
	vpshufb	ymm5, ymm14, ymm8
	vxorps	xmm14, xmm14, xmm14
	vpermd	ymm14, ymm1, ymmword ptr [rax + 8*rdi + 640]
	vpshufb	ymm14, ymm14, ymm9
	vpblendd	ymm5, ymm14, ymm5, 32           # ymm5 = ymm14[0,1,2,3,4],ymm5[5],ymm14[6,7]
	vpblendd	ymm4, ymm5, ymm4, 192           # ymm4 = ymm5[0,1,2,3,4,5],ymm4[6,7]
	vmovdqu	xmm5, xmmword ptr [rax + 8*rdi + 624]
	vpshufb	xmm5, xmm5, xmm0
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 608]
	vpshufb	xmm14, xmm14, xmm0
	vpunpcklwd	xmm5, xmm14, xmm5       # xmm5 = xmm14[0],xmm5[0],xmm14[1],xmm5[1],xmm14[2],xmm5[2],xmm14[3],xmm5[3]
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 592]
	vpshufb	xmm14, xmm14, xmm11
	vmovdqu	xmm15, xmmword ptr [rax + 8*rdi + 576]
	vpshufb	xmm15, xmm15, xmm11
	vpunpcklwd	xmm14, xmm15, xmm14     # xmm14 = xmm15[0],xmm14[0],xmm15[1],xmm14[1],xmm15[2],xmm14[2],xmm15[3],xmm14[3]
	vpblendd	xmm5, xmm14, xmm5, 8            # xmm5 = xmm14[0,1,2],xmm5[3]
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 560]
	vpshufb	xmm14, xmm14, xmm12
	vmovdqu	xmm15, xmmword ptr [rax + 8*rdi + 544]
	vpshufb	xmm15, xmm15, xmm12
	vpunpcklwd	xmm14, xmm15, xmm14     # xmm14 = xmm15[0],xmm14[0],xmm15[1],xmm14[1],xmm15[2],xmm14[2],xmm15[3],xmm14[3]
	vmovdqu	xmm15, xmmword ptr [rax + 8*rdi + 528]
	vpshufb	xmm15, xmm15, xmm13
	vmovdqu	xmm10, xmmword ptr [rax + 8*rdi + 512]
	vpshufb	xmm10, xmm10, xmm13
	vpunpcklwd	xmm10, xmm10, xmm15     # xmm10 = xmm10[0],xmm15[0],xmm10[1],xmm15[1],xmm10[2],xmm15[2],xmm10[3],xmm15[3]
	vpblendd	xmm10, xmm10, xmm14, 2          # xmm10 = xmm10[0],xmm14[1],xmm10[2,3]
	vpblendd	xmm5, xmm10, xmm5, 12           # xmm5 = xmm10[0,1],xmm5[2,3]
	vpblendd	ymm15, ymm4, ymm5, 15           # ymm15 = ymm5[0,1,2,3],ymm4[4,5,6,7]
	vxorps	xmm4, xmm4, xmm4
	vpermd	ymm4, ymm1, ymmword ptr [rax + 8*rdi + 992]
	vpshufb	ymm4, ymm4, ymm6
	vxorps	xmm5, xmm5, xmm5
	vpermd	ymm5, ymm1, ymmword ptr [rax + 8*rdi + 960]
	vpshufb	ymm5, ymm5, ymm7
	vpblendd	ymm4, ymm5, ymm4, 128           # ymm4 = ymm5[0,1,2,3,4,5,6],ymm4[7]
	vxorps	xmm5, xmm5, xmm5
	vpermd	ymm5, ymm1, ymmword ptr [rax + 8*rdi + 928]
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm1, ymmword ptr [rax + 8*rdi + 896]
	vpshufb	ymm5, ymm5, ymm8
	vpshufb	ymm10, ymm10, ymm9
	vpblendd	ymm5, ymm10, ymm5, 32           # ymm5 = ymm10[0,1,2,3,4],ymm5[5],ymm10[6,7]
	vpblendd	ymm4, ymm5, ymm4, 192           # ymm4 = ymm5[0,1,2,3,4,5],ymm4[6,7]
	vmovdqu	xmm5, xmmword ptr [rax + 8*rdi + 880]
	vpshufb	xmm5, xmm5, xmm0
	vmovdqu	xmm10, xmmword ptr [rax + 8*rdi + 864]
	vpshufb	xmm10, xmm10, xmm0
	vmovdqu	ymm0, ymmword ptr [rbp - 128]   # 32-byte Reload
	vpunpcklwd	xmm5, xmm10, xmm5       # xmm5 = xmm10[0],xmm5[0],xmm10[1],xmm5[1],xmm10[2],xmm5[2],xmm10[3],xmm5[3]
	vmovdqu	xmm10, xmmword ptr [rax + 8*rdi + 848]
	vpshufb	xmm10, xmm10, xmm11
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 832]
	vpshufb	xmm14, xmm14, xmm11
	vpunpcklwd	xmm10, xmm14, xmm10     # xmm10 = xmm14[0],xmm10[0],xmm14[1],xmm10[1],xmm14[2],xmm10[2],xmm14[3],xmm10[3]
	vpblendd	xmm5, xmm10, xmm5, 8            # xmm5 = xmm10[0,1,2],xmm5[3]
	vmovdqu	xmm10, xmmword ptr [rax + 8*rdi + 816]
	vpshufb	xmm10, xmm10, xmm12
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 800]
	vpshufb	xmm14, xmm14, xmm12
	vpunpcklwd	xmm10, xmm14, xmm10     # xmm10 = xmm14[0],xmm10[0],xmm14[1],xmm10[1],xmm14[2],xmm10[2],xmm14[3],xmm10[3]
	vmovdqu	xmm14, xmmword ptr [rax + 8*rdi + 784]
	vpshufb	xmm14, xmm14, xmm13
	vmovdqu	xmm6, xmmword ptr [rax + 8*rdi + 768]
	vpshufb	xmm6, xmm6, xmm13
	vpunpcklwd	xmm6, xmm6, xmm14       # xmm6 = xmm6[0],xmm14[0],xmm6[1],xmm14[1],xmm6[2],xmm14[2],xmm6[3],xmm14[3]
	vpblendd	xmm6, xmm6, xmm10, 2            # xmm6 = xmm6[0],xmm10[1],xmm6[2,3]
	vpblendd	xmm5, xmm6, xmm5, 12            # xmm5 = xmm6[0,1],xmm5[2,3]
	vmovdqu	ymm6, ymmword ptr [rbp - 160]   # 32-byte Reload
	vpblendd	ymm14, ymm4, ymm5, 15           # ymm14 = ymm5[0,1,2,3],ymm4[4,5,6,7]
	vpand	ymm4, ymm3, ymmword ptr [rbx + rdi]
	vpextrb	byte ptr [rax + 8*rdi], xmm4, 0
	vpextrb	byte ptr [rax + 8*rdi + 8], xmm4, 1
	vpextrb	byte ptr [rax + 8*rdi + 16], xmm4, 2
	vpextrb	byte ptr [rax + 8*rdi + 24], xmm4, 3
	vpextrb	byte ptr [rax + 8*rdi + 32], xmm4, 4
	vpextrb	byte ptr [rax + 8*rdi + 40], xmm4, 5
	vpextrb	byte ptr [rax + 8*rdi + 48], xmm4, 6
	vpextrb	byte ptr [rax + 8*rdi + 56], xmm4, 7
	vpextrb	byte ptr [rax + 8*rdi + 64], xmm4, 8
	vpextrb	byte ptr [rax + 8*rdi + 72], xmm4, 9
	vpextrb	byte ptr [rax + 8*rdi + 80], xmm4, 10
	vpextrb	byte ptr [rax + 8*rdi + 88], xmm4, 11
	vpextrb	byte ptr [rax + 8*rdi + 96], xmm4, 12
	vpextrb	byte ptr [rax + 8*rdi + 104], xmm4, 13
	vpextrb	byte ptr [rax + 8*rdi + 112], xmm4, 14
	vpextrb	byte ptr [rax + 8*rdi + 120], xmm4, 15
	vpcmpeqb	ymm3, ymm4, ymm3
	vpcmpeqd	ymm5, ymm5, ymm5
	vpxor	ymm3, ymm3, ymm5
	vextracti128	xmm4, ymm4, 1
	vpextrb	byte ptr [rax + 8*rdi + 128], xmm4, 0
	vpextrb	byte ptr [rax + 8*rdi + 136], xmm4, 1
	vpextrb	byte ptr [rax + 8*rdi + 144], xmm4, 2
	vpextrb	byte ptr [rax + 8*rdi + 152], xmm4, 3
	vpextrb	byte ptr [rax + 8*rdi + 160], xmm4, 4
	vpextrb	byte ptr [rax + 8*rdi + 168], xmm4, 5
	vpextrb	byte ptr [rax + 8*rdi + 176], xmm4, 6
	vpextrb	byte ptr [rax + 8*rdi + 184], xmm4, 7
	vpextrb	byte ptr [rax + 8*rdi + 192], xmm4, 8
	vpextrb	byte ptr [rax + 8*rdi + 200], xmm4, 9
	vpextrb	byte ptr [rax + 8*rdi + 208], xmm4, 10
	vpextrb	byte ptr [rax + 8*rdi + 216], xmm4, 11
	vpextrb	byte ptr [rax + 8*rdi + 224], xmm4, 12
	vpextrb	byte ptr [rax + 8*rdi + 232], xmm4, 13
	vpextrb	byte ptr [rax + 8*rdi + 240], xmm4, 14
	vpor	ymm0, ymm0, ymm3
	vpextrb	byte ptr [rax + 8*rdi + 248], xmm4, 15
	vmovdqu	ymm4, ymmword ptr [rbp - 192]   # 32-byte Reload
	vpand	ymm3, ymm2, ymmword ptr [rbx + rdi + 32]
	vpextrb	byte ptr [rax + 8*rdi + 256], xmm3, 0
	vpextrb	byte ptr [rax + 8*rdi + 264], xmm3, 1
	vpextrb	byte ptr [rax + 8*rdi + 272], xmm3, 2
	vpextrb	byte ptr [rax + 8*rdi + 280], xmm3, 3
	vpextrb	byte ptr [rax + 8*rdi + 288], xmm3, 4
	vpextrb	byte ptr [rax + 8*rdi + 296], xmm3, 5
	vpextrb	byte ptr [rax + 8*rdi + 304], xmm3, 6
	vpextrb	byte ptr [rax + 8*rdi + 312], xmm3, 7
	vpextrb	byte ptr [rax + 8*rdi + 320], xmm3, 8
	vpextrb	byte ptr [rax + 8*rdi + 328], xmm3, 9
	vpextrb	byte ptr [rax + 8*rdi + 336], xmm3, 10
	vpextrb	byte ptr [rax + 8*rdi + 344], xmm3, 11
	vpextrb	byte ptr [rax + 8*rdi + 352], xmm3, 12
	vpextrb	byte ptr [rax + 8*rdi + 360], xmm3, 13
	vpextrb	byte ptr [rax + 8*rdi + 368], xmm3, 14
	vpextrb	byte ptr [rax + 8*rdi + 376], xmm3, 15
	vpcmpeqb	ymm2, ymm3, ymm2
	vpxor	ymm2, ymm2, ymm5
	vextracti128	xmm3, ymm3, 1
	vpextrb	byte ptr [rax + 8*rdi + 384], xmm3, 0
	vpextrb	byte ptr [rax + 8*rdi + 392], xmm3, 1
	vpextrb	byte ptr [rax + 8*rdi + 400], xmm3, 2
	vpextrb	byte ptr [rax + 8*rdi + 408], xmm3, 3
	vpextrb	byte ptr [rax + 8*rdi + 416], xmm3, 4
	vpextrb	byte ptr [rax + 8*rdi + 424], xmm3, 5
	vpextrb	byte ptr [rax + 8*rdi + 432], xmm3, 6
	vpextrb	byte ptr [rax + 8*rdi + 440], xmm3, 7
	vpextrb	byte ptr [rax + 8*rdi + 448], xmm3, 8
	vpextrb	byte ptr [rax + 8*rdi + 456], xmm3, 9
	vpextrb	byte ptr [rax + 8*rdi + 464], xmm3, 10
	vpextrb	byte ptr [rax + 8*rdi + 472], xmm3, 11
	vpextrb	byte ptr [rax + 8*rdi + 480], xmm3, 12
	vpextrb	byte ptr [rax + 8*rdi + 488], xmm3, 13
	vpextrb	byte ptr [rax + 8*rdi + 496], xmm3, 14
	vpor	ymm4, ymm4, ymm2
	vpextrb	byte ptr [rax + 8*rdi + 504], xmm3, 15
	vpand	ymm2, ymm15, ymmword ptr [rbx + rdi + 64]
	vpextrb	byte ptr [rax + 8*rdi + 512], xmm2, 0
	vpextrb	byte ptr [rax + 8*rdi + 520], xmm2, 1
	vpextrb	byte ptr [rax + 8*rdi + 528], xmm2, 2
	vpextrb	byte ptr [rax + 8*rdi + 536], xmm2, 3
	vpextrb	byte ptr [rax + 8*rdi + 544], xmm2, 4
	vpextrb	byte ptr [rax + 8*rdi + 552], xmm2, 5
	vpextrb	byte ptr [rax + 8*rdi + 560], xmm2, 6
	vpextrb	byte ptr [rax + 8*rdi + 568], xmm2, 7
	vpextrb	byte ptr [rax + 8*rdi + 576], xmm2, 8
	vpextrb	byte ptr [rax + 8*rdi + 584], xmm2, 9
	vpextrb	byte ptr [rax + 8*rdi + 592], xmm2, 10
	vpextrb	byte ptr [rax + 8*rdi + 600], xmm2, 11
	vpextrb	byte ptr [rax + 8*rdi + 608], xmm2, 12
	vpextrb	byte ptr [rax + 8*rdi + 616], xmm2, 13
	vpextrb	byte ptr [rax + 8*rdi + 624], xmm2, 14
	vpextrb	byte ptr [rax + 8*rdi + 632], xmm2, 15
	vpcmpeqb	ymm3, ymm15, ymm2
	vpxor	ymm3, ymm3, ymm5
	vextracti128	xmm2, ymm2, 1
	vpextrb	byte ptr [rax + 8*rdi + 640], xmm2, 0
	vpextrb	byte ptr [rax + 8*rdi + 648], xmm2, 1
	vpextrb	byte ptr [rax + 8*rdi + 656], xmm2, 2
	vpextrb	byte ptr [rax + 8*rdi + 664], xmm2, 3
	vpextrb	byte ptr [rax + 8*rdi + 672], xmm2, 4
	vpextrb	byte ptr [rax + 8*rdi + 680], xmm2, 5
	vpextrb	byte ptr [rax + 8*rdi + 688], xmm2, 6
	vpextrb	byte ptr [rax + 8*rdi + 696], xmm2, 7
	vpextrb	byte ptr [rax + 8*rdi + 704], xmm2, 8
	vpextrb	byte ptr [rax + 8*rdi + 712], xmm2, 9
	vpextrb	byte ptr [rax + 8*rdi + 720], xmm2, 10
	vpextrb	byte ptr [rax + 8*rdi + 728], xmm2, 11
	vpextrb	byte ptr [rax + 8*rdi + 736], xmm2, 12
	vpextrb	byte ptr [rax + 8*rdi + 744], xmm2, 13
	vpextrb	byte ptr [rax + 8*rdi + 752], xmm2, 14
	vpor	ymm6, ymm6, ymm3
	vpextrb	byte ptr [rax + 8*rdi + 760], xmm2, 15
	vpand	ymm2, ymm14, ymmword ptr [rbx + rdi + 96]
	vpextrb	byte ptr [rax + 8*rdi + 768], xmm2, 0
	vpextrb	byte ptr [rax + 8*rdi + 776], xmm2, 1
	vpextrb	byte ptr [rax + 8*rdi + 784], xmm2, 2
	vpextrb	byte ptr [rax + 8*rdi + 792], xmm2, 3
	vpextrb	byte ptr [rax + 8*rdi + 800], xmm2, 4
	vpextrb	byte ptr [rax + 8*rdi + 808], xmm2, 5
	vpextrb	byte ptr [rax + 8*rdi + 816], xmm2, 6
	vpextrb	byte ptr [rax + 8*rdi + 824], xmm2, 7
	vpextrb	byte ptr [rax + 8*rdi + 832], xmm2, 8
	vpextrb	byte ptr [rax + 8*rdi + 840], xmm2, 9
	vpextrb	byte ptr [rax + 8*rdi + 848], xmm2, 10
	vpextrb	byte ptr [rax + 8*rdi + 856], xmm2, 11
	vpextrb	byte ptr [rax + 8*rdi + 864], xmm2, 12
	vpextrb	byte ptr [rax + 8*rdi + 872], xmm2, 13
	vpextrb	byte ptr [rax + 8*rdi + 880], xmm2, 14
	vpextrb	byte ptr [rax + 8*rdi + 888], xmm2, 15
	vpcmpeqb	ymm3, ymm14, ymm2
	vpxor	ymm3, ymm3, ymm5
	vextracti128	xmm2, ymm2, 1
	vpextrb	byte ptr [rax + 8*rdi + 896], xmm2, 0
	vpextrb	byte ptr [rax + 8*rdi + 904], xmm2, 1
	vpextrb	byte ptr [rax + 8*rdi + 912], xmm2, 2
	vpextrb	byte ptr [rax + 8*rdi + 920], xmm2, 3
	vpextrb	byte ptr [rax + 8*rdi + 928], xmm2, 4
	vpextrb	byte ptr [rax + 8*rdi + 936], xmm2, 5
	vpextrb	byte ptr [rax + 8*rdi + 944], xmm2, 6
	vpextrb	byte ptr [rax + 8*rdi + 952], xmm2, 7
	vpextrb	byte ptr [rax + 8*rdi + 960], xmm2, 8
	vpextrb	byte ptr [rax + 8*rdi + 968], xmm2, 9
	vpextrb	byte ptr [rax + 8*rdi + 976], xmm2, 10
	vpextrb	byte ptr [rax + 8*rdi + 984], xmm2, 11
	vpextrb	byte ptr [rax + 8*rdi + 992], xmm2, 12
	vpextrb	byte ptr [rax + 8*rdi + 1000], xmm2, 13
	vpextrb	byte ptr [rax + 8*rdi + 1008], xmm2, 14
	vmovdqu	ymm5, ymmword ptr [rbp - 96]    # 32-byte Reload
	vpor	ymm5, ymm5, ymm3
	vmovdqu	ymmword ptr [rbp - 96], ymm5    # 32-byte Spill
	vmovdqu	ymm3, ymmword ptr [rbp - 96]    # 32-byte Reload
	vpextrb	byte ptr [rax + 8*rdi + 1016], xmm2, 15
	sub	rdi, -128
	cmp	rdx, rdi
	jne	.LBB33_59
# %bb.60:
	vpor	ymm0, ymm4, ymm0
	vpor	ymm0, ymm6, ymm0
	vpor	ymm0, ymm3, ymm0
	vgf2p8affineqb	ymm0, ymm0, ymmword ptr [rip + .LCPI33_14], 0
	vpmovmskb	eax, ymm0
	test	eax, eax
	setne	al
	cmp	esi, 16
	jbe	.LBB33_64
.LBB33_61:
	mov	rsi, rdx
	mov	edx, r13d
	and	edx, 15
	mov	edi, 16
	cmovne	rdi, rdx
	mov	rdx, r13
	sub	rdx, rdi
	vmovd	xmm0, eax
	vpbroadcastb	xmm0, xmm0
	lea	rax, [rip + con]
	add	rax, rcx
	vpbroadcastw	xmm1, word ptr [rip + .LCPI33_16] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI33_16] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI33_16] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm4, word ptr [rip + .LCPI33_16] # xmm4 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpcmpeqd	xmm5, xmm5, xmm5
	.p2align	4, 0x90
.LBB33_62:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	ymm6, ymmword ptr [rax + 8*rsi]
	vmovdqu	ymm7, ymmword ptr [rax + 8*rsi + 32]
	vmovdqu	ymm8, ymmword ptr [rax + 8*rsi + 64]
	vmovdqu	ymm9, ymmword ptr [rax + 8*rsi + 96]
	vextracti128	xmm10, ymm9, 1
	vpshufb	xmm10, xmm10, xmm1
	vpshufb	xmm9, xmm9, xmm1
	vpunpcklwd	xmm9, xmm9, xmm10       # xmm9 = xmm9[0],xmm10[0],xmm9[1],xmm10[1],xmm9[2],xmm10[2],xmm9[3],xmm10[3]
	vextracti128	xmm10, ymm8, 1
	vpshufb	xmm10, xmm10, xmm2
	vpshufb	xmm8, xmm8, xmm2
	vpunpcklwd	xmm8, xmm8, xmm10       # xmm8 = xmm8[0],xmm10[0],xmm8[1],xmm10[1],xmm8[2],xmm10[2],xmm8[3],xmm10[3]
	vpblendd	xmm8, xmm8, xmm9, 8             # xmm8 = xmm8[0,1,2],xmm9[3]
	vextracti128	xmm9, ymm7, 1
	vpshufb	xmm9, xmm9, xmm3
	vpshufb	xmm7, xmm7, xmm3
	vpunpcklwd	xmm7, xmm7, xmm9        # xmm7 = xmm7[0],xmm9[0],xmm7[1],xmm9[1],xmm7[2],xmm9[2],xmm7[3],xmm9[3]
	vextracti128	xmm9, ymm6, 1
	vpshufb	xmm9, xmm9, xmm4
	vpshufb	xmm6, xmm6, xmm4
	vpunpcklwd	xmm6, xmm6, xmm9        # xmm6 = xmm6[0],xmm9[0],xmm6[1],xmm9[1],xmm6[2],xmm9[2],xmm6[3],xmm9[3]
	vpblendd	xmm6, xmm6, xmm7, 2             # xmm6 = xmm6[0],xmm7[1],xmm6[2,3]
	vpblendd	xmm6, xmm6, xmm8, 12            # xmm6 = xmm6[0,1],xmm8[2,3]
	vpand	xmm7, xmm6, xmmword ptr [rbx + rsi]
	vpcmpeqb	xmm6, xmm7, xmm6
	vpxor	xmm6, xmm6, xmm5
	vpextrb	byte ptr [rax + 8*rsi], xmm7, 0
	vpextrb	byte ptr [rax + 8*rsi + 8], xmm7, 1
	vpextrb	byte ptr [rax + 8*rsi + 16], xmm7, 2
	vpextrb	byte ptr [rax + 8*rsi + 24], xmm7, 3
	vpextrb	byte ptr [rax + 8*rsi + 32], xmm7, 4
	vpextrb	byte ptr [rax + 8*rsi + 40], xmm7, 5
	vpextrb	byte ptr [rax + 8*rsi + 48], xmm7, 6
	vpextrb	byte ptr [rax + 8*rsi + 56], xmm7, 7
	vpextrb	byte ptr [rax + 8*rsi + 64], xmm7, 8
	vpextrb	byte ptr [rax + 8*rsi + 72], xmm7, 9
	vpextrb	byte ptr [rax + 8*rsi + 80], xmm7, 10
	vpextrb	byte ptr [rax + 8*rsi + 88], xmm7, 11
	vpextrb	byte ptr [rax + 8*rsi + 96], xmm7, 12
	vpextrb	byte ptr [rax + 8*rsi + 104], xmm7, 13
	vpextrb	byte ptr [rax + 8*rsi + 112], xmm7, 14
	vpor	xmm0, xmm0, xmm6
	vpextrb	byte ptr [rax + 8*rsi + 120], xmm7, 15
	add	rsi, 16
	cmp	rdx, rsi
	jne	.LBB33_62
# %bb.63:
	vptest	xmm0, xmmword ptr [rip + .LCPI33_15]
	setne	al
.LBB33_64:
	add	rbx, rdx
	lea	rsi, [rcx + 8*rdx]
	lea	rcx, [rip + con]
	add	rcx, rsi
	sub	r13, rdx
	xor	edx, edx
	.p2align	4, 0x90
.LBB33_65:                              # =>This Inner Loop Header: Depth=1
	movzx	esi, byte ptr [rcx + 8*rdx]
	movzx	edi, byte ptr [rbx + rdx]
	and	dil, sil
	cmp	dil, sil
	setne	sil
	or	al, sil
	mov	byte ptr [rcx + 8*rdx], dil
	inc	rdx
	cmp	r13, rdx
	jne	.LBB33_65
.LBB33_66:
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	jne	.LBB33_68
# %bb.67:
	and	al, 1
                                        # kill: def $al killed $al killed $rax
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa rsp, 8
	vzeroupper
	ret
.LBB33_68:
	.cfi_def_cfa rbp, 16
	vzeroupper
	call	__stack_chk_fail@PLT
.Lfunc_end33:
	.size	sequence_filtration, .Lfunc_end33-sequence_filtration
	.cfi_endproc
                                        # -- End function
	.globl	apply_sequence_filtration       # -- Begin function apply_sequence_filtration
	.p2align	4, 0x90
	.type	apply_sequence_filtration,@function
apply_sequence_filtration:              # @apply_sequence_filtration
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	rbx
	.cfi_def_cfa_offset 24
	push	rax
	.cfi_def_cfa_offset 32
	.cfi_offset rbx, -24
	.cfi_offset rbp, -16
	xor	ebx, ebx
	cmp	dword ptr [rip + length], 0
	jle	.LBB34_1
# %bb.3:
	xor	ebp, ebp
	jmp	.LBB34_4
	.p2align	4, 0x90
.LBB34_7:                               #   in Loop: Header=BB34_4 Depth=1
	inc	ebx
	cmp	ebx, dword ptr [rip + length]
	jge	.LBB34_2
.LBB34_4:                               # =>This Inner Loop Header: Depth=1
	mov	eax, ebp
	mov	bpl, 1
	test	al, 1
	jne	.LBB34_7
# %bb.5:                                #   in Loop: Header=BB34_4 Depth=1
	mov	edi, ebx
	mov	esi, 1
	call	sequence_filtration
	test	al, al
	jne	.LBB34_7
# %bb.6:                                #   in Loop: Header=BB34_4 Depth=1
	mov	edi, ebx
	xor	esi, esi
	call	sequence_filtration
	mov	ebp, eax
	jmp	.LBB34_7
.LBB34_1:
	xor	ebp, ebp
.LBB34_2:
	mov	eax, ebp
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end34:
	.size	apply_sequence_filtration, .Lfunc_end34-apply_sequence_filtration
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0                          # -- Begin function solve
.LCPI35_0:
	.byte	1                               # 0x1
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	4                               # 0x4
	.byte	5                               # 0x5
	.byte	6                               # 0x6
	.byte	7                               # 0x7
	.byte	8                               # 0x8
	.byte	9                               # 0x9
	.byte	10                              # 0xa
	.byte	11                              # 0xb
	.byte	12                              # 0xc
	.byte	13                              # 0xd
	.byte	14                              # 0xe
	.byte	15                              # 0xf
	.byte	16                              # 0x10
	.byte	17                              # 0x11
	.byte	18                              # 0x12
	.byte	19                              # 0x13
	.byte	20                              # 0x14
	.byte	21                              # 0x15
	.byte	22                              # 0x16
	.byte	23                              # 0x17
	.byte	24                              # 0x18
	.byte	25                              # 0x19
	.byte	26                              # 0x1a
	.byte	27                              # 0x1b
	.byte	28                              # 0x1c
	.byte	29                              # 0x1d
	.byte	30                              # 0x1e
	.byte	31                              # 0x1f
	.byte	32                              # 0x20
.LCPI35_1:
	.zero	32,48
.LCPI35_2:
	.zero	32,32
.LCPI35_6:
	.zero	1
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI35_3:
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	4                               # 0x4
	.byte	5                               # 0x5
	.byte	6                               # 0x6
	.byte	7                               # 0x7
	.byte	8                               # 0x8
	.byte	9                               # 0x9
	.byte	10                              # 0xa
	.byte	11                              # 0xb
	.byte	12                              # 0xc
	.byte	13                              # 0xd
	.byte	14                              # 0xe
	.byte	15                              # 0xf
.LCPI35_4:
	.zero	16,48
.LCPI35_5:
	.zero	16,16
.LCPI35_7:
	.zero	1
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.byte	255                             # 0xff
	.section	.rodata,"a",@progbits
.LCPI35_8:
	.byte	48                              # 0x30
.LCPI35_9:
	.byte	16                              # 0x10
.LCPI35_10:
	.byte	32                              # 0x20
.LCPI35_11:
	.byte	255                             # 0xff
	.text
	.globl	solve
	.p2align	4, 0x90
	.type	solve,@function
solve:                                  # @solve
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 24
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	ebx, edx
	mov	r14, rdi
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 48], rax
	call	initialize_board
	test	eax, eax
	je	.LBB35_1
# %bb.2:
	mov	r15d, dword ptr [rip + length]
	test	ebx, ebx
	je	.LBB35_7
# %bb.3:
	mov	edi, ebx
	imul	edi, edi
	mov	eax, -1
	shlx	esi, eax, ebx
	not	sil
	mov	r8d, 1
	cmp	edi, 2
	cmovb	edi, r8d
	jae	.LBB35_31
# %bb.4:
	xor	ecx, ecx
	jmp	.LBB35_5
.LBB35_1:
	xor	eax, eax
	jmp	.LBB35_46
.LBB35_31:
	mov	r9d, edi
	and	r9d, -4
	xor	ecx, ecx
	movzx	r10d, sil
	lea	r11, [rip + con]
	.p2align	4, 0x90
.LBB35_32:                              # =>This Inner Loop Header: Depth=1
	mov	eax, ecx
	cdq
	idiv	r15d
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	shr	eax, 4
	and	eax, 15
	and	edx, 7
	movzx	r12d, byte ptr [r14 + rcx]
	lea	r13d, [r12 - 49]
	cmp	r12b, 45
	shlx	r12d, r8d, r13d
	cmove	r12d, r10d
	lea	r13, [r11 + 8*rax]
	mov	byte ptr [rdx + r13], r12b
	mov	byte ptr [rax + r11 + 64], 0
	lea	eax, [rcx + 1]
	cdq
	idiv	r15d
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	shr	eax, 4
	and	eax, 15
	movzx	r12d, byte ptr [r14 + rcx + 1]
	and	edx, 7
	lea	r13d, [r12 - 49]
	cmp	r12b, 45
	shlx	r12d, r8d, r13d
	cmove	r12d, r10d
	lea	r13, [r11 + 8*rax]
	mov	byte ptr [rdx + r13], r12b
	mov	byte ptr [rax + r11 + 64], 0
	add	rcx, 2
	cmp	rcx, r9
	jne	.LBB35_32
.LBB35_5:
	test	dil, 1
	je	.LBB35_7
# %bb.6:
	mov	eax, ecx
	cdq
	idiv	r15d
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	shr	eax, 4
	and	eax, 15
	and	edx, 7
	movzx	ecx, byte ptr [r14 + rcx]
	lea	edi, [rcx - 49]
	cmp	cl, 45
	mov	ecx, 1
	shlx	ecx, ecx, edi
	movzx	esi, sil
	cmovne	esi, ecx
	lea	rcx, [rip + con]
	lea	rdi, [rcx + 8*rax]
	mov	byte ptr [rdx + rdi], sil
	mov	byte ptr [rax + rcx + 64], 0
.LBB35_7:
	movsxd	rbx, ebx
	lea	r14, [rip + .Lconstinit.24]
	mov	edi, dword ptr [r14 + 4*rbx]
	shl	rdi, 3
	call	malloc@PLT
	mov	qword ptr [rbp - 56], rsp       # 8-byte Spill
	mov	qword ptr [rip + all_sequences], rax
	mov	rdx, rsp
	add	r15, 15
	and	r15, -16
	sub	rdx, r15
	mov	rsp, rdx
	mov	ecx, dword ptr [rip + length]
	test	ecx, ecx
	jle	.LBB35_14
# %bb.8:
	mov	esi, 1
	cmp	ecx, 16
	jb	.LBB35_29
# %bb.9:
	cmp	ecx, 32
	jae	.LBB35_24
# %bb.10:
	mov	edi, 1
	xor	eax, eax
.LBB35_11:
	mov	r8d, ecx
	and	r8d, 2147483632
	lea	rsi, [r8 + 1]
	vmovd	xmm0, edi
	vpbroadcastb	xmm0, xmm0
	vpaddb	xmm0, xmm0, xmmword ptr [rip + .LCPI35_3]
	vpbroadcastb	xmm1, byte ptr [rip + .LCPI35_8] # xmm1 = [48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48]
	vpbroadcastb	xmm2, byte ptr [rip + .LCPI35_9] # xmm2 = [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]
	.p2align	4, 0x90
.LBB35_12:                              # =>This Inner Loop Header: Depth=1
	vpaddb	xmm3, xmm0, xmm1
	vmovdqa	xmmword ptr [rdx + rax], xmm3
	add	rax, 16
	vpaddb	xmm0, xmm0, xmm2
	cmp	r8, rax
	jne	.LBB35_12
# %bb.13:
	cmp	r8d, ecx
	jne	.LBB35_29
	jmp	.LBB35_14
.LBB35_24:
	mov	eax, ecx
	and	eax, 2147483616
	lea	rdi, [rax + 1]
	vmovdqa	ymm0, ymmword ptr [rip + .LCPI35_0] # ymm0 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]
	xor	esi, esi
	vpbroadcastb	ymm1, byte ptr [rip + .LCPI35_8] # ymm1 = [48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48]
	vpbroadcastb	ymm2, byte ptr [rip + .LCPI35_10] # ymm2 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	.p2align	4, 0x90
.LBB35_25:                              # =>This Inner Loop Header: Depth=1
	vpaddb	ymm3, ymm0, ymm1
	vmovdqu	ymmword ptr [rdx + rsi], ymm3
	add	rsi, 32
	vpaddb	ymm0, ymm0, ymm2
	cmp	rax, rsi
	jne	.LBB35_25
# %bb.26:
	cmp	eax, ecx
	je	.LBB35_14
# %bb.27:
	test	cl, 16
	jne	.LBB35_11
# %bb.28:
	or	rax, 1
	mov	rsi, rax
.LBB35_29:
	lea	rax, [rcx + 1]
	.p2align	4, 0x90
.LBB35_30:                              # =>This Inner Loop Header: Depth=1
	lea	edi, [rsi + 48]
	mov	byte ptr [rdx + rsi - 1], dil
	inc	rsi
	cmp	rax, rsi
	jne	.LBB35_30
.LBB35_14:
	mov	dword ptr [rip + sequence_pos], 0
	mov	rdi, qword ptr [rip + all_sequences]
	mov	esi, ecx
                                        # kill: def $ecx killed $ecx killed $rcx
	vzeroupper
	call	permutations
	mov	ebx, dword ptr [r14 + 4*rbx]
	shl	rbx, 3
	mov	rdi, rbx
	call	malloc@PLT
	mov	qword ptr [rip + valid_sequences], rax
	mov	rdi, rbx
	call	malloc@PLT
	mov	qword ptr [rip + filtered_sequences], rax
	call	edge_clue_initialization
	call	print_board
	xor	r12d, r12d
	mov	eax, dword ptr [rip + length]
	mov	r13d, -1
	lea	r15, [rip + con]
	.p2align	4, 0x90
.LBB35_15:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB35_17 Depth 2
                                        #     Child Loop BB35_36 Depth 2
                                        #     Child Loop BB35_40 Depth 2
                                        #     Child Loop BB35_42 Depth 2
	test	eax, eax
	jle	.LBB35_21
# %bb.16:                               #   in Loop: Header=BB35_15 Depth=1
	xor	ebx, ebx
	xor	r14d, r14d
	jmp	.LBB35_17
	.p2align	4, 0x90
.LBB35_20:                              #   in Loop: Header=BB35_17 Depth=2
	inc	ebx
	cmp	ebx, dword ptr [rip + length]
	jge	.LBB35_21
.LBB35_17:                              #   Parent Loop BB35_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	eax, r14d
	mov	r14b, 1
	test	al, 1
	jne	.LBB35_20
# %bb.18:                               #   in Loop: Header=BB35_17 Depth=2
	mov	edi, ebx
	mov	esi, 1
	vzeroupper
	call	sequence_filtration
	test	al, al
	jne	.LBB35_20
# %bb.19:                               #   in Loop: Header=BB35_17 Depth=2
	mov	edi, ebx
	xor	esi, esi
	call	sequence_filtration
	mov	r14d, eax
	jmp	.LBB35_20
	.p2align	4, 0x90
.LBB35_21:                              #   in Loop: Header=BB35_15 Depth=1
	vzeroupper
	call	place_singles
	movsxd	rax, dword ptr [rip + length]
	test	rax, rax
	jle	.LBB35_45
# %bb.22:                               #   in Loop: Header=BB35_15 Depth=1
	shlx	ecx, r13d, eax
	not	cl
	cmp	eax, 16
	jae	.LBB35_33
# %bb.23:                               #   in Loop: Header=BB35_15 Depth=1
	xor	edx, edx
	mov	esi, ecx
	jmp	.LBB35_42
	.p2align	4, 0x90
.LBB35_33:                              #   in Loop: Header=BB35_15 Depth=1
	cmp	eax, 128
	jae	.LBB35_35
# %bb.34:                               #   in Loop: Header=BB35_15 Depth=1
	mov	esi, ecx
	xor	edx, edx
	jmp	.LBB35_39
	.p2align	4, 0x90
.LBB35_35:                              #   in Loop: Header=BB35_15 Depth=1
	mov	edx, eax
	vpbroadcastb	ymm1, byte ptr [rip + .LCPI35_11] # ymm1 = [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
	vpinsrb	xmm0, xmm1, ecx, 0
	and	edx, 2147483520
	vpblendd	ymm0, ymm1, ymm0, 15            # ymm0 = ymm0[0,1,2,3],ymm1[4,5,6,7]
	vpcmpeqd	ymm1, ymm1, ymm1
	xor	esi, esi
	vpcmpeqd	ymm2, ymm2, ymm2
	vpcmpeqd	ymm3, ymm3, ymm3
	.p2align	4, 0x90
.LBB35_36:                              #   Parent Loop BB35_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpand	ymm0, ymm0, ymmword ptr [rsi + r15 + 64]
	vpand	ymm1, ymm1, ymmword ptr [rsi + r15 + 96]
	vpand	ymm2, ymm2, ymmword ptr [rsi + r15 + 128]
	vpand	ymm3, ymm3, ymmword ptr [rsi + r15 + 160]
	sub	rsi, -128
	cmp	rdx, rsi
	jne	.LBB35_36
# %bb.37:                               #   in Loop: Header=BB35_15 Depth=1
	vpand	ymm0, ymm1, ymm0
	vpand	ymm1, ymm3, ymm2
	vpand	ymm0, ymm1, ymm0
	vextracti128	xmm1, ymm0, 1
	vpand	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 238                 # xmm1 = xmm0[2,3,2,3]
	vpand	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 85                  # xmm1 = xmm0[1,1,1,1]
	vpand	xmm0, xmm0, xmm1
	vpsrld	xmm1, xmm0, 16
	vpand	xmm0, xmm0, xmm1
	vpsrlw	xmm1, xmm0, 8
	vpand	xmm0, xmm0, xmm1
	vmovd	esi, xmm0
	cmp	rdx, rax
	je	.LBB35_43
# %bb.38:                               #   in Loop: Header=BB35_15 Depth=1
	test	al, 112
	je	.LBB35_42
.LBB35_39:                              #   in Loop: Header=BB35_15 Depth=1
	mov	rdi, rdx
	mov	edx, eax
	and	edx, 2147483632
	vpbroadcastb	xmm0, byte ptr [rip + .LCPI35_11] # xmm0 = [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
	vpinsrb	xmm0, xmm0, esi, 0
	.p2align	4, 0x90
.LBB35_40:                              #   Parent Loop BB35_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpand	xmm0, xmm0, xmmword ptr [rdi + r15 + 64]
	add	rdi, 16
	cmp	rdx, rdi
	jne	.LBB35_40
# %bb.41:                               #   in Loop: Header=BB35_15 Depth=1
	vpshufd	xmm1, xmm0, 238                 # xmm1 = xmm0[2,3,2,3]
	vpand	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 85                  # xmm1 = xmm0[1,1,1,1]
	vpand	xmm0, xmm0, xmm1
	vpsrld	xmm1, xmm0, 16
	vpand	xmm0, xmm0, xmm1
	vpsrlw	xmm1, xmm0, 8
	vpand	xmm0, xmm0, xmm1
	vmovd	esi, xmm0
	cmp	rdx, rax
	je	.LBB35_43
	.p2align	4, 0x90
.LBB35_42:                              #   Parent Loop BB35_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	and	sil, byte ptr [rdx + r15 + 64]
	inc	rdx
	cmp	rax, rdx
	jne	.LBB35_42
.LBB35_43:                              #   in Loop: Header=BB35_15 Depth=1
	cmp	sil, cl
	je	.LBB35_45
# %bb.44:                               #   in Loop: Header=BB35_15 Depth=1
	lea	ecx, [r12 + 1]
	cmp	r12d, 50
	mov	r12d, ecx
	jb	.LBB35_15
.LBB35_45:
	vzeroupper
	call	print_board
	mov	rdi, qword ptr [rip + all_sequences]
	call	free@PLT
	mov	rdi, qword ptr [rip + valid_sequences]
	call	free@PLT
	mov	rdi, qword ptr [rip + filtered_sequences]
	call	free@PLT
	mov	eax, 1
	mov	rsp, qword ptr [rbp - 56]       # 8-byte Reload
.LBB35_46:
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	jne	.LBB35_48
# %bb.47:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB35_48:
	.cfi_def_cfa rbp, 16
	call	__stack_chk_fail@PLT
.Lfunc_end35:
	.size	solve, .Lfunc_end35-solve
	.cfi_endproc
                                        # -- End function
	.type	top_key,@object                 # @top_key
	.bss
	.globl	top_key
	.p2align	4, 0x0
top_key:
	.zero	32
	.size	top_key, 32

	.type	bottom_key,@object              # @bottom_key
	.globl	bottom_key
	.p2align	4, 0x0
bottom_key:
	.zero	32
	.size	bottom_key, 32

	.type	left_key,@object                # @left_key
	.globl	left_key
	.p2align	4, 0x0
left_key:
	.zero	32
	.size	left_key, 32

	.type	right_key,@object               # @right_key
	.globl	right_key
	.p2align	4, 0x0
right_key:
	.zero	32
	.size	right_key, 32

	.type	board,@object                   # @board
	.globl	board
	.p2align	4, 0x0
board:
	.zero	64
	.size	board, 64

	.type	length,@object                  # @length
	.data
	.globl	length
	.p2align	2, 0x0
length:
	.long	5                               # 0x5
	.size	length, 4

	.type	remaining,@object               # @remaining
	.bss
	.globl	remaining
	.p2align	2, 0x0
remaining:
	.long	0                               # 0x0
	.size	remaining, 4

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"   "
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	" %d"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"\n   "
	.size	.L.str.2, 5

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	" v"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\n%d >"
	.size	.L.str.4, 6

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	" %c"
	.size	.L.str.5, 4

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	" < %d"
	.size	.L.str.6, 6

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	" ^"
	.size	.L.str.7, 3

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	" %8s%n"
	.size	.L.str.9, 7

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"Choose a piece (1-%d) or q to quit: "
	.size	.L.str.10, 37

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	" %8s"
	.size	.L.str.11, 5

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"q"
	.size	.L.str.12, 2

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"Invalid choice. "
	.size	.L.str.13, 17

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"Choose a row (0-%d): "
	.size	.L.str.14, 22

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"Choose a column (0-%d): "
	.size	.L.str.15, 25

	.type	con,@object                     # @con
	.bss
	.globl	con
con:
	.zero	72
	.size	con, 72

	.type	.L.str.20,@object               # @.str.20
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.20:
	.asciz	"single(bit)"
	.size	.L.str.20, 12

	.type	.L.str.21,@object               # @.str.21
.L.str.21:
	.asciz	"src/hw1.c"
	.size	.L.str.21, 10

	.type	.L__PRETTY_FUNCTION__.bit_to_piece,@object # @__PRETTY_FUNCTION__.bit_to_piece
.L__PRETTY_FUNCTION__.bit_to_piece:
	.asciz	"char bit_to_piece(uint_fast8_t)"
	.size	.L__PRETTY_FUNCTION__.bit_to_piece, 32

	.type	sequence_pos,@object            # @sequence_pos
	.bss
	.globl	sequence_pos
	.p2align	2, 0x0
sequence_pos:
	.long	0                               # 0x0
	.size	sequence_pos, 4

	.type	all_sequences,@object           # @all_sequences
	.globl	all_sequences
	.p2align	3, 0x0
all_sequences:
	.quad	0
	.size	all_sequences, 8

	.type	valid_sequences,@object         # @valid_sequences
	.globl	valid_sequences
	.p2align	3, 0x0
valid_sequences:
	.quad	0
	.size	valid_sequences, 8

	.type	filtered_sequences,@object      # @filtered_sequences
	.globl	filtered_sequences
	.p2align	3, 0x0
filtered_sequences:
	.quad	0
	.size	filtered_sequences, 8

	.type	.Lconstinit.24,@object          # @constinit.24
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.Lconstinit.24:
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	6                               # 0x6
	.long	24                              # 0x18
	.long	120                             # 0x78
	.long	720                             # 0x2d0
	.long	5040                            # 0x13b0
	.long	40320                           # 0x9d80
	.size	.Lconstinit.24, 36

	.type	.Lstr,@object                   # @str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"Invalid choice. You violate one of the key requirements."
	.size	.Lstr, 57

	.type	.Lstr.25,@object                # @str.25
.Lstr.25:
	.asciz	"Invalid choice. There is already a building with that height in that row or column."
	.size	.Lstr.25, 84

	.type	.Lstr.26,@object                # @str.26
.Lstr.26:
	.asciz	"Invalid choice. That space is already occupied."
	.size	.Lstr.26, 48

	.type	.Lstr.29,@object                # @str.29
.Lstr.29:
	.asciz	"Invalid initial board state."
	.size	.Lstr.29, 29

	.ident	"clang version 19.1.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __stack_chk_fail
	.addrsig_sym board

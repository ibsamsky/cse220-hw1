	.text
	.intel_syntax noprefix
	.file	"hw1.c"
	.globl	itopos                          # -- Begin function itopos
	.p2align	4, 0x90
	.type	itopos,@function
itopos:                                 # @itopos
	.cfi_startproc
# %bb.0:
	mov	eax, esi
	imul	eax, esi
	cmp	eax, edi
	jle	.LBB0_2
# %bb.1:
	mov	eax, edi
	cdq
	idiv	esi
	shl	eax, 4
	or	eax, edx
                                        # kill: def $al killed $al killed $eax
	ret
.LBB0_2:
	push	rax
	.cfi_def_cfa_offset 16
	lea	rdi, [rip + .L.str]
	lea	rsi, [rip + .L.str.1]
	lea	rcx, [rip + .L__PRETTY_FUNCTION__.itopos]
	mov	edx, 25
	call	__assert_fail@PLT
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
	lea	rdi, [rip + .L.str.2]
	xor	eax, eax
	call	printf@PLT
	cmp	dword ptr [rip + length], 0
	jle	.LBB5_3
# %bb.1:
	lea	r14, [rip + top_key]
	lea	rbx, [rip + .L.str.3]
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
	lea	rdi, [rip + .L.str.4]
	xor	eax, eax
	call	printf@PLT
	cmp	dword ptr [rip + length], 0
	jle	.LBB5_12
# %bb.4:
	lea	rbx, [rip + .L.str.5]
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
	lea	r14, [rip + .L.str.7]
	lea	rbp, [rip + right_key]
	lea	r15, [rip + .L.str.8]
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
	lea	rdi, [rip + .L.str.6]
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
	lea	rdi, [rip + .L.str.4]
	xor	eax, eax
	call	printf@PLT
	cmp	dword ptr [rip + length], 0
	jle	.LBB5_15
# %bb.13:
	lea	rbx, [rip + .L.str.9]
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
	lea	rdi, [rip + .L.str.4]
	xor	eax, eax
	call	printf@PLT
	cmp	dword ptr [rip + length], 0
	jle	.LBB5_18
# %bb.16:
	lea	r14, [rip + bottom_key]
	lea	rbx, [rip + .L.str.3]
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
	lea	rdi, [rip + .L.str.11]
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
	lea	rbx, [rip + .L.str.12]
	lea	r14, [rip + .L.str.13]
	lea	r15, [rsp + 30]
	lea	r13, [rip + .L.str.15]
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
	lea	rbp, [rip + .L.str.15]
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
	lea	rdi, [rip + .L.str.16]
	xor	eax, eax
	call	printf@PLT
	mov	r15d, dword ptr [rip + length]
	mov	dword ptr [rsp + 12], 0
	lea	rdi, [rip + .L.str.11]
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
	lea	rbp, [rip + .L.str.15]
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
	lea	rdi, [rip + .L.str.17]
	xor	eax, eax
	call	printf@PLT
	mov	r13d, dword ptr [rip + length]
	mov	dword ptr [rsp + 12], 0
	lea	rdi, [rip + .L.str.11]
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
	lea	r15, [rip + .Lstr.98]
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
	lea	r15, [rip + .Lstr.97]
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
	sub	rsp, 56
	.cfi_def_cfa_offset 112
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	ebp, edi
	movsxd	rbx, dword ptr [rip + length]
	movsxd	r13, edi
	test	rbx, rbx
	jle	.LBB13_14
# %bb.1:
	lea	rax, [8*r13]
	xor	ecx, ecx
	lea	r14, [rip + board]
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
	movsx	edi, byte ptr [r14 + rdi]
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
	jmp	.LBB13_15
.LBB13_6:
	lea	r15, [r14 + 8*r13]
	mov	rdi, r15
	mov	esi, 45
	mov	rdx, rbx
	call	memchr@PLT
	mov	rcx, rax
	mov	eax, 1
	test	rcx, rcx
	jne	.LBB13_15
# %bb.7:
	test	ebx, ebx
	jle	.LBB13_17
# %bb.8:
	mov	dword ptr [rsp + 20], ebp       # 4-byte Spill
	mov	eax, ebx
	and	eax, 3
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	cmp	ebx, 4
	mov	qword ptr [rsp + 40], r13       # 8-byte Spill
	mov	qword ptr [rsp + 24], rbx       # 8-byte Spill
	jae	.LBB13_25
# %bb.9:
	mov	bl, 48
	xor	edi, edi
	mov	dl, 48
	xor	r11d, r11d
	xor	ecx, ecx
.LBB13_10:
	mov	r14, qword ptr [rsp + 32]       # 8-byte Reload
	test	r14, r14
	mov	r13, qword ptr [rsp + 40]       # 8-byte Reload
	je	.LBB13_13
# %bb.11:
	mov	rax, qword ptr [rsp + 24]       # 8-byte Reload
	lea	r8, [rax + 8*r13]
	lea	r9, [rdi + 8*r13]
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
	cmp	al, bl
	setg	r10b
	movzx	ebx, bl
	cmovg	ebx, eax
	add	cl, r10b
	cmp	sil, dl
	setg	al
	movzx	edx, dl
	cmovg	edx, esi
	add	r11b, al
	inc	rdi
	dec	r8
	cmp	r14, rdi
	jne	.LBB13_12
.LBB13_13:
	shl	cl, 4
	or	cl, r11b
	movzx	r15d, cl
	mov	ebp, dword ptr [rsp + 20]       # 4-byte Reload
	jmp	.LBB13_18
.LBB13_14:
	lea	rax, [rip + board]
	lea	rdi, [rax + 8*r13]
	mov	esi, 45
	mov	rdx, rbx
	call	memchr@PLT
	mov	rcx, rax
	mov	eax, 1
	test	rcx, rcx
	je	.LBB13_17
.LBB13_15:
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
.LBB13_17:
	.cfi_def_cfa_offset 112
	xor	r15d, r15d
.LBB13_18:
	mov	r14d, r15d
	shr	r14d, 4
	and	r15d, 7
	lea	rbx, [rip + left_key]
	mov	eax, dword ptr [rbx + 4*r13]
	test	eax, eax
	je	.LBB13_20
# %bb.19:
	cmp	r14d, eax
	jne	.LBB13_22
.LBB13_20:
	lea	rax, [rip + right_key]
	mov	eax, dword ptr [rax + 4*r13]
	test	eax, eax
	je	.LBB13_23
# %bb.21:
	cmp	r15d, eax
	je	.LBB13_23
.LBB13_22:
	mov	r12, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [r12]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 210
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r12]
	mov	ecx, dword ptr [rbx + 4*r13]
	lea	rax, [rip + right_key]
	mov	r8d, dword ptr [rax + 4*r13]
	mov	dword ptr [rsp], r15d
	lea	rsi, [rip + .L.str.28]
	mov	edx, r13d
	mov	r9d, r14d
	xor	eax, eax
	call	fprintf@PLT
	mov	ebx, 8
	jmp	.LBB13_24
.LBB13_23:
	mov	rbx, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rbx]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 214
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbx]
	lea	rsi, [rip + .L.str.31]
	mov	edx, ebp
	xor	eax, eax
	call	fprintf@PLT
	mov	ebx, 1
.LBB13_24:
	mov	r14, qword ptr [rip + stderr@GOTPCREL]
	mov	rsi, qword ptr [r14]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r14]
	call	fflush@PLT
	mov	rax, rbx
	jmp	.LBB13_15
.LBB13_25:
	mov	eax, ebx
	and	eax, 2147483644
	mov	qword ptr [rsp + 48], rax       # 8-byte Spill
	lea	r9, [r14 + 8*r13]
	add	r9, 3
	lea	r10, [rbx + r15]
	dec	r10
	add	r15, rbx
	mov	bl, 48
	xor	edi, edi
	mov	dl, 48
	xor	r13d, r13d
	xor	ecx, ecx
	jmp	.LBB13_27
	.p2align	4, 0x90
.LBB13_26:                              #   in Loop: Header=BB13_27 Depth=1
	add	cl, bpl
	add	cl, r8b
	add	cl, r15b
	add	cl, r14b
	add	r13b, byte ptr [rsp + 19]       # 1-byte Folded Reload
	add	r13b, al
	add	r13b, r12b
	mov	rax, rdi
	xor	rax, -4
	mov	r15, r11
	movzx	eax, byte ptr [r11 + rax]
	cmp	al, dl
	setg	r11b
	cmovg	edx, eax
	add	r11b, r13b
	add	rdi, 4
	add	r10, -4
	mov	r13d, r11d
	cmp	qword ptr [rsp + 48], rdi       # 8-byte Folded Reload
	je	.LBB13_10
.LBB13_27:                              # =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [r9 + rdi - 3]
	cmp	al, bl
	setg	bpl
	movzx	r8d, byte ptr [r10]
	movzx	esi, bl
	cmovg	esi, eax
	cmp	r8b, dl
	setg	byte ptr [rsp + 19]             # 1-byte Folded Spill
	movzx	edx, dl
	cmovg	edx, r8d
	movzx	eax, byte ptr [r9 + rdi - 2]
	mov	r8, rdi
	xor	r8, -2
	movzx	ebx, byte ptr [r15 + r8]
	cmp	al, sil
	setg	r8b
	cmovg	esi, eax
	cmp	bl, dl
	setg	al
	cmovg	edx, ebx
	movzx	ebx, byte ptr [r9 + rdi - 1]
	mov	r14, rdi
	xor	r14, -3
	mov	r11, r15
	movzx	r14d, byte ptr [r15 + r14]
	cmp	bl, sil
	setg	r15b
	cmovg	esi, ebx
	cmp	r14b, dl
	setg	r12b
	cmovg	edx, r14d
	movzx	ebx, byte ptr [r9 + rdi]
	cmp	bl, sil
	setg	r14b
	jg	.LBB13_26
# %bb.28:                               #   in Loop: Header=BB13_27 Depth=1
	mov	ebx, esi
	jmp	.LBB13_26
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
	mov	r13d, edi
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 48], rax
	mov	eax, dword ptr [rip + length]
	test	eax, eax
	jle	.LBB14_6
# %bb.1:
	movsxd	rcx, r13d
	xor	edx, edx
	lea	rsi, [rip + board]
	mov	edi, 1
	xor	r8d, r8d
	jmp	.LBB14_3
	.p2align	4, 0x90
.LBB14_2:                               #   in Loop: Header=BB14_3 Depth=1
	inc	rdx
	cmp	rax, rdx
	je	.LBB14_6
.LBB14_3:                               # =>This Inner Loop Header: Depth=1
	lea	r9, [rcx + 8*rdx]
	movsx	r9d, byte ptr [rsi + r9]
	cmp	r9d, 45
	je	.LBB14_2
# %bb.4:                                #   in Loop: Header=BB14_3 Depth=1
	add	r9b, -49
	shlx	r9d, edi, r9d
	movzx	r10d, r8b
	movzx	r8d, r9b
	or	r8d, r10d
	cmp	r8d, r10d
	jne	.LBB14_2
# %bb.5:
	mov	eax, 4
	jmp	.LBB14_22
.LBB14_6:
	mov	rbx, rsp
	mov	rdi, rsp
	add	rax, 15
	and	rax, -16
	sub	rdi, rax
	mov	rsp, rdi
	movsxd	r15, dword ptr [rip + length]
	test	r15, r15
	jle	.LBB14_9
# %bb.7:
	movsxd	rax, r13d
	cmp	r15d, 17
	jae	.LBB14_11
# %bb.8:
	xor	ecx, ecx
	jmp	.LBB14_18
.LBB14_9:
	mov	esi, 45
	mov	rdx, r15
	call	memchr@PLT
	mov	rcx, rax
	mov	eax, 1
	test	rcx, rcx
	jne	.LBB14_21
# %bb.10:
	mov	qword ptr [rbp - 80], rbx       # 8-byte Spill
	jmp	.LBB14_31
.LBB14_11:
	cmp	r15d, 33
	jae	.LBB14_13
# %bb.12:
	xor	ecx, ecx
	jmp	.LBB14_16
.LBB14_13:
	mov	ecx, r15d
	and	ecx, 31
	mov	edx, 32
	cmovne	rdx, rcx
	mov	rcx, r15
	sub	rcx, rdx
	xor	esi, esi
	lea	r9, [rip + board]
	vpbroadcastw	xmm0, word ptr [rip + .LCPI14_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI14_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI14_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI14_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpmovsxbd	ymm4, qword ptr [rip + .LCPI14_8] # ymm4 = [0,2,2,3,0,2,4,6]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI14_9] # ymm5 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI14_9] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	.p2align	4, 0x90
.LBB14_14:                              # =>This Inner Loop Header: Depth=1
	lea	r8, [rax + 8*rsi]
	vmovdqu	xmm7, xmmword ptr [r9 + r8 + 112]
	vpshufb	xmm7, xmm7, xmm0
	vmovdqu	xmm8, xmmword ptr [r9 + r8 + 96]
	vpshufb	xmm8, xmm8, xmm0
	vpunpcklwd	xmm7, xmm8, xmm7        # xmm7 = xmm8[0],xmm7[0],xmm8[1],xmm7[1],xmm8[2],xmm7[2],xmm8[3],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r9 + r8 + 80]
	vpshufb	xmm8, xmm8, xmm1
	vmovdqu	xmm9, xmmword ptr [r9 + r8 + 64]
	vpshufb	xmm9, xmm9, xmm1
	vpunpcklwd	xmm8, xmm9, xmm8        # xmm8 = xmm9[0],xmm8[0],xmm9[1],xmm8[1],xmm9[2],xmm8[2],xmm9[3],xmm8[3]
	vpblendd	xmm7, xmm8, xmm7, 8             # xmm7 = xmm8[0,1,2],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r9 + r8]
	vmovdqu	xmm9, xmmword ptr [r9 + r8 + 16]
	vmovdqu	xmm10, xmmword ptr [r9 + r8 + 32]
	vmovdqu	xmm11, xmmword ptr [r9 + r8 + 48]
	vpshufb	xmm11, xmm11, xmm2
	vpshufb	xmm10, xmm10, xmm2
	vpunpcklwd	xmm10, xmm10, xmm11     # xmm10 = xmm10[0],xmm11[0],xmm10[1],xmm11[1],xmm10[2],xmm11[2],xmm10[3],xmm11[3]
	vpshufb	xmm9, xmm9, xmm3
	vpshufb	xmm8, xmm8, xmm3
	vpunpcklwd	xmm8, xmm8, xmm9        # xmm8 = xmm8[0],xmm9[0],xmm8[1],xmm9[1],xmm8[2],xmm9[2],xmm8[3],xmm9[3]
	vpblendd	xmm8, xmm8, xmm10, 2            # xmm8 = xmm8[0],xmm10[1],xmm8[2,3]
	vpblendd	xmm7, xmm8, xmm7, 12            # xmm7 = xmm8[0,1],xmm7[2,3]
	vxorps	xmm8, xmm8, xmm8
	vpermd	ymm8, ymm4, ymmword ptr [r9 + r8 + 224]
	vpshufb	ymm8, ymm8, ymm5
	vxorps	xmm9, xmm9, xmm9
	vpermd	ymm9, ymm4, ymmword ptr [r9 + r8 + 192]
	vpshufb	ymm9, ymm9, ymm5
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r9 + r8 + 160]
	vpblendd	ymm8, ymm9, ymm8, 128           # ymm8 = ymm9[0,1,2,3,4,5,6],ymm8[7]
	vpshufb	ymm9, ymm10, ymm6
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r9 + r8 + 128]
	vpshufb	ymm10, ymm10, ymm6
	vpblendd	ymm9, ymm10, ymm9, 32           # ymm9 = ymm10[0,1,2,3,4],ymm9[5],ymm10[6,7]
	vpblendd	ymm8, ymm9, ymm8, 192           # ymm8 = ymm9[0,1,2,3,4,5],ymm8[6,7]
	vpblendd	ymm7, ymm8, ymm7, 15            # ymm7 = ymm7[0,1,2,3],ymm8[4,5,6,7]
	vmovdqu	ymmword ptr [rdi + rsi], ymm7
	add	rsi, 32
	cmp	rcx, rsi
	jne	.LBB14_14
# %bb.15:
	cmp	edx, 16
	jbe	.LBB14_18
.LBB14_16:
	mov	r8, rcx
	mov	ecx, r15d
	and	ecx, 15
	mov	edx, 16
	cmovne	rdx, rcx
	mov	rcx, r15
	sub	rcx, rdx
	lea	rsi, [rax + 8*r8]
	lea	rdx, [rip + board]
	add	rdx, rsi
	lea	rsi, [rdi + r8]
	mov	r9, rcx
	sub	r9, r8
	xor	r8d, r8d
	vpbroadcastw	xmm0, word ptr [rip + .LCPI14_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI14_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI14_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI14_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB14_17:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm4, xmmword ptr [rdx + 8*r8 + 112]
	vpshufb	xmm4, xmm4, xmm0
	vmovdqu	xmm5, xmmword ptr [rdx + 8*r8 + 96]
	vpshufb	xmm5, xmm5, xmm0
	vpunpcklwd	xmm4, xmm5, xmm4        # xmm4 = xmm5[0],xmm4[0],xmm5[1],xmm4[1],xmm5[2],xmm4[2],xmm5[3],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rdx + 8*r8 + 80]
	vpshufb	xmm5, xmm5, xmm1
	vmovdqu	xmm6, xmmword ptr [rdx + 8*r8 + 64]
	vpshufb	xmm6, xmm6, xmm1
	vpunpcklwd	xmm5, xmm6, xmm5        # xmm5 = xmm6[0],xmm5[0],xmm6[1],xmm5[1],xmm6[2],xmm5[2],xmm6[3],xmm5[3]
	vpblendd	xmm4, xmm5, xmm4, 8             # xmm4 = xmm5[0,1,2],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rdx + 8*r8]
	vmovdqu	xmm6, xmmword ptr [rdx + 8*r8 + 16]
	vmovdqu	xmm7, xmmword ptr [rdx + 8*r8 + 32]
	vmovdqu	xmm8, xmmword ptr [rdx + 8*r8 + 48]
	vpshufb	xmm8, xmm8, xmm2
	vpshufb	xmm7, xmm7, xmm2
	vpunpcklwd	xmm7, xmm7, xmm8        # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1],xmm7[2],xmm8[2],xmm7[3],xmm8[3]
	vpshufb	xmm6, xmm6, xmm3
	vpshufb	xmm5, xmm5, xmm3
	vpunpcklwd	xmm5, xmm5, xmm6        # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1],xmm5[2],xmm6[2],xmm5[3],xmm6[3]
	vpblendd	xmm5, xmm5, xmm7, 2             # xmm5 = xmm5[0],xmm7[1],xmm5[2,3]
	vpblendd	xmm4, xmm5, xmm4, 12            # xmm4 = xmm5[0,1],xmm4[2,3]
	vmovdqu	xmmword ptr [rsi + r8], xmm4
	add	r8, 16
	cmp	r9, r8
	jne	.LBB14_17
.LBB14_18:
	lea	rdx, [rdi + rcx]
	lea	rsi, [rax + 8*rcx]
	lea	rax, [rip + board]
	add	rax, rsi
	mov	rsi, r15
	sub	rsi, rcx
	xor	ecx, ecx
	.p2align	4, 0x90
.LBB14_19:                              # =>This Inner Loop Header: Depth=1
	movzx	r8d, byte ptr [rax + 8*rcx]
	mov	byte ptr [rdx + rcx], r8b
	inc	rcx
	cmp	rsi, rcx
	jne	.LBB14_19
# %bb.20:
	mov	esi, 45
	mov	rdx, r15
	mov	r14, rdi
	vzeroupper
	call	memchr@PLT
	mov	rcx, rax
	mov	eax, 1
	test	rcx, rcx
	je	.LBB14_24
.LBB14_21:
	mov	rsp, rbx
.LBB14_22:
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	jne	.LBB14_43
# %bb.23:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB14_24:
	.cfi_def_cfa rbp, 16
	mov	qword ptr [rbp - 64], r14       # 8-byte Spill
	test	r15d, r15d
	mov	qword ptr [rbp - 80], rbx       # 8-byte Spill
	jle	.LBB14_31
# %bb.25:
	mov	dword ptr [rbp - 68], r13d      # 4-byte Spill
	mov	eax, r15d
	and	eax, 3
	mov	qword ptr [rbp - 96], rax       # 8-byte Spill
	cmp	r15d, 4
	mov	qword ptr [rbp - 88], r15       # 8-byte Spill
	jae	.LBB14_39
# %bb.26:
	mov	bl, 48
	xor	edi, edi
	mov	dl, 48
	xor	r11d, r11d
	xor	ecx, ecx
.LBB14_27:
	mov	r14, qword ptr [rbp - 96]       # 8-byte Reload
	test	r14, r14
	mov	r10, qword ptr [rbp - 64]       # 8-byte Reload
	je	.LBB14_30
# %bb.28:
	mov	r8, rdi
	not	r8
	add	r8, qword ptr [rbp - 88]        # 8-byte Folded Reload
	add	r8, r10
	add	r10, rdi
	xor	edi, edi
	.p2align	4, 0x90
.LBB14_29:                              # =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [r10 + rdi]
	movzx	esi, byte ptr [r8]
	cmp	al, bl
	setg	r9b
	movzx	ebx, bl
	cmovg	ebx, eax
	add	cl, r9b
	cmp	sil, dl
	setg	al
	movzx	edx, dl
	cmovg	edx, esi
	add	r11b, al
	inc	rdi
	dec	r8
	cmp	r14, rdi
	jne	.LBB14_29
.LBB14_30:
	shl	cl, 4
	or	cl, r11b
	movzx	r15d, cl
	mov	r13d, dword ptr [rbp - 68]      # 4-byte Reload
	jmp	.LBB14_32
.LBB14_31:
	xor	r15d, r15d
.LBB14_32:
	mov	r14d, r15d
	shr	r14d, 4
	and	r15d, 7
	movsxd	rbx, r13d
	lea	rax, [rip + top_key]
	mov	eax, dword ptr [rax + 4*rbx]
	test	eax, eax
	je	.LBB14_34
# %bb.33:
	cmp	r14d, eax
	jne	.LBB14_36
.LBB14_34:
	lea	rax, [rip + bottom_key]
	mov	eax, dword ptr [rax + 4*rbx]
	test	eax, eax
	je	.LBB14_37
# %bb.35:
	cmp	r15d, eax
	je	.LBB14_37
.LBB14_36:
	mov	r12, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [r12]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 235
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r12]
	lea	rax, [rip + top_key]
	mov	ecx, dword ptr [rax + 4*rbx]
	lea	rax, [rip + bottom_key]
	mov	r8d, dword ptr [rax + 4*rbx]
	sub	rsp, 8
	lea	rsi, [rip + .L.str.34]
	mov	edx, r13d
	mov	r9d, r14d
	xor	eax, eax
	push	r15
	call	fprintf@PLT
	add	rsp, 16
	mov	ebx, 8
	jmp	.LBB14_38
.LBB14_37:
	mov	rbx, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rbx]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 239
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbx]
	lea	rsi, [rip + .L.str.37]
	mov	edx, r13d
	xor	eax, eax
	call	fprintf@PLT
	mov	ebx, 1
.LBB14_38:
	mov	r14, qword ptr [rip + stderr@GOTPCREL]
	mov	rsi, qword ptr [r14]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r14]
	call	fflush@PLT
	mov	rax, rbx
	mov	rbx, qword ptr [rbp - 80]       # 8-byte Reload
	jmp	.LBB14_21
.LBB14_39:
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	lea	r14, [rax + r15]
	mov	eax, r15d
	and	eax, 2147483644
	mov	qword ptr [rbp - 104], rax      # 8-byte Spill
	lea	r10, [r15 - 1]
	mov	bl, 48
	xor	edi, edi
	mov	dl, 48
	xor	r13d, r13d
	xor	ecx, ecx
	jmp	.LBB14_41
	.p2align	4, 0x90
.LBB14_40:                              #   in Loop: Header=BB14_41 Depth=1
	add	cl, byte ptr [rbp - 49]         # 1-byte Folded Reload
	add	cl, al
	add	cl, r14b
	add	cl, r8b
	add	r13b, byte ptr [rbp - 50]       # 1-byte Folded Reload
	add	r13b, r15b
	add	r13b, r9b
	mov	rax, rdi
	xor	rax, -4
	mov	r14, r12
	movzx	eax, byte ptr [r12 + rax]
	cmp	al, dl
	setg	r11b
	cmovg	edx, eax
	add	r11b, r13b
	add	rdi, 4
	add	r10, -4
	mov	r13d, r11d
	cmp	qword ptr [rbp - 104], rdi      # 8-byte Folded Reload
	je	.LBB14_27
.LBB14_41:                              # =>This Inner Loop Header: Depth=1
	mov	r11, qword ptr [rbp - 64]       # 8-byte Reload
	mov	eax, dword ptr [r11 + rdi]
	cmp	al, bl
	setg	byte ptr [rbp - 49]             # 1-byte Folded Spill
	movzx	r8d, byte ptr [r11 + r10]
	movzx	esi, bl
	cmovg	esi, eax
	cmp	r8b, dl
	setg	byte ptr [rbp - 50]             # 1-byte Folded Spill
	movzx	edx, dl
	cmovg	edx, r8d
	movzx	r8d, byte ptr [r11 + rdi + 1]
	mov	rax, rdi
	xor	rax, -2
	movzx	r9d, byte ptr [r14 + rax]
	cmp	r8b, sil
	setg	al
	cmovg	esi, r8d
	cmp	r9b, dl
	setg	r15b
	cmovg	edx, r9d
	movzx	r8d, byte ptr [r11 + rdi + 2]
	mov	r9, rdi
	xor	r9, -3
	mov	r12, r14
	movzx	ebx, byte ptr [r14 + r9]
	cmp	r8b, sil
	setg	r14b
	cmovg	esi, r8d
	cmp	bl, dl
	setg	r9b
	cmovg	edx, ebx
	movzx	ebx, byte ptr [r11 + rdi + 3]
	cmp	bl, sil
	setg	r8b
	jg	.LBB14_40
# %bb.42:                               #   in Loop: Header=BB14_41 Depth=1
	mov	ebx, esi
	jmp	.LBB14_40
.LBB14_43:
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
	mov	ebx, edx
	mov	r14, rsi
	mov	r15, rdi
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 48], rax
	mov	r13, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.21]
	lea	r12, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	rdx, r12
	mov	r9d, 269
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.40]
	mov	edx, ebx
	xor	eax, eax
	call	fprintf@PLT
	mov	rsi, qword ptr [r13]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r13]
	call	fflush@PLT
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.21]
	mov	rdx, r12
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 270
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.43]
	mov	rdx, r15
	xor	eax, eax
	call	fprintf@PLT
	mov	rsi, qword ptr [r13]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r13]
	call	fflush@PLT
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.21]
	mov	rdx, r12
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 271
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.46]
	mov	rdx, r14
	xor	eax, eax
	call	fprintf@PLT
	mov	rsi, qword ptr [r13]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r13]
	call	fflush@PLT
	mov	dword ptr [rip + length], ebx
	cmp	ebx, 9
	jge	.LBB15_41
# %bb.1:
	test	ebx, ebx
	jle	.LBB15_42
# %bb.2:
	mov	r12d, ebx
	imul	r12d, r12d
	lea	esi, [rbx + 48]
	xor	eax, eax
	jmp	.LBB15_3
	.p2align	4, 0x90
.LBB15_4:                               #   in Loop: Header=BB15_3 Depth=1
	inc	rax
	cmp	rax, r12
	jge	.LBB15_5
.LBB15_3:                               # =>This Inner Loop Header: Depth=1
	movzx	ecx, byte ptr [r15 + rax]
	cmp	cl, 45
	je	.LBB15_4
# %bb.12:                               #   in Loop: Header=BB15_3 Depth=1
	cmp	cl, 49
	jl	.LBB15_14
# %bb.13:                               #   in Loop: Header=BB15_3 Depth=1
	cmp	sil, cl
	jge	.LBB15_4
.LBB15_14:
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 279
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.51]
	mov	edx, r12d
	mov	rcx, r15
	jmp	.LBB15_15
.LBB15_5:
	mov	edi, dword ptr [rip + remaining]
	cmp	r12d, 1
	jne	.LBB15_20
# %bb.6:
	xor	ecx, ecx
.LBB15_7:
	test	r12b, 1
	je	.LBB15_11
# %bb.8:
	movzx	r8d, byte ptr [r15 + rcx]
	cmp	r8b, 45
	jne	.LBB15_10
# %bb.9:
	inc	edi
	mov	dword ptr [rip + remaining], edi
.LBB15_10:
	mov	eax, ecx
	xor	edx, edx
	div	ebx
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	and	edx, 7
	shr	eax
	and	eax, 120
	lea	rcx, [rip + board]
	add	rcx, rax
	mov	byte ptr [rdx + rcx], r8b
.LBB15_11:
	lea	r15d, [4*rbx]
	xor	eax, eax
	.p2align	4, 0x90
.LBB15_17:                              # =>This Inner Loop Header: Depth=1
	movzx	ecx, byte ptr [r14 + rax]
	cmp	cl, 48
	jl	.LBB15_19
# %bb.18:                               #   in Loop: Header=BB15_17 Depth=1
	cmp	sil, cl
	jl	.LBB15_19
# %bb.16:                               #   in Loop: Header=BB15_17 Depth=1
	inc	rax
	cmp	rax, r15
	jl	.LBB15_17
# %bb.26:
	mov	qword ptr [rbp - 64], rsp       # 8-byte Spill
	mov	r12, rsp
	lea	rax, [4*r15 + 15]
	and	rax, -16
	sub	r12, rax
	mov	rsp, r12
	cmp	r15d, 16
	jae	.LBB15_28
# %bb.27:
	xor	eax, eax
	jmp	.LBB15_31
.LBB15_20:
	mov	r8d, r12d
	and	r8d, -4
	xor	ecx, ecx
	lea	r9, [rip + board]
	jmp	.LBB15_21
	.p2align	4, 0x90
.LBB15_25:                              #   in Loop: Header=BB15_21 Depth=1
	lea	eax, [rcx + 1]
	xor	edx, edx
	div	ebx
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	and	edx, 7
	shr	eax
	and	eax, 120
	add	rax, r9
	mov	byte ptr [rdx + rax], r10b
	add	rcx, 2
	cmp	r8, rcx
	je	.LBB15_7
.LBB15_21:                              # =>This Inner Loop Header: Depth=1
	movzx	r10d, byte ptr [r15 + rcx]
	cmp	r10b, 45
	jne	.LBB15_23
# %bb.22:                               #   in Loop: Header=BB15_21 Depth=1
	inc	edi
	mov	dword ptr [rip + remaining], edi
.LBB15_23:                              #   in Loop: Header=BB15_21 Depth=1
	mov	eax, ecx
	xor	edx, edx
	div	ebx
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	and	edx, 7
	shr	eax
	and	eax, 120
	add	rax, r9
	mov	byte ptr [rdx + rax], r10b
	movzx	r10d, byte ptr [r15 + rcx + 1]
	cmp	r10b, 45
	jne	.LBB15_25
# %bb.24:                               #   in Loop: Header=BB15_21 Depth=1
	inc	edi
	mov	dword ptr [rip + remaining], edi
	jmp	.LBB15_25
.LBB15_28:
	mov	eax, r15d
	and	eax, -16
	xor	ecx, ecx
	vpbroadcastd	ymm0, dword ptr [rip + .LCPI15_0] # ymm0 = [4294967248,4294967248,4294967248,4294967248,4294967248,4294967248,4294967248,4294967248]
	.p2align	4, 0x90
.LBB15_29:                              # =>This Inner Loop Header: Depth=1
	vpmovsxbd	ymm1, qword ptr [r14 + rcx]
	vpmovsxbd	ymm2, qword ptr [r14 + rcx + 8]
	vpaddd	ymm1, ymm1, ymm0
	vpaddd	ymm2, ymm2, ymm0
	vmovdqu	ymmword ptr [r12 + 4*rcx], ymm1
	vmovdqu	ymmword ptr [r12 + 4*rcx + 32], ymm2
	add	rcx, 16
	cmp	rax, rcx
	jne	.LBB15_29
# %bb.30:
	cmp	eax, r15d
	je	.LBB15_32
	.p2align	4, 0x90
.LBB15_31:                              # =>This Inner Loop Header: Depth=1
	movsx	ecx, byte ptr [r14 + rax]
	add	ecx, -48
	mov	dword ptr [r12 + 4*rax], ecx
	inc	rax
	cmp	r15, rax
	jne	.LBB15_31
.LBB15_32:
	mov	r15d, ebx
	lea	r13d, [rbx + rbx]
	lea	eax, [rbx + 2*rbx]
	mov	qword ptr [rbp - 56], rax       # 8-byte Spill
	lea	r14, [4*r15]
	lea	rdi, [rip + top_key]
	mov	rsi, r12
	mov	rdx, r14
	vzeroupper
	call	memcpy@PLT
	lea	rsi, [r12 + 4*r15]
	lea	rdi, [rip + bottom_key]
	mov	rdx, r14
	call	memcpy@PLT
	lea	rsi, [r12 + 4*r13]
	lea	rdi, [rip + left_key]
	mov	rdx, r14
	call	memcpy@PLT
	mov	rax, qword ptr [rbp - 56]       # 8-byte Reload
	lea	rsi, [r12 + 4*rax]
	lea	rdi, [rip + right_key]
	mov	rdx, r14
	call	memcpy@PLT
	cmp	ebx, 2
	mov	r14d, 1
	mov	r12d, 1
	cmovge	r12d, ebx
	xor	r13d, r13d
	xor	edi, edi
	call	check_row
	mov	r15, rax
	xor	edi, edi
	call	check_col
	or	rax, r15
	cmp	rax, 3
	ja	.LBB15_36
	.p2align	4, 0x90
.LBB15_33:                              # =>This Inner Loop Header: Depth=1
	cmp	r12d, r14d
	je	.LBB15_37
# %bb.34:                               #   in Loop: Header=BB15_33 Depth=1
	mov	edi, r14d
	call	check_row
	mov	r15, rax
	mov	edi, r14d
	call	check_col
	or	rax, r15
	inc	r14d
	cmp	rax, 4
	jb	.LBB15_33
# %bb.35:
	dec	r14d
	cmp	r14d, ebx
	setge	r13b
.LBB15_36:
	lea	rdi, [rip + .Lstr.101]
	call	puts@PLT
	jmp	.LBB15_38
.LBB15_37:
	cmp	r14d, ebx
	setge	r13b
.LBB15_38:
	movzx	eax, r13b
	mov	rsp, qword ptr [rbp - 64]       # 8-byte Reload
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	jne	.LBB15_40
.LBB15_43:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB15_19:
	.cfi_def_cfa rbp, 16
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 292
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.55]
	mov	edx, r15d
	mov	rcx, r14
.LBB15_15:
	xor	eax, eax
	call	fprintf@PLT
	mov	rsi, qword ptr [r13]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r13]
	call	fflush@PLT
	lea	rdi, [rip + .Lstr.101]
	call	puts@PLT
	xor	eax, eax
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	je	.LBB15_43
.LBB15_40:
	call	__stack_chk_fail@PLT
.LBB15_41:
	lea	rdi, [rip + .L.str.47]
	lea	rsi, [rip + .L.str.1]
	lea	rcx, [rip + .L__PRETTY_FUNCTION__.initialize_board]
	mov	edx, 274
	call	__assert_fail@PLT
.LBB15_42:
	lea	rdi, [rip + .L.str.48]
	lea	rsi, [rip + .L.str.1]
	lea	rcx, [rip + .L__PRETTY_FUNCTION__.initialize_board]
	mov	edx, 275
	call	__assert_fail@PLT
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
	lea	rdi, [rip + .L.str.56]
	lea	rsi, [rip + .L.str.1]
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
	lea	r12, [rip + con]
	mov	r15d, 1
	xor	ebp, ebp
	jmp	.LBB21_2
.LBB21_11:                              #   in Loop: Header=BB21_2 Depth=1
	mov	edi, ebx
	xor	esi, esi
	call	sequence_filtration
.LBB21_12:                              #   in Loop: Header=BB21_2 Depth=1
	call	place_singles
	.p2align	4, 0x90
.LBB21_13:                              #   in Loop: Header=BB21_2 Depth=1
	inc	ebp
	mov	ecx, dword ptr [rip + length]
	mov	eax, ecx
	imul	eax, ecx
	cmp	ebp, eax
	jae	.LBB21_14
.LBB21_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB21_8 Depth 2
	mov	eax, ebp
	cdq
	idiv	ecx
	mov	ebx, edx
	mov	r14d, eax
	shl	r14d, 4
	or	r14d, edx
	shr	r14d, 4
	and	r14d, 15
	and	ebx, 7
	mov	edi, r14d
	mov	esi, ebx
	call	apply_process_of_elimination
	lea	rax, [r12 + 8*r14]
	movzx	eax, byte ptr [rbx + rax]
	lea	ecx, [rax - 1]
	mov	edx, eax
	xor	dl, cl
	cmp	dl, cl
	jbe	.LBB21_13
# %bb.3:                                #   in Loop: Header=BB21_2 Depth=1
	movzx	ecx, byte ptr [r14 + r12 + 64]
	bt	ecx, ebx
	jb	.LBB21_13
# %bb.4:                                #   in Loop: Header=BB21_2 Depth=1
	shlx	r13d, r15d, ebx
	movzx	ecx, al
	tzcnt	ecx, ecx
	add	cl, 49
	test	al, al
	movzx	r15d, cl
	mov	eax, 48
	cmove	r15d, eax
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 358
	xor	eax, eax
	call	fprintf@PLT
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	movzx	r15d, r15b
	lea	rsi, [rip + .L.str.59]
	mov	edx, r15d
	mov	ecx, r14d
	mov	r8d, ebx
	xor	eax, eax
	call	fprintf@PLT
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rsi, qword ptr [rax]
	mov	edi, 10
	call	fputc@PLT
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	call	fflush@PLT
	lea	rax, [rip + board]
	lea	rax, [rax + 8*r14]
	mov	byte ptr [rbx + rax], r15b
	or	byte ptr [r14 + r12 + 64], r13b
	mov	edi, r14d
	mov	esi, ebx
	mov	edx, r15d
	call	apply_constraint_propagation
	mov	eax, dword ptr [rip + length]
	mov	ecx, -1
	shlx	ecx, ecx, eax
	xor	cl, byte ptr [r14 + r12 + 64]
	cmp	cl, -1
	je	.LBB21_6
# %bb.5:                                #   in Loop: Header=BB21_2 Depth=1
	mov	edi, r14d
	mov	esi, 1
	call	sequence_filtration
	mov	eax, dword ptr [rip + length]
.LBB21_6:                               #   in Loop: Header=BB21_2 Depth=1
	test	eax, eax
	mov	r15d, 1
	jle	.LBB21_12
# %bb.7:                                #   in Loop: Header=BB21_2 Depth=1
	mov	eax, eax
	mov	dl, 1
	xor	ecx, ecx
	jmp	.LBB21_8
	.p2align	4, 0x90
.LBB21_16:                              #   in Loop: Header=BB21_8 Depth=2
	inc	rcx
	xor	edx, edx
	cmp	rcx, rax
	je	.LBB21_11
.LBB21_8:                               #   Parent Loop BB21_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	test	dl, 1
	je	.LBB21_16
# %bb.9:                                #   in Loop: Header=BB21_8 Depth=2
	movzx	esi, byte ptr [rcx + r12 + 64]
	test	r13d, esi
	setne	dl
	inc	rcx
	cmp	rcx, rax
	jne	.LBB21_8
# %bb.10:                               #   in Loop: Header=BB21_2 Depth=1
	test	r13d, esi
	jne	.LBB21_12
	jmp	.LBB21_11
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
	sub	rsp, 40
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 48], rax
	mov	eax, dword ptr [rip + length]
	mov	rcx, rsp
	lea	rdx, [rax + 15]
	and	rdx, -16
	sub	rcx, rdx
	mov	rsp, rcx
	test	eax, eax
	jle	.LBB22_40
# %bb.1:
	movsxd	r12, esi
	cmp	eax, 17
	jae	.LBB22_3
# %bb.2:
	xor	edx, edx
	jmp	.LBB22_10
.LBB22_3:
	cmp	eax, 33
	jae	.LBB22_7
# %bb.4:
	xor	edx, edx
	jmp	.LBB22_5
.LBB22_7:
	mov	edx, eax
	and	edx, 31
	mov	esi, 32
	cmovne	rsi, rdx
	mov	rdx, rax
	sub	rdx, rsi
	xor	r8d, r8d
	lea	r9, [rip + con]
	vpbroadcastw	xmm0, word ptr [rip + .LCPI22_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI22_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI22_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI22_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpmovsxbd	ymm4, qword ptr [rip + .LCPI22_8] # ymm4 = [0,2,2,3,0,2,4,6]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI22_9] # ymm5 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI22_9] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	.p2align	4, 0x90
.LBB22_8:                               # =>This Inner Loop Header: Depth=1
	lea	r10, [r12 + 8*r8]
	vmovdqu	xmm7, xmmword ptr [r9 + r10 + 112]
	vpshufb	xmm7, xmm7, xmm0
	vmovdqu	xmm8, xmmword ptr [r9 + r10 + 96]
	vpshufb	xmm8, xmm8, xmm0
	vpunpcklwd	xmm7, xmm8, xmm7        # xmm7 = xmm8[0],xmm7[0],xmm8[1],xmm7[1],xmm8[2],xmm7[2],xmm8[3],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r9 + r10 + 80]
	vpshufb	xmm8, xmm8, xmm1
	vmovdqu	xmm9, xmmword ptr [r9 + r10 + 64]
	vpshufb	xmm9, xmm9, xmm1
	vpunpcklwd	xmm8, xmm9, xmm8        # xmm8 = xmm9[0],xmm8[0],xmm9[1],xmm8[1],xmm9[2],xmm8[2],xmm9[3],xmm8[3]
	vpblendd	xmm7, xmm8, xmm7, 8             # xmm7 = xmm8[0,1,2],xmm7[3]
	vmovdqu	xmm8, xmmword ptr [r9 + r10]
	vmovdqu	xmm9, xmmword ptr [r9 + r10 + 16]
	vmovdqu	xmm10, xmmword ptr [r9 + r10 + 32]
	vmovdqu	xmm11, xmmword ptr [r9 + r10 + 48]
	vpshufb	xmm11, xmm11, xmm2
	vpshufb	xmm10, xmm10, xmm2
	vpunpcklwd	xmm10, xmm10, xmm11     # xmm10 = xmm10[0],xmm11[0],xmm10[1],xmm11[1],xmm10[2],xmm11[2],xmm10[3],xmm11[3]
	vpshufb	xmm9, xmm9, xmm3
	vpshufb	xmm8, xmm8, xmm3
	vpunpcklwd	xmm8, xmm8, xmm9        # xmm8 = xmm8[0],xmm9[0],xmm8[1],xmm9[1],xmm8[2],xmm9[2],xmm8[3],xmm9[3]
	vpblendd	xmm8, xmm8, xmm10, 2            # xmm8 = xmm8[0],xmm10[1],xmm8[2,3]
	vpblendd	xmm7, xmm8, xmm7, 12            # xmm7 = xmm8[0,1],xmm7[2,3]
	vxorps	xmm8, xmm8, xmm8
	vpermd	ymm8, ymm4, ymmword ptr [r9 + r10 + 224]
	vpshufb	ymm8, ymm8, ymm5
	vxorps	xmm9, xmm9, xmm9
	vpermd	ymm9, ymm4, ymmword ptr [r9 + r10 + 192]
	vpshufb	ymm9, ymm9, ymm5
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r9 + r10 + 160]
	vpblendd	ymm8, ymm9, ymm8, 128           # ymm8 = ymm9[0,1,2,3,4,5,6],ymm8[7]
	vpshufb	ymm9, ymm10, ymm6
	vxorps	xmm10, xmm10, xmm10
	vpermd	ymm10, ymm4, ymmword ptr [r9 + r10 + 128]
	vpshufb	ymm10, ymm10, ymm6
	vpblendd	ymm9, ymm10, ymm9, 32           # ymm9 = ymm10[0,1,2,3,4],ymm9[5],ymm10[6,7]
	vpblendd	ymm8, ymm9, ymm8, 192           # ymm8 = ymm9[0,1,2,3,4,5],ymm8[6,7]
	vpblendd	ymm7, ymm8, ymm7, 15            # ymm7 = ymm7[0,1,2,3],ymm8[4,5,6,7]
	vmovdqu	ymmword ptr [rcx + r8], ymm7
	add	r8, 32
	cmp	rdx, r8
	jne	.LBB22_8
# %bb.9:
	cmp	esi, 16
	jbe	.LBB22_10
.LBB22_5:
	mov	r10, rdx
	mov	edx, eax
	and	edx, 15
	mov	esi, 16
	cmovne	rsi, rdx
	mov	rdx, rax
	sub	rdx, rsi
	lea	r8, [r12 + 8*r10]
	lea	rsi, [rip + con]
	add	rsi, r8
	lea	r8, [rcx + r10]
	mov	r9, rdx
	sub	r9, r10
	xor	r10d, r10d
	vpbroadcastw	xmm0, word ptr [rip + .LCPI22_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI22_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI22_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI22_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB22_6:                               # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm4, xmmword ptr [rsi + 8*r10 + 112]
	vpshufb	xmm4, xmm4, xmm0
	vmovdqu	xmm5, xmmword ptr [rsi + 8*r10 + 96]
	vpshufb	xmm5, xmm5, xmm0
	vpunpcklwd	xmm4, xmm5, xmm4        # xmm4 = xmm5[0],xmm4[0],xmm5[1],xmm4[1],xmm5[2],xmm4[2],xmm5[3],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rsi + 8*r10 + 80]
	vpshufb	xmm5, xmm5, xmm1
	vmovdqu	xmm6, xmmword ptr [rsi + 8*r10 + 64]
	vpshufb	xmm6, xmm6, xmm1
	vpunpcklwd	xmm5, xmm6, xmm5        # xmm5 = xmm6[0],xmm5[0],xmm6[1],xmm5[1],xmm6[2],xmm5[2],xmm6[3],xmm5[3]
	vpblendd	xmm4, xmm5, xmm4, 8             # xmm4 = xmm5[0,1,2],xmm4[3]
	vmovdqu	xmm5, xmmword ptr [rsi + 8*r10]
	vmovdqu	xmm6, xmmword ptr [rsi + 8*r10 + 16]
	vmovdqu	xmm7, xmmword ptr [rsi + 8*r10 + 32]
	vmovdqu	xmm8, xmmword ptr [rsi + 8*r10 + 48]
	vpshufb	xmm8, xmm8, xmm2
	vpshufb	xmm7, xmm7, xmm2
	vpunpcklwd	xmm7, xmm7, xmm8        # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1],xmm7[2],xmm8[2],xmm7[3],xmm8[3]
	vpshufb	xmm6, xmm6, xmm3
	vpshufb	xmm5, xmm5, xmm3
	vpunpcklwd	xmm5, xmm5, xmm6        # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1],xmm5[2],xmm6[2],xmm5[3],xmm6[3]
	vpblendd	xmm5, xmm5, xmm7, 2             # xmm5 = xmm5[0],xmm7[1],xmm5[2,3]
	vpblendd	xmm4, xmm5, xmm4, 12            # xmm4 = xmm5[0,1],xmm4[2,3]
	vmovdqu	xmmword ptr [r8 + r10], xmm4
	add	r10, 16
	cmp	r9, r10
	jne	.LBB22_6
.LBB22_10:
	lea	rsi, [rcx + rdx]
	lea	r8, [r12 + 8*rdx]
	lea	r13, [rip + con]
	add	r8, r13
	mov	r9, rax
	sub	r9, rdx
	xor	edx, edx
	.p2align	4, 0x90
.LBB22_11:                              # =>This Inner Loop Header: Depth=1
	movzx	r10d, byte ptr [r8 + 8*rdx]
	mov	byte ptr [rsi + rdx], r10b
	inc	rdx
	cmp	r9, rdx
	jne	.LBB22_11
# %bb.12:
	test	eax, eax
	jle	.LBB22_13
# %bb.14:
	mov	qword ptr [rbp - 72], r12       # 8-byte Spill
	movsxd	r14, edi
	mov	esi, eax
	and	esi, 7
	cmp	eax, 8
	jae	.LBB22_16
# %bb.15:
	xor	edi, edi
	xor	r12d, r12d
	xor	edx, edx
	jmp	.LBB22_18
.LBB22_13:
	xor	r15d, r15d
	xor	ebx, ebx
	movsxd	rax, dword ptr [rip + length]
	test	rax, rax
	jg	.LBB22_36
	jmp	.LBB22_40
.LBB22_16:
	mov	r8d, eax
	and	r8d, 2147483640
	lea	r9, [8*r14 + 7]
	add	r9, r13
	xor	edi, edi
	xor	r10d, r10d
	xor	edx, edx
	.p2align	4, 0x90
.LBB22_17:                              # =>This Inner Loop Header: Depth=1
	movzx	r12d, byte ptr [r9 + rdi - 7]
	movzx	r11d, byte ptr [r9 + rdi - 6]
	mov	ebx, r12d
	and	bl, r10b
	or	bl, dl
	or	r12b, r10b
	mov	edx, r11d
	and	dl, r12b
	or	dl, bl
	or	r12b, r11b
	movzx	r10d, byte ptr [r9 + rdi - 5]
	mov	r11d, r10d
	and	r11b, r12b
	or	r11b, dl
	or	r12b, r10b
	movzx	edx, byte ptr [r9 + rdi - 4]
	mov	r10d, edx
	and	r10b, r12b
	or	r10b, r11b
	or	r12b, dl
	movzx	edx, byte ptr [r9 + rdi - 3]
	mov	r11d, edx
	and	r11b, r12b
	or	r11b, r10b
	or	r12b, dl
	movzx	edx, byte ptr [r9 + rdi - 2]
	mov	r10d, edx
	and	r10b, r12b
	or	r10b, r11b
	or	r12b, dl
	movzx	edx, byte ptr [r9 + rdi - 1]
	mov	r11d, edx
	and	r11b, r12b
	or	r11b, r10b
	movzx	r10d, byte ptr [r9 + rdi]
	or	r12b, dl
	mov	edx, r10d
	and	dl, r12b
	or	dl, r11b
	or	r12b, r10b
	add	rdi, 8
	mov	r10d, r12d
	cmp	r8, rdi
	jne	.LBB22_17
.LBB22_18:
	test	rsi, rsi
	je	.LBB22_21
# %bb.19:
	lea	rdi, [rdi + 8*r14]
	add	rdi, r13
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB22_20:                              # =>This Inner Loop Header: Depth=1
	movzx	r9d, byte ptr [rdi + r8]
	mov	r10d, r9d
	and	r10b, r12b
	or	dl, r10b
	or	r12b, r9b
	inc	r8
	cmp	rsi, r8
	jne	.LBB22_20
.LBB22_21:
	mov	esi, eax
	and	esi, 7
	cmp	eax, 8
	jae	.LBB22_23
# %bb.22:
	xor	r8d, r8d
	xor	edi, edi
	xor	ebx, ebx
	jmp	.LBB22_25
.LBB22_23:
	mov	r9d, eax
	and	r9d, 2147483640
	xor	r8d, r8d
	xor	r10d, r10d
	xor	ebx, ebx
	.p2align	4, 0x90
.LBB22_24:                              # =>This Inner Loop Header: Depth=1
	movzx	edi, byte ptr [rcx + r8]
	movzx	r11d, byte ptr [rcx + r8 + 1]
	mov	r15d, edi
	and	r15b, r10b
	or	r15b, bl
	or	dil, r10b
	mov	r10d, r11d
	and	r10b, dil
	or	r10b, r15b
	or	dil, r11b
	movzx	r11d, byte ptr [rcx + r8 + 2]
	mov	ebx, r11d
	and	bl, dil
	or	bl, r10b
	or	dil, r11b
	movzx	r10d, byte ptr [rcx + r8 + 3]
	mov	r11d, r10d
	and	r11b, dil
	or	r11b, bl
	or	dil, r10b
	movzx	r10d, byte ptr [rcx + r8 + 4]
	mov	ebx, r10d
	and	bl, dil
	or	bl, r11b
	or	dil, r10b
	movzx	r10d, byte ptr [rcx + r8 + 5]
	mov	r11d, r10d
	and	r11b, dil
	or	r11b, bl
	or	dil, r10b
	movzx	r10d, byte ptr [rcx + r8 + 6]
	mov	r15d, r10d
	and	r15b, dil
	or	r15b, r11b
	movzx	r11d, byte ptr [rcx + r8 + 7]
	or	dil, r10b
	mov	ebx, r11d
	and	bl, dil
	or	bl, r15b
	or	dil, r11b
	add	r8, 8
	mov	r10d, edi
	cmp	r9, r8
	jne	.LBB22_24
.LBB22_25:
	not	dl
	test	rsi, rsi
	je	.LBB22_28
# %bb.26:
	add	rcx, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB22_27:                              # =>This Inner Loop Header: Depth=1
	movzx	r9d, byte ptr [rcx + r8]
	mov	r10d, r9d
	and	r10b, dil
	or	bl, r10b
	or	dil, r9b
	inc	r8
	cmp	rsi, r8
	jne	.LBB22_27
.LBB22_28:
	test	eax, eax
	setle	cl
	and	r12b, dl
	not	bl
	and	bl, dil
	cmp	r12b, -1
	sete	dl
	or	dl, cl
	jne	.LBB22_33
# %bb.29:
	movzx	r8d, r12b
	lea	rcx, [8*r14]
	xor	r15d, r15d
	.p2align	4, 0x90
.LBB22_30:                              # =>This Inner Loop Header: Depth=1
	lea	rdx, [rcx + r15]
	movzx	edx, byte ptr [r13 + rdx]
	mov	esi, edx
	and	sil, r12b
	lea	edi, [rsi - 1]
	xor	sil, dil
	cmp	sil, dil
	setbe	sil
	lea	edi, [rdx - 1]
	xor	dl, dil
	cmp	dl, dil
	seta	dl
	or	dl, sil
	je	.LBB22_31
# %bb.32:                               #   in Loop: Header=BB22_30 Depth=1
	inc	r15
	cmp	rax, r15
	jne	.LBB22_30
.LBB22_33:
	cmp	bl, -1
	mov	r12, qword ptr [rbp - 72]       # 8-byte Reload
	je	.LBB22_40
.LBB22_34:
	movzx	r15d, bl
	movsxd	rax, dword ptr [rip + length]
	test	rax, rax
	jle	.LBB22_40
.LBB22_36:
	xor	r14d, r14d
	.p2align	4, 0x90
.LBB22_37:                              # =>This Inner Loop Header: Depth=1
	lea	rcx, [r12 + 8*r14]
	movzx	ecx, byte ptr [r13 + rcx]
	mov	edx, ecx
	and	dl, bl
	lea	esi, [rdx - 1]
	xor	dl, sil
	cmp	dl, sil
	setbe	dl
	lea	esi, [rcx - 1]
	xor	cl, sil
	cmp	cl, sil
	seta	cl
	or	cl, dl
	je	.LBB22_38
# %bb.39:                               #   in Loop: Header=BB22_37 Depth=1
	inc	r14
	cmp	rax, r14
	jne	.LBB22_37
.LBB22_40:
	mov	rax, qword ptr fs:[40]
	cmp	rax, qword ptr [rbp - 48]
	jne	.LBB22_42
# %bb.41:
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
.LBB22_38:
	.cfi_def_cfa rbp, 16
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 491
	xor	eax, eax
	vzeroupper
	call	fprintf@PLT
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	add	r13, r12
	movzx	r9d, byte ptr [r13 + 8*r14]
	lea	rsi, [rip + .L.str.75]
	mov	edx, r14d
	mov	ecx, r12d
	mov	r8d, r15d
	xor	eax, eax
	call	fprintf@PLT
	mov	r15, qword ptr [rip + stderr@GOTPCREL]
	mov	rsi, qword ptr [r15]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r15]
	call	fflush@PLT
	and	byte ptr [r13 + 8*r14], bl
	jmp	.LBB22_40
.LBB22_31:
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	mov	dword ptr [rbp - 52], r8d       # 4-byte Spill
	lea	r8, [rip + .L.str.1]
	mov	r9d, 481
	xor	eax, eax
	vzeroupper
	call	fprintf@PLT
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	lea	rax, [8*r14]
	add	rax, r13
	mov	qword ptr [rbp - 64], rax       # 8-byte Spill
	movzx	r9d, byte ptr [r15 + rax]
	lea	rsi, [rip + .L.str.72]
	mov	edx, r14d
	mov	ecx, r15d
	mov	r8d, dword ptr [rbp - 52]       # 4-byte Reload
	xor	eax, eax
	call	fprintf@PLT
	mov	r14, qword ptr [rip + stderr@GOTPCREL]
	mov	rsi, qword ptr [r14]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r14]
	call	fflush@PLT
	mov	rax, qword ptr [rbp - 64]       # 8-byte Reload
	and	byte ptr [r15 + rax], r12b
	cmp	bl, -1
	mov	r12, qword ptr [rbp - 72]       # 8-byte Reload
	jne	.LBB22_34
	jmp	.LBB22_40
.LBB22_42:
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
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
                                        # kill: def $edx killed $edx def $rdx
	lea	eax, [rdx - 49]
	mov	ecx, 1
	shlx	eax, ecx, eax
	movsxd	r11, dword ptr [rip + length]
	mov	dword ptr [rsp + 12], edi       # 4-byte Spill
	movsxd	rdi, edi
	mov	dword ptr [rsp + 8], esi        # 4-byte Spill
	movsxd	rcx, esi
	test	r11, r11
	jle	.LBB23_1
# %bb.4:
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	dword ptr [rsp + 4], eax        # 4-byte Spill
	mov	r8d, eax
	not	r8b
	cmp	r11d, 1
	jne	.LBB23_13
# %bb.5:
	mov	rdx, rdi
	xor	r10d, r10d
	xor	r9d, r9d
.LBB23_6:
	test	r11b, 1
	je	.LBB23_12
# %bb.7:
	lea	r14, [rip + con]
	lea	r11, [r14 + 8*rdx]
	movzx	r15d, byte ptr [r10 + r11]
	lea	ebp, [r15 - 1]
	mov	r12d, r15d
	xor	r12b, bpl
	cmp	r12b, bpl
	seta	r12b
	lea	r14, [r14 + 8*r10]
	movzx	ebp, byte ptr [rcx + r14]
	and	r15b, r8b
	mov	byte ptr [r10 + r11], r15b
	and	r8b, byte ptr [rcx + r14]
	mov	byte ptr [rcx + r14], r8b
	movzx	r10d, byte ptr [r10 + r11]
	lea	r14d, [r10 - 1]
	xor	r10b, r14b
	cmp	r10b, r14b
	setbe	r10b
	or	r10b, r12b
	cmp	r10b, 1
	jne	.LBB23_10
# %bb.8:
	lea	r10d, [r8 - 1]
	xor	r8b, r10b
	cmp	r8b, r10b
	jbe	.LBB23_12
# %bb.9:
	movzx	r8d, bpl
	popcnt	r8d, r8d
	cmp	r8b, 1
	jne	.LBB23_10
.LBB23_12:
	lea	r8, [rip + con]
	lea	rdx, [r8 + 8*rdx]
	mov	eax, dword ptr [rsp + 4]        # 4-byte Reload
	mov	byte ptr [rcx + rdx], al
	test	r9b, 1
	je	.LBB23_2
	jmp	.LBB23_11
.LBB23_1:
	lea	rsi, [rip + con]
	lea	rdx, [rsi + 8*rdi]
	mov	byte ptr [rcx + rdx], al
.LBB23_2:
	xor	eax, eax
.LBB23_3:
                                        # kill: def $al killed $al killed $eax
	add	rsp, 24
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
.LBB23_13:
	.cfi_def_cfa_offset 80
	mov	r14d, r11d
	and	r14d, 2147483646
	lea	r9, [rip + con]
	mov	rdx, rdi
	lea	r15, [r9 + 8*rdi]
	inc	r15
	lea	r12, [rcx + r9]
	add	r12, 8
	xor	r10d, r10d
	xor	r9d, r9d
	jmp	.LBB23_14
	.p2align	4, 0x90
.LBB23_21:                              #   in Loop: Header=BB23_14 Depth=1
	mov	r9b, 1
.LBB23_22:                              #   in Loop: Header=BB23_14 Depth=1
	add	r10, 2
	cmp	r14, r10
	je	.LBB23_6
.LBB23_14:                              # =>This Inner Loop Header: Depth=1
	movzx	r13d, byte ptr [r15 + r10 - 1]
	lea	ebp, [r13 - 1]
	mov	ebx, r13d
	xor	bl, bpl
	cmp	bl, bpl
	seta	bl
	movzx	ebp, byte ptr [r12 + 8*r10 - 8]
	and	r13b, r8b
	mov	byte ptr [r15 + r10 - 1], r13b
	movzx	r13d, byte ptr [r12 + 8*r10 - 8]
	and	r13b, r8b
	mov	byte ptr [r12 + 8*r10 - 8], r13b
	movzx	eax, byte ptr [r15 + r10 - 1]
	lea	esi, [rax - 1]
	xor	al, sil
	cmp	al, sil
	setbe	al
	or	al, bl
	cmp	al, 1
	jne	.LBB23_17
# %bb.15:                               #   in Loop: Header=BB23_14 Depth=1
	lea	eax, [r13 - 1]
	xor	r13b, al
	cmp	r13b, al
	jbe	.LBB23_18
# %bb.16:                               #   in Loop: Header=BB23_14 Depth=1
	movzx	eax, bpl
	popcnt	eax, eax
	cmp	al, 1
	je	.LBB23_18
.LBB23_17:                              #   in Loop: Header=BB23_14 Depth=1
	mov	r9b, 1
.LBB23_18:                              #   in Loop: Header=BB23_14 Depth=1
	movzx	eax, byte ptr [r15 + r10]
	lea	esi, [rax - 1]
	mov	edi, eax
	xor	dil, sil
	cmp	dil, sil
	seta	sil
	movzx	ebp, byte ptr [r12 + 8*r10]
	and	al, r8b
	mov	byte ptr [r15 + r10], al
	movzx	r13d, byte ptr [r12 + 8*r10]
	and	r13b, r8b
	mov	byte ptr [r12 + 8*r10], r13b
	movzx	eax, byte ptr [r15 + r10]
	lea	edi, [rax - 1]
	xor	al, dil
	cmp	al, dil
	setbe	al
	or	al, sil
	cmp	al, 1
	jne	.LBB23_21
# %bb.19:                               #   in Loop: Header=BB23_14 Depth=1
	lea	eax, [r13 - 1]
	xor	r13b, al
	cmp	r13b, al
	jbe	.LBB23_22
# %bb.20:                               #   in Loop: Header=BB23_14 Depth=1
	movzx	eax, bpl
	popcnt	eax, eax
	cmp	al, 1
	jne	.LBB23_21
	jmp	.LBB23_22
.LBB23_10:
	mov	eax, dword ptr [rsp + 4]        # 4-byte Reload
	mov	byte ptr [rcx + r11], al
.LBB23_11:
	mov	r15, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [r15]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 464
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r15]
	lea	rsi, [rip + .L.str.69]
	mov	rdx, qword ptr [rsp + 16]       # 8-byte Reload
                                        # kill: def $edx killed $edx killed $rdx
	mov	ecx, dword ptr [rsp + 12]       # 4-byte Reload
	mov	r8d, dword ptr [rsp + 8]        # 4-byte Reload
	xor	eax, eax
	call	fprintf@PLT
	mov	rsi, qword ptr [r15]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r15]
	call	fflush@PLT
	mov	al, 1
	jmp	.LBB23_3
.Lfunc_end23:
	.size	apply_constraint_propagation, .Lfunc_end23-apply_constraint_propagation
	.cfi_endproc
                                        # -- End function
	.globl	row_filled                      # -- Begin function row_filled
	.p2align	4, 0x90
	.type	row_filled,@function
row_filled:                             # @row_filled
	.cfi_startproc
# %bb.0:
	movsxd	rax, edi
	lea	rcx, [rip + con]
	movzx	edx, byte ptr [rip + length]
	mov	esi, -1
	shlx	edx, esi, edx
	xor	dl, byte ptr [rax + rcx + 64]
	cmp	dl, -1
	sete	al
	ret
.Lfunc_end24:
	.size	row_filled, .Lfunc_end24-row_filled
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function sequence_filtration
.LCPI25_0:
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
.LCPI25_1:
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
.LCPI25_2:
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
.LCPI25_3:
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
.LCPI25_15:
	.zero	16,1
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI25_4:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	4                               # 0x4
	.long	6                               # 0x6
.LCPI25_5:
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
.LCPI25_6:
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
.LCPI25_10:
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
.LCPI25_11:
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
.LCPI25_12:
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
.LCPI25_13:
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
.LCPI25_14:
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
.LCPI25_7:
	.long	4294967247                      # 0xffffffcf
.LCPI25_8:
	.long	1                               # 0x1
.LCPI25_9:
	.byte	255                             # 0xff
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
.LCPI25_18:
	.byte	0                               # 0x0
	.byte	4                               # 0x4
	.byte	8                               # 0x8
	.byte	12                              # 0xc
	.section	.rodata,"a",@progbits
	.p2align	1, 0x0
.LCPI25_16:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.section	.rodata.cst8,"aM",@progbits,8
.LCPI25_17:
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
	mov	dword ptr [rbp - 96], esi       # 4-byte Spill
	mov	rax, qword ptr fs:[40]
	mov	qword ptr [rbp - 48], rax
	test	esi, esi
	mov	dword ptr [rbp - 128], edi      # 4-byte Spill
	je	.LBB25_2
# %bb.1:
	movsxd	rax, edi
	lea	rcx, [rip + con]
	lea	rsi, [rcx + 8*rax]
	mov	ebx, dword ptr [rip + length]
	movsxd	rdx, ebx
	lea	rdi, [rbp - 56]
	call	memcpy@PLT
	jmp	.LBB25_14
.LBB25_2:
	movsxd	rax, dword ptr [rip + length]
	mov	ebx, eax
	test	rax, rax
	jle	.LBB25_14
# %bb.3:
	movsxd	rcx, edi
	cmp	ebx, 17
	jae	.LBB25_5
# %bb.4:
	xor	edx, edx
	jmp	.LBB25_12
.LBB25_5:
	cmp	ebx, 33
	jae	.LBB25_7
# %bb.6:
	xor	edx, edx
	jmp	.LBB25_10
.LBB25_7:
	mov	edx, eax
	and	edx, 31
	mov	esi, 32
	cmovne	rsi, rdx
	mov	rdx, rax
	sub	rdx, rsi
	xor	r10d, r10d
	lea	r8, [rip + con]
	vpbroadcastw	xmm0, word ptr [rip + .LCPI25_16] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI25_16] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI25_16] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI25_16] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpmovsxbd	ymm4, qword ptr [rip + .LCPI25_17] # ymm4 = [0,2,2,3,0,2,4,6]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI25_18] # ymm5 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI25_18] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	.p2align	4, 0x90
.LBB25_8:                               # =>This Inner Loop Header: Depth=1
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
	jne	.LBB25_8
# %bb.9:
	cmp	esi, 16
	jbe	.LBB25_12
.LBB25_10:
	mov	r9, rdx
	mov	edx, eax
	and	edx, 15
	mov	esi, 16
	cmovne	rsi, rdx
	mov	rdx, rax
	sub	rdx, rsi
	lea	r8, [rcx + 8*r9]
	lea	rsi, [rip + con]
	add	rsi, r8
	lea	r10, [r9 + rbp]
	add	r10, -56
	mov	r8, rdx
	sub	r8, r9
	xor	r9d, r9d
	vpbroadcastw	xmm0, word ptr [rip + .LCPI25_16] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI25_16] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI25_16] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI25_16] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB25_11:                              # =>This Inner Loop Header: Depth=1
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
	vmovdqu	xmmword ptr [r10 + r9], xmm4
	add	r9, 16
	cmp	r8, r9
	jne	.LBB25_11
.LBB25_12:
	sub	rax, rdx
	lea	rsi, [rdx + rbp]
	add	rsi, -56
	lea	rdx, [rcx + 8*rdx]
	lea	rcx, [rip + con]
	add	rcx, rdx
	xor	edx, edx
	.p2align	4, 0x90
.LBB25_13:                              # =>This Inner Loop Header: Depth=1
	movzx	r8d, byte ptr [rcx + 8*rdx]
	mov	byte ptr [rsi + rdx], r8b
	inc	rdx
	cmp	rax, rdx
	jne	.LBB25_13
.LBB25_14:
	movsxd	rdx, ebx
	xor	r12d, r12d
	mov	rax, qword ptr [rip + all_sequences]
	mov	r13d, 1
	lea	r14, [rip + .Lconstinit.96]
	xor	r15d, r15d
	jmp	.LBB25_17
	.p2align	4, 0x90
.LBB25_15:                              #   in Loop: Header=BB25_17 Depth=1
	movsxd	r15, r15d
	lea	rdi, [8*r15]
	add	rdi, qword ptr [rip + valid_sequences]
	lea	rsi, [rax + 8*r12]
	vzeroupper
	call	memcpy@PLT
	inc	r15d
	mov	ebx, dword ptr [rip + length]
	mov	rax, qword ptr [rip + all_sequences]
.LBB25_16:                              #   in Loop: Header=BB25_17 Depth=1
	inc	r12
	movsxd	rdx, ebx
	mov	ecx, dword ptr [r14 + 4*rdx]
	cmp	r12, rcx
	jae	.LBB25_23
.LBB25_17:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB25_20 Depth 2
	test	ebx, ebx
	jle	.LBB25_15
# %bb.18:                               #   in Loop: Header=BB25_17 Depth=1
	mov	ecx, ebx
	mov	r8b, 1
	lea	rsi, [rax + 8*r12]
	xor	edi, edi
	jmp	.LBB25_20
	.p2align	4, 0x90
.LBB25_19:                              #   in Loop: Header=BB25_20 Depth=2
	inc	rdi
	xor	r8d, r8d
	cmp	rdi, rcx
	je	.LBB25_16
.LBB25_20:                              #   Parent Loop BB25_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	test	r8b, 1
	je	.LBB25_19
# %bb.21:                               #   in Loop: Header=BB25_20 Depth=2
	movzx	r8d, byte ptr [rdi + rsi]
	add	r8b, -49
	shlx	r9d, r13d, r8d
	and	r9b, byte ptr [rbp + rdi - 56]
	setne	r8b
	inc	rdi
	cmp	rdi, rcx
	jne	.LBB25_20
# %bb.22:                               #   in Loop: Header=BB25_17 Depth=1
	test	r9b, r9b
	jne	.LBB25_15
	jmp	.LBB25_16
.LBB25_23:
	movsxd	r13, r15d
	mov	r14d, dword ptr [rbp - 96]      # 4-byte Reload
	movzx	edx, r14b
	mov	rdi, r13
	mov	r15d, dword ptr [rbp - 128]     # 4-byte Reload
	mov	esi, r15d
	vzeroupper
	call	generate_filtered_sequences
	mov	r12, rax
	lea	rax, [rip + .L.str.86]
	lea	rbx, [rip + .L.str.87]
	cmp	r12, r13
	jne	.LBB25_25
# %bb.24:
	test	r14b, r14b
	cmovne	rbx, rax
	jmp	.LBB25_26
.LBB25_25:
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 631
	xor	eax, eax
	call	fprintf@PLT
	mov	rax, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	test	r14b, r14b
	lea	rax, [rip + .L.str.86]
	cmovne	rbx, rax
	lea	rsi, [rip + .L.str.85]
	mov	rdx, r13
	mov	rcx, rbx
	mov	r8d, r15d
	xor	eax, eax
	call	fprintf@PLT
	mov	r14, qword ptr [rip + stderr@GOTPCREL]
	mov	rsi, qword ptr [r14]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r14]
	call	fflush@PLT
.LBB25_26:
	mov	r14, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [r14]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 635
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r14]
	lea	rsi, [rip + .L.str.90]
	mov	rdx, r12
	mov	rcx, rbx
	mov	r8d, r15d
	xor	eax, eax
	call	fprintf@PLT
	mov	rsi, qword ptr [r14]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r14]
	call	fflush@PLT
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
	mov	r10d, dword ptr [rbp - 96]      # 4-byte Reload
	je	.LBB25_39
# %bb.27:
	test	r13d, r13d
	jle	.LBB25_39
# %bb.28:
	mov	rax, qword ptr [rip + filtered_sequences]
	mov	ecx, r13d
	and	ecx, 2147483616
	mov	edx, r13d
	and	edx, 2147483632
	xor	esi, esi
	mov	edi, 1
	vpbroadcastd	ymm0, dword ptr [rip + .LCPI25_7] # ymm0 = [4294967247,4294967247,4294967247,4294967247,4294967247,4294967247,4294967247,4294967247]
	vpbroadcastd	ymm1, dword ptr [rip + .LCPI25_8] # ymm1 = [1,1,1,1,1,1,1,1]
	vpbroadcastd	ymm2, dword ptr [rip + .LCPI25_9] # ymm2 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	jmp	.LBB25_30
	.p2align	4, 0x90
.LBB25_29:                              #   in Loop: Header=BB25_30 Depth=1
	inc	rsi
	add	rax, 8
	cmp	rsi, r12
	je	.LBB25_39
.LBB25_30:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB25_35 Depth 2
                                        #     Child Loop BB25_33 Depth 2
                                        #     Child Loop BB25_38 Depth 2
	cmp	r13d, 16
	jae	.LBB25_32
# %bb.31:                               #   in Loop: Header=BB25_30 Depth=1
	xor	r9d, r9d
	jmp	.LBB25_38
	.p2align	4, 0x90
.LBB25_32:                              #   in Loop: Header=BB25_30 Depth=1
	xor	r8d, r8d
	cmp	r13d, 32
	jae	.LBB25_35
	.p2align	4, 0x90
.LBB25_33:                              #   Parent Loop BB25_30 Depth=1
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
	jne	.LBB25_33
# %bb.34:                               #   in Loop: Header=BB25_30 Depth=1
	mov	r9, rdx
	cmp	edx, r13d
	jne	.LBB25_38
	jmp	.LBB25_29
	.p2align	4, 0x90
.LBB25_35:                              #   Parent Loop BB25_30 Depth=1
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
	jne	.LBB25_35
# %bb.36:                               #   in Loop: Header=BB25_30 Depth=1
	cmp	ecx, r13d
	je	.LBB25_29
# %bb.37:                               #   in Loop: Header=BB25_30 Depth=1
	mov	r8, rcx
	mov	r9, rcx
	test	r13b, 16
	jne	.LBB25_33
	.p2align	4, 0x90
.LBB25_38:                              #   Parent Loop BB25_30 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzx	r8d, byte ptr [rax + r9]
	add	r8b, -49
	shlx	r8d, edi, r8d
	or	byte ptr [rbx + r9], r8b
	inc	r9
	cmp	r13, r9
	jne	.LBB25_38
	jmp	.LBB25_29
.LBB25_39:
	test	r10b, r10b
	je	.LBB25_43
# %bb.40:
	test	r13d, r13d
	jle	.LBB25_47
# %bb.41:
	movsxd	rcx, r15d
	cmp	r13d, 16
	jae	.LBB25_48
# %bb.42:
	xor	edx, edx
	xor	eax, eax
	jmp	.LBB25_59
.LBB25_43:
	test	r13d, r13d
	jle	.LBB25_47
# %bb.44:
	movsxd	rcx, r15d
	cmp	r13d, 17
	jae	.LBB25_50
# %bb.45:
	xor	edx, edx
	xor	eax, eax
	jmp	.LBB25_67
.LBB25_47:
	xor	eax, eax
	jmp	.LBB25_69
.LBB25_48:
	cmp	r13d, 128
	jae	.LBB25_52
# %bb.49:
	xor	eax, eax
	xor	edx, edx
	jmp	.LBB25_56
.LBB25_50:
	cmp	r13d, 129
	jae	.LBB25_61
# %bb.51:
	xor	eax, eax
	xor	edx, edx
	jmp	.LBB25_64
.LBB25_52:
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
.LBB25_53:                              # =>This Inner Loop Header: Depth=1
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
	jne	.LBB25_53
# %bb.54:
	vpor	ymm0, ymm2, ymm0
	vpor	ymm0, ymm3, ymm0
	vpor	ymm0, ymm4, ymm0
	vgf2p8affineqb	ymm0, ymm0, ymmword ptr [rip + .LCPI25_14], 0
	vpmovmskb	eax, ymm0
	test	eax, eax
	setne	al
	cmp	edx, r13d
	je	.LBB25_69
# %bb.55:
	test	r13b, 112
	je	.LBB25_59
.LBB25_56:
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
.LBB25_57:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm2, xmmword ptr [rax + r8]
	vpand	xmm3, xmm2, xmmword ptr [rsi + r8]
	vpcmpeqb	xmm2, xmm3, xmm2
	vpxor	xmm2, xmm2, xmm1
	vpor	xmm0, xmm0, xmm2
	vmovdqu	xmmword ptr [rax + r8], xmm3
	add	r8, 16
	cmp	rdi, r8
	jne	.LBB25_57
# %bb.58:
	vptest	xmm0, xmmword ptr [rip + .LCPI25_15]
	setne	al
	cmp	edx, r13d
	je	.LBB25_69
.LBB25_59:
	add	rbx, rdx
	lea	rsi, [rdx + 8*rcx]
	lea	rcx, [rip + con]
	add	rcx, rsi
	sub	r13, rdx
	xor	edx, edx
	.p2align	4, 0x90
.LBB25_60:                              # =>This Inner Loop Header: Depth=1
	movzx	esi, byte ptr [rcx + rdx]
	movzx	edi, byte ptr [rbx + rdx]
	and	dil, sil
	cmp	dil, sil
	setne	sil
	or	al, sil
	mov	byte ptr [rcx + rdx], dil
	inc	rdx
	cmp	r13, rdx
	jne	.LBB25_60
	jmp	.LBB25_69
.LBB25_61:
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
	vpmovsxbd	ymm1, qword ptr [rip + .LCPI25_17] # ymm1 = [0,2,2,3,0,2,4,6]
	vpxor	xmm4, xmm4, xmm4
	vpxor	xmm6, xmm6, xmm6
	vpxor	xmm3, xmm3, xmm3
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI25_18] # ymm7 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm8, dword ptr [rip + .LCPI25_18] # ymm8 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm9, dword ptr [rip + .LCPI25_18] # ymm9 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastw	xmm11, word ptr [rip + .LCPI25_16] # xmm11 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm12, word ptr [rip + .LCPI25_16] # xmm12 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm13, word ptr [rip + .LCPI25_16] # xmm13 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB25_62:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	ymmword ptr [rbp - 96], ymm3    # 32-byte Spill
	vmovdqu	ymmword ptr [rbp - 160], ymm6   # 32-byte Spill
	vmovdqu	ymmword ptr [rbp - 192], ymm4   # 32-byte Spill
	vmovdqu	ymmword ptr [rbp - 128], ymm0   # 32-byte Spill
	vxorps	xmm2, xmm2, xmm2
	vpermd	ymm2, ymm1, ymmword ptr [rax + 8*rdi + 224]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI25_18] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
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
	vpbroadcastw	xmm0, word ptr [rip + .LCPI25_16] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
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
	jne	.LBB25_62
# %bb.63:
	vpor	ymm0, ymm4, ymm0
	vpor	ymm0, ymm6, ymm0
	vpor	ymm0, ymm3, ymm0
	vgf2p8affineqb	ymm0, ymm0, ymmword ptr [rip + .LCPI25_14], 0
	vpmovmskb	eax, ymm0
	test	eax, eax
	setne	al
	cmp	esi, 16
	jbe	.LBB25_67
.LBB25_64:
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
	vpbroadcastw	xmm1, word ptr [rip + .LCPI25_16] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI25_16] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI25_16] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm4, word ptr [rip + .LCPI25_16] # xmm4 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpcmpeqd	xmm5, xmm5, xmm5
	.p2align	4, 0x90
.LBB25_65:                              # =>This Inner Loop Header: Depth=1
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
	jne	.LBB25_65
# %bb.66:
	vptest	xmm0, xmmword ptr [rip + .LCPI25_15]
	setne	al
.LBB25_67:
	add	rbx, rdx
	lea	rsi, [rcx + 8*rdx]
	lea	rcx, [rip + con]
	add	rcx, rsi
	sub	r13, rdx
	xor	edx, edx
	.p2align	4, 0x90
.LBB25_68:                              # =>This Inner Loop Header: Depth=1
	movzx	esi, byte ptr [rcx + 8*rdx]
	movzx	edi, byte ptr [rbx + rdx]
	and	dil, sil
	cmp	dil, sil
	setne	sil
	or	al, sil
	mov	byte ptr [rcx + 8*rdx], dil
	inc	rdx
	cmp	r13, rdx
	jne	.LBB25_68
.LBB25_69:
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	jne	.LBB25_71
# %bb.70:
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
.LBB25_71:
	.cfi_def_cfa rbp, 16
	vzeroupper
	call	__stack_chk_fail@PLT
.Lfunc_end25:
	.size	sequence_filtration, .Lfunc_end25-sequence_filtration
	.cfi_endproc
                                        # -- End function
	.globl	col_filled                      # -- Begin function col_filled
	.p2align	4, 0x90
	.type	col_filled,@function
col_filled:                             # @col_filled
	.cfi_startproc
# %bb.0:
	movsxd	rsi, dword ptr [rip + length]
	test	rsi, rsi
	jle	.LBB26_9
# %bb.1:
	mov	eax, 1
	shlx	ecx, eax, edi
	mov	edx, esi
	and	edx, 7
	cmp	esi, 8
	jae	.LBB26_10
# %bb.2:
	mov	al, 1
	xor	edi, edi
	jmp	.LBB26_3
.LBB26_9:
	mov	al, 1
	and	al, 1
                                        # kill: def $al killed $al killed $eax
	ret
.LBB26_10:
	and	esi, 2147483640
	mov	al, 1
	xor	edi, edi
	lea	r8, [rip + con]
	.p2align	4, 0x90
.LBB26_13:                              # =>This Inner Loop Header: Depth=1
	test	al, 1
	je	.LBB26_11
# %bb.14:                               #   in Loop: Header=BB26_13 Depth=1
	movzx	eax, byte ptr [rdi + r8 + 64]
	test	ecx, eax
	je	.LBB26_11
# %bb.15:                               #   in Loop: Header=BB26_13 Depth=1
	movzx	eax, byte ptr [rdi + r8 + 65]
	test	ecx, eax
	je	.LBB26_11
# %bb.16:                               #   in Loop: Header=BB26_13 Depth=1
	movzx	eax, byte ptr [rdi + r8 + 66]
	test	ecx, eax
	je	.LBB26_11
# %bb.17:                               #   in Loop: Header=BB26_13 Depth=1
	movzx	eax, byte ptr [rdi + r8 + 67]
	test	ecx, eax
	je	.LBB26_11
# %bb.18:                               #   in Loop: Header=BB26_13 Depth=1
	movzx	eax, byte ptr [rdi + r8 + 68]
	test	ecx, eax
	je	.LBB26_11
# %bb.19:                               #   in Loop: Header=BB26_13 Depth=1
	movzx	eax, byte ptr [rdi + r8 + 69]
	test	ecx, eax
	je	.LBB26_11
# %bb.20:                               #   in Loop: Header=BB26_13 Depth=1
	movzx	eax, byte ptr [rdi + r8 + 70]
	test	ecx, eax
	je	.LBB26_11
# %bb.21:                               #   in Loop: Header=BB26_13 Depth=1
	movzx	eax, byte ptr [rdi + r8 + 71]
	test	ecx, eax
	setne	al
	add	rdi, 8
	cmp	rsi, rdi
	jne	.LBB26_13
	jmp	.LBB26_3
	.p2align	4, 0x90
.LBB26_11:                              #   in Loop: Header=BB26_13 Depth=1
	xor	eax, eax
	add	rdi, 8
	cmp	rsi, rdi
	jne	.LBB26_13
.LBB26_3:
	test	rdx, rdx
	je	.LBB26_8
# %bb.4:
	lea	rsi, [rip + con]
	add	rsi, rdi
	add	rsi, 64
	xor	edi, edi
	jmp	.LBB26_6
	.p2align	4, 0x90
.LBB26_5:                               #   in Loop: Header=BB26_6 Depth=1
	movzx	eax, byte ptr [rsi + rdi]
	test	ecx, eax
	setne	al
	inc	rdi
	cmp	rdx, rdi
	je	.LBB26_8
.LBB26_6:                               # =>This Inner Loop Header: Depth=1
	test	al, 1
	jne	.LBB26_5
# %bb.7:                                #   in Loop: Header=BB26_6 Depth=1
	xor	eax, eax
	inc	rdi
	cmp	rdx, rdi
	jne	.LBB26_6
.LBB26_8:
	and	al, 1
                                        # kill: def $al killed $al killed $eax
	ret
.Lfunc_end26:
	.size	col_filled, .Lfunc_end26-col_filled
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
	cmp	al, -1
	je	.LBB27_2
# %bb.1:
	not	al
                                        # kill: def $al killed $al killed $eax
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
.LBB27_2:
	.cfi_def_cfa_offset 16
	lea	rdi, [rip + .L.str.60]
	lea	rsi, [rip + .L.str.1]
	lea	rcx, [rip + .L__PRETTY_FUNCTION__.edge_constraint]
	mov	edx, 386
	call	__assert_fail@PLT
.Lfunc_end27:
	.size	edge_constraint, .Lfunc_end27-edge_constraint
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0                          # -- Begin function edge_clue_initialization
.LCPI28_0:
	.long	8                               # 0x8
	.long	9                               # 0x9
	.long	10                              # 0xa
	.long	11                              # 0xb
	.long	12                              # 0xc
	.long	13                              # 0xd
	.long	14                              # 0xe
	.long	15                              # 0xf
.LCPI28_1:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
.LCPI28_7:
	.long	24                              # 0x18
	.long	25                              # 0x19
	.long	26                              # 0x1a
	.long	27                              # 0x1b
	.long	28                              # 0x1c
	.long	29                              # 0x1d
	.long	30                              # 0x1e
	.long	31                              # 0x1f
.LCPI28_8:
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
.LCPI28_2:
	.long	822083584                       # 0x31000000
.LCPI28_3:
	.long	4294967247                      # 0xffffffcf
.LCPI28_4:
	.long	1                               # 0x1
.LCPI28_5:
	.long	16                              # 0x10
.LCPI28_6:
	.long	8                               # 0x8
.LCPI28_9:
	.byte	255                             # 0xff
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
.LCPI28_10:
	.long	32                              # 0x20
	.section	.rodata.cst8,"aM",@progbits,8
.LCPI28_11:
	.byte	0                               # 0x0
	.byte	1                               # 0x1
	.byte	2                               # 0x2
	.byte	3                               # 0x3
	.byte	4                               # 0x4
	.byte	5                               # 0x5
	.byte	6                               # 0x6
	.byte	7                               # 0x7
.LCPI28_12:
	.byte	8                               # 0x8
	.byte	9                               # 0x9
	.byte	10                              # 0xa
	.byte	11                              # 0xb
	.byte	12                              # 0xc
	.byte	13                              # 0xd
	.byte	14                              # 0xe
	.byte	15                              # 0xf
.LCPI28_13:
	.byte	16                              # 0x10
	.byte	17                              # 0x11
	.byte	18                              # 0x12
	.byte	19                              # 0x13
	.byte	20                              # 0x14
	.byte	21                              # 0x15
	.byte	22                              # 0x16
	.byte	23                              # 0x17
.LCPI28_14:
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
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	movsxd	rcx, dword ptr [rip + length]
	test	rcx, rcx
	jle	.LBB28_17
# %bb.1:
	lea	eax, [rcx + 48]
	mov	edx, ecx
	and	edx, 2147483632
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	r10d, ecx
	and	r10d, 2147483640
	mov	dword ptr [rsp + 20], eax       # 4-byte Spill
	vmovd	xmm0, eax
	vpbroadcastd	ymm0, xmm0
	mov	r11d, ecx
	and	r11d, 2147483616
	mov	ebx, ecx
	shr	ebx, 4
	and	ebx, 134217727
	shl	rbx, 7
	lea	r14, [rip + con+120]
	lea	r15, [rip + con+32]
	lea	r12, [rip + con]
	xor	r13d, r13d
	mov	ebp, 1
	vpmovsxbd	ymm1, qword ptr [rip + .LCPI28_11] # ymm1 = [0,1,2,3,4,5,6,7]
	vpbroadcastd	ymm2, dword ptr [rip + .LCPI28_2] # ymm2 = [822083584,822083584,822083584,822083584,822083584,822083584,822083584,822083584]
	vpbroadcastd	ymm3, dword ptr [rip + .LCPI28_3] # ymm3 = [4294967247,4294967247,4294967247,4294967247,4294967247,4294967247,4294967247,4294967247]
	vpbroadcastd	ymm4, dword ptr [rip + .LCPI28_4] # ymm4 = [1,1,1,1,1,1,1,1]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI28_6] # ymm5 = [8,8,8,8,8,8,8,8]
	vpmovsxbd	ymm6, qword ptr [rip + .LCPI28_12] # ymm6 = [8,9,10,11,12,13,14,15]
	mov	rax, r12
	jmp	.LBB28_2
	.p2align	4, 0x90
.LBB28_72:                              #   in Loop: Header=BB28_2 Depth=1
	inc	r13
	inc	r14
	inc	r15
	inc	rax
	add	r12, 8
	cmp	r13, rcx
	je	.LBB28_5
.LBB28_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB28_23 Depth 2
                                        #     Child Loop BB28_27 Depth 2
                                        #     Child Loop BB28_30 Depth 2
                                        #     Child Loop BB28_36 Depth 2
                                        #     Child Loop BB28_40 Depth 2
                                        #     Child Loop BB28_43 Depth 2
                                        #     Child Loop BB28_50 Depth 2
                                        #     Child Loop BB28_54 Depth 2
                                        #     Child Loop BB28_57 Depth 2
                                        #     Child Loop BB28_64 Depth 2
                                        #     Child Loop BB28_68 Depth 2
                                        #     Child Loop BB28_71 Depth 2
	lea	rdx, [rip + top_key]
	cmp	dword ptr [rdx + 4*r13], ecx
	jne	.LBB28_31
# %bb.3:                                #   in Loop: Header=BB28_2 Depth=1
	cmp	ecx, 8
	jae	.LBB28_21
# %bb.4:                                #   in Loop: Header=BB28_2 Depth=1
	xor	r8d, r8d
	jmp	.LBB28_29
	.p2align	4, 0x90
.LBB28_21:                              #   in Loop: Header=BB28_2 Depth=1
	xor	edx, edx
	cmp	ecx, 16
	jae	.LBB28_22
.LBB28_26:                              #   in Loop: Header=BB28_2 Depth=1
	vmovd	xmm9, edx
	vpbroadcastd	ymm9, xmm9
	vpor	ymm9, ymm9, ymm1
	.p2align	4, 0x90
.LBB28_27:                              #   Parent Loop BB28_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpslld	ymm10, ymm9, 24
	vpaddd	ymm10, ymm10, ymm2
	vpsrad	ymm10, ymm10, 24
	vpaddd	ymm10, ymm10, ymm3
	vpsllvd	ymm10, ymm4, ymm10
	vextracti128	xmm11, ymm10, 1
	vpextrb	byte ptr [r15 + 8*rdx - 32], xmm10, 0
	vpextrb	byte ptr [r15 + 8*rdx - 24], xmm10, 4
	vpextrb	byte ptr [r15 + 8*rdx - 16], xmm10, 8
	vpextrb	byte ptr [r15 + 8*rdx - 8], xmm10, 12
	vpextrb	byte ptr [r15 + 8*rdx], xmm11, 0
	vpextrb	byte ptr [r15 + 8*rdx + 8], xmm11, 4
	vpextrb	byte ptr [r15 + 8*rdx + 16], xmm11, 8
	vpextrb	byte ptr [r15 + 8*rdx + 24], xmm11, 12
	add	rdx, 8
	vpaddd	ymm9, ymm9, ymm5
	cmp	r10, rdx
	jne	.LBB28_27
# %bb.28:                               #   in Loop: Header=BB28_2 Depth=1
	mov	r8, r10
	cmp	r10, rcx
	jne	.LBB28_29
	jmp	.LBB28_31
.LBB28_22:                              #   in Loop: Header=BB28_2 Depth=1
	vmovdqa	ymm9, ymm1
	vmovdqa	ymm10, ymm6
	.p2align	4, 0x90
.LBB28_23:                              #   Parent Loop BB28_2 Depth=1
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
	vpextrb	byte ptr [r14 + rdx - 120], xmm11, 0
	vpextrb	byte ptr [r14 + rdx - 112], xmm11, 4
	vpextrb	byte ptr [r14 + rdx - 104], xmm11, 8
	vpextrb	byte ptr [r14 + rdx - 96], xmm11, 12
	vpextrb	byte ptr [r14 + rdx - 88], xmm14, 0
	vpextrb	byte ptr [r14 + rdx - 80], xmm14, 4
	vpextrb	byte ptr [r14 + rdx - 72], xmm14, 8
	vpextrb	byte ptr [r14 + rdx - 64], xmm14, 12
	vpextrb	byte ptr [r14 + rdx - 56], xmm12, 0
	vpextrb	byte ptr [r14 + rdx - 48], xmm12, 4
	vpextrb	byte ptr [r14 + rdx - 40], xmm12, 8
	vpextrb	byte ptr [r14 + rdx - 32], xmm12, 12
	vpextrb	byte ptr [r14 + rdx - 24], xmm13, 0
	vpextrb	byte ptr [r14 + rdx - 16], xmm13, 4
	vpextrb	byte ptr [r14 + rdx - 8], xmm13, 8
	vpextrb	byte ptr [r14 + rdx], xmm13, 12
	vpbroadcastd	ymm11, dword ptr [rip + .LCPI28_5] # ymm11 = [16,16,16,16,16,16,16,16]
	vpaddd	ymm9, ymm9, ymm11
	vpaddd	ymm10, ymm10, ymm11
	sub	rdx, -128
	cmp	rbx, rdx
	jne	.LBB28_23
# %bb.24:                               #   in Loop: Header=BB28_2 Depth=1
	cmp	qword ptr [rsp + 8], rcx        # 8-byte Folded Reload
	je	.LBB28_31
# %bb.25:                               #   in Loop: Header=BB28_2 Depth=1
	mov	r8, qword ptr [rsp + 8]         # 8-byte Reload
	mov	rdx, r8
	test	cl, 8
	jne	.LBB28_26
	.p2align	4, 0x90
.LBB28_29:                              #   in Loop: Header=BB28_2 Depth=1
	mov	esi, r8d
	shl	esi, 24
	add	esi, 822083584
	lea	rdi, [rax + 8*r8]
	mov	r9, rcx
	sub	r9, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB28_30:                              #   Parent Loop BB28_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	edx, esi
	shr	edx, 24
	add	dl, -49
	shlx	edx, ebp, edx
	mov	byte ptr [rdi + 8*r8], dl
	add	esi, 16777216
	inc	r8
	cmp	r9, r8
	jne	.LBB28_30
.LBB28_31:                              #   in Loop: Header=BB28_2 Depth=1
	lea	rdx, [rip + bottom_key]
	cmp	dword ptr [rdx + 4*r13], ecx
	jne	.LBB28_44
# %bb.32:                               #   in Loop: Header=BB28_2 Depth=1
	cmp	ecx, 8
	jae	.LBB28_34
# %bb.33:                               #   in Loop: Header=BB28_2 Depth=1
	xor	r8d, r8d
	jmp	.LBB28_42
	.p2align	4, 0x90
.LBB28_34:                              #   in Loop: Header=BB28_2 Depth=1
	xor	edx, edx
	cmp	ecx, 16
	jae	.LBB28_35
.LBB28_39:                              #   in Loop: Header=BB28_2 Depth=1
	vmovd	xmm9, edx
	vpbroadcastd	ymm9, xmm9
	vpor	ymm9, ymm9, ymm1
	.p2align	4, 0x90
.LBB28_40:                              #   Parent Loop BB28_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpsubd	ymm10, ymm0, ymm9
	vpslld	ymm10, ymm10, 24
	vpsrad	ymm10, ymm10, 24
	vpaddd	ymm10, ymm10, ymm3
	vpsllvd	ymm10, ymm4, ymm10
	vextracti128	xmm11, ymm10, 1
	vpextrb	byte ptr [r15 + 8*rdx - 32], xmm10, 0
	vpextrb	byte ptr [r15 + 8*rdx - 24], xmm10, 4
	vpextrb	byte ptr [r15 + 8*rdx - 16], xmm10, 8
	vpextrb	byte ptr [r15 + 8*rdx - 8], xmm10, 12
	vpextrb	byte ptr [r15 + 8*rdx], xmm11, 0
	vpextrb	byte ptr [r15 + 8*rdx + 8], xmm11, 4
	vpextrb	byte ptr [r15 + 8*rdx + 16], xmm11, 8
	vpextrb	byte ptr [r15 + 8*rdx + 24], xmm11, 12
	add	rdx, 8
	vpaddd	ymm9, ymm9, ymm5
	cmp	r10, rdx
	jne	.LBB28_40
# %bb.41:                               #   in Loop: Header=BB28_2 Depth=1
	mov	r8, r10
	cmp	r10, rcx
	jne	.LBB28_42
	jmp	.LBB28_44
.LBB28_35:                              #   in Loop: Header=BB28_2 Depth=1
	vmovdqa	ymm9, ymm1
	vmovdqa	ymm10, ymm6
	.p2align	4, 0x90
.LBB28_36:                              #   Parent Loop BB28_2 Depth=1
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
	vpextrb	byte ptr [r14 + rdx - 120], xmm12, 0
	vpextrb	byte ptr [r14 + rdx - 112], xmm12, 4
	vpextrb	byte ptr [r14 + rdx - 104], xmm12, 8
	vpextrb	byte ptr [r14 + rdx - 96], xmm12, 12
	vpextrb	byte ptr [r14 + rdx - 88], xmm14, 0
	vpextrb	byte ptr [r14 + rdx - 80], xmm14, 4
	vpextrb	byte ptr [r14 + rdx - 72], xmm14, 8
	vpextrb	byte ptr [r14 + rdx - 64], xmm14, 12
	vpextrb	byte ptr [r14 + rdx - 56], xmm11, 0
	vpextrb	byte ptr [r14 + rdx - 48], xmm11, 4
	vpextrb	byte ptr [r14 + rdx - 40], xmm11, 8
	vpextrb	byte ptr [r14 + rdx - 32], xmm11, 12
	vpextrb	byte ptr [r14 + rdx - 24], xmm13, 0
	vpextrb	byte ptr [r14 + rdx - 16], xmm13, 4
	vpextrb	byte ptr [r14 + rdx - 8], xmm13, 8
	vpextrb	byte ptr [r14 + rdx], xmm13, 12
	vpbroadcastd	ymm11, dword ptr [rip + .LCPI28_5] # ymm11 = [16,16,16,16,16,16,16,16]
	vpaddd	ymm9, ymm9, ymm11
	vpaddd	ymm10, ymm10, ymm11
	sub	rdx, -128
	cmp	rbx, rdx
	jne	.LBB28_36
# %bb.37:                               #   in Loop: Header=BB28_2 Depth=1
	cmp	qword ptr [rsp + 8], rcx        # 8-byte Folded Reload
	je	.LBB28_44
# %bb.38:                               #   in Loop: Header=BB28_2 Depth=1
	mov	r8, qword ptr [rsp + 8]         # 8-byte Reload
	mov	rdx, r8
	test	cl, 8
	jne	.LBB28_39
	.p2align	4, 0x90
.LBB28_42:                              #   in Loop: Header=BB28_2 Depth=1
	mov	edx, dword ptr [rsp + 20]       # 4-byte Reload
	sub	edx, r8d
	shl	edx, 24
	lea	rdi, [rax + 8*r8]
	mov	r9, rcx
	sub	r9, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB28_43:                              #   Parent Loop BB28_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	esi, edx
	shr	esi, 24
	add	sil, -49
	shlx	esi, ebp, esi
	mov	byte ptr [rdi + 8*r8], sil
	add	edx, -16777216
	inc	r8
	cmp	r9, r8
	jne	.LBB28_43
.LBB28_44:                              #   in Loop: Header=BB28_2 Depth=1
	lea	rdx, [rip + left_key]
	cmp	dword ptr [rdx + 4*r13], ecx
	jne	.LBB28_58
# %bb.45:                               #   in Loop: Header=BB28_2 Depth=1
	cmp	ecx, 16
	jae	.LBB28_47
# %bb.46:                               #   in Loop: Header=BB28_2 Depth=1
	xor	r8d, r8d
	jmp	.LBB28_56
	.p2align	4, 0x90
.LBB28_47:                              #   in Loop: Header=BB28_2 Depth=1
	cmp	ecx, 32
	jae	.LBB28_49
# %bb.48:                               #   in Loop: Header=BB28_2 Depth=1
	xor	edi, edi
.LBB28_53:                              #   in Loop: Header=BB28_2 Depth=1
	vmovd	xmm7, edi
	vpbroadcastd	ymm7, xmm7
	vpor	ymm9, ymm7, ymm6
	vpor	ymm10, ymm7, ymm1
	lea	rdx, [r12 + rdi]
	mov	r9, qword ptr [rsp + 8]         # 8-byte Reload
	sub	r9, rdi
	xor	edi, edi
	.p2align	4, 0x90
.LBB28_54:                              #   Parent Loop BB28_2 Depth=1
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
	vpbroadcastd	ymm11, dword ptr [rip + .LCPI28_9] # ymm11 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	vpand	ymm8, ymm8, ymm11
	vpand	ymm7, ymm11, ymm7
	vpackusdw	ymm7, ymm8, ymm7
	vextracti128	xmm8, ymm7, 1
	vpackuswb	xmm7, xmm7, xmm8
	vpshufd	xmm7, xmm7, 216                 # xmm7 = xmm7[0,2,1,3]
	vmovdqu	xmmword ptr [rdx + rdi], xmm7
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI28_5] # ymm7 = [16,16,16,16,16,16,16,16]
	vpaddd	ymm10, ymm10, ymm7
	vpaddd	ymm9, ymm9, ymm7
	add	rdi, 16
	cmp	r9, rdi
	jne	.LBB28_54
# %bb.55:                               #   in Loop: Header=BB28_2 Depth=1
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	mov	r8, rdx
	cmp	rdx, rcx
	jne	.LBB28_56
	jmp	.LBB28_58
.LBB28_49:                              #   in Loop: Header=BB28_2 Depth=1
	xor	edx, edx
	vmovdqa	ymm9, ymm1
	vmovdqa	ymm10, ymm6
	vpmovsxbd	ymm11, qword ptr [rip + .LCPI28_13] # ymm11 = [16,17,18,19,20,21,22,23]
	vpmovsxbd	ymm12, qword ptr [rip + .LCPI28_14] # ymm12 = [24,25,26,27,28,29,30,31]
	.p2align	4, 0x90
.LBB28_50:                              #   Parent Loop BB28_2 Depth=1
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
	vpbroadcastd	ymm8, dword ptr [rip + .LCPI28_9] # ymm8 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
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
	vmovdqu	ymmword ptr [r12 + rdx], ymm7
	add	rdx, 32
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI28_10] # ymm7 = [32,32,32,32,32,32,32,32]
	vpaddd	ymm9, ymm9, ymm7
	vpaddd	ymm10, ymm10, ymm7
	vpaddd	ymm11, ymm11, ymm7
	vpaddd	ymm12, ymm12, ymm7
	cmp	r11, rdx
	jne	.LBB28_50
# %bb.51:                               #   in Loop: Header=BB28_2 Depth=1
	cmp	r11, rcx
	je	.LBB28_58
# %bb.52:                               #   in Loop: Header=BB28_2 Depth=1
	mov	rdi, r11
	mov	r8, r11
	test	cl, 16
	jne	.LBB28_53
	.p2align	4, 0x90
.LBB28_56:                              #   in Loop: Header=BB28_2 Depth=1
	mov	edx, r8d
	shl	edx, 24
	add	edx, 822083584
	lea	rdi, [r12 + r8]
	mov	r9, rcx
	sub	r9, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB28_57:                              #   Parent Loop BB28_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	esi, edx
	shr	esi, 24
	add	sil, -49
	shlx	esi, ebp, esi
	mov	byte ptr [rdi + r8], sil
	add	edx, 16777216
	inc	r8
	cmp	r9, r8
	jne	.LBB28_57
.LBB28_58:                              #   in Loop: Header=BB28_2 Depth=1
	lea	rdx, [rip + right_key]
	cmp	dword ptr [rdx + 4*r13], ecx
	jne	.LBB28_72
# %bb.59:                               #   in Loop: Header=BB28_2 Depth=1
	cmp	ecx, 16
	jae	.LBB28_61
# %bb.60:                               #   in Loop: Header=BB28_2 Depth=1
	xor	r8d, r8d
	jmp	.LBB28_70
	.p2align	4, 0x90
.LBB28_61:                              #   in Loop: Header=BB28_2 Depth=1
	cmp	ecx, 32
	jae	.LBB28_63
# %bb.62:                               #   in Loop: Header=BB28_2 Depth=1
	xor	edi, edi
.LBB28_67:                              #   in Loop: Header=BB28_2 Depth=1
	vmovd	xmm7, edi
	vpbroadcastd	ymm7, xmm7
	vpor	ymm9, ymm7, ymm6
	vpor	ymm10, ymm7, ymm1
	lea	rdx, [r12 + rdi]
	mov	r9, qword ptr [rsp + 8]         # 8-byte Reload
	sub	r9, rdi
	xor	edi, edi
	.p2align	4, 0x90
.LBB28_68:                              #   Parent Loop BB28_2 Depth=1
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
	vpbroadcastd	ymm11, dword ptr [rip + .LCPI28_9] # ymm11 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	vpand	ymm7, ymm11, ymm7
	vpand	ymm8, ymm8, ymm11
	vpackusdw	ymm7, ymm7, ymm8
	vextracti128	xmm8, ymm7, 1
	vpackuswb	xmm7, xmm7, xmm8
	vpshufd	xmm7, xmm7, 216                 # xmm7 = xmm7[0,2,1,3]
	vmovdqu	xmmword ptr [rdx + rdi], xmm7
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI28_5] # ymm7 = [16,16,16,16,16,16,16,16]
	vpaddd	ymm10, ymm10, ymm7
	vpaddd	ymm9, ymm9, ymm7
	add	rdi, 16
	cmp	r9, rdi
	jne	.LBB28_68
# %bb.69:                               #   in Loop: Header=BB28_2 Depth=1
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	mov	r8, rdx
	cmp	rdx, rcx
	je	.LBB28_72
	jmp	.LBB28_70
.LBB28_63:                              #   in Loop: Header=BB28_2 Depth=1
	xor	edx, edx
	vmovdqa	ymm9, ymm1
	vmovdqa	ymm10, ymm6
	vpmovsxbd	ymm11, qword ptr [rip + .LCPI28_13] # ymm11 = [16,17,18,19,20,21,22,23]
	vpmovsxbd	ymm12, qword ptr [rip + .LCPI28_14] # ymm12 = [24,25,26,27,28,29,30,31]
	.p2align	4, 0x90
.LBB28_64:                              #   Parent Loop BB28_2 Depth=1
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
	vpbroadcastd	ymm15, dword ptr [rip + .LCPI28_9] # ymm15 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
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
	vmovdqu	ymmword ptr [r12 + rdx], ymm7
	add	rdx, 32
	vpbroadcastd	ymm7, dword ptr [rip + .LCPI28_10] # ymm7 = [32,32,32,32,32,32,32,32]
	vpaddd	ymm9, ymm9, ymm7
	vpaddd	ymm10, ymm10, ymm7
	vpaddd	ymm11, ymm11, ymm7
	vpaddd	ymm12, ymm12, ymm7
	cmp	r11, rdx
	jne	.LBB28_64
# %bb.65:                               #   in Loop: Header=BB28_2 Depth=1
	cmp	r11, rcx
	je	.LBB28_72
# %bb.66:                               #   in Loop: Header=BB28_2 Depth=1
	mov	rdi, r11
	mov	r8, r11
	test	cl, 16
	jne	.LBB28_67
	.p2align	4, 0x90
.LBB28_70:                              #   in Loop: Header=BB28_2 Depth=1
	mov	edx, dword ptr [rsp + 20]       # 4-byte Reload
	sub	edx, r8d
	shl	edx, 24
	lea	rdi, [r12 + r8]
	mov	r9, rcx
	sub	r9, r8
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB28_71:                              #   Parent Loop BB28_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	esi, edx
	shr	esi, 24
	add	sil, -49
	shlx	esi, ebp, esi
	mov	byte ptr [rdi + r8], sil
	add	edx, -16777216
	inc	r8
	cmp	r9, r8
	jne	.LBB28_71
	jmp	.LBB28_72
.LBB28_5:
	test	ecx, ecx
	jle	.LBB28_17
# %bb.6:
	mov	eax, ecx
	shl	eax, 24
	add	eax, 805306368
	shr	eax, 24
	add	al, -49
	mov	edx, 1
	shlx	eax, edx, eax
	lea	r8d, [rcx - 1]
	cmp	ecx, 1
	jne	.LBB28_73
# %bb.7:
	xor	r9d, r9d
.LBB28_8:
	test	cl, 1
	je	.LBB28_17
# %bb.9:
	lea	rdx, [rip + top_key]
	cmp	dword ptr [rdx + 4*r9], 1
	je	.LBB28_10
# %bb.11:
	lea	rdx, [rip + bottom_key]
	cmp	dword ptr [rdx + 4*r9], 1
	je	.LBB28_12
.LBB28_13:
	lea	rdx, [rip + left_key]
	cmp	dword ptr [rdx + 4*r9], 1
	je	.LBB28_14
.LBB28_15:
	lea	rdx, [rip + right_key]
	cmp	dword ptr [rdx + 4*r9], 1
	jne	.LBB28_17
.LBB28_16:
	lea	rdx, [rip + con]
	lea	rdx, [rdx + 8*r9]
	mov	byte ptr [r8 + rdx], al
.LBB28_17:
	test	ecx, ecx
	je	.LBB28_92
# %bb.18:
	mov	r13, qword ptr [rip + stderr@GOTPCREL]
	xor	ebp, ebp
	.p2align	4, 0x90
.LBB28_19:                              # =>This Inner Loop Header: Depth=1
	mov	eax, ebp
	cdq
	idiv	ecx
	mov	ebx, edx
	mov	r14d, eax
	shl	r14d, 4
	or	r14d, edx
	shr	r14d, 4
	and	r14d, 15
	and	ebx, 7
	lea	edx, [4*rbx]
	lea	eax, [4*r14]
	lea	esi, [rcx + 1]
	lea	rdi, [rip + top_key]
	sub	esi, dword ptr [rdx + rdi]
	add	esi, r14d
	mov	r9d, -1
	shlx	esi, r9d, esi
	lea	edi, [rcx + rcx]
	lea	r8, [rip + bottom_key]
	mov	edx, dword ptr [rdx + r8]
	add	edx, r14d
	mov	r8d, edi
	sub	r8d, edx
	shlx	edx, r9d, r8d
	or	edx, esi
	add	ecx, ebx
	inc	ecx
	lea	rsi, [rip + left_key]
	sub	ecx, dword ptr [rax + rsi]
	shlx	ecx, r9d, ecx
	or	ecx, edx
	lea	rdx, [rip + right_key]
	mov	eax, dword ptr [rax + rdx]
	add	eax, ebx
	sub	edi, eax
	shlx	r15d, r9d, edi
	or	r15d, ecx
	cmp	r15b, -1
	je	.LBB28_20
# %bb.91:                               #   in Loop: Header=BB28_19 Depth=1
	not	r15b
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 437
	xor	eax, eax
	vzeroupper
	call	fprintf@PLT
	mov	rdi, qword ptr [r13]
	movzx	r15d, r15b
	lea	rax, [rip + con]
	lea	r12, [rax + 8*r14]
	movzx	r9d, byte ptr [rbx + r12]
	lea	rsi, [rip + .L.str.63]
	mov	edx, r14d
	mov	ecx, ebx
	mov	r8d, r15d
	xor	eax, eax
	call	fprintf@PLT
	mov	rsi, qword ptr [r13]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r13]
	call	fflush@PLT
	and	byte ptr [rbx + r12], r15b
	inc	ebp
	mov	ecx, dword ptr [rip + length]
	mov	eax, ecx
	imul	eax, ecx
	cmp	ebp, eax
	jb	.LBB28_19
.LBB28_92:
	mov	rbx, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rbx]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 442
	xor	eax, eax
	vzeroupper
	call	fprintf@PLT
	mov	rcx, qword ptr [rbx]
	lea	rdi, [rip + .L.str.66]
	mov	esi, 24
	mov	edx, 1
	call	fwrite@PLT
	mov	rsi, qword ptr [rbx]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbx]
	call	fflush@PLT
	add	rsp, 24
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
	jmp	place_singles                   # TAILCALL
.LBB28_73:
	.cfi_def_cfa_offset 80
	mov	r10d, ecx
	and	r10d, 2147483646
	lea	r11, [rip + con]
	lea	rbx, [r11 + 8*r8]
	inc	rbx
	lea	r14, [r8 + r11]
	add	r14, 8
	xor	r9d, r9d
	jmp	.LBB28_74
	.p2align	4, 0x90
.LBB28_90:                              #   in Loop: Header=BB28_74 Depth=1
	add	r9, 2
	cmp	r10, r9
	je	.LBB28_8
.LBB28_74:                              # =>This Inner Loop Header: Depth=1
	lea	rdx, [rip + top_key]
	cmp	dword ptr [rdx + 4*r9], 1
	je	.LBB28_75
# %bb.76:                               #   in Loop: Header=BB28_74 Depth=1
	lea	rdx, [rip + bottom_key]
	cmp	dword ptr [rdx + 4*r9], 1
	je	.LBB28_77
.LBB28_78:                              #   in Loop: Header=BB28_74 Depth=1
	lea	rdx, [rip + left_key]
	cmp	dword ptr [rdx + 4*r9], 1
	je	.LBB28_79
.LBB28_80:                              #   in Loop: Header=BB28_74 Depth=1
	lea	rdx, [rip + right_key]
	cmp	dword ptr [rdx + 4*r9], 1
	je	.LBB28_81
.LBB28_82:                              #   in Loop: Header=BB28_74 Depth=1
	lea	rdx, [rip + top_key]
	cmp	dword ptr [rdx + 4*r9 + 4], 1
	je	.LBB28_83
.LBB28_84:                              #   in Loop: Header=BB28_74 Depth=1
	lea	rdx, [rip + bottom_key]
	cmp	dword ptr [rdx + 4*r9 + 4], 1
	je	.LBB28_85
.LBB28_86:                              #   in Loop: Header=BB28_74 Depth=1
	lea	rdx, [rip + left_key]
	cmp	dword ptr [rdx + 4*r9 + 4], 1
	je	.LBB28_87
.LBB28_88:                              #   in Loop: Header=BB28_74 Depth=1
	lea	rdx, [rip + right_key]
	cmp	dword ptr [rdx + 4*r9 + 4], 1
	jne	.LBB28_90
	jmp	.LBB28_89
	.p2align	4, 0x90
.LBB28_75:                              #   in Loop: Header=BB28_74 Depth=1
	mov	byte ptr [r9 + r11], al
	lea	rdx, [rip + bottom_key]
	cmp	dword ptr [rdx + 4*r9], 1
	jne	.LBB28_78
.LBB28_77:                              #   in Loop: Header=BB28_74 Depth=1
	mov	byte ptr [rbx + r9 - 1], al
	lea	rdx, [rip + left_key]
	cmp	dword ptr [rdx + 4*r9], 1
	jne	.LBB28_80
.LBB28_79:                              #   in Loop: Header=BB28_74 Depth=1
	mov	byte ptr [r11 + 8*r9], al
	lea	rdx, [rip + right_key]
	cmp	dword ptr [rdx + 4*r9], 1
	jne	.LBB28_82
.LBB28_81:                              #   in Loop: Header=BB28_74 Depth=1
	mov	byte ptr [r14 + 8*r9 - 8], al
	lea	rdx, [rip + top_key]
	cmp	dword ptr [rdx + 4*r9 + 4], 1
	jne	.LBB28_84
.LBB28_83:                              #   in Loop: Header=BB28_74 Depth=1
	mov	byte ptr [r9 + r11 + 1], al
	lea	rdx, [rip + bottom_key]
	cmp	dword ptr [rdx + 4*r9 + 4], 1
	jne	.LBB28_86
.LBB28_85:                              #   in Loop: Header=BB28_74 Depth=1
	mov	byte ptr [rbx + r9], al
	lea	rdx, [rip + left_key]
	cmp	dword ptr [rdx + 4*r9 + 4], 1
	jne	.LBB28_88
.LBB28_87:                              #   in Loop: Header=BB28_74 Depth=1
	mov	byte ptr [r11 + 8*r9 + 8], al
	lea	rdx, [rip + right_key]
	cmp	dword ptr [rdx + 4*r9 + 4], 1
	jne	.LBB28_90
.LBB28_89:                              #   in Loop: Header=BB28_74 Depth=1
	mov	byte ptr [r14 + 8*r9], al
	jmp	.LBB28_90
.LBB28_10:
	lea	rdx, [rip + con]
	mov	byte ptr [r9 + rdx], al
	lea	rdx, [rip + bottom_key]
	cmp	dword ptr [rdx + 4*r9], 1
	jne	.LBB28_13
.LBB28_12:
	lea	rdx, [rip + con]
	lea	rdx, [rdx + 8*r8]
	mov	byte ptr [r9 + rdx], al
	lea	rdx, [rip + left_key]
	cmp	dword ptr [rdx + 4*r9], 1
	jne	.LBB28_15
.LBB28_14:
	lea	rdx, [rip + con]
	mov	byte ptr [rdx + 8*r9], al
	lea	rdx, [rip + right_key]
	cmp	dword ptr [rdx + 4*r9], 1
	je	.LBB28_16
	jmp	.LBB28_17
.LBB28_20:
	lea	rdi, [rip + .L.str.60]
	lea	rsi, [rip + .L.str.1]
	lea	rcx, [rip + .L__PRETTY_FUNCTION__.edge_constraint]
	mov	edx, 386
	vzeroupper
	call	__assert_fail@PLT
.Lfunc_end28:
	.size	edge_clue_initialization, .Lfunc_end28-edge_clue_initialization
	.cfi_endproc
                                        # -- End function
	.globl	unique_bits                     # -- Begin function unique_bits
	.p2align	4, 0x90
	.type	unique_bits,@function
unique_bits:                            # @unique_bits
	.cfi_startproc
# %bb.0:
	test	edi, edi
	jle	.LBB29_1
# %bb.2:
	mov	r8d, edi
	mov	ecx, r8d
	and	ecx, 7
	cmp	edi, 8
	jae	.LBB29_9
# %bb.3:
	xor	edi, edi
	xor	edx, edx
	xor	eax, eax
	jmp	.LBB29_4
.LBB29_1:
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	ret
.LBB29_9:
	and	r8d, 2147483640
	xor	edi, edi
	xor	r9d, r9d
	xor	eax, eax
	.p2align	4, 0x90
.LBB29_10:                              # =>This Inner Loop Header: Depth=1
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
	jne	.LBB29_10
.LBB29_4:
	test	rcx, rcx
	je	.LBB29_7
# %bb.5:
	add	rsi, rdi
	xor	edi, edi
	.p2align	4, 0x90
.LBB29_6:                               # =>This Inner Loop Header: Depth=1
	movzx	r8d, byte ptr [rsi + rdi]
	mov	r9d, r8d
	and	r9b, dl
	or	al, r9b
	or	dl, r8b
	inc	rdi
	cmp	rcx, rdi
	jne	.LBB29_6
.LBB29_7:
	not	al
	and	al, dl
                                        # kill: def $al killed $al killed $eax
	ret
.Lfunc_end29:
	.size	unique_bits, .Lfunc_end29-unique_bits
	.cfi_endproc
                                        # -- End function
	.globl	pp_constraints                  # -- Begin function pp_constraints
	.p2align	4, 0x90
	.type	pp_constraints,@function
pp_constraints:                         # @pp_constraints
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
	mov	rbp, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [rbp]
	lea	r15, [rip + .L.str.21]
	lea	r12, [rip + .L.str.22]
	lea	r13, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	rsi, r15
	mov	rdx, r12
	mov	rcx, r13
	mov	r9d, 503
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbp]
	movzx	edx, byte ptr [rip + con]
	movzx	ecx, byte ptr [rip + con+1]
	movzx	r8d, byte ptr [rip + con+2]
	movzx	r9d, byte ptr [rip + con+3]
	movzx	r10d, byte ptr [rip + con+4]
	movzx	r11d, byte ptr [rip + con+5]
	movzx	ebx, byte ptr [rip + con+6]
	movzx	r14d, byte ptr [rip + con+7]
	lea	rsi, [rip + .L.str.78]
	xor	eax, eax
	push	r14
	.cfi_adjust_cfa_offset 8
	push	rbx
	.cfi_adjust_cfa_offset 8
	push	r11
	.cfi_adjust_cfa_offset 8
	push	r10
	.cfi_adjust_cfa_offset 8
	call	fprintf@PLT
	add	rsp, 32
	.cfi_adjust_cfa_offset -32
	mov	rsi, qword ptr [rbp]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbp]
	call	fflush@PLT
	mov	rdi, qword ptr [rbp]
	mov	rsi, r15
	mov	rdx, r12
	mov	rcx, r13
	lea	r8, [rip + .L.str.1]
	mov	r9d, 503
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbp]
	movzx	edx, byte ptr [rip + con+8]
	movzx	ecx, byte ptr [rip + con+9]
	movzx	r8d, byte ptr [rip + con+10]
	movzx	r9d, byte ptr [rip + con+11]
	movzx	r10d, byte ptr [rip + con+12]
	movzx	r11d, byte ptr [rip + con+13]
	movzx	ebx, byte ptr [rip + con+14]
	movzx	r14d, byte ptr [rip + con+15]
	lea	rsi, [rip + .L.str.78]
	xor	eax, eax
	push	r14
	.cfi_adjust_cfa_offset 8
	push	rbx
	.cfi_adjust_cfa_offset 8
	push	r11
	.cfi_adjust_cfa_offset 8
	push	r10
	.cfi_adjust_cfa_offset 8
	call	fprintf@PLT
	add	rsp, 32
	.cfi_adjust_cfa_offset -32
	mov	rsi, qword ptr [rbp]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbp]
	call	fflush@PLT
	mov	rdi, qword ptr [rbp]
	mov	rsi, r15
	mov	rdx, r12
	mov	rcx, r13
	lea	r8, [rip + .L.str.1]
	mov	r15, r8
	mov	r9d, 503
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbp]
	movzx	edx, byte ptr [rip + con+16]
	movzx	ecx, byte ptr [rip + con+17]
	movzx	r8d, byte ptr [rip + con+18]
	movzx	r9d, byte ptr [rip + con+19]
	movzx	r10d, byte ptr [rip + con+20]
	movzx	r11d, byte ptr [rip + con+21]
	movzx	ebx, byte ptr [rip + con+22]
	movzx	r14d, byte ptr [rip + con+23]
	lea	rsi, [rip + .L.str.78]
	xor	eax, eax
	push	r14
	.cfi_adjust_cfa_offset 8
	push	rbx
	.cfi_adjust_cfa_offset 8
	push	r11
	.cfi_adjust_cfa_offset 8
	push	r10
	.cfi_adjust_cfa_offset 8
	call	fprintf@PLT
	add	rsp, 32
	.cfi_adjust_cfa_offset -32
	mov	rsi, qword ptr [rbp]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbp]
	call	fflush@PLT
	mov	rdi, qword ptr [rbp]
	lea	rsi, [rip + .L.str.21]
	mov	rdx, r12
	mov	rcx, r13
	mov	r8, r15
	mov	r9d, 503
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbp]
	movzx	edx, byte ptr [rip + con+24]
	movzx	ecx, byte ptr [rip + con+25]
	movzx	r8d, byte ptr [rip + con+26]
	movzx	r9d, byte ptr [rip + con+27]
	movzx	r10d, byte ptr [rip + con+28]
	movzx	r11d, byte ptr [rip + con+29]
	movzx	ebx, byte ptr [rip + con+30]
	movzx	r14d, byte ptr [rip + con+31]
	lea	rsi, [rip + .L.str.78]
	xor	eax, eax
	push	r14
	.cfi_adjust_cfa_offset 8
	push	rbx
	.cfi_adjust_cfa_offset 8
	push	r11
	.cfi_adjust_cfa_offset 8
	push	r10
	.cfi_adjust_cfa_offset 8
	call	fprintf@PLT
	add	rsp, 32
	.cfi_adjust_cfa_offset -32
	mov	rsi, qword ptr [rbp]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbp]
	call	fflush@PLT
	mov	rdi, qword ptr [rbp]
	lea	rsi, [rip + .L.str.21]
	mov	rdx, r12
	mov	rcx, r13
	mov	r8, r15
	mov	r9d, 503
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbp]
	movzx	edx, byte ptr [rip + con+32]
	movzx	ecx, byte ptr [rip + con+33]
	movzx	r8d, byte ptr [rip + con+34]
	movzx	r9d, byte ptr [rip + con+35]
	movzx	r10d, byte ptr [rip + con+36]
	movzx	r11d, byte ptr [rip + con+37]
	movzx	ebx, byte ptr [rip + con+38]
	movzx	r14d, byte ptr [rip + con+39]
	lea	rsi, [rip + .L.str.78]
	xor	eax, eax
	push	r14
	.cfi_adjust_cfa_offset 8
	push	rbx
	.cfi_adjust_cfa_offset 8
	push	r11
	.cfi_adjust_cfa_offset 8
	push	r10
	.cfi_adjust_cfa_offset 8
	call	fprintf@PLT
	add	rsp, 32
	.cfi_adjust_cfa_offset -32
	mov	rsi, qword ptr [rbp]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbp]
	call	fflush@PLT
	mov	rdi, qword ptr [rbp]
	lea	rsi, [rip + .L.str.21]
	mov	rdx, r12
	mov	rcx, r13
	mov	r8, r15
	mov	r9d, 503
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbp]
	movzx	edx, byte ptr [rip + con+40]
	movzx	ecx, byte ptr [rip + con+41]
	movzx	r8d, byte ptr [rip + con+42]
	movzx	r9d, byte ptr [rip + con+43]
	movzx	r10d, byte ptr [rip + con+44]
	movzx	r11d, byte ptr [rip + con+45]
	movzx	ebx, byte ptr [rip + con+46]
	movzx	r14d, byte ptr [rip + con+47]
	lea	rsi, [rip + .L.str.78]
	xor	eax, eax
	push	r14
	.cfi_adjust_cfa_offset 8
	push	rbx
	.cfi_adjust_cfa_offset 8
	push	r11
	.cfi_adjust_cfa_offset 8
	push	r10
	.cfi_adjust_cfa_offset 8
	call	fprintf@PLT
	add	rsp, 32
	.cfi_adjust_cfa_offset -32
	mov	rsi, qword ptr [rbp]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbp]
	call	fflush@PLT
	mov	rdi, qword ptr [rbp]
	lea	rsi, [rip + .L.str.21]
	mov	rdx, r12
	mov	rcx, r13
	mov	r8, r15
	mov	r9d, 503
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbp]
	movzx	edx, byte ptr [rip + con+48]
	movzx	ecx, byte ptr [rip + con+49]
	movzx	r8d, byte ptr [rip + con+50]
	movzx	r9d, byte ptr [rip + con+51]
	movzx	r10d, byte ptr [rip + con+52]
	movzx	r11d, byte ptr [rip + con+53]
	movzx	ebx, byte ptr [rip + con+54]
	movzx	r14d, byte ptr [rip + con+55]
	lea	rsi, [rip + .L.str.78]
	xor	eax, eax
	push	r14
	.cfi_adjust_cfa_offset 8
	push	rbx
	.cfi_adjust_cfa_offset 8
	push	r11
	.cfi_adjust_cfa_offset 8
	push	r10
	.cfi_adjust_cfa_offset 8
	call	fprintf@PLT
	add	rsp, 32
	.cfi_adjust_cfa_offset -32
	mov	rsi, qword ptr [rbp]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbp]
	call	fflush@PLT
	mov	rdi, qword ptr [rbp]
	lea	rsi, [rip + .L.str.21]
	mov	rdx, r12
	mov	rcx, r13
	mov	r8, r15
	mov	r9d, 503
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbp]
	movzx	edx, byte ptr [rip + con+56]
	movzx	ecx, byte ptr [rip + con+57]
	movzx	r8d, byte ptr [rip + con+58]
	movzx	r9d, byte ptr [rip + con+59]
	movzx	r10d, byte ptr [rip + con+60]
	movzx	r11d, byte ptr [rip + con+61]
	movzx	ebx, byte ptr [rip + con+62]
	movzx	r14d, byte ptr [rip + con+63]
	lea	rsi, [rip + .L.str.78]
	xor	eax, eax
	push	r14
	.cfi_adjust_cfa_offset 8
	push	rbx
	.cfi_adjust_cfa_offset 8
	push	r11
	.cfi_adjust_cfa_offset 8
	push	r10
	.cfi_adjust_cfa_offset 8
	call	fprintf@PLT
	add	rsp, 32
	.cfi_adjust_cfa_offset -32
	mov	rsi, qword ptr [rbp]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbp]
	call	fflush@PLT
	mov	rdi, qword ptr [rbp]
	lea	rsi, [rip + .L.str.21]
	mov	rdx, r12
	mov	rcx, r13
	mov	r8, r15
	mov	r9d, 505
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [rbp]
	movzx	edx, byte ptr [rip + con+64]
	movzx	ecx, byte ptr [rip + con+65]
	movzx	r8d, byte ptr [rip + con+66]
	movzx	r9d, byte ptr [rip + con+67]
	movzx	r10d, byte ptr [rip + con+68]
	movzx	r11d, byte ptr [rip + con+69]
	movzx	ebx, byte ptr [rip + con+70]
	movzx	r14d, byte ptr [rip + con+71]
	lea	rsi, [rip + .L.str.81]
	xor	eax, eax
	push	r14
	.cfi_adjust_cfa_offset 8
	push	rbx
	.cfi_adjust_cfa_offset 8
	push	r11
	.cfi_adjust_cfa_offset 8
	push	r10
	.cfi_adjust_cfa_offset 8
	call	fprintf@PLT
	add	rsp, 32
	.cfi_adjust_cfa_offset -32
	mov	rsi, qword ptr [rbp]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [rbp]
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
	jmp	fflush@PLT                      # TAILCALL
.Lfunc_end30:
	.size	pp_constraints, .Lfunc_end30-pp_constraints
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0                          # -- Begin function solver_win
.LCPI31_0:
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
.LCPI31_1:
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
.LCPI31_2:
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
	jle	.LBB31_8
# %bb.1:
	cmp	ecx, 16
	jae	.LBB31_3
# %bb.2:
	xor	edx, edx
	mov	esi, eax
	jmp	.LBB31_13
.LBB31_3:
	cmp	ecx, 128
	jae	.LBB31_9
# %bb.4:
	xor	edx, edx
	mov	esi, eax
	jmp	.LBB31_5
.LBB31_9:
	mov	edx, ecx
	and	edx, 2147483520
	vpbroadcastb	ymm0, byte ptr [rip + .LCPI31_2] # ymm0 = [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
	vpinsrb	xmm1, xmm0, eax, 0
	vpblendd	ymm0, ymm0, ymm1, 15            # ymm0 = ymm1[0,1,2,3],ymm0[4,5,6,7]
	vpcmpeqd	ymm1, ymm1, ymm1
	xor	esi, esi
	lea	rdi, [rip + con]
	vpcmpeqd	ymm2, ymm2, ymm2
	vpcmpeqd	ymm3, ymm3, ymm3
	.p2align	4, 0x90
.LBB31_10:                              # =>This Inner Loop Header: Depth=1
	vpand	ymm0, ymm0, ymmword ptr [rsi + rdi + 64]
	vpand	ymm1, ymm1, ymmword ptr [rsi + rdi + 96]
	vpand	ymm2, ymm2, ymmword ptr [rsi + rdi + 128]
	vpand	ymm3, ymm3, ymmword ptr [rsi + rdi + 160]
	sub	rsi, -128
	cmp	rdx, rsi
	jne	.LBB31_10
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
	je	.LBB31_8
# %bb.12:
	test	cl, 112
	je	.LBB31_13
.LBB31_5:
	mov	rdi, rdx
	mov	edx, ecx
	and	edx, 2147483632
	vpbroadcastb	xmm0, byte ptr [rip + .LCPI31_2] # xmm0 = [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
	vpinsrb	xmm0, xmm0, esi, 0
	lea	rsi, [rip + con]
	.p2align	4, 0x90
.LBB31_6:                               # =>This Inner Loop Header: Depth=1
	vpand	xmm0, xmm0, xmmword ptr [rdi + rsi + 64]
	add	rdi, 16
	cmp	rdx, rdi
	jne	.LBB31_6
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
	je	.LBB31_8
.LBB31_13:
	lea	rdi, [rip + con]
	.p2align	4, 0x90
.LBB31_14:                              # =>This Inner Loop Header: Depth=1
	and	sil, byte ptr [rdx + rdi + 64]
	inc	rdx
	cmp	rcx, rdx
	jne	.LBB31_14
.LBB31_8:
	cmp	sil, al
	sete	al
	vzeroupper
	ret
.Lfunc_end31:
	.size	solver_win, .Lfunc_end31-solver_win
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
.Lfunc_end32:
	.size	swap, .Lfunc_end32-swap
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
	jne	.LBB33_1
# %bb.6:
	movsxd	rax, dword ptr [rip + sequence_pos]
	lea	rdi, [r14 + 8*rax]
	movsxd	rdx, ebp
	mov	rsi, rbx
	call	memcpy@PLT
	inc	dword ptr [rip + sequence_pos]
	jmp	.LBB33_7
.LBB33_1:
	jl	.LBB33_7
# %bb.2:
	mov	r12d, ecx
	lea	r15d, [r12 - 1]
	test	r12b, 1
	jne	.LBB33_5
# %bb.3:
	mov	r12d, r12d
	xor	r13d, r13d
	.p2align	4, 0x90
.LBB33_4:                               # =>This Inner Loop Header: Depth=1
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
	jne	.LBB33_4
	jmp	.LBB33_7
	.p2align	4, 0x90
.LBB33_5:                               # =>This Inner Loop Header: Depth=1
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
	jne	.LBB33_5
.LBB33_7:
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
.Lfunc_end33:
	.size	permutations, .Lfunc_end33-permutations
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function generate_valid_sequences
.LCPI34_0:
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
.LCPI34_1:
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
.LCPI34_2:
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
.LCPI34_3:
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
.LCPI34_4:
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	2                               # 0x2
	.long	4                               # 0x4
	.long	6                               # 0x6
.LCPI34_5:
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
.LCPI34_6:
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
.LCPI34_7:
	.byte	0                               # 0x0
	.byte	8                               # 0x8
	.section	.rodata.cst8,"aM",@progbits,8
.LCPI34_8:
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
.LCPI34_9:
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
	je	.LBB34_1
# %bb.25:
	movsxd	rax, edi
	lea	rcx, [rip + con]
	lea	rsi, [rcx + 8*rax]
	mov	ebx, dword ptr [rip + length]
	movsxd	rdx, ebx
	mov	rdi, rsp
	call	memcpy@PLT
	jmp	.LBB34_13
.LBB34_1:
	movsxd	rax, dword ptr [rip + length]
	mov	ebx, eax
	test	rax, rax
	jle	.LBB34_13
# %bb.2:
	movsxd	rcx, edi
	cmp	ebx, 17
	jae	.LBB34_4
# %bb.3:
	xor	edx, edx
	jmp	.LBB34_11
.LBB34_4:
	cmp	ebx, 33
	jae	.LBB34_8
# %bb.5:
	xor	edx, edx
	jmp	.LBB34_6
.LBB34_8:
	mov	edx, eax
	and	edx, 31
	mov	esi, 32
	cmovne	rsi, rdx
	mov	rdx, rax
	sub	rdx, rsi
	xor	edi, edi
	lea	r8, [rip + con]
	vpbroadcastw	xmm0, word ptr [rip + .LCPI34_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI34_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI34_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI34_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpmovsxbd	ymm4, qword ptr [rip + .LCPI34_8] # ymm4 = [0,2,2,3,0,2,4,6]
	vpbroadcastd	ymm5, dword ptr [rip + .LCPI34_9] # ymm5 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	vpbroadcastd	ymm6, dword ptr [rip + .LCPI34_9] # ymm6 = [0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12,0,4,8,12]
	.p2align	4, 0x90
.LBB34_9:                               # =>This Inner Loop Header: Depth=1
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
	jne	.LBB34_9
# %bb.10:
	cmp	esi, 16
	jbe	.LBB34_11
.LBB34_6:
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
	vpbroadcastw	xmm0, word ptr [rip + .LCPI34_7] # xmm0 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm1, word ptr [rip + .LCPI34_7] # xmm1 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm2, word ptr [rip + .LCPI34_7] # xmm2 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	vpbroadcastw	xmm3, word ptr [rip + .LCPI34_7] # xmm3 = [0,8,0,8,0,8,0,8,0,8,0,8,0,8,0,8]
	.p2align	4, 0x90
.LBB34_7:                               # =>This Inner Loop Header: Depth=1
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
	jne	.LBB34_7
.LBB34_11:
	lea	rsi, [rsp + rdx]
	lea	rdi, [rcx + 8*rdx]
	lea	rcx, [rip + con]
	add	rcx, rdi
	sub	rax, rdx
	xor	edx, edx
	.p2align	4, 0x90
.LBB34_12:                              # =>This Inner Loop Header: Depth=1
	movzx	edi, byte ptr [rcx + 8*rdx]
	mov	byte ptr [rsi + rdx], dil
	inc	rdx
	cmp	rax, rdx
	jne	.LBB34_12
.LBB34_13:
	movsxd	rdx, ebx
	xor	r14d, r14d
	mov	rax, qword ptr [rip + all_sequences]
	mov	ebp, 1
	lea	r12, [rip + .Lconstinit.96]
	xor	r15d, r15d
	jmp	.LBB34_14
	.p2align	4, 0x90
.LBB34_19:                              #   in Loop: Header=BB34_14 Depth=1
	movsxd	r15, r15d
	lea	rdi, [8*r15]
	add	rdi, qword ptr [rip + valid_sequences]
	lea	rsi, [rax + 8*r14]
	vzeroupper
	call	memcpy@PLT
	inc	r15d
	mov	ebx, dword ptr [rip + length]
	mov	rax, qword ptr [rip + all_sequences]
.LBB34_23:                              #   in Loop: Header=BB34_14 Depth=1
	inc	r14
	movsxd	rdx, ebx
	mov	ecx, dword ptr [r12 + 4*rdx]
	cmp	r14, rcx
	jae	.LBB34_20
.LBB34_14:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB34_16 Depth 2
	test	ebx, ebx
	jle	.LBB34_19
# %bb.15:                               #   in Loop: Header=BB34_14 Depth=1
	mov	ecx, ebx
	mov	r8b, 1
	lea	rsi, [rax + 8*r14]
	xor	edi, edi
	jmp	.LBB34_16
	.p2align	4, 0x90
.LBB34_22:                              #   in Loop: Header=BB34_16 Depth=2
	inc	rdi
	xor	r8d, r8d
	cmp	rdi, rcx
	je	.LBB34_23
.LBB34_16:                              #   Parent Loop BB34_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	test	r8b, 1
	je	.LBB34_22
# %bb.17:                               #   in Loop: Header=BB34_16 Depth=2
	movzx	r8d, byte ptr [rdi + rsi]
	add	r8b, -49
	shlx	r9d, ebp, r8d
	and	r9b, byte ptr [rsp + rdi]
	setne	r8b
	inc	rdi
	cmp	rdi, rcx
	jne	.LBB34_16
# %bb.18:                               #   in Loop: Header=BB34_14 Depth=1
	test	r9b, r9b
	jne	.LBB34_19
	jmp	.LBB34_23
.LBB34_20:
	mov	rax, qword ptr fs:[40]
	cmp	rax, qword ptr [rsp + 8]
	jne	.LBB34_24
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
.LBB34_24:
	.cfi_def_cfa_offset 64
	vzeroupper
	call	__stack_chk_fail@PLT
.Lfunc_end34:
	.size	generate_valid_sequences, .Lfunc_end34-generate_valid_sequences
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
	je	.LBB35_1
# %bb.2:
	movsxd	rax, esi
	mov	qword ptr [rsp + 88], rax       # 8-byte Spill
	mov	r9d, dword ptr [rip + length]
	mov	r14, qword ptr [rip + valid_sequences]
	mov	r15d, 3
	mov	r12, -1
	xor	r13d, r13d
	test	dl, dl
	je	.LBB35_3
# %bb.6:
	mov	qword ptr [rsp + 16], 0         # 8-byte Folded Spill
	xor	ebp, ebp
	jmp	.LBB35_7
	.p2align	4, 0x90
.LBB35_22:                              #   in Loop: Header=BB35_7 Depth=1
	inc	rbp
	add	r15, 8
	add	r12, 8
	add	r13, 8
	cmp	rbp, qword ptr [rsp + 96]       # 8-byte Folded Reload
	je	.LBB35_23
.LBB35_7:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB35_12 Depth 2
                                        #     Child Loop BB35_17 Depth 2
	lea	rsi, [r14 + 8*rbp]
	test	r9d, r9d
	jle	.LBB35_8
# %bb.9:                                #   in Loop: Header=BB35_7 Depth=1
	mov	qword ptr [rsp + 40], rbp       # 8-byte Spill
	mov	qword ptr [rsp + 48], r13       # 8-byte Spill
	mov	edx, r9d
	mov	dword ptr [rsp + 28], r9d       # 4-byte Spill
	cmp	r9d, 4
	mov	qword ptr [rsp + 72], r14       # 8-byte Spill
	mov	qword ptr [rsp + 64], r15       # 8-byte Spill
	mov	qword ptr [rsp + 56], r12       # 8-byte Spill
	mov	qword ptr [rsp + 32], rsi       # 8-byte Spill
	jae	.LBB35_11
# %bb.10:                               #   in Loop: Header=BB35_7 Depth=1
	mov	bpl, 48
	xor	edi, edi
	mov	r10b, 48
	xor	r9d, r9d
	xor	r8d, r8d
.LBB35_15:                              #   in Loop: Header=BB35_7 Depth=1
	mov	eax, edx
	and	eax, 3
	mov	r14, qword ptr [rsp + 72]       # 8-byte Reload
	mov	r12, qword ptr [rsp + 56]       # 8-byte Reload
	mov	r13, qword ptr [rsp + 48]       # 8-byte Reload
	je	.LBB35_18
# %bb.16:                               #   in Loop: Header=BB35_7 Depth=1
	add	rdx, r12
	sub	rdx, rdi
	add	rdx, r14
	add	rdi, r13
	add	rdi, r14
	xor	ecx, ecx
	.p2align	4, 0x90
.LBB35_17:                              #   Parent Loop BB35_7 Depth=1
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
	jne	.LBB35_17
.LBB35_18:                              #   in Loop: Header=BB35_7 Depth=1
	shl	r8b, 4
	or	r8b, r9b
	mov	r9d, dword ptr [rsp + 28]       # 4-byte Reload
	mov	r15, qword ptr [rsp + 64]       # 8-byte Reload
	mov	rbp, qword ptr [rsp + 40]       # 8-byte Reload
	mov	rsi, qword ptr [rsp + 32]       # 8-byte Reload
	jmp	.LBB35_19
	.p2align	4, 0x90
.LBB35_8:                               #   in Loop: Header=BB35_7 Depth=1
	xor	r8d, r8d
.LBB35_19:                              #   in Loop: Header=BB35_7 Depth=1
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
	jne	.LBB35_22
# %bb.20:                               #   in Loop: Header=BB35_7 Depth=1
	or	al, cl
	je	.LBB35_22
# %bb.21:                               #   in Loop: Header=BB35_7 Depth=1
	mov	rbx, qword ptr [rsp + 16]       # 8-byte Reload
	lea	rdi, [8*rbx]
	add	rdi, qword ptr [rip + filtered_sequences]
	movsxd	rdx, r9d
	call	memcpy@PLT
	inc	rbx
	mov	qword ptr [rsp + 16], rbx       # 8-byte Spill
	mov	r9d, dword ptr [rip + length]
	mov	r14, qword ptr [rip + valid_sequences]
	jmp	.LBB35_22
	.p2align	4, 0x90
.LBB35_11:                              #   in Loop: Header=BB35_7 Depth=1
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
	jmp	.LBB35_12
	.p2align	4, 0x90
.LBB35_14:                              #   in Loop: Header=BB35_12 Depth=2
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
	je	.LBB35_15
.LBB35_12:                              #   Parent Loop BB35_7 Depth=1
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
	jg	.LBB35_14
# %bb.13:                               #   in Loop: Header=BB35_12 Depth=2
	mov	ebp, r11d
	jmp	.LBB35_14
.LBB35_1:
	mov	qword ptr [rsp + 16], 0         # 8-byte Folded Spill
.LBB35_23:
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
.LBB35_3:
	.cfi_def_cfa_offset 160
	mov	qword ptr [rsp + 16], 0         # 8-byte Folded Spill
	xor	ebp, ebp
	jmp	.LBB35_4
	.p2align	4, 0x90
.LBB35_33:                              #   in Loop: Header=BB35_4 Depth=1
	inc	rbp
	add	r15, 8
	add	r12, 8
	add	r13, 8
	cmp	rbp, qword ptr [rsp + 96]       # 8-byte Folded Reload
	je	.LBB35_23
.LBB35_4:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB35_35 Depth 2
                                        #     Child Loop BB35_28 Depth 2
	lea	rsi, [r14 + 8*rbp]
	test	r9d, r9d
	jle	.LBB35_5
# %bb.24:                               #   in Loop: Header=BB35_4 Depth=1
	mov	qword ptr [rsp + 40], rbp       # 8-byte Spill
	mov	qword ptr [rsp + 48], r13       # 8-byte Spill
	mov	edx, r9d
	mov	dword ptr [rsp + 28], r9d       # 4-byte Spill
	cmp	r9d, 4
	mov	qword ptr [rsp + 72], r14       # 8-byte Spill
	mov	qword ptr [rsp + 64], r15       # 8-byte Spill
	mov	qword ptr [rsp + 56], r12       # 8-byte Spill
	mov	qword ptr [rsp + 32], rsi       # 8-byte Spill
	jae	.LBB35_34
# %bb.25:                               #   in Loop: Header=BB35_4 Depth=1
	mov	bpl, 48
	xor	edi, edi
	mov	r9b, 48
	xor	eax, eax
	xor	r8d, r8d
.LBB35_26:                              #   in Loop: Header=BB35_4 Depth=1
	mov	ecx, edx
	and	ecx, 3
	mov	r14, qword ptr [rsp + 72]       # 8-byte Reload
	mov	r12, qword ptr [rsp + 56]       # 8-byte Reload
	mov	r13, qword ptr [rsp + 48]       # 8-byte Reload
	je	.LBB35_29
# %bb.27:                               #   in Loop: Header=BB35_4 Depth=1
	add	rdx, r12
	sub	rdx, rdi
	add	rdx, r14
	add	rdi, r13
	add	rdi, r14
	xor	esi, esi
	.p2align	4, 0x90
.LBB35_28:                              #   Parent Loop BB35_4 Depth=1
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
	jne	.LBB35_28
.LBB35_29:                              #   in Loop: Header=BB35_4 Depth=1
	shl	r8b, 4
	or	r8b, al
	mov	r9d, dword ptr [rsp + 28]       # 4-byte Reload
	mov	r15, qword ptr [rsp + 64]       # 8-byte Reload
	mov	rbp, qword ptr [rsp + 40]       # 8-byte Reload
	mov	rsi, qword ptr [rsp + 32]       # 8-byte Reload
	jmp	.LBB35_30
	.p2align	4, 0x90
.LBB35_5:                               #   in Loop: Header=BB35_4 Depth=1
	xor	r8d, r8d
.LBB35_30:                              #   in Loop: Header=BB35_4 Depth=1
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
	jne	.LBB35_33
# %bb.31:                               #   in Loop: Header=BB35_4 Depth=1
	or	al, cl
	je	.LBB35_33
# %bb.32:                               #   in Loop: Header=BB35_4 Depth=1
	mov	rbx, qword ptr [rsp + 16]       # 8-byte Reload
	lea	rdi, [8*rbx]
	add	rdi, qword ptr [rip + filtered_sequences]
	movsxd	rdx, r9d
	call	memcpy@PLT
	inc	rbx
	mov	qword ptr [rsp + 16], rbx       # 8-byte Spill
	mov	r9d, dword ptr [rip + length]
	mov	r14, qword ptr [rip + valid_sequences]
	jmp	.LBB35_33
	.p2align	4, 0x90
.LBB35_34:                              #   in Loop: Header=BB35_4 Depth=1
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
	jmp	.LBB35_35
	.p2align	4, 0x90
.LBB35_37:                              #   in Loop: Header=BB35_35 Depth=2
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
	je	.LBB35_26
.LBB35_35:                              #   Parent Loop BB35_4 Depth=1
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
	jg	.LBB35_37
# %bb.36:                               #   in Loop: Header=BB35_35 Depth=2
	mov	ebp, r10d
	jmp	.LBB35_37
.Lfunc_end35:
	.size	generate_filtered_sequences, .Lfunc_end35-generate_filtered_sequences
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
	jle	.LBB36_1
# %bb.3:
	xor	ebp, ebp
	jmp	.LBB36_4
	.p2align	4, 0x90
.LBB36_7:                               #   in Loop: Header=BB36_4 Depth=1
	inc	ebx
	cmp	ebx, dword ptr [rip + length]
	jge	.LBB36_2
.LBB36_4:                               # =>This Inner Loop Header: Depth=1
	mov	eax, ebp
	mov	bpl, 1
	test	al, 1
	jne	.LBB36_7
# %bb.5:                                #   in Loop: Header=BB36_4 Depth=1
	mov	edi, ebx
	mov	esi, 1
	call	sequence_filtration
	test	al, al
	jne	.LBB36_7
# %bb.6:                                #   in Loop: Header=BB36_4 Depth=1
	mov	edi, ebx
	xor	esi, esi
	call	sequence_filtration
	mov	ebp, eax
	jmp	.LBB36_7
.LBB36_1:
	xor	ebp, ebp
.LBB36_2:
	mov	eax, ebp
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end36:
	.size	apply_sequence_filtration, .Lfunc_end36-apply_sequence_filtration
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0                          # -- Begin function solve
.LCPI37_0:
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
.LCPI37_1:
	.zero	32,48
.LCPI37_2:
	.zero	32,32
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI37_3:
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
.LCPI37_4:
	.zero	16,48
.LCPI37_5:
	.zero	16,16
	.section	.rodata,"a",@progbits
.LCPI37_6:
	.byte	48                              # 0x30
.LCPI37_7:
	.byte	16                              # 0x10
.LCPI37_8:
	.byte	32                              # 0x20
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
	push	rax
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
	mov	ecx, eax
	xor	eax, eax
	test	ecx, ecx
	jne	.LBB37_1
# %bb.13:
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	jne	.LBB37_22
.LBB37_14:
	lea	rsp, [rbp - 40]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.LBB37_1:
	.cfi_def_cfa rbp, 16
	mov	r13d, dword ptr [rip + length]
	test	ebx, ebx
	je	.LBB37_5
# %bb.2:
	mov	esi, ebx
	imul	esi, esi
	mov	edi, r13d
	imul	edi, edi
	mov	eax, -1
	shlx	eax, eax, ebx
	not	al
	cmp	esi, 1
	adc	esi, 0
	xor	ecx, ecx
	mov	r8d, 1
	movzx	r9d, al
	lea	r10, [rip + con]
	.p2align	4, 0x90
.LBB37_3:                               # =>This Inner Loop Header: Depth=1
	cmp	rdi, rcx
	je	.LBB37_23
# %bb.4:                                #   in Loop: Header=BB37_3 Depth=1
	mov	eax, ecx
	cdq
	idiv	r13d
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $eax killed $eax def $rax
	shl	eax, 4
	or	eax, edx
	shr	eax, 4
	and	eax, 15
	and	edx, 7
	movzx	r11d, byte ptr [r14 + rcx]
	lea	r15d, [r11 - 49]
	cmp	r11b, 45
	shlx	r11d, r8d, r15d
	cmove	r11d, r9d
	lea	r15, [r10 + 8*rax]
	mov	byte ptr [rdx + r15], r11b
	mov	byte ptr [rax + r10 + 64], 0
	inc	rcx
	cmp	rsi, rcx
	jne	.LBB37_3
.LBB37_5:
	movsxd	r15, ebx
	lea	r12, [rip + .Lconstinit.96]
	mov	edi, dword ptr [r12 + 4*r15]
	shl	rdi, 3
	call	malloc@PLT
	mov	r14, rsp
	mov	qword ptr [rip + all_sequences], rax
	mov	rdx, rsp
	add	r13, 15
	and	r13, -16
	sub	rdx, r13
	mov	rsp, rdx
	mov	ecx, dword ptr [rip + length]
	test	ecx, ecx
	jle	.LBB37_12
# %bb.6:
	mov	esi, 1
	cmp	ecx, 16
	jb	.LBB37_20
# %bb.7:
	cmp	ecx, 32
	jae	.LBB37_15
# %bb.8:
	mov	edi, 1
	xor	eax, eax
.LBB37_9:
	mov	r8d, ecx
	and	r8d, 2147483632
	lea	rsi, [r8 + 1]
	vmovd	xmm0, edi
	vpbroadcastb	xmm0, xmm0
	vpaddb	xmm0, xmm0, xmmword ptr [rip + .LCPI37_3]
	vpbroadcastb	xmm1, byte ptr [rip + .LCPI37_6] # xmm1 = [48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48]
	vpbroadcastb	xmm2, byte ptr [rip + .LCPI37_7] # xmm2 = [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16]
	.p2align	4, 0x90
.LBB37_10:                              # =>This Inner Loop Header: Depth=1
	vpaddb	xmm3, xmm0, xmm1
	vmovdqa	xmmword ptr [rdx + rax], xmm3
	add	rax, 16
	vpaddb	xmm0, xmm0, xmm2
	cmp	r8, rax
	jne	.LBB37_10
# %bb.11:
	cmp	r8d, ecx
	jne	.LBB37_20
	jmp	.LBB37_12
.LBB37_15:
	mov	eax, ecx
	and	eax, 2147483616
	lea	rdi, [rax + 1]
	vmovdqa	ymm0, ymmword ptr [rip + .LCPI37_0] # ymm0 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]
	xor	esi, esi
	vpbroadcastb	ymm1, byte ptr [rip + .LCPI37_6] # ymm1 = [48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48]
	vpbroadcastb	ymm2, byte ptr [rip + .LCPI37_8] # ymm2 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	.p2align	4, 0x90
.LBB37_16:                              # =>This Inner Loop Header: Depth=1
	vpaddb	ymm3, ymm0, ymm1
	vmovdqu	ymmword ptr [rdx + rsi], ymm3
	add	rsi, 32
	vpaddb	ymm0, ymm0, ymm2
	cmp	rax, rsi
	jne	.LBB37_16
# %bb.17:
	cmp	eax, ecx
	je	.LBB37_12
# %bb.18:
	test	cl, 16
	jne	.LBB37_9
# %bb.19:
	or	rax, 1
	mov	rsi, rax
.LBB37_20:
	lea	rax, [rcx + 1]
	.p2align	4, 0x90
.LBB37_21:                              # =>This Inner Loop Header: Depth=1
	lea	edi, [rsi + 48]
	mov	byte ptr [rdx + rsi - 1], dil
	inc	rsi
	cmp	rax, rsi
	jne	.LBB37_21
.LBB37_12:
	mov	dword ptr [rip + sequence_pos], 0
	mov	rdi, qword ptr [rip + all_sequences]
	mov	esi, ecx
                                        # kill: def $ecx killed $ecx killed $rcx
	vzeroupper
	call	permutations
	mov	r13, qword ptr [rip + stderr@GOTPCREL]
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.21]
	lea	rdx, [rip + .L.str.22]
	lea	rcx, [rip + .L.str.23]
	lea	r8, [rip + .L.str.1]
	mov	r9d, 721
	xor	eax, eax
	call	fprintf@PLT
	mov	rdi, qword ptr [r13]
	lea	rsi, [rip + .L.str.94]
	mov	edx, ebx
	xor	eax, eax
	call	fprintf@PLT
	mov	rsi, qword ptr [r13]
	mov	edi, 10
	call	fputc@PLT
	mov	rdi, qword ptr [r13]
	call	fflush@PLT
	mov	ebx, dword ptr [r12 + 4*r15]
	shl	rbx, 3
	mov	rdi, rbx
	call	malloc@PLT
	mov	qword ptr [rip + valid_sequences], rax
	mov	rdi, rbx
	call	malloc@PLT
	mov	qword ptr [rip + filtered_sequences], rax
	call	pp_constraints
	call	edge_clue_initialization
	call	pp_constraints
	call	print_board
	mov	rdi, qword ptr [rip + all_sequences]
	call	free@PLT
	mov	rdi, qword ptr [rip + valid_sequences]
	call	free@PLT
	mov	rdi, qword ptr [rip + filtered_sequences]
	call	free@PLT
	mov	eax, 1
	mov	rsp, r14
	mov	rcx, qword ptr fs:[40]
	cmp	rcx, qword ptr [rbp - 48]
	je	.LBB37_14
.LBB37_22:
	call	__stack_chk_fail@PLT
.LBB37_23:
	lea	rdi, [rip + .L.str]
	lea	rsi, [rip + .L.str.1]
	lea	rcx, [rip + .L__PRETTY_FUNCTION__.itopos]
	mov	edx, 25
	call	__assert_fail@PLT
.Lfunc_end37:
	.size	solve, .Lfunc_end37-solve
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
	.asciz	"n < cols * cols"
	.size	.L.str, 16

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"src/hw1.c"
	.size	.L.str.1, 10

	.type	.L__PRETTY_FUNCTION__.itopos,@object # @__PRETTY_FUNCTION__.itopos
.L__PRETTY_FUNCTION__.itopos:
	.asciz	"uint_fast8_t itopos(const int, const int)"
	.size	.L__PRETTY_FUNCTION__.itopos, 42

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"   "
	.size	.L.str.2, 4

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	" %d"
	.size	.L.str.3, 4

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\n   "
	.size	.L.str.4, 5

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	" v"
	.size	.L.str.5, 3

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"\n%d >"
	.size	.L.str.6, 6

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	" %c"
	.size	.L.str.7, 4

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	" < %d"
	.size	.L.str.8, 6

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	" ^"
	.size	.L.str.9, 3

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	" %8s%n"
	.size	.L.str.11, 7

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"Choose a piece (1-%d) or q to quit: "
	.size	.L.str.12, 37

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	" %8s"
	.size	.L.str.13, 5

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"q"
	.size	.L.str.14, 2

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"Invalid choice. "
	.size	.L.str.15, 17

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	"Choose a row (0-%d): "
	.size	.L.str.16, 22

	.type	.L.str.17,@object               # @.str.17
.L.str.17:
	.asciz	"Choose a column (0-%d): "
	.size	.L.str.17, 25

	.type	.L.str.21,@object               # @.str.21
.L.str.21:
	.asciz	"[ %s%-5s ] %s:%d: "
	.size	.L.str.21, 19

	.type	.L.str.22,@object               # @.str.22
.L.str.22:
	.zero	1
	.size	.L.str.22, 1

	.type	.L.str.23,@object               # @.str.23
.L.str.23:
	.asciz	"DEBUG"
	.size	.L.str.23, 6

	.type	.L.str.28,@object               # @.str.28
.L.str.28:
	.asciz	"key error r=%d: expected %d/%d, got %d/%d"
	.size	.L.str.28, 42

	.type	.L.str.31,@object               # @.str.31
.L.str.31:
	.asciz	"key success r=%d"
	.size	.L.str.31, 17

	.type	.L.str.34,@object               # @.str.34
.L.str.34:
	.asciz	"key error c=%d: expected %d/%d, got %d/%d"
	.size	.L.str.34, 42

	.type	.L.str.37,@object               # @.str.37
.L.str.37:
	.asciz	"key success c=%d"
	.size	.L.str.37, 17

	.type	.L.str.40,@object               # @.str.40
.L.str.40:
	.asciz	"size=%d"
	.size	.L.str.40, 8

	.type	.L.str.43,@object               # @.str.43
.L.str.43:
	.asciz	"initial_state=\"%s\""
	.size	.L.str.43, 19

	.type	.L.str.46,@object               # @.str.46
.L.str.46:
	.asciz	"keys=\"%s\""
	.size	.L.str.46, 10

	.type	.L.str.47,@object               # @.str.47
.L.str.47:
	.asciz	"size <= 8"
	.size	.L.str.47, 10

	.type	.L__PRETTY_FUNCTION__.initialize_board,@object # @__PRETTY_FUNCTION__.initialize_board
.L__PRETTY_FUNCTION__.initialize_board:
	.asciz	"int initialize_board(const char *, const char *, int)"
	.size	.L__PRETTY_FUNCTION__.initialize_board, 54

	.type	.L.str.48,@object               # @.str.48
.L.str.48:
	.asciz	"0 < size"
	.size	.L.str.48, 9

	.type	.L.str.51,@object               # @.str.51
.L.str.51:
	.asciz	"invalid state (must have >= %d chars): %s"
	.size	.L.str.51, 42

	.type	.L.str.55,@object               # @.str.55
.L.str.55:
	.asciz	"invalid keys (must have >= %d chars): %s"
	.size	.L.str.55, 41

	.type	con,@object                     # @con
	.bss
	.globl	con
con:
	.zero	72
	.size	con, 72

	.type	.L.str.56,@object               # @.str.56
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.56:
	.asciz	"single(bit)"
	.size	.L.str.56, 12

	.type	.L__PRETTY_FUNCTION__.bit_to_piece,@object # @__PRETTY_FUNCTION__.bit_to_piece
.L__PRETTY_FUNCTION__.bit_to_piece:
	.asciz	"char bit_to_piece(uint_fast8_t)"
	.size	.L__PRETTY_FUNCTION__.bit_to_piece, 32

	.type	.L.str.59,@object               # @.str.59
.L.str.59:
	.asciz	"placing '%c' at %d:%d"
	.size	.L.str.59, 22

	.type	.L.str.60,@object               # @.str.60
.L.str.60:
	.asciz	"min_bound > 0"
	.size	.L.str.60, 14

	.type	.L__PRETTY_FUNCTION__.edge_constraint,@object # @__PRETTY_FUNCTION__.edge_constraint
.L__PRETTY_FUNCTION__.edge_constraint:
	.asciz	"uint_fast8_t edge_constraint(int, int)"
	.size	.L__PRETTY_FUNCTION__.edge_constraint, 39

	.type	.L.str.63,@object               # @.str.63
.L.str.63:
	.asciz	"constraining %d:%d to %02X (from %02X)"
	.size	.L.str.63, 39

	.type	.L.str.66,@object               # @.str.66
.L.str.66:
	.asciz	"placing edge constraints"
	.size	.L.str.66, 25

	.type	.L.str.69,@object               # @.str.69
.L.str.69:
	.asciz	"propagating '%c' at %d:%d yielded new singles"
	.size	.L.str.69, 46

	.type	.L.str.72,@object               # @.str.72
.L.str.72:
	.asciz	"constrained %d:%d to %02X by row elimination (from %02X)"
	.size	.L.str.72, 57

	.type	.L.str.75,@object               # @.str.75
.L.str.75:
	.asciz	"constrained %d:%d to %02X by col elimination (from %02X)"
	.size	.L.str.75, 57

	.type	.L.str.78,@object               # @.str.78
.L.str.78:
	.asciz	"con.bv=[%02X %02X %02X %02X %02X %02X %02X %02X]"
	.size	.L.str.78, 49

	.type	.L.str.81,@object               # @.str.81
.L.str.81:
	.asciz	"con.pv=[%02X %02X %02X %02X %02X %02X %02X %02X]"
	.size	.L.str.81, 49

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

	.type	.L.str.85,@object               # @.str.85
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.85:
	.asciz	"%ld valid seq for %s %d"
	.size	.L.str.85, 24

	.type	.L.str.86,@object               # @.str.86
.L.str.86:
	.asciz	"row"
	.size	.L.str.86, 4

	.type	.L.str.87,@object               # @.str.87
.L.str.87:
	.asciz	"col"
	.size	.L.str.87, 4

	.type	.L.str.90,@object               # @.str.90
.L.str.90:
	.asciz	"%ld filtered seq for %s %d"
	.size	.L.str.90, 27

	.type	.L.str.94,@object               # @.str.94
.L.str.94:
	.asciz	"permutations done for n=%d"
	.size	.L.str.94, 27

	.type	.Lconstinit.96,@object          # @constinit.96
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.Lconstinit.96:
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	2                               # 0x2
	.long	6                               # 0x6
	.long	24                              # 0x18
	.long	120                             # 0x78
	.long	720                             # 0x2d0
	.long	5040                            # 0x13b0
	.long	40320                           # 0x9d80
	.size	.Lconstinit.96, 36

	.type	.Lstr,@object                   # @str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"Invalid choice. You violate one of the key requirements."
	.size	.Lstr, 57

	.type	.Lstr.97,@object                # @str.97
.Lstr.97:
	.asciz	"Invalid choice. There is already a building with that height in that row or column."
	.size	.Lstr.97, 84

	.type	.Lstr.98,@object                # @str.98
.Lstr.98:
	.asciz	"Invalid choice. That space is already occupied."
	.size	.Lstr.98, 48

	.type	.Lstr.101,@object               # @str.101
.Lstr.101:
	.asciz	"Invalid initial board state."
	.size	.Lstr.101, 29

	.ident	"clang version 19.1.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __stack_chk_fail
	.addrsig_sym board

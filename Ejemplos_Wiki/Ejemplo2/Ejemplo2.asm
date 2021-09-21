global asmFloatNormTwo
	section .text

asmFloatNormTwo:
	xorpd	xmm0,	xmm0    ;Se limpian los 64
	xorpd	xmm1,	xmm1
	cmp	rdx,	0
	je	done
next:
	movss	xmm0,	[rdi]    ;Se trabaja con 32
	mulss	xmm0,	xmm0
	addss	xmm1,	xmm0      ; a cuadrado + b cuadrado + c cuadrado .....
	add	rdi,	4
	sub	rsi,	1
	jnz	next	
done:
	sqrtss	xmm1,	xmm1      ; suma ^ 0.5
	movss	[rdx],	xmm1
	ret
;CodigoQue obtiene producto interno de dos vectores
;Recuerda que los punteros se pasan de un programa en c.

global asmFloatInnerProd
	section .text

asmFloatInnerProd:
	xorpd	xmm0,	xmm0     ; Xor de doubles.
	xorpd	xmm1,	xmm1     ; Xor de doubles
	xorpd	xmm2,	xmm2     ; Xor de doubles
	cmp	rdx,	0            ; Si el tamano de los vectores es 0 entonces terminamos.
	je	done
next:
	movss	xmm0,	[rdi]
	movss	xmm1,	[rsi]
	mulss	xmm0,	xmm1
	addss	xmm2,	xmm0
	add	rdi,	4
	add	rsi,	4
	sub	rdx,	1
	jnz	next	
done:
	movss	[rcx],	xmm2
	ret
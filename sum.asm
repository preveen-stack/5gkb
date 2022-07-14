;----------------------------------------------------
; a 64 bit program that returns the sum of elements in a floating point
; array. the function has prototype:
;
; double sum[double[] array, uint64_t length)
; -----------------------------------------------------------------------

		global sum
		section .text
sum:
		xorpd xmm0, xmm0			;initialize sum to zero
		cmp rsi, 0				; special case for length = 0
		je done
next:
		addsd xmm0, [rdi]			; add in the current array element
		add rdi, 8				; move to the next array element
		dec rsi					; count down
		jnz next				; if not down counting, contnue
done:
		ret					; return value already in xmm0

section .data
    one dq 1.0
    five dq 5.0
    ten dq 10.0
section .text
global score
score:
    mulsd xmm0, xmm0
    mulsd xmm1, xmm1
    addsd xmm0, xmm1
    sqrtsd xmm0, xmm0
    movsd xmm2, [rel one]
    comisd xmm0, xmm2
    jbe score10
    movsd xmm2, [rel five]
    comisd xmm0, xmm2
    jbe score5
    movsd xmm2, [rel ten]
    comisd xmm0, xmm2
    jbe score1
    jmp score0
    
score10:
    mov rax, 10
    jmp exit
score5:
    mov rax, 5
    jmp exit
score1:
    mov rax, 1
    jmp exit
score0:
    mov rax, 0
    jmp exit

exit:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif

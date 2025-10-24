section .text
global steps
extern printf
extern atoi

steps:
    test edi, edi
    js .error
    jz .error
    xor ecx, ecx
.loop:
    cmp edi, 1
    je .done
    mov eax, edi
    and eax, 1
    test eax, eax
    jz .even
    jmp .odd
.even:
    shr edi, 1
    inc ecx
    jmp .loop
.odd:
    imul edi, 3
    inc edi
    inc ecx
    jmp .loop
.error:
    mov rax, -1
    ret
.done:
    mov rax, rcx
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
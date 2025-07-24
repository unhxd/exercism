section .data
    fmt db "%d", 10, 0
    usage db "Usage: ./program <number>", 10, 0

section .text
    global main
    extern printf
    extern atoi

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    cmp edi, 2
    jne .usage_error
    mov rdi, [rsi + 8]
    call atoi
    test eax, eax
    jle .input_error
    mov edx, eax
    xor ecx, ecx
    
.collatz_loop:
    cmp edx, 1
    je .print_result
    test dl, 1
    jz .even_case
    lea edx, [edx + edx*2 + 1]
    jmp .increment_counter
    
.even_case:
    shr edx, 1
    
.increment_counter:
    inc ecx
    jmp .collatz_loop
    
.input_error:
    mov ecx, -1
    jmp .print_result
    
.usage_error:
    mov rdi, usage
    xor eax, eax
    call printf
    mov eax, 1
    jmp .cleanup
    
.print_result:
    mov rdi, fmt
    mov esi, ecx
    xor eax, eax
    call printf
    xor eax, eax
    
.cleanup:
    add rsp, 16
    pop rbp
    ret


%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif

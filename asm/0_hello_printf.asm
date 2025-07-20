.data
msg db "Goodbye, Mars!", 0
format db "%s", 10, 0

.code
extrn printf:proc

hello proc public
    lea rax, offset msg
    ret
hello endp

main proc
    sub rsp, 40
    
    call hello
    
    lea rcx, format
    mov rdx, rax
    call printf
    
    add rsp, 40
    xor eax, eax
    ret
main endp

end

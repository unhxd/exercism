.data
msg db "Hello, Reader!", 13, 10, 0

.code
extrn ExitProcess:proc
extrn GetStdHandle:proc  
extrn WriteConsoleA:proc

main proc
    sub rsp, 48

    mov rcx, -11
    call GetStdHandle
    mov r12, rax

    mov rcx, r12
    lea rdx, msg
    mov r8, 15
    lea r9, [rsp+32]
    mov qword ptr [rsp+32], 0
    mov qword ptr [rsp+40], 0
    call WriteConsoleA

    add rsp, 48
    xor rcx, rcx
    call ExitProcess
main endp

end
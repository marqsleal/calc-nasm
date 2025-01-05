section .text
    global division     ;  must be declared for linker (ld)

division:
    ; Param:
    ;   rdi: first number
    ;   rsi: second number
    ;   return: RAX

    ; Check if the second number is zero
    test rsi, rsi       ;  test if the second number is zero
    jz zero_error       ;  jump to zero_error if the second number is zero

    ; Division the first number by the second number
    mov rax, rdi        ;  move the first number to RAX
    cqo                 ;  Sign-extend RAX into RDX (required for division)
    idiv rsi            ;  Signed divide RDX:RAX by RSI; quotient -> RAX, remainder -> RDX
    ret                 ;  return the division value

zero_error:
    mov rax, 0          ;  move 0 to RAX
    ret                 ;  return 0

section .note.GNU-stack noalloc noexec nowrite progbits ; tell the linker that this section is not executable, writable, or allocatable

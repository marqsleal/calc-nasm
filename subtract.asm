section .text
    global subtract         ;  must be declared for linker (ld)

subtract:
    ; Param:
    ;   rdi: first number
    ;   rsi: second number
    ;   return: RAX
    mov rax, rdi            ;  move the first number to RAX
    sub rax, rsi            ;  subtract the second number to RAX
    ret                     ;  return the subtract value

section .note.GNU-stack noalloc noexec nowrite progbits ; tell the linker that this section is not executable, writable, or allocatable

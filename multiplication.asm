section .text
    global multiplication       ;  must be declared for linker (ld)

multiplication:
    ; Param:
    ;   rdi: first number
    ;   rsi: second number
    ;   return: RAX
    mov rax, rdi                ;  move the first number to RAX
    imul rax, rsi               ;  multiplication the second number to RAX
    ret                         ;  return the multiplication value

section .note.GNU-stack noalloc noexec nowrite progbits ; tell the linker that this section is not executable, writable, or allocatable

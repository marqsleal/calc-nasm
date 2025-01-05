section .text
    global sum              ;  must be declared for linker (ld)

sum:
    ; Param:
    ;   rdi: first number
    ;   rsi: second number
    ;   return: RAX
    mov rax, rdi            ;  move the first number to RAX
    add rax, rsi            ;  add the second number to RAX
    ret                     ;  return the sum value

section .note.GNU-stack noalloc noexec nowrite progbits ; tell the linker that this section is not executable, writable, or allocatable

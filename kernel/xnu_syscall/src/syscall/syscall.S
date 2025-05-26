
.global _call_syscall
_call_syscall:
#ifdef __ARM64__
    # Preserve stack and return value
    stp fp, lr, [sp, #-16]!
	mov fp, sp
    
    # Move `retargs` to a location where it won't be overwritten
    ldr x15, [sp, #24]

    # Get syscall number and activate syscall
    ldr w16, [sp, #16]      ; Syscall number
    svc #0x80

    str x0, [x15, #0]       ; First return arg
    str x1, [x15, #8]       ; Second return arg

    mrs x0, nzcv            ; System register that contains carry flag
    str x0, [x15, #16]

    # restore stack, frame, and return value
    mov sp, fp
	ldp fp, lr, [sp], #16
    ret

#elif defined(__x86_64__)
    # Get syscall number, fix arguments, and activate syscall
    movl    24(%rsp), %eax
    movq	%rcx, %r10
    syscall

    # Grab the pointer to `retargs`
    pushq   %rbx
    movq    40(%rsp), %rbx  # 32 + 8 (additional pushq)

    movq    %rax, (%rbx)    # First return arg
    movq    %rdx, 8(%rbx)   # Second return arg

    pushfq
    popq    %rax            # Get eflag
    movq    %rax, 16(%rbx)  

    # Restore rbx and return
    popq    %rbx
    retq

#else
#error "Missing architecture for `call_syscall`"
#endif

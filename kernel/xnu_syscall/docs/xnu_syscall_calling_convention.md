# XNU Syscall Calling Convention

> ⚠️ **WARNING**:
> Apple does not promise any ABI stability when calling their syscalls. The syscall calling convention may change between releases.

# Overview

## PPC

*TODO*

## i386

*TODO*

## arm

*TODO*

## x86-64

```
    #
    # Syscall class & number structure
    #
    
    # 0xAABBBBBB
    # --> `AA` represents the syscall class:
    # ----> 0 - Invalid
    # ----> 1 - Mach
    # ----> 2 - Unix/BSD
    # ----> 3 - Machine-dependent
    # ----> 4 - Diagnostics
    # ----> 5 - Mach IPC
    # --> `BBBBBB` represents the syscall number

    # Set the syscall class & number
    movl    0x1000001, %rax

    # Syscall arguments
    # Arguments 1 - 6 are stored in the register
    movl    $0, %rdi 
    movl    $1, %rsi
    movl    $2, %rdx
    movl    $3, %r10
    movl    $4, %r8
    movl    $5, %r9
    # Additional arguments are stored on the stack
    pushq   $N
    ; ...
    pushq   $7
    pushq   $6

    # While pretty much all of arguments match the C calling
    # convention, there is one exception to this rule...
    # Due to how the `syscall` instruction works, `rcx` will
    # be overwriten, so a different register will need to be used.
    ; movq	%rcx, %r10

    # Call syscall
    syscall

    # The unix syscall will set the carry flag if there is an
    # error. However... depending on the syscall number, 
    # machdep can also set the carry flag.
    #
    # --> If carry flag is 0, then no error has occured.
    # --> Otherwise, an error has occured.
    jnb		no_error

    #
    # Scenario 1: Unix syscall returns an error that is neither
    # ERESTART nor EJUSTRETURN
    #
    ; rax contains the error code (positive value)

    #
    # Scenario 2: Machdep syscall returns an error (error != 0)
    #
    ; rax contains the error code (positive value)

	b end

no_error:
    #
    # Scenario 1: Unix syscall
    #

    # --> Syscall with no return value
    ; (No changes)

    # --> Syscall with 1 return value
    ; rax contains the return value
    ; rdx is set to 0

    # --> Syscall with 2 return values
    ; rax contains the first return value
    ; rdx contains the second return value

    #
    # Scenario 2: Mach, Machdep, and Diagnostics syscall
    #
    ; rax contains the return value

end:
```

## arm64

```
    #
    # Syscall number structure
    #

    # --> 0x80000000 - platform syscall
    # --> If syscall number is negative:
    # ----> -3 - mach absolute time syscall
    # ----> -4 - mach continuous time syscall
    # ----> Any other negative number is a mach syscall
    # --> Else:
    # ----> Unix syscall number
    
    # Set the syscall number
    mov x16, 0

    # x0 to xN are syscall arguments:
    mov x0, 0
    mov x1, 1
    mov x2, 2
    ; ...
    mov xN, n
    
    # Call syscall (Apple always sets the svc number to 0x80)
    svc 0x80

    # The (unix) syscall will set the carry flag:
    # --> carry set = en error has occured
    # --> carry clear = no error has occured
    b.cc  no_error

    # Note that no other syscall sets the carry flag, only 
    # the unix syscall sets the flag

    # A syscall that returns an error that is neither
    # ERESTART nor EJUSTRETURN
    ; x0 contains the errno code (as a positive value)
    ; x1 is set to 0

    b end

no_error:
    #
    # Scenario 1: Unix syscall
    #

    # --> Syscall with no return value
    ; (No changes)

    # --> Syscall with 1 return value
    ; x0 contains the return value
    ; x1 is set to 0

    # --> Syscall with 2 return values
    ; x0 contains the first return value
    ; x1 contains the second return value

    #
    # Scenario 2: Platform & Mach syscall
    #
    ; x0 contains the return value

    #
    # Scenario 3: `mach_absolute_time` & `mach_continuous_time`
    #
    ; x0 contains the return value

end:
```

# Sources

* [x86-64 `UNIX_SYSCALL` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/custom/SYS.h#L134-L142)
  * [An explantion for `r10` replacing `rcx` as the fourth argument](https://stackoverflow.com/a/32480482)
* [x86-64 `hndl_syscall` assembly method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/x86_64/idt64.s#L1865-L1946)
  * [x86-64 `unix_syscall64` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/dev/i386/systemcalls.c#L287-L504)
  * [x86-64 `mach_call_munger64` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/i386/bsd_i386.c#L611-L727)
  * [x86-64 `machdep_syscall64` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/i386/bsd_i386.c#L378-L480)
  * [x86-64 `diagCall64` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/i386/Diagnostics.c#L128-L352)
* [arm64 `DO_SYSCALL` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/custom/SYS.h#L449-L458C3)
* [arm64 `handle_svc` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/arm64/sleh.c#L1624-L1669)
  * [arm64 `platform_syscall` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/arm64/machine_routines.c#L2503-L2540)
  * [arm64 `handle_mach_absolute_time_trap` & `handle_mach_continuous_time_trap` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/arm64/sleh.c#L1671-L1683)
  * [arm64 `mach_syscall` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/arm64/bsd_arm64.c#L172-L293)
  * [arm64 `unix_syscall` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/dev/arm/systemcalls.c#L82-L228)
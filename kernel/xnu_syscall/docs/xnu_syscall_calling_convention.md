# XNU Syscall Calling Convention

> ⚠️ **WARNING**:
> Apple does not promise any ABI stability when calling their syscalls. The syscall calling convention may change between releases.

# Overview

## PPC

*TODO*

## i386

```
/*
 * We have two entry points. int's is used for syscalls which need to preserve
 * %ecx across the call, or return a 64-bit value in %eax:%edx. sysenter is used
 * for the majority of syscalls which just return a value in %eax.
 */
```

```
#define UNIX_INT     0x80
```

```
#define UNIX_SYSCALL_TRAP	\
	int $(UNIX_INT)
```

```
LABEL(__sysenter_trap)
	popl %edx
	movl %esp, %ecx
	sysenter
```

```
#define UNIX_SYSCALL_SYSENTER		call __sysenter_trap
```

```
#if defined(__SYSCALL_32BIT_ARG_BYTES) && ((__SYSCALL_32BIT_ARG_BYTES >= 4) && (__SYSCALL_32BIT_ARG_BYTES <= 20))
#define UNIX_SYSCALL_NONAME(name, nargs, cerror)			\
	movl	$(SYS_##name | (__SYSCALL_32BIT_ARG_BYTES << I386_SYSCALL_ARG_BYTES_SHIFT)), %eax		;\
	UNIX_SYSCALL_SYSENTER					;\
	jnb	2f						;\
	BRANCH_EXTERN(tramp_##cerror)				;\
2:
#else /* __SYSCALL_32BIT_ARG_BYTES < 4 || > 20 */
#define UNIX_SYSCALL_NONAME(name, nargs, cerror)	\
	movl	$ SYS_##name, %eax			;\
	UNIX_SYSCALL_SYSENTER				;\
	jnb	2f					;\
	BRANCH_EXTERN(tramp_##cerror)			;\
2:
#endif


#define UNIX_SYSCALL_INT_NONAME(name, nargs)		\
	.globl	tramp_cerror_nocancel			;\
	movl	$ SYS_##name, %eax			;\
	UNIX_SYSCALL_TRAP				;\
	jnb	2f					;\
	BRANCH_EXTERN(tramp_cerror_nocancel) 		;\
2:
```

On i386 macOS, There are two ways to call a syscall By using either `sysenter` or `int`.

### sysenter

```
    movl	$(SYS_##name | (__SYSCALL_32BIT_ARG_BYTES << I386_SYSCALL_ARG_BYTES_SHIFT)), %eax
    # The way the syscall number is handled is a bit 
    # complicated... The main thing I noticed is that:
    # --> unix syscall is a positive number
    # --> mach syscall is a negative number

    # Set the syscall number
    movl	$0, %eax

    # All arguments lives in the stack

    push    N
    ; ...
    push    2
    push    1
    push    0

    # Call syscall
    call call_sysenter

    # The (unix) syscall will set the carry flag:
    # --> carry flag is set = an error has occured
    # --> carry flag is not set = no error has occured
    jnb	no_error

    #
    # Scenario 1: Unix syscall returns an error that is neither
    # ERESTART nor EJUSTRETURN
    #
    ; eax contains the error code

no_error:
    #
    # Scenario 1: Unix syscall
    #

    # If no error has occured
    ; eax contains the first return value (or zero)
    ; edx contains the second return value (or zero)

    #
    # Scenario 2: Mach syscall
    #
    ; eax contains the first return value

    ret

call_sysenter:
    # sysenter requires that the following registers are set:
    # --> %ecx - stack pointer for sysexit
    # --> %edx - return address
	popl %edx       ; Use the return address from `call``
	movl %esp, %ecx ; Use our current stack pointer for sysexit
	sysenter

```

### int

```

```

## arm

*TODO*

## PPC64

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

## Universal
* [*universal* `mach_traps.s` file](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/mach/mach_traps.s)
  * [*universal* `mach/syscall_sw.h` file](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/mach/syscall_sw.h)
* [*universal* `syscalls.master` file](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/kern/syscalls.master)

## i386

### User space
* [i386 `UNIX_SYSCALL_NONAME` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/custom/SYS.h#L81-L95) & [i386 `UNIX_SYSCALL_INT_NONAME` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/custom/SYS.h#L97-L103)
* [i386 `kernel_trap` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/mach/i386/syscall_sw.h#L86-L90)
* [i386 `MACHDEP_SYSCALL_TRAP` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/mach/i386/syscall_sw.h#L79-L80)

### Kernel space
* [i386 `idt64_..._scall` assembly methods](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/x86_64/idt64.s#L277-L303) & [i386 `hndl_sysenter` assembly method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/x86_64/idt64.s#L1803-L1810)
  * [1386 `unix_syscall` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/dev/i386/systemcalls.c#L80-L285)
  * [i386 `mach_call_munger` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/i386/bsd_i386.c#L487-L606)

## x86-64

### User space
* [x86-64 `UNIX_SYSCALL` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/custom/SYS.h#L134-L142)
  * [An explantion for `r10` replacing `rcx` as the fourth argument](https://stackoverflow.com/a/32480482)
* [x86-64 `kernel_trap` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/mach/i386/syscall_sw.h#L105-L117)
* [x86-64 `MACHDEP_SYSCALL_TRAP` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/mach/i386/syscall_sw.h#L102-L103)

### Kernel space
* [x86-64 `hndl_syscall` assembly method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/x86_64/idt64.s#L1865-L1946)
  * [x86-64 `unix_syscall64` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/dev/i386/systemcalls.c#L287-L504)
  * [x86-64 `mach_call_munger64` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/i386/bsd_i386.c#L611-L727)
  * [x86-64 `machdep_syscall64` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/i386/bsd_i386.c#L378-L480)
  * [x86-64 `diagCall64` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/i386/Diagnostics.c#L128-L352)

## arm64

### User space
* [arm64 `DO_SYSCALL` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/custom/SYS.h#L449-L458)
* [arm64 `kernel_trap` macro](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/mach/arm/syscall_sw.h#L110-L117)
* [arm64 `_thread_set_tsd_base` assembly method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/libsyscall/custom/custom.s#L137-L143)

### Kernel space
* [arm64 `handle_svc` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/arm64/sleh.c#L1624-L1669)
  * [arm64 `platform_syscall` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/arm64/machine_routines.c#L2503-L2540)
  * [arm64 `handle_mach_absolute_time_trap` & `handle_mach_continuous_time_trap` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/arm64/sleh.c#L1671-L1683)
  * [arm64 `mach_syscall` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/arm64/bsd_arm64.c#L172-L293)
  * [arm64 `unix_syscall` method](https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/dev/arm/systemcalls.c#L82-L228)
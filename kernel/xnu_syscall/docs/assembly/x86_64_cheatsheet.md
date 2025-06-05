# x86-64 ASM Cheatsheet

## Registers

Register | Role in the procedure call standard
-- | --
`rax` | Return argument or temporary register
`rdi`, `rsi`, `rcx`, `r8`, `r9` | Function argument or temporary register
`rdx` | Function argument, return argument or temporary register
`rsp` | Stack register
`rbp` | Frame register
`r10`, `r11` | Temporary register
`rbx`, `r12`, `r13`, `r14`, `r15` | Callee-saved register

64bit | 32bit  | 16-bit | upper 8bits of lower 16bits | 8bit
---   | ---    | ---    | ---                         | ---
`rax` | `eax`  | `ax`   | `ah`                        | `al`
`rbx` | `ebx`  | `bx`   | `bh`                        | `bl`
`rcx` | `ecx`  | `cx`   | `ch`                        | `cl`
`rdx` | `edx`  | `dx`   | `dh`                        | `dl`
`rsi` | `esi`  | `si`   |                             | `sil`
`rdi` | `edi`  | `di`   |                             | `dil`
`rsp` | `esp`  | `sp`   |                             | `spl`
`rbp` | `ebp`  | `bp`   |                             | `bpl`
`r8`  | `r8d`  | `r8w`  |                             | `r8b`
`r9`  | `r9d`  | `r9w`  |                             | `r9b`
`r10` | `r10d` | `r10w` |                             | `r10b`
`r11` | `r11d` | `r11w` |                             | `r11b`
`r12` | `r12d` | `r12w` |                             | `r12b`
`r13` | `r13d` | `r13w` |                             | `r13b`
`r14` | `r14d` | `r14w` |                             | `r14b`
`r15` | `r15d` | `r15w` |                             | `r15b`

## Calling Convention

### Arguments

```c
void calling_convention_args(
    uint8_t     reg_arg_1,
    uint16_t    reg_arg_2,
    uint32_t    reg_arg_3,
    uint64_t    reg_arg_4,
    uint64_t    reg_arg_5,
    uint64_t    reg_arg_6,

    uint8_t     stack_arg_1,
    uint16_t    stack_arg_2,
    uint32_t    stack_arg_3,
    uint64_t    stack_arg_4,
    uint64_t    stack_arg_5
);

void my_function(void) {
    calling_convention_args(
        0x11,
        0x22AA,
        0x33AA11BB,
        0x44AA11BB22CC33DD,
        0x55AA11BB22CC33DD,
        0x66AA11BB22CC33DD,

        0x77,
        0x11BB,
        0x22BB22CC,
        0x33BB22CC33DD44EE
        0x1
    );
}
```

```assembly
; The first 6 arguments live in the register
; --> For arugments that are 32bit or lower, they are set
;     in the 32bit register
movl    $0x11, %edi                 ; 1st argument
movl    $0x22aa, %esi               ; 2nd argument
movl    $0x33aa11bb, %edx           ; 3rd argument
movabsq $0x44aa11bb22cc33dd, %rcx   ; 4th argument
movabsq $0x55aa11bb22cc33dd, %r8    ; 5th argument
movabsq $0x66aa11bb22cc33dd, %r9    ; 6th argument

; It's important that you make sure the stack is aligned
; by 16 bytes. This will be important when you call a
; function.
subq    $0x8, %rsp

movabsq $0x33bb22cc33dd44ee, %rax

; Additional arguments live in the stack
; --> All stack arguments are 64bit size
pushq   $0x1            ; 11th argument
pushq   %rax            ; 10th argument
pushq   $0x22bb22cc     ; 9th argument
pushq   $0x11bb         ; 8th argument
pushq   $0x77           ; 7th argument
```

### Return Arguments

```c
uint8_t calling_convention_retarg_uint8(void) {
    return 0x11;
}

uint16_t calling_convention_retarg_uint16(void) {
    return 0x11AA;
}

uint32_t calling_convention_retarg_uint32(void) {
    return 0x11AA22BB;
}

uint64_t calling_convention_retarg_uint64(void) {
    return 0x11AA22BB33CC44DD;
}

__uint128_t calling_convention_retarg_uint128(void) {
    __uint128_t result;
    result = 0x11AA22BB33CC44DD;
    result = (result << 64) + 0x55EE66FF77AA88BB;
    return result;
}
```

```assembly
; x86-64 has two return arguments
; --> rax - First return argument
; --> rdx - Second return argument

_calling_convention_retarg_uint8:
    ; ...
    movl    $0x11, %eax
    ; ...

_calling_convention_retarg_uint16:
    ; ...
    movl    $0x11aa, %eax
    ; ...

_calling_convention_retarg_uint32:
    ; ...
    movl    $0x11aa22bb, %eax
    ; ...

_calling_convention_retarg_uint64:
    ; ...
    movabsq $0x11aa22bb33cc44dd, %rax
    ; ...

_calling_convention_retarg_uint128:
    ; ...
    movabsq $0x55ee66ff77aa88bb, %rax
    movabsq $0x11aa22bb33cc44dd, %rdx
    ; ...
```

### Creating & Calling A Function

```assembly
_caller_function:
    ; Preserve the original frame pointer and update the
    ; frame pointer to a new value. All functions must
    ; preserve the frame pointer.
    pushq   %rbp
    movq    %rsp, %rbp

    ; Some functions may use to stack to store additional
    ; values or arguments. It's important that the stack is
    ; aligned by 16 bytes.
    subq    $0x10, %rsp

    ; Function Arguments
    movq    $0x7, (%rsp)
    movl    $0x1, %edi
    movl    $0x2, %esi
    movl    $0x3, %edx
    movl    $0x4, %ecx
    movl    $0x5, %r8d
    movl    $0x6, %r9d

    ; The `callq` instruction will store the return address
    ; in the stack. If the stack is not properly aligned, you
    ; may risk your program crashing.
    callq   _callee_function

    ; If you borrow from the stack, you must restore the
    ; stack to it's original position.
    addq    $0x10, %rsp

    ; Restore the original frame pointer and return
    popq    %rbp
    retq
```

# Sources

* [Writing 64-bit Intel code for Apple Platforms](https://developer.apple.com/documentation/xcode/writing-64-bit-intel-code-for-apple-platforms)
* [x86-64 psABI](https://gitlab.com/x86-psABIs/x86-64-ABI)
* [CPU Registers x86-64](https://wiki.osdev.org/CPU_Registers_x86-64)

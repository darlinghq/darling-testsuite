# i386 ASM Cheatsheet

## Registers

Register | Role in the procedure call standard
-- | --
`eax` | Return register (1st argument) or scratch register
`ebx` | Global offset table base register for position-independent code
`ecx` | Scratch register
`edx` | Return register (2nd argument) or scratch register
`esi` | Callee-saved registers
`edi` | Callee-saved registers
`esp` | The stack pointer
`ebp` | The frame pointer

32bit  | 16-bit | upper 8bits of lower 16bits | 8bit
---    | ---    | ---                         | ---
`eax`  | `ax`   | `ah`                        | `al`
`ebx`  | `bx`   | `bh`                        | `bl`
`ecx`  | `cx`   | `ch`                        | `cl`
`edx`  | `dx`   | `dh`                        | `dl`
`esi`  | `si`   |                             | `sil`
`edi`  | `di`   |                             | `dil`
`esp`  | `sp`   |                             | `spl`
`ebp`  | `bp`   |                             | `bpl`

## Calling Convention

### Arguments

```c
void calling_convention_args(
    uint8_t a,
    uint16_t b,
    uint32_t c,
    uint64_t d
);

void my_function() {
    calling_convention_args(
        0x11,
        0x22AA,
        0x33BB44CC,
        0x44CC55DD66EE77FF
    );
}
```

```assembly
; All arguments live in the stack 
; --> All arguments that are 32bit or lower are stored as a
;     32bit value. 64bit arguments are split into two 32bit
;     values.

movl    $0x44CC55DD, 16(%eax)   ; 4th argument (higher half)
movl    $0x66EE77FF, 12(%eax)   ; 4th argument (lower half)

movl    $0x33BB44CC, 8(%eax)    ; 3rd argument
movl    $0x22AA, 4(%eax)        ; 2nd argument
movl    $0x11, (%eax)           ; 1st argument
```

### Return Arguments

```c
uint8_t calling_convention_retarg_8bit() {
    return 0x11;
}

uint16_t calling_convention_retarg_16bit() {
    return 0x11AA;
}

uint32_t calling_convention_retarg_32bit() {
    return 0x11AA22CC;
}

uint64_t calling_convention_retarg_64bit() {
    return 0x11AA22BB33CC44DD;
}
```

```assembly
; i386 has two return registers:
; --> %eax - First return value
; --> %edx - Second return value

calling_convention_retarg_8bit():
    ; ...
    movl    $0x11, %eax
    ; ...

calling_convention_retarg_16bit():
    ; ...
    movl    $0x11aa, %eax
    ; ...

calling_convention_retarg_32bit():
    ; ...
    movl    $0x11aa22cc, %eax
    ; ...

calling_convention_retarg_64bit():
    ; ...
    movl    $0x33cc44dd, %eax   ; 4th argument (lower half)
    movl    $0x11aa22bb, %edx   ; 4th argument (higher half)
    ; ...
```

### Creating & Calling A Function

```assembly
_caller_function:
    ; Push the original frame pointer to the stack
    pushl   %ebp
    ; Set the stack to the frame pointer
    movl    %esp, %ebp

    ; Unlike other operating systems, macOS requires that the stack
    ; must be aligned by 16 bytes.
    ;
    ; A consequence of this is that both `pushl` and `calll` would not
    ; be enough to satisify the 16 byte alignment requirement. Both
    ; instructions combined would only push 8 bytes to the stack.
    ;
    ; Which is why we need to reserve 8 additional bytes to keep the
    ; stack aligned.
    subl    $0x8, %esp
    
    ;
    ; Arguments
    ;

    ; We need to make sure our stack is still aligned once we
    ; finished pushing our arguments to the stack.
    subl    $0x8, %esp
    pushl   $0xb
    pushl   $0xa

    ; A return address is pushed to the the stack
    calll   _callee_function
    
    ; If you borrow from the stack, you must restore the
    ; stack to it's original position.
    addl    $0x18, %esp

    ; Restore the original frame pointer
    popl    %ebp
    ; Grab return pointer from the stack and return
    retl
```

## Sources

* [Mac OS X ABI Function Call Guide](https://leopard-adc.pepas.com/documentation/DeveloperTools/Conceptual/LowLevelABI/Mac_OS_X_ABI_Function_Calls.pdf)
* [SYSTEM V APPLICATION BINARY INTERFACE - Intel386 Architecture Processor Supplement](https://www.sco.com/developers/devspecs/abi386-4.pdf)
* [CPU Registers x86](https://wiki.osdev.org/CPU_Registers_x86)

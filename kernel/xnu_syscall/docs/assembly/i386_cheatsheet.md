# Calling Convention

## Arguments

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
        #
        # Arguments that are 64bit are split
        # into two arguments.
        #
        
        # 4th argument (higher half)
        movl    $0x44CC55DD, 16(%eax)
        # 4th argument (lower half)
        movl    $0x66EE77FF, 12(%eax)
        
        #
        # Arguments that are 32bit or lower are
        # stored as 32bit value.
        #

        # 3rd argument
        movl    $0x33BB44CC, 8(%eax)
        # 2nd argument
        movl    $0x22AA, 4(%eax)
        # 1st argument
        movl    $0x11, (%eax)
```

## Return Arguments

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
calling_convention_retarg_8bit():
        movb    $0x11, %al
        retl

calling_convention_retarg_16bit():
        movw    $0x11AA, %ax
        retl

calling_convention_retarg_32bit():
        movl    $0x11AA22CC, %eax
        retl

calling_convention_retarg_64bit():
        # 4th argument (lower half)
        movl    $0x33CC44DD, %eax
        # 4th argument (higher half)
        movl    $0x11AA22BB, %edx
        retl
```
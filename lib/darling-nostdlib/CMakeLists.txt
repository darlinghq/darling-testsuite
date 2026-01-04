set(nostdlib_source
    src/assert.c
    src/io.c
    src/math.c
    src/string.c
)

add_library(darling-nostdlib STATIC
    ${nostdlib_source}
)

target_link_libraries(darling-nostdlib darling-directsyscall)

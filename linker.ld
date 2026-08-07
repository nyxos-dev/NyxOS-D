ENTRY(_start)

SECTIONS {
    . = 1M;

    .multiboot : { *(.multiboot) }
    .text      : { *(.text*) }
    .rodata    : { *(.rodata*) *(.data.rel.ro*) }
    .data      : { *(.data*) }
    .bss       : { *(.bss*)  *(COMMON) }
}

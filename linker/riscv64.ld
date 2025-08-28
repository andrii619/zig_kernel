ENTRY(_start)

SECTIONS {
    . = 0x80000000; /* Load address */

    .text : {
        *(.text)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
        *(COMMON)
    }
}
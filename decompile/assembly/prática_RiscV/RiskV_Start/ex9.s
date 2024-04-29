.text
.globl _start

_start:
    ori x8, x0, 0x12345678
    li x20,24
    srl x9, x8, x20
    andi x9, x9, 0xFF

    li x20,16
    srl x10, x8, x20
    andi x10, x10, 0xFF

    li x20,8
    srl x11, x8, x20
    andi x11, x11, 0xFF

    andi x12, x8, 0xFF

    nop

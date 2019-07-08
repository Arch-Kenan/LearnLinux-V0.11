load_setup:
        mov     dx,#0x0000              ! drive 0, head 0
        mov     cx,#0x0002              ! sector 2, track 0
        mov     bx,#0x0200              ! address = 512, in INITSEG
        mov     ax,#0x0200+SETUPLEN     ! service 2, nr of sectors
        int     0x13                    ! read it
        jnc     ok_load_setup           ! ok - continue
        mov     dx,#0x0000
        mov     ax,#0x0000              ! reset the diskette
        int     0x13
        j       load_setup

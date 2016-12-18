	.file	"relay_control.c"
	.text
.Ltext0:
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.LC0:
	.string	"Init Relay\r"
	.text
	.literal_position
	.literal .LC1, .LC0
	.literal .LC2, 1610614788
	.literal .LC3, relaysstate
	.align	4
	.global	initrelaycontrol
	.type	initrelaycontrol, @function
initrelaycontrol:
.LFB0:
	.file 1 "src/relay_control.c"
	.loc 1 5 0
	.loc 1 6 0
	l32r	a2, .LC1
	.loc 1 5 0
	addi	sp, sp, -16
.LCFI0:
	s32i.n	a0, sp, 12
	.loc 1 6 0
	call0	puts
.LVL0:
	.loc 1 9 0
	l32r	a2, .LC2
	movi	a3, -0x131
	memw
	l32i.n	a4, a2, 0
	.loc 1 12 0
	l32i.n	a0, sp, 12
	.loc 1 9 0
	and	a3, a4, a3
	memw
	s32i.n	a3, a2, 0
	memw
	l32i.n	a4, a2, 0
	movi.n	a3, 0x30
	or	a3, a4, a3
	memw
	s32i.n	a3, a2, 0
	.loc 1 10 0
	l32r	a2, .LC3
	movi.n	a3, 0
	s32i.n	a3, a2, 0
	.loc 1 12 0
	addi	sp, sp, 16
.LCFI1:
	ret.n
.LFE0:
	.size	initrelaycontrol, .-initrelaycontrol
	.section	.rodata.str1.4
	.align	4
.LC5:
	.string	"Turn Relay %d \r\n"
	.text
	.literal_position
	.literal .LC4, 4096
	.literal .LC6, .LC5
	.literal .LC7, relaysstate
	.align	4
	.global	setrelaystate
	.type	setrelaystate, @function
setrelaystate:
.LFB1:
	.loc 1 15 0
.LVL1:
	addi	sp, sp, -16
.LCFI2:
	s32i.n	a12, sp, 8
	mov.n	a12, a2
	.loc 1 16 0
	l32r	a2, .LC6
.LVL2:
	mov.n	a3, a12
	.loc 1 15 0
	s32i.n	a0, sp, 12
	.loc 1 16 0
	call0	printf
.LVL3:
	.loc 1 18 0
	l32r	a2, .LC7
	l32r	a4, .LC4
	.loc 1 19 0
	movi.n	a5, 0
	.loc 1 18 0
	s32i.n	a12, a2, 0
	.loc 1 19 0
	extui	a3, a12, 0, 1
	mov.n	a2, a5
	moveqz	a2, a4, a3
	mov.n	a3, a2
	slli	a2, a12, 12
	call0	gpio_output_conf
.LVL4:
	.loc 1 21 0
	l32i.n	a0, sp, 12
	l32i.n	a12, sp, 8
.LVL5:
	addi	sp, sp, 16
.LCFI3:
	ret.n
.LFE1:
	.size	setrelaystate, .-setrelaystate
	.literal_position
	.literal .LC8, relaysstate
	.align	4
	.global	getrelaystate
	.type	getrelaystate, @function
getrelaystate:
.LFB2:
	.loc 1 24 0
	.loc 1 26 0
	l32r	a2, .LC8
	l32i.n	a2, a2, 0
	ret.n
.LFE2:
	.size	getrelaystate, .-getrelaystate
	.literal_position
	.literal .LC9, relaysstate
	.align	4
	.global	invertrelaystate
	.type	invertrelaystate, @function
invertrelaystate:
.LFB3:
	.loc 1 29 0
.LBB4:
.LBB5:
	.loc 1 25 0
	l32r	a2, .LC9
.LBE5:
.LBE4:
	.loc 1 31 0
	movi.n	a3, 1
	l32i.n	a4, a2, 0
	movi.n	a2, 0
	.loc 1 29 0
	addi	sp, sp, -16
.LCFI4:
	.loc 1 31 0
	moveqz	a2, a3, a4
	.loc 1 29 0
	s32i.n	a0, sp, 12
	.loc 1 31 0
	call0	setrelaystate
.LVL6:
	.loc 1 33 0
	l32i.n	a0, sp, 12
	addi	sp, sp, 16
.LCFI5:
	ret.n
.LFE3:
	.size	invertrelaystate, .-invertrelaystate
	.local	relaysstate
	.comm	relaysstate,4,4
	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0
	.byte	0xc
	.uleb128 0x1
	.uleb128 0
	.align	4
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI2-.LFB1
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI4-.LFB3
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0
	.align	4
.LEFDE6:
	.text
.Letext0:
	.file 2 "c:\\xtensa-lx106-elf\\xtensa-lx106-elf\\include\\stdint.h"
	.file 3 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/espressif/c_types.h"
	.file 4 "<built-in>"
	.file 5 "src/relay_control.h"
	.file 6 "c:\\xtensa-lx106-elf\\xtensa-lx106-elf\\include\\stdio.h"
	.file 7 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/driver_lib/include/gpio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1f8
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x1
	.4byte	.LASF21
	.4byte	.LASF22
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x2
	.byte	0x51
	.4byte	0x53
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x3
	.byte	0x34
	.4byte	0x48
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x5
	.byte	0x4
	.4byte	0xa3
	.uleb128 0x6
	.4byte	0x96
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF15
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x1
	.byte	0x17
	.4byte	0x41
	.byte	0x1
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x1
	.byte	0x4
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe4
	.uleb128 0x9
	.4byte	.LVL0
	.4byte	0x1b0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x1
	.byte	0xe
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x157
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x1
	.byte	0xe
	.4byte	0x41
	.4byte	.LLST0
	.uleb128 0xd
	.4byte	.LVL3
	.4byte	0x1c9
	.4byte	0x125
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.uleb128 0x9
	.4byte	.LVL4
	.4byte	0x1df
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.2byte	0x1000
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x53
	.uleb128 0xf
	.byte	0xa
	.2byte	0x1000
	.byte	0x30
	.byte	0x7c
	.sleb128 0
	.byte	0x31
	.byte	0x1a
	.byte	0x30
	.byte	0x29
	.byte	0x28
	.2byte	0x1
	.byte	0x16
	.byte	0x13
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x4
	.byte	0x7c
	.sleb128 0
	.byte	0x3c
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0xaf
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1c
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19f
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0x1e
	.4byte	0x41
	.uleb128 0x10
	.4byte	0xaf
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.byte	0x1e
	.uleb128 0x11
	.4byte	.LVL6
	.4byte	0xe4
	.byte	0
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0x5
	.byte	0x9
	.4byte	0x41
	.uleb128 0x5
	.byte	0x3
	.4byte	relaysstate
	.uleb128 0x13
	.4byte	.LASF19
	.byte	0x4
	.byte	0
	.4byte	.LASF27
	.4byte	0x41
	.4byte	0x1c9
	.uleb128 0x14
	.4byte	0x9d
	.byte	0
	.uleb128 0x15
	.4byte	.LASF28
	.byte	0x6
	.byte	0xb3
	.4byte	0x41
	.4byte	0x1df
	.uleb128 0x14
	.4byte	0x9d
	.uleb128 0x16
	.byte	0
	.uleb128 0x17
	.4byte	.LASF29
	.byte	0x7
	.byte	0xf5
	.uleb128 0x14
	.4byte	0x68
	.uleb128 0x14
	.4byte	0x68
	.uleb128 0x14
	.4byte	0x68
	.uleb128 0x14
	.4byte	0x68
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL5-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF17:
	.string	"invertrelaystate"
.LASF25:
	.string	"state"
.LASF29:
	.string	"gpio_output_conf"
.LASF9:
	.string	"float"
.LASF19:
	.string	"__builtin_puts"
.LASF21:
	.string	"src/relay_control.c"
.LASF1:
	.string	"unsigned char"
.LASF11:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF18:
	.string	"initrelaycontrol"
.LASF23:
	.string	"getrelaystate"
.LASF10:
	.string	"double"
.LASF22:
	.string	"C:\\\\Workspaces\\\\ESP8266\\\\TME4025Project"
.LASF8:
	.string	"uint32"
.LASF4:
	.string	"unsigned int"
.LASF24:
	.string	"newstate"
.LASF6:
	.string	"long long unsigned int"
.LASF16:
	.string	"setrelaystate"
.LASF13:
	.string	"sizetype"
.LASF5:
	.string	"long long int"
.LASF14:
	.string	"char"
.LASF28:
	.string	"printf"
.LASF2:
	.string	"short int"
.LASF20:
	.string	"GNU C 4.8.2 -fpreprocessed -mlongcalls -mtext-section-literals -g -Os -fno-inline-functions -fno-exceptions"
.LASF7:
	.string	"uint32_t"
.LASF12:
	.string	"long int"
.LASF27:
	.string	"puts"
.LASF26:
	.string	"relaysstate"
.LASF0:
	.string	"signed char"
.LASF15:
	.string	"_Bool"
	.ident	"GCC: (GNU) 4.8.2"

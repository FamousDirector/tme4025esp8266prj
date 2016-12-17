	.file	"user_main.c"
	.text
.Ltext0:
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.LC1:
	.string	"off"
	.align	4
.LC3:
	.string	"on"
	.text
	.literal_position
	.literal .LC0, 1610613560
	.literal .LC2, .LC1
	.literal .LC4, .LC3
	.align	4
	.global	LEDBlinkTask
	.type	LEDBlinkTask, @function
LEDBlinkTask:
.LFB1:
	.file 1 "src/user_main.c"
	.loc 1 39 0
.LVL0:
	addi	sp, sp, -16
.LCFI0:
	s32i.n	a12, sp, 8
	.loc 1 44 0
	l32r	a12, .LC0
	.loc 1 39 0
	s32i.n	a13, sp, 4
	s32i.n	a0, sp, 12
	.loc 1 44 0
	movi.n	a13, 0
.LVL1:
.L2:
	.loc 1 43 0 discriminator 1
	movi.n	a2, 0x1e
	call0	vTaskDelay
.LVL2:
	.loc 1 45 0 discriminator 1
	l32r	a2, .LC2
	.loc 1 44 0 discriminator 1
	memw
	s32i.n	a13, a12, 0
	.loc 1 45 0 discriminator 1
	call0	printf
.LVL3:
	.loc 1 48 0 discriminator 1
	movi.n	a2, 0x1e
	call0	vTaskDelay
.LVL4:
	.loc 1 49 0 discriminator 1
	movi.n	a2, 1
	memw
	s32i.n	a2, a12, 0
	.loc 1 50 0 discriminator 1
	l32r	a2, .LC4
	call0	printf
.LVL5:
	j	.L2
.LFE1:
	.size	LEDBlinkTask, .-LEDBlinkTask
	.section	.irom0.text,"ax",@progbits
	.literal_position
	.literal .LC5, CSWTCH$2
	.align	4
	.global	user_rf_cal_sector_set
	.type	user_rf_cal_sector_set, @function
user_rf_cal_sector_set:
.LFB0:
	.loc 1 7 0
	addi	sp, sp, -16
.LCFI1:
	s32i.n	a0, sp, 12
	.loc 1 8 0
	call0	system_get_flash_size_map
.LVL6:
	movi.n	a3, 0
	bgeui	a2, 7, .L4
	l32r	a3, .LC5
	addx2	a2, a2, a3
.LVL7:
	l16ui	a3, a2, 0
.L4:
.LVL8:
	.loc 1 36 0
	l32i.n	a0, sp, 12
	mov.n	a2, a3
	addi	sp, sp, 16
.LCFI2:
	ret.n
.LFE0:
	.size	user_rf_cal_sector_set, .-user_rf_cal_sector_set
	.section	.rodata.str1.4
	.align	4
.LC6:
	.string	"SDK version:%s\n"
	.align	4
.LC8:
	.string	"HI JAMES THis is V2"
	.align	4
.LC12:
	.string	"Blink"
	.text
	.literal_position
	.literal .LC7, .LC6
	.literal .LC9, .LC8
	.literal .LC10, 1610614788
	.literal .LC11, LEDBlinkTask
	.literal .LC13, .LC12
	.align	4
	.global	user_init
	.type	user_init, @function
user_init:
.LFB2:
	.loc 1 55 0
	addi	sp, sp, -32
.LCFI3:
	s32i.n	a0, sp, 28
	.loc 1 56 0
	call0	system_get_sdk_version
.LVL9:
	mov.n	a3, a2
	l32r	a2, .LC7
	call0	printf
.LVL10:
	.loc 1 57 0
	l32r	a2, .LC9
	call0	printf
.LVL11:
	.loc 1 60 0
	l32r	a2, .LC10
	movi	a3, -0x131
	memw
	l32i.n	a4, a2, 0
	.loc 1 63 0
	movi.n	a7, 0
	.loc 1 60 0
	and	a3, a4, a3
	memw
	s32i.n	a3, a2, 0
	memw
	l32i.n	a4, a2, 0
	movi.n	a3, 0x30
	or	a3, a4, a3
	memw
	s32i.n	a3, a2, 0
	.loc 1 63 0
	l32r	a2, .LC11
	l32r	a3, .LC13
	s32i.n	a7, sp, 0
	s32i.n	a7, sp, 4
	movi	a4, 0x100
	mov.n	a5, a7
	movi.n	a6, 2
	call0	xTaskGenericCreate
.LVL12:
	.loc 1 64 0
	l32i.n	a0, sp, 28
	addi	sp, sp, 32
.LCFI4:
	ret.n
.LFE2:
	.size	user_init, .-user_init
	.section	.rodata
	.align	4
	.type	CSWTCH$2, @object
	.size	CSWTCH$2, 14
CSWTCH$2:
	.short	120
	.short	0
	.short	251
	.short	507
	.short	1019
	.short	507
	.short	1019
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x10
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI1-.LFB0
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
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
	.byte	0x4
	.4byte	.LCFI3-.LFB2
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0
	.align	4
.LEFDE4:
	.text
.Letext0:
	.file 2 "c:\\xtensa-lx106-elf\\xtensa-lx106-elf\\include\\stdint.h"
	.file 3 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/espressif/c_types.h"
	.file 4 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/espressif/esp_system.h"
	.file 5 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/projdefs.h"
	.file 6 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/portmacro.h"
	.file 7 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/task.h"
	.file 8 "c:\\xtensa-lx106-elf\\xtensa-lx106-elf\\include\\stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x341
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x1
	.4byte	.LASF40
	.4byte	.LASF41
	.4byte	.Ldebug_ranges0+0
	.4byte	0
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
	.uleb128 0x5
	.byte	0x4
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
	.uleb128 0x6
	.byte	0x4
	.4byte	0xa5
	.uleb128 0x7
	.4byte	0x98
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF15
	.uleb128 0x8
	.byte	0x4
	.byte	0x4
	.2byte	0x20e
	.4byte	0xe5
	.uleb128 0x9
	.4byte	.LASF16
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF17
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF18
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF19
	.sleb128 3
	.uleb128 0x9
	.4byte	.LASF20
	.sleb128 4
	.uleb128 0x9
	.4byte	.LASF21
	.sleb128 5
	.uleb128 0x9
	.4byte	.LASF22
	.sleb128 6
	.byte	0
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x216
	.4byte	0xb1
	.uleb128 0xb
	.4byte	0xfc
	.uleb128 0xc
	.4byte	0x88
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xf1
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x5
	.byte	0x45
	.4byte	0xfc
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x6
	.byte	0x63
	.4byte	0x81
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x7
	.byte	0x5f
	.4byte	0x88
	.uleb128 0xd
	.4byte	.LASF42
	.byte	0xc
	.byte	0x7
	.byte	0x77
	.4byte	0x154
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x7
	.byte	0x79
	.4byte	0x88
	.byte	0
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x7
	.byte	0x7a
	.4byte	0x81
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x7
	.byte	0x7b
	.4byte	0x81
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0x7
	.byte	0x7c
	.4byte	0x123
	.uleb128 0x7
	.4byte	0x164
	.uleb128 0x6
	.byte	0x4
	.4byte	0x16a
	.uleb128 0x7
	.4byte	0x25
	.uleb128 0x6
	.byte	0x4
	.4byte	0x81
	.uleb128 0xf
	.4byte	.LASF33
	.byte	0x1
	.byte	0x26
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ea
	.uleb128 0x10
	.4byte	.LASF43
	.byte	0x1
	.byte	0x26
	.4byte	0x88
	.4byte	.LLST0
	.uleb128 0x11
	.4byte	.LVL2
	.4byte	0x2b6
	.4byte	0x1ac
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x4e
	.byte	0
	.uleb128 0x11
	.4byte	.LVL3
	.4byte	0x2c8
	.4byte	0x1c3
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.uleb128 0x11
	.4byte	.LVL4
	.4byte	0x2b6
	.4byte	0x1d6
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x4e
	.byte	0
	.uleb128 0x13
	.4byte	.LVL5
	.4byte	0x2c8
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x6
	.4byte	0x68
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x22b
	.uleb128 0x15
	.4byte	.LASF31
	.byte	0x1
	.byte	0x8
	.4byte	0xe5
	.4byte	.LLST1
	.uleb128 0x15
	.4byte	.LASF32
	.byte	0x1
	.byte	0x9
	.4byte	0x68
	.4byte	.LLST2
	.uleb128 0x16
	.4byte	.LVL6
	.4byte	0x2de
	.byte	0
	.uleb128 0xf
	.4byte	.LASF34
	.byte	0x1
	.byte	0x36
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b6
	.uleb128 0x16
	.4byte	.LVL9
	.4byte	0x2ea
	.uleb128 0x11
	.4byte	.LVL10
	.4byte	0x2c8
	.4byte	0x260
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC6
	.byte	0
	.uleb128 0x11
	.4byte	.LVL11
	.4byte	0x2c8
	.4byte	0x277
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC8
	.byte	0
	.uleb128 0x13
	.4byte	.LVL12
	.4byte	0x2f5
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC12
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	LEDBlinkTask
	.uleb128 0x12
	.uleb128 0x2
	.byte	0x71
	.sleb128 4
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x12
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF45
	.byte	0x7
	.2byte	0x20d
	.4byte	0x2c8
	.uleb128 0xc
	.4byte	0x10d
	.byte	0
	.uleb128 0x18
	.4byte	.LASF37
	.byte	0x8
	.byte	0xb3
	.4byte	0x41
	.4byte	0x2de
	.uleb128 0xc
	.4byte	0x9f
	.uleb128 0x19
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x222
	.4byte	0xe5
	.uleb128 0x1b
	.4byte	.LASF36
	.byte	0x4
	.byte	0x4f
	.4byte	0x9f
	.uleb128 0x1c
	.4byte	.LASF38
	.byte	0x7
	.2byte	0x5c4
	.4byte	0x8a
	.4byte	0x32e
	.uleb128 0xc
	.4byte	0x102
	.uleb128 0xc
	.4byte	0x15f
	.uleb128 0xc
	.4byte	0x3a
	.uleb128 0xc
	.4byte	0x88
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0xc
	.4byte	0x32e
	.uleb128 0xc
	.4byte	0x16f
	.uleb128 0xc
	.4byte	0x334
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x118
	.uleb128 0x7
	.4byte	0x339
	.uleb128 0x6
	.byte	0x4
	.4byte	0x33f
	.uleb128 0x7
	.4byte	0x154
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
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
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL1
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL6
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LFE0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF29:
	.string	"ulParameters"
.LASF27:
	.string	"pvBaseAddress"
.LASF16:
	.string	"FLASH_SIZE_4M_MAP_256_256"
.LASF32:
	.string	"rf_cal_sec"
.LASF25:
	.string	"portTickType"
.LASF36:
	.string	"system_get_sdk_version"
.LASF18:
	.string	"FLASH_SIZE_8M_MAP_512_512"
.LASF30:
	.string	"xMemoryRegion"
.LASF42:
	.string	"xMEMORY_REGION"
.LASF26:
	.string	"xTaskHandle"
.LASF34:
	.string	"user_init"
.LASF17:
	.string	"FLASH_SIZE_2M"
.LASF31:
	.string	"size_map"
.LASF9:
	.string	"float"
.LASF44:
	.string	"user_rf_cal_sector_set"
.LASF11:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF24:
	.string	"pdTASK_CODE"
.LASF1:
	.string	"unsigned char"
.LASF33:
	.string	"LEDBlinkTask"
.LASF10:
	.string	"double"
.LASF41:
	.string	"C:\\\\Workspaces\\\\ESP8266\\\\TME4025Project"
.LASF20:
	.string	"FLASH_SIZE_32M_MAP_512_512"
.LASF21:
	.string	"FLASH_SIZE_16M_MAP_1024_1024"
.LASF8:
	.string	"uint32"
.LASF23:
	.string	"flash_size_map"
.LASF4:
	.string	"unsigned int"
.LASF35:
	.string	"system_get_flash_size_map"
.LASF6:
	.string	"long long unsigned int"
.LASF28:
	.string	"ulLengthInBytes"
.LASF40:
	.string	"src/user_main.c"
.LASF13:
	.string	"sizetype"
.LASF5:
	.string	"long long int"
.LASF14:
	.string	"char"
.LASF43:
	.string	"pvParameters"
.LASF39:
	.string	"GNU C 4.8.2 -fpreprocessed -mlongcalls -mtext-section-literals -g -Os -fno-inline-functions -fno-exceptions"
.LASF37:
	.string	"printf"
.LASF2:
	.string	"short int"
.LASF38:
	.string	"xTaskGenericCreate"
.LASF19:
	.string	"FLASH_SIZE_16M_MAP_512_512"
.LASF7:
	.string	"uint32_t"
.LASF12:
	.string	"long int"
.LASF45:
	.string	"vTaskDelay"
.LASF0:
	.string	"signed char"
.LASF15:
	.string	"_Bool"
.LASF22:
	.string	"FLASH_SIZE_32M_MAP_1024_1024"
	.ident	"GCC: (GNU) 4.8.2"

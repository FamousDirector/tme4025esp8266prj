	.file	"user_main.c"
	.text
.Ltext0:
	.section	.irom0.text,"ax",@progbits
	.literal_position
	.literal .LC0, CSWTCH$1
	.align	4
	.global	user_rf_cal_sector_set
	.type	user_rf_cal_sector_set, @function
user_rf_cal_sector_set:
.LFB0:
	.file 1 "src/user_main.c"
	.loc 1 6 0
	addi	sp, sp, -16
.LCFI0:
	s32i.n	a0, sp, 12
	.loc 1 7 0
	call0	system_get_flash_size_map
.LVL0:
	movi.n	a3, 0
	bgeui	a2, 7, .L2
	l32r	a3, .LC0
	addx2	a2, a2, a3
.LVL1:
	l16ui	a3, a2, 0
.L2:
.LVL2:
	.loc 1 35 0
	l32i.n	a0, sp, 12
	mov.n	a2, a3
	addi	sp, sp, 16
.LCFI1:
	ret.n
.LFE0:
	.size	user_rf_cal_sector_set, .-user_rf_cal_sector_set
	.literal_position
	.align	4
	.global	RelayTestTask
	.type	RelayTestTask, @function
RelayTestTask:
.LFB1:
	.loc 1 38 0
.LVL3:
	addi	sp, sp, -16
.LCFI2:
	s32i.n	a0, sp, 12
.LVL4:
.L5:
	.loc 1 42 0 discriminator 1
	movi	a2, 0x64
	call0	vTaskDelay
.LVL5:
	.loc 1 43 0 discriminator 1
	movi.n	a2, 0
	call0	setrelaystate
.LVL6:
	.loc 1 46 0 discriminator 1
	movi	a2, 0x64
	call0	vTaskDelay
.LVL7:
	.loc 1 47 0 discriminator 1
	movi.n	a2, 1
	call0	setrelaystate
.LVL8:
	j	.L5
.LFE1:
	.size	RelayTestTask, .-RelayTestTask
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.LC1:
	.string	"Temperature is %d \n\r"
	.section	.irom0.text
	.literal_position
	.literal .LC2, .LC1
	.align	4
	.global	TemperatureTestTask
	.type	TemperatureTestTask, @function
TemperatureTestTask:
.LFB2:
	.loc 1 52 0
.LVL9:
	addi	sp, sp, -16
.LCFI3:
	s32i.n	a0, sp, 12
.LVL10:
.L7:
.LBB2:
	.loc 1 58 0 discriminator 1
	movi	a2, 0xc8
	call0	vTaskDelay
.LVL11:
	.loc 1 59 0 discriminator 1
	call0	gettemperature
.LVL12:
	.loc 1 60 0 discriminator 1
	extui	a3, a2, 0, 16
	l32r	a2, .LC2
.LVL13:
	call0	printf
.LVL14:
	j	.L7
.LBE2:
.LFE2:
	.size	TemperatureTestTask, .-TemperatureTestTask
	.section	.rodata.str1.4
	.align	4
.LC3:
	.string	"SDK version:%s\n"
	.align	4
.LC5:
	.string	"HI JAMES THis is V4"
	.section	.irom0.text
	.literal_position
	.literal .LC4, .LC3
	.literal .LC6, .LC5
	.align	4
	.global	user_init
	.type	user_init, @function
user_init:
.LFB3:
	.loc 1 65 0
	addi	sp, sp, -16
.LCFI4:
	s32i.n	a0, sp, 12
	.loc 1 66 0
	call0	system_get_sdk_version
.LVL15:
	mov.n	a3, a2
	l32r	a2, .LC4
	call0	printf
.LVL16:
	.loc 1 67 0
	l32r	a2, .LC6
	call0	printf
.LVL17:
	.loc 1 72 0
	call0	button_init
.LVL18:
	.loc 1 74 0
	call0	conn_AP_Init
.LVL19:
	.loc 1 76 0
	call0	initrelaycontrol
.LVL20:
	.loc 1 82 0
	l32i.n	a0, sp, 12
	addi	sp, sp, 16
.LCFI5:
	ret.n
.LFE3:
	.size	user_init, .-user_init
	.section	.rodata
	.align	4
	.type	CSWTCH$1, @object
	.size	CSWTCH$1, 14
CSWTCH$1:
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
	.uleb128 0x10
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
	.file 4 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/espressif/esp_system.h"
	.file 5 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/portmacro.h"
	.file 6 "./src/relay_control.h"
	.file 7 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/task.h"
	.file 8 "./src/button_interrupt.h"
	.file 9 "./src/wifi_communications.h"
	.file 10 "c:\\xtensa-lx106-elf\\xtensa-lx106-elf\\include\\stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x32a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x1
	.4byte	.LASF43
	.4byte	.LASF44
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
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x36
	.4byte	0x45
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x51
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x30
	.4byte	0x3a
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x34
	.4byte	0x53
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF14
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.uleb128 0x6
	.byte	0x4
	.4byte	0xbb
	.uleb128 0x7
	.4byte	0xae
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF17
	.uleb128 0x8
	.byte	0x4
	.byte	0x4
	.2byte	0x20e
	.4byte	0xfb
	.uleb128 0x9
	.4byte	.LASF18
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF19
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF20
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF21
	.sleb128 3
	.uleb128 0x9
	.4byte	.LASF22
	.sleb128 4
	.uleb128 0x9
	.4byte	.LASF23
	.sleb128 5
	.uleb128 0x9
	.4byte	.LASF24
	.sleb128 6
	.byte	0
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x216
	.4byte	0xc7
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x5
	.byte	0x63
	.4byte	0x97
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x1
	.byte	0x5
	.4byte	0x7e
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x153
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x1
	.byte	0x7
	.4byte	0xfb
	.4byte	.LLST0
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x1
	.byte	0x8
	.4byte	0x7e
	.4byte	.LLST1
	.uleb128 0xd
	.4byte	.LVL0
	.4byte	0x2b5
	.byte	0
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x1
	.byte	0x25
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c2
	.uleb128 0xf
	.4byte	.LASF31
	.byte	0x1
	.byte	0x25
	.4byte	0x9e
	.4byte	.LLST2
	.uleb128 0x10
	.4byte	.LVL5
	.4byte	0x2c1
	.4byte	0x18b
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x10
	.4byte	.LVL6
	.4byte	0x2d3
	.4byte	0x19e
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x10
	.4byte	.LVL7
	.4byte	0x2c1
	.4byte	0x1b2
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x12
	.4byte	.LVL8
	.4byte	0x2d3
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x1
	.byte	0x33
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x241
	.uleb128 0xf
	.4byte	.LASF31
	.byte	0x1
	.byte	0x33
	.4byte	0x9e
	.4byte	.LLST3
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x1
	.byte	0x35
	.4byte	0x73
	.4byte	.LLST4
	.uleb128 0x13
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x1
	.byte	0x3b
	.4byte	0x4c
	.4byte	0x20f
	.uleb128 0x15
	.byte	0
	.uleb128 0x10
	.4byte	.LVL11
	.4byte	0x2c1
	.4byte	0x223
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0xc8
	.byte	0
	.uleb128 0xd
	.4byte	.LVL12
	.4byte	0x2e4
	.uleb128 0x12
	.4byte	.LVL14
	.4byte	0x2f5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF33
	.byte	0x1
	.byte	0x40
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a9
	.uleb128 0xd
	.4byte	.LVL15
	.4byte	0x30b
	.uleb128 0x10
	.4byte	.LVL16
	.4byte	0x2f5
	.4byte	0x276
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.uleb128 0x10
	.4byte	.LVL17
	.4byte	0x2f5
	.4byte	0x28d
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.uleb128 0xd
	.4byte	.LVL18
	.4byte	0x316
	.uleb128 0xd
	.4byte	.LVL19
	.4byte	0x31d
	.uleb128 0xd
	.4byte	.LVL20
	.4byte	0x324
	.byte	0
	.uleb128 0x16
	.4byte	.LASF34
	.byte	0x6
	.byte	0x9
	.4byte	0x4c
	.byte	0
	.uleb128 0x17
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x222
	.4byte	0xfb
	.uleb128 0x18
	.4byte	.LASF36
	.byte	0x7
	.2byte	0x20d
	.4byte	0x2d3
	.uleb128 0x19
	.4byte	0x107
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF37
	.byte	0x6
	.byte	0xc
	.4byte	0x2e4
	.uleb128 0x19
	.4byte	0x4c
	.byte	0
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x1
	.byte	0x3b
	.4byte	0x4c
	.4byte	0x2f5
	.uleb128 0x15
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF46
	.byte	0xa
	.byte	0xb3
	.4byte	0x4c
	.4byte	0x30b
	.uleb128 0x19
	.4byte	0xb5
	.uleb128 0x15
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF39
	.byte	0x4
	.byte	0x4f
	.4byte	0xb5
	.uleb128 0x1d
	.4byte	.LASF40
	.byte	0x8
	.byte	0xa
	.uleb128 0x1d
	.4byte	.LASF41
	.byte	0x9
	.byte	0xe
	.uleb128 0x1e
	.4byte	.LASF47
	.byte	0x6
	.byte	0xb
	.uleb128 0x15
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
	.uleb128 0x4
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x3c
	.uleb128 0x19
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
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LFE0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL4
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL10
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL13
	.4byte	.LVL14-1
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF43:
	.string	"src/user_main.c"
.LASF18:
	.string	"FLASH_SIZE_4M_MAP_256_256"
.LASF28:
	.string	"rf_cal_sec"
.LASF26:
	.string	"portTickType"
.LASF32:
	.string	"value"
.LASF39:
	.string	"system_get_sdk_version"
.LASF20:
	.string	"FLASH_SIZE_8M_MAP_512_512"
.LASF33:
	.string	"user_init"
.LASF40:
	.string	"button_init"
.LASF24:
	.string	"FLASH_SIZE_32M_MAP_1024_1024"
.LASF27:
	.string	"size_map"
.LASF11:
	.string	"float"
.LASF8:
	.string	"long long unsigned int"
.LASF35:
	.string	"gettemperature"
.LASF30:
	.string	"TemperatureTestTask"
.LASF45:
	.string	"user_rf_cal_sector_set"
.LASF13:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF23:
	.string	"FLASH_SIZE_16M_MAP_1024_1024"
.LASF47:
	.string	"initrelaycontrol"
.LASF1:
	.string	"unsigned char"
.LASF12:
	.string	"double"
.LASF44:
	.string	"C:\\\\Workspaces\\\\ESP8266\\\\TME4025Project"
.LASF41:
	.string	"conn_AP_Init"
.LASF9:
	.string	"uint16"
.LASF10:
	.string	"uint32"
.LASF25:
	.string	"flash_size_map"
.LASF6:
	.string	"unsigned int"
.LASF38:
	.string	"system_get_flash_size_map"
.LASF16:
	.string	"char"
.LASF37:
	.string	"setrelaystate"
.LASF29:
	.string	"RelayTestTask"
.LASF22:
	.string	"FLASH_SIZE_32M_MAP_512_512"
.LASF15:
	.string	"sizetype"
.LASF7:
	.string	"long long int"
.LASF31:
	.string	"pvParameters"
.LASF46:
	.string	"printf"
.LASF2:
	.string	"short int"
.LASF4:
	.string	"uint16_t"
.LASF42:
	.string	"GNU C 4.8.2 -fpreprocessed -mlongcalls -mtext-section-literals -g -Os -fno-inline-functions -fno-exceptions"
.LASF21:
	.string	"FLASH_SIZE_16M_MAP_512_512"
.LASF5:
	.string	"uint32_t"
.LASF14:
	.string	"long int"
.LASF36:
	.string	"vTaskDelay"
.LASF34:
	.string	"relaysstate"
.LASF0:
	.string	"signed char"
.LASF17:
	.string	"_Bool"
.LASF19:
	.string	"FLASH_SIZE_2M"
	.ident	"GCC: (GNU) 4.8.2"

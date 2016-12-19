	.file	"user_main.c"
	.text
.Ltext0:
	.section	.irom0.text,"ax",@progbits
	.literal_position
	.align	4
	.global	RelayTestTask
	.type	RelayTestTask, @function
RelayTestTask:
.LFB2:
	.file 1 "src/user_main.c"
	.loc 1 38 0
.LVL0:
	addi	sp, sp, -16
.LCFI0:
	s32i.n	a0, sp, 12
	.loc 1 40 0
	call0	initrelaycontrol
.LVL1:
.L2:
	.loc 1 45 0 discriminator 1
	movi	a2, 0x64
	call0	vTaskDelay
.LVL2:
	.loc 1 46 0 discriminator 1
	movi.n	a2, 0
	call0	setrelaystate
.LVL3:
	.loc 1 49 0 discriminator 1
	movi	a2, 0x64
	call0	vTaskDelay
.LVL4:
	.loc 1 50 0 discriminator 1
	movi.n	a2, 1
	call0	setrelaystate
.LVL5:
	j	.L2
.LFE2:
	.size	RelayTestTask, .-RelayTestTask
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.LC0:
	.string	"Temperature is %d \n\r"
	.section	.irom0.text
	.literal_position
	.literal .LC1, .LC0
	.align	4
	.global	TemperatureTestTask
	.type	TemperatureTestTask, @function
TemperatureTestTask:
.LFB3:
	.loc 1 55 0
.LVL6:
	addi	sp, sp, -16
.LCFI1:
	s32i.n	a0, sp, 12
.LVL7:
.L4:
.LBB2:
	.loc 1 61 0 discriminator 1
	movi	a2, 0xc8
	call0	vTaskDelay
.LVL8:
	.loc 1 62 0 discriminator 1
	call0	gettemperature
.LVL9:
	.loc 1 63 0 discriminator 1
	extui	a3, a2, 0, 16
	l32r	a2, .LC1
.LVL10:
	call0	printf
.LVL11:
	j	.L4
.LBE2:
.LFE3:
	.size	TemperatureTestTask, .-TemperatureTestTask
	.literal_position
	.literal .LC2, CSWTCH$3
	.align	4
	.global	user_rf_cal_sector_set
	.type	user_rf_cal_sector_set, @function
user_rf_cal_sector_set:
.LFB1:
	.loc 1 6 0
	addi	sp, sp, -16
.LCFI2:
	s32i.n	a0, sp, 12
	.loc 1 7 0
	call0	system_get_flash_size_map
.LVL12:
	movi.n	a3, 0
	bgeui	a2, 7, .L6
	l32r	a3, .LC2
	addx2	a2, a2, a3
.LVL13:
	l16ui	a3, a2, 0
.L6:
.LVL14:
	.loc 1 35 0
	l32i.n	a0, sp, 12
	mov.n	a2, a3
	addi	sp, sp, 16
.LCFI3:
	ret.n
.LFE1:
	.size	user_rf_cal_sector_set, .-user_rf_cal_sector_set
	.section	.rodata.str1.4
	.align	4
.LC3:
	.string	"SDK version:%s\n"
	.align	4
.LC5:
	.string	"HI JAMES THis is V4"
	.align	4
.LC8:
	.string	"Blink"
	.align	4
.LC11:
	.string	"Read"
	.section	.irom0.text
	.literal_position
	.literal .LC4, .LC3
	.literal .LC6, .LC5
	.literal .LC7, RelayTestTask
	.literal .LC9, .LC8
	.literal .LC10, TemperatureTestTask
	.literal .LC12, .LC11
	.align	4
	.global	user_init
	.type	user_init, @function
user_init:
.LFB4:
	.loc 1 68 0
	addi	sp, sp, -32
.LCFI4:
	s32i.n	a0, sp, 28
	s32i.n	a12, sp, 24
	.loc 1 69 0
	call0	system_get_sdk_version
.LVL15:
	mov.n	a3, a2
	l32r	a2, .LC4
	.loc 1 81 0
	movi.n	a12, 0
	.loc 1 69 0
	call0	printf
.LVL16:
	.loc 1 70 0
	l32r	a2, .LC6
	call0	printf
.LVL17:
	.loc 1 75 0
	call0	button_init
.LVL18:
	.loc 1 77 0
	call0	initwifi
.LVL19:
	.loc 1 81 0
	l32r	a3, .LC9
	l32r	a2, .LC7
	s32i.n	a12, sp, 0
	s32i.n	a12, sp, 4
	mov.n	a5, a12
	mov.n	a7, a12
	movi	a4, 0x100
	movi.n	a6, 2
	call0	xTaskGenericCreate
.LVL20:
	.loc 1 82 0
	l32r	a2, .LC10
	l32r	a3, .LC12
	s32i.n	a12, sp, 0
	s32i.n	a12, sp, 4
	mov.n	a5, a12
	mov.n	a7, a12
	movi	a4, 0x100
	movi.n	a6, 2
	call0	xTaskGenericCreate
.LVL21:
	.loc 1 84 0
	l32i.n	a0, sp, 28
	l32i.n	a12, sp, 24
	addi	sp, sp, 32
.LCFI5:
	ret.n
.LFE4:
	.size	user_init, .-user_init
	.section	.rodata
	.align	4
	.type	CSWTCH$3, @object
	.size	CSWTCH$3, 14
CSWTCH$3:
	.short	120
	.short	0
	.short	251
	.short	507
	.short	1019
	.short	507
	.short	1019
	.comm	show_critical_only,4,4
	.comm	debug,4,4
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
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI0-.LFB2
	.byte	0xe
	.uleb128 0x10
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI1-.LFB3
	.byte	0xe
	.uleb128 0x10
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
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
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI4-.LFB4
	.byte	0xe
	.uleb128 0x20
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
	.file 5 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/projdefs.h"
	.file 6 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/portmacro.h"
	.file 7 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/task.h"
	.file 8 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/nopoll/nopoll_decl.h"
	.file 9 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/queue.h"
	.file 10 "./src/relay_control.h"
	.file 11 "./src/websocket.h"
	.file 12 "./src/button_interrupt.h"
	.file 13 "./src/wifi_communications.h"
	.file 14 "c:\\xtensa-lx106-elf\\xtensa-lx106-elf\\include\\stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4c1
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x1
	.4byte	.LASF55
	.4byte	.LASF56
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
	.uleb128 0xb
	.4byte	0x112
	.uleb128 0xc
	.4byte	0x9e
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x107
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x5
	.byte	0x45
	.4byte	0x112
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x6
	.byte	0x63
	.4byte	0x97
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x7
	.byte	0x5f
	.4byte	0x9e
	.uleb128 0xd
	.4byte	.LASF57
	.byte	0xc
	.byte	0x7
	.byte	0x77
	.4byte	0x16a
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x7
	.byte	0x79
	.4byte	0x9e
	.byte	0
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x7
	.byte	0x7a
	.4byte	0x97
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x7
	.byte	0x7b
	.4byte	0x97
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x7
	.byte	0x7c
	.4byte	0x139
	.uleb128 0x7
	.4byte	0x17a
	.uleb128 0x6
	.byte	0x4
	.4byte	0x180
	.uleb128 0x7
	.4byte	0x25
	.uleb128 0x6
	.byte	0x4
	.4byte	0x97
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0x8
	.byte	0xcd
	.4byte	0x4c
	.uleb128 0x3
	.4byte	.LASF34
	.byte	0x9
	.byte	0x53
	.4byte	0x9e
	.uleb128 0xf
	.4byte	.LASF35
	.byte	0x1
	.byte	0x25
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x219
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x1
	.byte	0x25
	.4byte	0x9e
	.4byte	.LLST0
	.uleb128 0x11
	.4byte	.LVL1
	.4byte	0x3f9
	.uleb128 0x12
	.4byte	.LVL2
	.4byte	0x406
	.4byte	0x1e2
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x12
	.4byte	.LVL3
	.4byte	0x418
	.4byte	0x1f5
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x12
	.4byte	.LVL4
	.4byte	0x406
	.4byte	0x209
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0x14
	.4byte	.LVL5
	.4byte	0x418
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LASF36
	.byte	0x1
	.byte	0x36
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x298
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x1
	.byte	0x36
	.4byte	0x9e
	.4byte	.LLST1
	.uleb128 0x15
	.4byte	.LASF38
	.byte	0x1
	.byte	0x38
	.4byte	0x73
	.4byte	.LLST2
	.uleb128 0x16
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x17
	.4byte	.LASF45
	.byte	0x1
	.byte	0x3e
	.4byte	0x4c
	.4byte	0x266
	.uleb128 0x18
	.byte	0
	.uleb128 0x12
	.4byte	.LVL8
	.4byte	0x406
	.4byte	0x27a
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0xc8
	.byte	0
	.uleb128 0x11
	.4byte	.LVL9
	.4byte	0x429
	.uleb128 0x14
	.4byte	.LVL11
	.4byte	0x43a
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF58
	.byte	0x1
	.byte	0x5
	.4byte	0x7e
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d9
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.byte	0x7
	.4byte	0xfb
	.4byte	.LLST3
	.uleb128 0x15
	.4byte	.LASF40
	.byte	0x1
	.byte	0x8
	.4byte	0x7e
	.4byte	.LLST4
	.uleb128 0x11
	.4byte	.LVL12
	.4byte	0x450
	.byte	0
	.uleb128 0xf
	.4byte	.LASF41
	.byte	0x1
	.byte	0x43
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3c0
	.uleb128 0x11
	.4byte	.LVL15
	.4byte	0x45c
	.uleb128 0x12
	.4byte	.LVL16
	.4byte	0x43a
	.4byte	0x30e
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.uleb128 0x12
	.4byte	.LVL17
	.4byte	0x43a
	.4byte	0x325
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.uleb128 0x11
	.4byte	.LVL18
	.4byte	0x467
	.uleb128 0x11
	.4byte	.LVL19
	.4byte	0x46e
	.uleb128 0x12
	.4byte	.LVL20
	.4byte	0x475
	.4byte	0x37d
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC8
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	RelayTestTask
	.uleb128 0x13
	.uleb128 0x2
	.byte	0x71
	.sleb128 4
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL21
	.4byte	0x475
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC11
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	TemperatureTestTask
	.uleb128 0x13
	.uleb128 0x2
	.byte	0x71
	.sleb128 4
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x13
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF42
	.byte	0xa
	.byte	0x9
	.4byte	0x4c
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF59
	.byte	0xb
	.byte	0x34
	.4byte	0x196
	.uleb128 0x1c
	.4byte	.LASF43
	.byte	0xb
	.byte	0x32
	.4byte	0x18b
	.uleb128 0x5
	.byte	0x3
	.4byte	debug
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0xb
	.byte	0x33
	.4byte	0x18b
	.uleb128 0x5
	.byte	0x3
	.4byte	show_critical_only
	.uleb128 0x1d
	.4byte	.LASF60
	.byte	0xa
	.byte	0xb
	.4byte	0x406
	.uleb128 0x18
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF46
	.byte	0x7
	.2byte	0x20d
	.4byte	0x418
	.uleb128 0xc
	.4byte	0x123
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF47
	.byte	0xa
	.byte	0xc
	.4byte	0x429
	.uleb128 0xc
	.4byte	0x4c
	.byte	0
	.uleb128 0x17
	.4byte	.LASF45
	.byte	0x1
	.byte	0x3e
	.4byte	0x4c
	.4byte	0x43a
	.uleb128 0x18
	.byte	0
	.uleb128 0x20
	.4byte	.LASF52
	.byte	0xe
	.byte	0xb3
	.4byte	0x4c
	.4byte	0x450
	.uleb128 0xc
	.4byte	0xb5
	.uleb128 0x18
	.byte	0
	.uleb128 0x21
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x222
	.4byte	0xfb
	.uleb128 0x22
	.4byte	.LASF49
	.byte	0x4
	.byte	0x4f
	.4byte	0xb5
	.uleb128 0x23
	.4byte	.LASF50
	.byte	0xc
	.byte	0xa
	.uleb128 0x23
	.4byte	.LASF51
	.byte	0xd
	.byte	0x20
	.uleb128 0x24
	.4byte	.LASF53
	.byte	0x7
	.2byte	0x5c4
	.4byte	0xa0
	.4byte	0x4ae
	.uleb128 0xc
	.4byte	0x118
	.uleb128 0xc
	.4byte	0x175
	.uleb128 0xc
	.4byte	0x45
	.uleb128 0xc
	.4byte	0x9e
	.uleb128 0xc
	.4byte	0x97
	.uleb128 0xc
	.4byte	0x4ae
	.uleb128 0xc
	.4byte	0x185
	.uleb128 0xc
	.4byte	0x4b4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x12e
	.uleb128 0x7
	.4byte	0x4b9
	.uleb128 0x6
	.byte	0x4
	.4byte	0x4bf
	.uleb128 0x7
	.4byte	0x16a
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
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL1-1
	.4byte	.LFE2
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
	.4byte	.LVL7
	.4byte	.LFE3
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL10
	.4byte	.LVL11-1
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL12
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE1
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
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF30:
	.string	"ulLengthInBytes"
.LASF53:
	.string	"xTaskGenericCreate"
.LASF29:
	.string	"pvBaseAddress"
.LASF55:
	.string	"src/user_main.c"
.LASF18:
	.string	"FLASH_SIZE_4M_MAP_256_256"
.LASF40:
	.string	"rf_cal_sec"
.LASF27:
	.string	"portTickType"
.LASF38:
	.string	"value"
.LASF49:
	.string	"system_get_sdk_version"
.LASF51:
	.string	"initwifi"
.LASF43:
	.string	"debug"
.LASF32:
	.string	"xMemoryRegion"
.LASF57:
	.string	"xMEMORY_REGION"
.LASF28:
	.string	"xTaskHandle"
.LASF41:
	.string	"user_init"
.LASF50:
	.string	"button_init"
.LASF24:
	.string	"FLASH_SIZE_32M_MAP_1024_1024"
.LASF39:
	.string	"size_map"
.LASF11:
	.string	"float"
.LASF34:
	.string	"xQueueHandle"
.LASF0:
	.string	"signed char"
.LASF45:
	.string	"gettemperature"
.LASF36:
	.string	"TemperatureTestTask"
.LASF58:
	.string	"user_rf_cal_sector_set"
.LASF13:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF23:
	.string	"FLASH_SIZE_16M_MAP_1024_1024"
.LASF26:
	.string	"pdTASK_CODE"
.LASF60:
	.string	"initrelaycontrol"
.LASF1:
	.string	"unsigned char"
.LASF12:
	.string	"double"
.LASF56:
	.string	"C:\\\\Workspaces\\\\ESP8266\\\\TME4025Project"
.LASF9:
	.string	"uint16"
.LASF10:
	.string	"uint32"
.LASF25:
	.string	"flash_size_map"
.LASF6:
	.string	"unsigned int"
.LASF48:
	.string	"system_get_flash_size_map"
.LASF16:
	.string	"char"
.LASF47:
	.string	"setrelaystate"
.LASF35:
	.string	"RelayTestTask"
.LASF22:
	.string	"FLASH_SIZE_32M_MAP_512_512"
.LASF44:
	.string	"show_critical_only"
.LASF15:
	.string	"sizetype"
.LASF7:
	.string	"long long int"
.LASF37:
	.string	"pvParameters"
.LASF52:
	.string	"printf"
.LASF20:
	.string	"FLASH_SIZE_8M_MAP_512_512"
.LASF4:
	.string	"uint16_t"
.LASF2:
	.string	"short int"
.LASF31:
	.string	"ulParameters"
.LASF33:
	.string	"nopoll_bool"
.LASF54:
	.string	"GNU C 4.8.2 -fpreprocessed -mlongcalls -mtext-section-literals -g -Os -fno-inline-functions -fno-exceptions"
.LASF21:
	.string	"FLASH_SIZE_16M_MAP_512_512"
.LASF5:
	.string	"uint32_t"
.LASF14:
	.string	"long int"
.LASF46:
	.string	"vTaskDelay"
.LASF42:
	.string	"relaysstate"
.LASF59:
	.string	"Web_QueueStop"
.LASF17:
	.string	"_Bool"
.LASF8:
	.string	"long long unsigned int"
.LASF19:
	.string	"FLASH_SIZE_2M"
	.ident	"GCC: (GNU) 4.8.2"

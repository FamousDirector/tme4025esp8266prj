	.file	"user_main.c"
	.text
.Ltext0:
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.LC0:
	.string	"off"
	.align	4
.LC2:
	.string	"on"
	.text
	.literal_position
	.literal .LC1, .LC0
	.literal .LC3, .LC2
	.align	4
	.global	LEDBlinkTask
	.type	LEDBlinkTask, @function
LEDBlinkTask:
.LFB1:
	.file 1 "src/user_main.c"
	.loc 1 40 0
.LVL0:
	addi	sp, sp, -16
.LCFI0:
	s32i.n	a0, sp, 12
.LVL1:
.L2:
	.loc 1 44 0 discriminator 1
	movi.n	a2, 0x1e
	call0	vTaskDelay
.LVL2:
	.loc 1 45 0 discriminator 1
	movi.n	a3, 4
	movi.n	a2, 0
	mov.n	a4, a3
	mov.n	a5, a2
	call0	gpio_output_conf
.LVL3:
	.loc 1 46 0 discriminator 1
	l32r	a2, .LC1
	call0	printf
.LVL4:
	.loc 1 49 0 discriminator 1
	movi.n	a2, 0x1e
	call0	vTaskDelay
.LVL5:
	.loc 1 50 0 discriminator 1
	movi.n	a2, 4
	movi.n	a3, 0
	mov.n	a4, a2
	mov.n	a5, a3
	call0	gpio_output_conf
.LVL6:
	.loc 1 51 0 discriminator 1
	l32r	a2, .LC3
	call0	printf
.LVL7:
	j	.L2
.LFE1:
	.size	LEDBlinkTask, .-LEDBlinkTask
	.section	.rodata.str1.4
	.align	4
.LC4:
	.string	"Value is %u"
	.text
	.literal_position
	.literal .LC5, .LC4
	.align	4
	.global	ADCREADTask
	.type	ADCREADTask, @function
ADCREADTask:
.LFB2:
	.loc 1 56 0
.LVL8:
	addi	sp, sp, -16
.LCFI1:
	s32i.n	a0, sp, 12
	.loc 1 60 0
	call0	gpio16_input_conf
.LVL9:
.L4:
	.loc 1 65 0 discriminator 1
	movi.n	a2, 0x50
	call0	vTaskDelay
.LVL10:
	.loc 1 66 0 discriminator 1
	call0	system_adc_read
.LVL11:
	mov.n	a3, a2
.LVL12:
	.loc 1 67 0 discriminator 1
	l32r	a2, .LC5
.LVL13:
	call0	printf
.LVL14:
	j	.L4
.LFE2:
	.size	ADCREADTask, .-ADCREADTask
	.section	.irom0.text,"ax",@progbits
	.literal_position
	.literal .LC6, CSWTCH$3
	.align	4
	.global	user_rf_cal_sector_set
	.type	user_rf_cal_sector_set, @function
user_rf_cal_sector_set:
.LFB0:
	.loc 1 8 0
	addi	sp, sp, -16
.LCFI2:
	s32i.n	a0, sp, 12
	.loc 1 9 0
	call0	system_get_flash_size_map
.LVL15:
	movi.n	a3, 0
	bgeui	a2, 7, .L6
	l32r	a3, .LC6
	addx2	a2, a2, a3
.LVL16:
	l16ui	a3, a2, 0
.L6:
.LVL17:
	.loc 1 37 0
	l32i.n	a0, sp, 12
	mov.n	a2, a3
	addi	sp, sp, 16
.LCFI3:
	ret.n
.LFE0:
	.size	user_rf_cal_sector_set, .-user_rf_cal_sector_set
	.section	.rodata.str1.4
	.align	4
.LC7:
	.string	"SDK version:%s\n"
	.align	4
.LC9:
	.string	"HI JAMES THis is V2"
	.align	4
.LC13:
	.string	"Blink"
	.align	4
.LC16:
	.string	"Read"
	.text
	.literal_position
	.literal .LC8, .LC7
	.literal .LC10, .LC9
	.literal .LC11, 1610614788
	.literal .LC12, LEDBlinkTask
	.literal .LC14, .LC13
	.literal .LC15, ADCREADTask
	.literal .LC17, .LC16
	.align	4
	.global	user_init
	.type	user_init, @function
user_init:
.LFB3:
	.loc 1 72 0
	addi	sp, sp, -32
.LCFI4:
	s32i.n	a0, sp, 28
	s32i.n	a12, sp, 24
	.loc 1 73 0
	call0	system_get_sdk_version
.LVL18:
	mov.n	a3, a2
	l32r	a2, .LC8
	.loc 1 80 0
	movi.n	a12, 0
	.loc 1 73 0
	call0	printf
.LVL19:
	.loc 1 74 0
	l32r	a2, .LC10
	call0	printf
.LVL20:
	.loc 1 77 0
	l32r	a2, .LC11
	movi	a3, -0x131
	memw
	l32i.n	a4, a2, 0
	.loc 1 80 0
	mov.n	a5, a12
	.loc 1 77 0
	and	a3, a4, a3
	memw
	s32i.n	a3, a2, 0
	memw
	l32i.n	a4, a2, 0
	movi.n	a3, 0x30
	or	a3, a4, a3
	memw
	s32i.n	a3, a2, 0
	.loc 1 80 0
	l32r	a3, .LC14
	l32r	a2, .LC12
	s32i.n	a12, sp, 0
	s32i.n	a12, sp, 4
	mov.n	a7, a12
	movi	a4, 0x100
	movi.n	a6, 2
	call0	xTaskGenericCreate
.LVL21:
	.loc 1 81 0
	l32r	a2, .LC15
	l32r	a3, .LC17
	s32i.n	a12, sp, 0
	s32i.n	a12, sp, 4
	mov.n	a5, a12
	mov.n	a7, a12
	movi	a4, 0x100
	movi.n	a6, 2
	call0	xTaskGenericCreate
.LVL22:
	.loc 1 83 0
	l32i.n	a0, sp, 28
	l32i.n	a12, sp, 24
	addi	sp, sp, 32
.LCFI5:
	ret.n
.LFE3:
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
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI1-.LFB2
	.byte	0xe
	.uleb128 0x10
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI2-.LFB0
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
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI4-.LFB3
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
	.file 8 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/driver_lib/include/gpio.h"
	.file 9 "c:\\xtensa-lx106-elf\\xtensa-lx106-elf\\include\\stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x485
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x1
	.4byte	.LASF48
	.4byte	.LASF49
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
	.4byte	.LASF50
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
	.uleb128 0xf
	.4byte	.LASF33
	.byte	0x1
	.byte	0x27
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x244
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0x27
	.4byte	0x9e
	.4byte	.LLST0
	.uleb128 0x11
	.4byte	.LVL2
	.4byte	0x3c7
	.4byte	0x1c2
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x4e
	.byte	0
	.uleb128 0x11
	.4byte	.LVL3
	.4byte	0x3d9
	.4byte	0x1e4
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x11
	.4byte	.LVL4
	.4byte	0x3f9
	.4byte	0x1fb
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x11
	.4byte	.LVL5
	.4byte	0x3c7
	.4byte	0x20e
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x4e
	.byte	0
	.uleb128 0x11
	.4byte	.LVL6
	.4byte	0x3d9
	.4byte	0x230
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x34
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.uleb128 0x13
	.4byte	.LVL7
	.4byte	0x3f9
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LASF34
	.byte	0x1
	.byte	0x37
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b1
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0x37
	.4byte	0x9e
	.4byte	.LLST1
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.byte	0x39
	.4byte	0x73
	.4byte	.LLST2
	.uleb128 0x15
	.4byte	.LVL9
	.4byte	0x40f
	.uleb128 0x11
	.4byte	.LVL10
	.4byte	0x3c7
	.4byte	0x294
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LVL11
	.4byte	0x416
	.uleb128 0x13
	.4byte	.LVL14
	.4byte	0x3f9
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF51
	.byte	0x1
	.byte	0x7
	.4byte	0x7e
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2f2
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x1
	.byte	0x9
	.4byte	0xfb
	.4byte	.LLST3
	.uleb128 0x14
	.4byte	.LASF38
	.byte	0x1
	.byte	0xa
	.4byte	0x7e
	.4byte	.LLST4
	.uleb128 0x15
	.4byte	.LVL15
	.4byte	0x422
	.byte	0
	.uleb128 0xf
	.4byte	.LASF39
	.byte	0x1
	.byte	0x47
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3c7
	.uleb128 0x15
	.4byte	.LVL18
	.4byte	0x42e
	.uleb128 0x11
	.4byte	.LVL19
	.4byte	0x3f9
	.4byte	0x327
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC7
	.byte	0
	.uleb128 0x11
	.4byte	.LVL20
	.4byte	0x3f9
	.4byte	0x33e
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC9
	.byte	0
	.uleb128 0x11
	.4byte	.LVL21
	.4byte	0x439
	.4byte	0x384
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
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
	.4byte	.LC13
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
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x12
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.4byte	.LVL22
	.4byte	0x439
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
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
	.4byte	.LC16
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	ADCREADTask
	.uleb128 0x12
	.uleb128 0x2
	.byte	0x71
	.sleb128 4
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x12
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF40
	.byte	0x7
	.2byte	0x20d
	.4byte	0x3d9
	.uleb128 0xc
	.4byte	0x123
	.byte	0
	.uleb128 0x18
	.4byte	.LASF41
	.byte	0x8
	.byte	0xf5
	.4byte	0x3f9
	.uleb128 0xc
	.4byte	0x7e
	.uleb128 0xc
	.4byte	0x7e
	.uleb128 0xc
	.4byte	0x7e
	.uleb128 0xc
	.4byte	0x7e
	.byte	0
	.uleb128 0x19
	.4byte	.LASF45
	.byte	0x9
	.byte	0xb3
	.4byte	0x4c
	.4byte	0x40f
	.uleb128 0xc
	.4byte	0xb5
	.uleb128 0x1a
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF52
	.byte	0x8
	.byte	0xdc
	.uleb128 0x1c
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x12a
	.4byte	0x73
	.uleb128 0x1c
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x222
	.4byte	0xfb
	.uleb128 0x1d
	.4byte	.LASF44
	.byte	0x4
	.byte	0x4f
	.4byte	0xb5
	.uleb128 0x1e
	.4byte	.LASF46
	.byte	0x7
	.2byte	0x5c4
	.4byte	0xa0
	.4byte	0x472
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
	.4byte	0x472
	.uleb128 0xc
	.4byte	0x185
	.uleb128 0xc
	.4byte	0x478
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x12e
	.uleb128 0x7
	.4byte	0x47d
	.uleb128 0x6
	.byte	0x4
	.4byte	0x483
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
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x5
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
	.uleb128 0x49
	.uleb128 0x13
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
	.4byte	.LVL8
	.4byte	.LVL9-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL9-1
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
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
.LLST3:
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL15
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL17
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
.LASF31:
	.string	"ulParameters"
.LASF29:
	.string	"pvBaseAddress"
.LASF18:
	.string	"FLASH_SIZE_4M_MAP_256_256"
.LASF38:
	.string	"rf_cal_sec"
.LASF41:
	.string	"gpio_output_conf"
.LASF27:
	.string	"portTickType"
.LASF36:
	.string	"value"
.LASF44:
	.string	"system_get_sdk_version"
.LASF20:
	.string	"FLASH_SIZE_8M_MAP_512_512"
.LASF32:
	.string	"xMemoryRegion"
.LASF50:
	.string	"xMEMORY_REGION"
.LASF28:
	.string	"xTaskHandle"
.LASF39:
	.string	"user_init"
.LASF19:
	.string	"FLASH_SIZE_2M"
.LASF37:
	.string	"size_map"
.LASF11:
	.string	"float"
.LASF51:
	.string	"user_rf_cal_sector_set"
.LASF13:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF26:
	.string	"pdTASK_CODE"
.LASF1:
	.string	"unsigned char"
.LASF33:
	.string	"LEDBlinkTask"
.LASF12:
	.string	"double"
.LASF49:
	.string	"C:\\\\Workspaces\\\\ESP8266\\\\TME4025Project"
.LASF22:
	.string	"FLASH_SIZE_32M_MAP_512_512"
.LASF9:
	.string	"uint16"
.LASF23:
	.string	"FLASH_SIZE_16M_MAP_1024_1024"
.LASF10:
	.string	"uint32"
.LASF25:
	.string	"flash_size_map"
.LASF6:
	.string	"unsigned int"
.LASF43:
	.string	"system_get_flash_size_map"
.LASF52:
	.string	"gpio16_input_conf"
.LASF8:
	.string	"long long unsigned int"
.LASF30:
	.string	"ulLengthInBytes"
.LASF48:
	.string	"src/user_main.c"
.LASF15:
	.string	"sizetype"
.LASF7:
	.string	"long long int"
.LASF16:
	.string	"char"
.LASF35:
	.string	"pvParameters"
.LASF47:
	.string	"GNU C 4.8.2 -fpreprocessed -mlongcalls -mtext-section-literals -g -Os -fno-inline-functions -fno-exceptions"
.LASF45:
	.string	"printf"
.LASF4:
	.string	"uint16_t"
.LASF2:
	.string	"short int"
.LASF34:
	.string	"ADCREADTask"
.LASF46:
	.string	"xTaskGenericCreate"
.LASF21:
	.string	"FLASH_SIZE_16M_MAP_512_512"
.LASF5:
	.string	"uint32_t"
.LASF14:
	.string	"long int"
.LASF40:
	.string	"vTaskDelay"
.LASF0:
	.string	"signed char"
.LASF17:
	.string	"_Bool"
.LASF24:
	.string	"FLASH_SIZE_32M_MAP_1024_1024"
.LASF42:
	.string	"system_adc_read"
	.ident	"GCC: (GNU) 4.8.2"

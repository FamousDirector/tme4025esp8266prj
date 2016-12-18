	.file	"user_main.c"
	.text
.Ltext0:
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.LC2:
	.string	"off"
	.align	4
.LC4:
	.string	"on"
	.text
	.literal_position
	.literal .LC0, 1610614788
	.literal .LC1, 4096
	.literal .LC3, .LC2
	.literal .LC5, .LC4
	.align	4
	.global	LEDBlinkTask
	.type	LEDBlinkTask, @function
LEDBlinkTask:
.LFB1:
	.file 1 "src/user_main.c"
	.loc 1 40 0
.LVL0:
	.loc 1 42 0
	l32r	a2, .LC0
.LVL1:
	.loc 1 40 0
	addi	sp, sp, -16
.LCFI0:
	.loc 1 42 0
	memw
	l32i.n	a4, a2, 0
	movi	a3, -0x131
	.loc 1 40 0
	s32i.n	a12, sp, 8
	.loc 1 42 0
	and	a3, a4, a3
	.loc 1 40 0
	s32i.n	a0, sp, 12
	.loc 1 42 0
	memw
	s32i.n	a3, a2, 0
	memw
	l32i.n	a4, a2, 0
	movi.n	a3, 0x30
	or	a3, a4, a3
	.loc 1 48 0
	l32r	a12, .LC1
	.loc 1 42 0
	memw
	s32i.n	a3, a2, 0
.L2:
	.loc 1 47 0 discriminator 1
	movi.n	a2, 0x1e
	call0	vTaskDelay
.LVL2:
	.loc 1 48 0 discriminator 1
	movi.n	a2, 0
	mov.n	a3, a12
	mov.n	a4, a12
	mov.n	a5, a2
	call0	gpio_output_conf
.LVL3:
	.loc 1 49 0 discriminator 1
	l32r	a2, .LC3
	call0	printf
.LVL4:
	.loc 1 52 0 discriminator 1
	movi.n	a2, 0x1e
	call0	vTaskDelay
.LVL5:
	.loc 1 53 0 discriminator 1
	movi.n	a3, 0
	mov.n	a2, a12
	mov.n	a4, a12
	mov.n	a5, a3
	call0	gpio_output_conf
.LVL6:
	.loc 1 54 0 discriminator 1
	l32r	a2, .LC5
	call0	printf
.LVL7:
	j	.L2
.LFE1:
	.size	LEDBlinkTask, .-LEDBlinkTask
	.section	.rodata.str1.4
	.align	4
.LC6:
	.string	"Value is %d"
	.text
	.literal_position
	.literal .LC7, .LC6
	.align	4
	.global	ADCREADTask
	.type	ADCREADTask, @function
ADCREADTask:
.LFB2:
	.loc 1 59 0
.LVL8:
	addi	sp, sp, -16
.LCFI1:
	s32i.n	a0, sp, 12
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
	l32r	a2, .LC7
.LVL13:
	call0	printf
.LVL14:
	j	.L4
.LFE2:
	.size	ADCREADTask, .-ADCREADTask
	.section	.rodata.str1.4
	.align	4
.LC11:
	.string	"!!!"
	.text
	.literal_position
	.literal .LC8, 1610613532
	.literal .LC9, 16384
	.literal .LC10, 1610613540
	.literal .LC12, .LC11
	.align	4
	.type	intr_handler, @function
intr_handler:
.LFB3:
	.loc 1 72 0
	.loc 1 73 0
	l32r	a2, .LC8
	.loc 1 72 0
	addi	sp, sp, -16
.LCFI2:
	.loc 1 74 0
	movi.n	a3, 0
	.loc 1 72 0
	s32i.n	a12, sp, 8
	.loc 1 73 0
	memw
	l32i.n	a12, a2, 0
.LVL15:
	.loc 1 74 0
	movi.n	a2, 0xe
	.loc 1 72 0
	s32i.n	a0, sp, 12
	.loc 1 74 0
	call0	gpio_pin_intr_state_set
.LVL16:
	.loc 1 75 0
	l32r	a2, .LC9
	and	a12, a12, a2
.LVL17:
	l32r	a2, .LC10
	memw
	s32i.n	a12, a2, 0
	.loc 1 77 0
	call0	vPortEnterCritical
.LVL18:
	.loc 1 83 0
	call0	vPortExitCritical
.LVL19:
	.loc 1 85 0
	l32r	a2, .LC12
	call0	printf
.LVL20:
	.loc 1 87 0
	movi.n	a2, 0xe
	movi.n	a3, 2
	call0	gpio_pin_intr_state_set
.LVL21:
	.loc 1 88 0
	l32i.n	a0, sp, 12
	l32i.n	a12, sp, 8
	addi	sp, sp, 16
.LCFI3:
	ret.n
.LFE3:
	.size	intr_handler, .-intr_handler
	.section	.irom0.text,"ax",@progbits
	.literal_position
	.literal .LC13, CSWTCH$4
	.align	4
	.global	user_rf_cal_sector_set
	.type	user_rf_cal_sector_set, @function
user_rf_cal_sector_set:
.LFB0:
	.loc 1 8 0
	addi	sp, sp, -16
.LCFI4:
	s32i.n	a0, sp, 12
	.loc 1 9 0
	call0	system_get_flash_size_map
.LVL22:
	movi.n	a3, 0
	bgeui	a2, 7, .L7
	l32r	a3, .LC13
	addx2	a2, a2, a3
.LVL23:
	l16ui	a3, a2, 0
.L7:
.LVL24:
	.loc 1 37 0
	l32i.n	a0, sp, 12
	mov.n	a2, a3
	addi	sp, sp, 16
.LCFI5:
	ret.n
.LFE0:
	.size	user_rf_cal_sector_set, .-user_rf_cal_sector_set
	.text
	.literal_position
	.literal .LC14, 16384
	.literal .LC15, intr_handler
	.align	4
	.global	button_init
	.type	button_init, @function
button_init:
.LFB4:
	.loc 1 91 0
	.loc 1 93 0
	l32r	a2, .LC14
	.loc 1 91 0
	addi	sp, sp, -32
.LCFI6:
	.loc 1 93 0
	s16i	a2, sp, 0
	.loc 1 94 0
	movi.n	a2, 2
	s32i.n	a2, sp, 12
	.loc 1 96 0
	movi.n	a2, 1
	.loc 1 91 0
	s32i.n	a12, sp, 24
	.loc 1 96 0
	s32i.n	a2, sp, 8
	.loc 1 95 0
	movi.n	a12, 0
	.loc 1 97 0
	mov.n	a2, sp
	.loc 1 91 0
	s32i.n	a0, sp, 28
	.loc 1 95 0
	s32i.n	a12, sp, 4
	.loc 1 97 0
	call0	gpio_config
.LVL25:
	.loc 1 99 0
	l32r	a2, .LC15
	mov.n	a3, a12
	call0	gpio_intr_handler_register
.LVL26:
	.loc 1 100 0
	movi.n	a2, 0x10
	call0	_xt_isr_unmask
.LVL27:
	.loc 1 101 0
	l32i.n	a0, sp, 28
	l32i.n	a12, sp, 24
	addi	sp, sp, 32
.LCFI7:
	ret.n
.LFE4:
	.size	button_init, .-button_init
	.section	.rodata.str1.4
	.align	4
.LC16:
	.string	"SDK version:%s\n"
	.align	4
.LC18:
	.string	"HI JAMES THis is V2"
	.align	4
.LC21:
	.string	"Blink"
	.align	4
.LC24:
	.string	"Read"
	.text
	.literal_position
	.literal .LC17, .LC16
	.literal .LC19, .LC18
	.literal .LC20, LEDBlinkTask
	.literal .LC22, .LC21
	.literal .LC23, ADCREADTask
	.literal .LC25, .LC24
	.align	4
	.global	user_init
	.type	user_init, @function
user_init:
.LFB5:
	.loc 1 104 0
	addi	sp, sp, -32
.LCFI8:
	s32i.n	a0, sp, 28
	s32i.n	a12, sp, 24
	.loc 1 105 0
	call0	system_get_sdk_version
.LVL28:
	mov.n	a3, a2
	l32r	a2, .LC17
	.loc 1 112 0
	movi.n	a12, 0
	.loc 1 105 0
	call0	printf
.LVL29:
	.loc 1 106 0
	l32r	a2, .LC19
	call0	printf
.LVL30:
	.loc 1 109 0
	call0	button_init
.LVL31:
	.loc 1 112 0
	l32r	a3, .LC22
	l32r	a2, .LC20
	s32i.n	a12, sp, 0
	s32i.n	a12, sp, 4
	mov.n	a5, a12
	mov.n	a7, a12
	movi	a4, 0x100
	movi.n	a6, 2
	call0	xTaskGenericCreate
.LVL32:
	.loc 1 113 0
	l32r	a2, .LC23
	l32r	a3, .LC25
	s32i.n	a12, sp, 0
	s32i.n	a12, sp, 4
	mov.n	a5, a12
	mov.n	a7, a12
	movi	a4, 0x100
	movi.n	a6, 2
	call0	xTaskGenericCreate
.LVL33:
	.loc 1 115 0
	l32i.n	a0, sp, 28
	l32i.n	a12, sp, 24
	addi	sp, sp, 32
.LCFI9:
	ret.n
.LFE5:
	.size	user_init, .-user_init
	.section	.rodata
	.align	4
	.type	CSWTCH$4, @object
	.size	CSWTCH$4, 14
CSWTCH$4:
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
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI2-.LFB3
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
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI4-.LFB0
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0
	.align	4
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI6-.LFB4
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0
	.align	4
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI8-.LFB5
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0
	.align	4
.LEFDE10:
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
	.4byte	0x6ab
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x1
	.4byte	.LASF77
	.4byte	.LASF78
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
	.uleb128 0x5
	.string	"u32"
	.byte	0x3
	.byte	0x36
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
	.uleb128 0x6
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
	.uleb128 0x7
	.byte	0x4
	.4byte	0xc6
	.uleb128 0x8
	.4byte	0xb9
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF17
	.uleb128 0x9
	.byte	0x4
	.byte	0x4
	.2byte	0x20e
	.4byte	0x106
	.uleb128 0xa
	.4byte	.LASF18
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF19
	.sleb128 1
	.uleb128 0xa
	.4byte	.LASF20
	.sleb128 2
	.uleb128 0xa
	.4byte	.LASF21
	.sleb128 3
	.uleb128 0xa
	.4byte	.LASF22
	.sleb128 4
	.uleb128 0xa
	.4byte	.LASF23
	.sleb128 5
	.uleb128 0xa
	.4byte	.LASF24
	.sleb128 6
	.byte	0
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x216
	.4byte	0xd2
	.uleb128 0xc
	.4byte	0x11d
	.uleb128 0xd
	.4byte	0xa9
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x112
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x5
	.byte	0x45
	.4byte	0x11d
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x6
	.byte	0x63
	.4byte	0xa2
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x7
	.byte	0x5f
	.4byte	0xa9
	.uleb128 0xe
	.4byte	.LASF79
	.byte	0xc
	.byte	0x7
	.byte	0x77
	.4byte	0x175
	.uleb128 0xf
	.4byte	.LASF29
	.byte	0x7
	.byte	0x79
	.4byte	0xa9
	.byte	0
	.uleb128 0xf
	.4byte	.LASF30
	.byte	0x7
	.byte	0x7a
	.4byte	0xa2
	.byte	0x4
	.uleb128 0xf
	.4byte	.LASF31
	.byte	0x7
	.byte	0x7b
	.4byte	0xa2
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x7
	.byte	0x7c
	.4byte	0x144
	.uleb128 0x8
	.4byte	0x185
	.uleb128 0x7
	.byte	0x4
	.4byte	0x18b
	.uleb128 0x8
	.4byte	0x25
	.uleb128 0x7
	.byte	0x4
	.4byte	0xa2
	.uleb128 0x10
	.byte	0x4
	.byte	0x8
	.byte	0x5c
	.4byte	0x1c3
	.uleb128 0xa
	.4byte	.LASF33
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF34
	.sleb128 1
	.uleb128 0xa
	.4byte	.LASF35
	.sleb128 2
	.uleb128 0xa
	.4byte	.LASF36
	.sleb128 3
	.uleb128 0xa
	.4byte	.LASF37
	.sleb128 4
	.uleb128 0xa
	.4byte	.LASF38
	.sleb128 5
	.byte	0
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x8
	.byte	0x63
	.4byte	0x196
	.uleb128 0x10
	.byte	0x4
	.byte	0x8
	.byte	0x65
	.4byte	0x1ef
	.uleb128 0xa
	.4byte	.LASF40
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF41
	.sleb128 1
	.uleb128 0xa
	.4byte	.LASF42
	.sleb128 2
	.uleb128 0xa
	.4byte	.LASF43
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF44
	.byte	0x8
	.byte	0x6a
	.4byte	0x1ce
	.uleb128 0x10
	.byte	0x4
	.byte	0x8
	.byte	0x6c
	.4byte	0x20f
	.uleb128 0xa
	.4byte	.LASF45
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF46
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF47
	.byte	0x8
	.byte	0x6f
	.4byte	0x1fa
	.uleb128 0x11
	.byte	0x10
	.byte	0x8
	.byte	0x71
	.4byte	0x253
	.uleb128 0xf
	.4byte	.LASF48
	.byte	0x8
	.byte	0x72
	.4byte	0x73
	.byte	0
	.uleb128 0xf
	.4byte	.LASF49
	.byte	0x8
	.byte	0x73
	.4byte	0x1ef
	.byte	0x4
	.uleb128 0xf
	.4byte	.LASF50
	.byte	0x8
	.byte	0x74
	.4byte	0x20f
	.byte	0x8
	.uleb128 0xf
	.4byte	.LASF51
	.byte	0x8
	.byte	0x75
	.4byte	0x1c3
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x8
	.byte	0x76
	.4byte	0x21a
	.uleb128 0x12
	.4byte	.LASF53
	.byte	0x1
	.byte	0x27
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x31b
	.uleb128 0x13
	.4byte	.LASF55
	.byte	0x1
	.byte	0x27
	.4byte	0xa9
	.4byte	.LLST0
	.uleb128 0x14
	.4byte	.LVL2
	.4byte	0x597
	.4byte	0x295
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x4e
	.byte	0
	.uleb128 0x14
	.4byte	.LVL3
	.4byte	0x5a9
	.4byte	0x2b9
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x14
	.4byte	.LVL4
	.4byte	0x5c9
	.4byte	0x2d0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.uleb128 0x14
	.4byte	.LVL5
	.4byte	0x597
	.4byte	0x2e3
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x4e
	.byte	0
	.uleb128 0x14
	.4byte	.LVL6
	.4byte	0x5a9
	.4byte	0x307
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL7
	.4byte	0x5c9
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC4
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x1
	.byte	0x3a
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x37f
	.uleb128 0x13
	.4byte	.LASF55
	.byte	0x1
	.byte	0x3a
	.4byte	0xa9
	.4byte	.LLST1
	.uleb128 0x17
	.4byte	.LASF56
	.byte	0x1
	.byte	0x3c
	.4byte	0x73
	.4byte	.LLST2
	.uleb128 0x14
	.4byte	.LVL10
	.4byte	0x597
	.4byte	0x362
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.4byte	.LVL11
	.4byte	0x5df
	.uleb128 0x16
	.4byte	.LVL14
	.4byte	0x5c9
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC6
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF80
	.byte	0x1
	.byte	0x47
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x403
	.uleb128 0x17
	.4byte	.LASF57
	.byte	0x1
	.byte	0x49
	.4byte	0x89
	.4byte	.LLST3
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x50
	.4byte	0x4c
	.byte	0
	.uleb128 0x14
	.4byte	.LVL16
	.4byte	0x5eb
	.4byte	0x3c5
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x3e
	.byte	0
	.uleb128 0x18
	.4byte	.LVL18
	.4byte	0x602
	.uleb128 0x18
	.4byte	.LVL19
	.4byte	0x609
	.uleb128 0x14
	.4byte	.LVL20
	.4byte	0x5c9
	.4byte	0x3ee
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC11
	.byte	0
	.uleb128 0x16
	.4byte	.LVL21
	.4byte	0x5eb
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x3e
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF81
	.byte	0x1
	.byte	0x7
	.4byte	0x7e
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x444
	.uleb128 0x17
	.4byte	.LASF58
	.byte	0x1
	.byte	0x9
	.4byte	0x106
	.4byte	.LLST4
	.uleb128 0x17
	.4byte	.LASF59
	.byte	0x1
	.byte	0xa
	.4byte	0x7e
	.4byte	.LLST5
	.uleb128 0x18
	.4byte	.LVL22
	.4byte	0x610
	.byte	0
	.uleb128 0x12
	.4byte	.LASF60
	.byte	0x1
	.byte	0x5a
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b9
	.uleb128 0x1c
	.4byte	.LASF61
	.byte	0x1
	.byte	0x5c
	.4byte	0x253
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.4byte	.LASF63
	.byte	0x1
	.byte	0x61
	.4byte	0x4c
	.4byte	0x478
	.uleb128 0x1e
	.byte	0
	.uleb128 0x14
	.4byte	.LVL25
	.4byte	0x61c
	.4byte	0x48c
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL26
	.4byte	0x62d
	.4byte	0x4a9
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	intr_handler
	.byte	0
	.uleb128 0x16
	.4byte	.LVL27
	.4byte	0x643
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF62
	.byte	0x1
	.byte	0x67
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x597
	.uleb128 0x18
	.4byte	.LVL28
	.4byte	0x654
	.uleb128 0x14
	.4byte	.LVL29
	.4byte	0x5c9
	.4byte	0x4ee
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC16
	.byte	0
	.uleb128 0x14
	.4byte	.LVL30
	.4byte	0x5c9
	.4byte	0x505
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC18
	.byte	0
	.uleb128 0x18
	.4byte	.LVL31
	.4byte	0x444
	.uleb128 0x14
	.4byte	.LVL32
	.4byte	0x65f
	.4byte	0x554
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC21
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	LEDBlinkTask
	.uleb128 0x15
	.uleb128 0x2
	.byte	0x71
	.sleb128 4
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL33
	.4byte	0x65f
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x57
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.2byte	0x100
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC24
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	ADCREADTask
	.uleb128 0x15
	.uleb128 0x2
	.byte	0x71
	.sleb128 4
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF64
	.byte	0x7
	.2byte	0x20d
	.4byte	0x5a9
	.uleb128 0xd
	.4byte	0x12e
	.byte	0
	.uleb128 0x20
	.4byte	.LASF65
	.byte	0x8
	.byte	0xf5
	.4byte	0x5c9
	.uleb128 0xd
	.4byte	0x7e
	.uleb128 0xd
	.4byte	0x7e
	.uleb128 0xd
	.4byte	0x7e
	.uleb128 0xd
	.4byte	0x7e
	.byte	0
	.uleb128 0x21
	.4byte	.LASF74
	.byte	0x9
	.byte	0xb3
	.4byte	0x4c
	.4byte	0x5df
	.uleb128 0xd
	.4byte	0xc0
	.uleb128 0x1e
	.byte	0
	.uleb128 0x22
	.4byte	.LASF69
	.byte	0x4
	.2byte	0x12a
	.4byte	0x73
	.uleb128 0x1f
	.4byte	.LASF66
	.byte	0x8
	.2byte	0x11c
	.4byte	0x602
	.uleb128 0xd
	.4byte	0x7e
	.uleb128 0xd
	.4byte	0x1c3
	.byte	0
	.uleb128 0x23
	.4byte	.LASF67
	.byte	0x6
	.byte	0x8a
	.uleb128 0x23
	.4byte	.LASF68
	.byte	0x6
	.byte	0x8b
	.uleb128 0x22
	.4byte	.LASF70
	.byte	0x4
	.2byte	0x222
	.4byte	0x106
	.uleb128 0x1d
	.4byte	.LASF63
	.byte	0x1
	.byte	0x61
	.4byte	0x4c
	.4byte	0x62d
	.uleb128 0x1e
	.byte	0
	.uleb128 0x20
	.4byte	.LASF71
	.byte	0x8
	.byte	0xff
	.4byte	0x643
	.uleb128 0xd
	.4byte	0xa9
	.uleb128 0xd
	.4byte	0xa9
	.byte	0
	.uleb128 0x20
	.4byte	.LASF72
	.byte	0x6
	.byte	0xb3
	.4byte	0x654
	.uleb128 0xd
	.4byte	0x7e
	.byte	0
	.uleb128 0x24
	.4byte	.LASF73
	.byte	0x4
	.byte	0x4f
	.4byte	0xc0
	.uleb128 0x25
	.4byte	.LASF75
	.byte	0x7
	.2byte	0x5c4
	.4byte	0xab
	.4byte	0x698
	.uleb128 0xd
	.4byte	0x123
	.uleb128 0xd
	.4byte	0x180
	.uleb128 0xd
	.4byte	0x45
	.uleb128 0xd
	.4byte	0xa9
	.uleb128 0xd
	.4byte	0xa2
	.uleb128 0xd
	.4byte	0x698
	.uleb128 0xd
	.4byte	0x190
	.uleb128 0xd
	.4byte	0x69e
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x139
	.uleb128 0x8
	.4byte	0x6a3
	.uleb128 0x7
	.byte	0x4
	.4byte	0x6a9
	.uleb128 0x8
	.4byte	0x175
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x1
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
	.uleb128 0x11
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x5
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x5
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
	.uleb128 0x25
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
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL9
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
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
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL22
	.4byte	.LVL24
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL24
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
.LASF48:
	.string	"GPIO_Pin"
.LASF65:
	.string	"gpio_output_conf"
.LASF81:
	.string	"user_rf_cal_sector_set"
.LASF52:
	.string	"GPIO_ConfigTypeDef"
.LASF63:
	.string	"gpio_config"
.LASF44:
	.string	"GPIOMode_TypeDef"
.LASF73:
	.string	"system_get_sdk_version"
.LASF2:
	.string	"short int"
.LASF27:
	.string	"portTickType"
.LASF15:
	.string	"sizetype"
.LASF64:
	.string	"vTaskDelay"
.LASF29:
	.string	"pvBaseAddress"
.LASF30:
	.string	"ulLengthInBytes"
.LASF46:
	.string	"GPIO_PullUp_EN"
.LASF62:
	.string	"user_init"
.LASF57:
	.string	"gpio_status"
.LASF70:
	.string	"system_get_flash_size_map"
.LASF55:
	.string	"pvParameters"
.LASF21:
	.string	"FLASH_SIZE_16M_MAP_512_512"
.LASF56:
	.string	"value"
.LASF77:
	.string	"src/user_main.c"
.LASF9:
	.string	"uint16"
.LASF18:
	.string	"FLASH_SIZE_4M_MAP_256_256"
.LASF80:
	.string	"intr_handler"
.LASF33:
	.string	"GPIO_PIN_INTR_DISABLE"
.LASF54:
	.string	"ADCREADTask"
.LASF22:
	.string	"FLASH_SIZE_32M_MAP_512_512"
.LASF11:
	.string	"float"
.LASF7:
	.string	"long long int"
.LASF26:
	.string	"pdTASK_CODE"
.LASF14:
	.string	"long int"
.LASF19:
	.string	"FLASH_SIZE_2M"
.LASF38:
	.string	"GPIO_PIN_INTR_HILEVEL"
.LASF74:
	.string	"printf"
.LASF50:
	.string	"GPIO_Pullup"
.LASF47:
	.string	"GPIO_Pullup_IF"
.LASF79:
	.string	"xMEMORY_REGION"
.LASF66:
	.string	"gpio_pin_intr_state_set"
.LASF69:
	.string	"system_adc_read"
.LASF43:
	.string	"GPIO_Mode_Sigma_Delta"
.LASF1:
	.string	"unsigned char"
.LASF20:
	.string	"FLASH_SIZE_8M_MAP_512_512"
.LASF41:
	.string	"GPIO_Mode_Out_OD"
.LASF37:
	.string	"GPIO_PIN_INTR_LOLEVEL"
.LASF40:
	.string	"GPIO_Mode_Input"
.LASF0:
	.string	"signed char"
.LASF8:
	.string	"long long unsigned int"
.LASF5:
	.string	"uint32_t"
.LASF28:
	.string	"xTaskHandle"
.LASF6:
	.string	"unsigned int"
.LASF4:
	.string	"uint16_t"
.LASF13:
	.string	"long unsigned int"
.LASF78:
	.string	"C:\\\\Workspaces\\\\ESP8266\\\\TME4025Project"
.LASF32:
	.string	"xMemoryRegion"
.LASF3:
	.string	"short unsigned int"
.LASF67:
	.string	"vPortEnterCritical"
.LASF16:
	.string	"char"
.LASF17:
	.string	"_Bool"
.LASF36:
	.string	"GPIO_PIN_INTR_ANYEDGE"
.LASF45:
	.string	"GPIO_PullUp_DIS"
.LASF68:
	.string	"vPortExitCritical"
.LASF39:
	.string	"GPIO_INT_TYPE"
.LASF31:
	.string	"ulParameters"
.LASF10:
	.string	"uint32"
.LASF49:
	.string	"GPIO_Mode"
.LASF76:
	.string	"GNU C 4.8.2 -fpreprocessed -mlongcalls -mtext-section-literals -g -Os -fno-inline-functions -fno-exceptions"
.LASF23:
	.string	"FLASH_SIZE_16M_MAP_1024_1024"
.LASF71:
	.string	"gpio_intr_handler_register"
.LASF34:
	.string	"GPIO_PIN_INTR_POSEDGE"
.LASF42:
	.string	"GPIO_Mode_Output"
.LASF25:
	.string	"flash_size_map"
.LASF60:
	.string	"button_init"
.LASF75:
	.string	"xTaskGenericCreate"
.LASF12:
	.string	"double"
.LASF59:
	.string	"rf_cal_sec"
.LASF61:
	.string	"gpio_in_cfg14"
.LASF53:
	.string	"LEDBlinkTask"
.LASF51:
	.string	"GPIO_IntrType"
.LASF58:
	.string	"size_map"
.LASF24:
	.string	"FLASH_SIZE_32M_MAP_1024_1024"
.LASF35:
	.string	"GPIO_PIN_INTR_NEGEDGE"
.LASF72:
	.string	"_xt_isr_unmask"
	.ident	"GCC: (GNU) 4.8.2"

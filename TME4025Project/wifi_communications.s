	.file	"wifi_communications.c"
	.text
.Ltext0:
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.LC0:
	.string	"Cameron"
	.align	4
.LC2:
	.string	"Allan111"
	.text
	.literal_position
	.literal .LC1, .LC0
	.literal .LC3, .LC2
	.literal .LC4, wifi_event_hand_function
	.align	4
	.global	initwifi
	.type	initwifi, @function
initwifi:
.LFB1:
	.file 1 "src/wifi_communications.c"
	.loc 1 10 0
	addi	sp, sp, -128
.LCFI0:
	.loc 1 11 0
	movi.n	a2, 1
	.loc 1 10 0
	s32i	a0, sp, 124
	.loc 1 11 0
	call0	wifi_set_opmode
.LVL0:
	.loc 1 13 0
	movi	a4, 0x67
	mov.n	a2, sp
	movi.n	a3, 0
	call0	memset
.LVL1:
	.loc 1 15 0
	l32r	a3, .LC1
	mov.n	a2, sp
	call0	strcpy
.LVL2:
	.loc 1 16 0
	l32r	a3, .LC3
	addi	a2, sp, 32
	call0	strcpy
.LVL3:
	.loc 1 17 0
	mov.n	a2, sp
	call0	wifi_station_set_config
.LVL4:
	.loc 1 18 0
	l32r	a2, .LC4
	call0	wifi_set_event_handler_cb
.LVL5:
	.loc 1 21 0
	l32i	a0, sp, 124
	movi	a9, 0x80
	add.n	sp, sp, a9
.LCFI1:
	ret.n
.LFE1:
	.size	initwifi, .-initwifi
	.section	.rodata.str1.4
	.align	4
.LC5:
	.string	"iot.espressif.cn"
	.align	4
.LC7:
	.string	"/ws"
	.align	4
.LC9:
	.string	"9000"
	.align	4
.LC11:
	.string	"9443"
	.text
	.literal_position
	.literal .LC6, .LC5
	.literal .LC8, .LC7
	.literal .LC10, .LC9
	.literal .LC12, .LC11
	.align	4
	.global	esp_demo
	.type	esp_demo, @function
esp_demo:
.LFB3:
	.loc 1 43 0
.LVL6:
	addi	sp, sp, -16
.LCFI2:
	s32i.n	a13, sp, 4
	extui	a13, a2, 0, 8
	.loc 1 45 0
	movi.n	a2, 0x20
.LVL7:
	.loc 1 43 0
	s32i.n	a12, sp, 8
	s32i.n	a14, sp, 0
	s32i.n	a0, sp, 12
	.loc 1 43 0
	extui	a14, a3, 0, 8
	.loc 1 45 0
	call0	zalloc
.LVL8:
	mov.n	a12, a2
.LVL9:
	.loc 1 46 0
	beqz.n	a2, .L23
	.loc 1 50 0
	movi.n	a2, 0x40
.LVL10:
	.loc 1 49 0
	beqz.n	a14, .L4
	.loc 1 50 0
	call0	zalloc
.LVL11:
	s32i.n	a2, a12, 16
	j	.L22
.L4:
	.loc 1 56 0
	call0	zalloc
.LVL12:
	s32i.n	a2, a12, 4
.L22:
	.loc 1 57 0
	beqz.n	a2, .L5
	.loc 1 60 0
	l32r	a3, .LC6
	call0	strcpy
.LVL13:
	.loc 1 63 0
	movi	a2, 0x100
	call0	zalloc
.LVL14:
	s32i.n	a2, a12, 20
	.loc 1 64 0
	beqz.n	a2, .L5
	.loc 1 67 0
	l32r	a3, .LC8
	call0	strcpy
.LVL15:
	.loc 1 69 0
	addi.n	a2, a12, 8
	l32r	a3, .LC10
	.loc 1 68 0
	beqi	a13, 1, .L21
.L7:
	.loc 1 71 0
	bnei	a13, 2, .L5
	.loc 1 72 0
	l32r	a3, .LC12
	addi.n	a2, a12, 8
.L21:
	call0	strcpy
.LVL16:
	.loc 1 77 0
	mov.n	a2, a12
	.loc 1 73 0
	s32i.n	a13, a12, 0
	.loc 1 77 0
	call0	websocket_start
.LVL17:
	.loc 1 78 0
	movi.n	a2, 0
	j	.L19
.L5:
	.loc 1 81 0
	l32i.n	a2, a12, 20
	call0	free
.LVL18:
	.loc 1 82 0
	l32i.n	a2, a12, 4
	call0	free
.LVL19:
	.loc 1 83 0
	l32i.n	a2, a12, 16
	call0	free
.LVL20:
	.loc 1 84 0
	mov.n	a2, a12
	call0	free
.LVL21:
.L23:
	.loc 1 86 0
	movi.n	a2, -1
.L19:
	.loc 1 87 0
	l32i.n	a0, sp, 12
	l32i.n	a12, sp, 8
.LVL22:
	l32i.n	a13, sp, 4
.LVL23:
	l32i.n	a14, sp, 0
.LVL24:
	addi	sp, sp, 16
.LCFI3:
	ret.n
.LFE3:
	.size	esp_demo, .-esp_demo
	.literal_position
	.align	4
	.global	wifi_event_hand_function
	.type	wifi_event_hand_function, @function
wifi_event_hand_function:
.LFB2:
	.loc 1 24 0
.LVL25:
	addi	sp, sp, -16
.LCFI4:
	.loc 1 25 0
	l32i.n	a2, a2, 0
.LVL26:
	.loc 1 24 0
	s32i.n	a0, sp, 12
	.loc 1 25 0
	bnei	a2, 4, .L24
.LVL27:
.LBB4:
.LBB5:
	.loc 1 33 0
	movi.n	a2, 2
	movi.n	a3, 0
	call0	esp_demo
.LVL28:
.L24:
.LBE5:
.LBE4:
	.loc 1 40 0
	l32i.n	a0, sp, 12
	addi	sp, sp, 16
.LCFI5:
	ret.n
.LFE2:
	.size	wifi_event_hand_function, .-wifi_event_hand_function
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x80
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
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI4-.LFB2
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0
	.align	4
.LEFDE4:
	.text
.Letext0:
	.file 2 "c:\\xtensa-lx106-elf\\xtensa-lx106-elf\\include\\stdint.h"
	.file 3 "c:\\xtensa-lx106-elf\\lib\\gcc\\xtensa-lx106-elf\\4.8.2\\include\\stddef.h"
	.file 4 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/espressif/c_types.h"
	.file 5 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/espressif/esp_wifi.h"
	.file 6 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/lwip/ipv4/lwip/ip4_addr.h"
	.file 7 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/espressif/esp_sta.h"
	.file 8 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/nopoll/nopoll_decl.h"
	.file 9 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/freertos/queue.h"
	.file 10 "src/wifi_communications.h"
	.file 11 "src/websocket.h"
	.file 12 "C:/Workspaces/ESP8266/SDK/ESP8266_RTOS_SDK/include/espressif/esp_libc.h"
	.file 13 "<built-in>"
	.file 14 "c:\\xtensa-lx106-elf\\xtensa-lx106-elf\\include\\stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x93d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF120
	.byte	0x1
	.4byte	.LASF121
	.4byte	.LASF122
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x29
	.4byte	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2a
	.4byte	0x42
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x2
	.byte	0x35
	.4byte	0x54
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x2
	.byte	0x51
	.4byte	0x74
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x3
	.byte	0xd4
	.4byte	0x74
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x4
	.byte	0x28
	.4byte	0x69
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x4
	.byte	0x2b
	.4byte	0x37
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x4
	.byte	0x2d
	.4byte	0x25
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x4
	.byte	0x32
	.4byte	0x49
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x4
	.byte	0x34
	.4byte	0x69
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF17
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF18
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF19
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF20
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF21
	.uleb128 0x6
	.byte	0x4
	.4byte	0xf6
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF22
	.uleb128 0x6
	.byte	0x4
	.4byte	0x103
	.uleb128 0x7
	.4byte	0xf6
	.uleb128 0x8
	.4byte	0xf6
	.4byte	0x118
	.uleb128 0x9
	.4byte	0xe9
	.byte	0x7
	.byte	0
	.uleb128 0xa
	.4byte	.LASF50
	.byte	0x4
	.byte	0x6
	.byte	0x2c
	.4byte	0x131
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x6
	.byte	0x2d
	.4byte	0x94
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.4byte	.LASF23
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.byte	0x33
	.4byte	0x15f
	.uleb128 0xd
	.4byte	.LASF24
	.sleb128 0
	.uleb128 0xd
	.4byte	.LASF25
	.sleb128 1
	.uleb128 0xd
	.4byte	.LASF26
	.sleb128 2
	.uleb128 0xd
	.4byte	.LASF27
	.sleb128 3
	.uleb128 0xd
	.4byte	.LASF28
	.sleb128 4
	.byte	0
	.uleb128 0x2
	.4byte	.LASF29
	.byte	0x5
	.byte	0x39
	.4byte	0x138
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.byte	0x3b
	.4byte	0x197
	.uleb128 0xd
	.4byte	.LASF30
	.sleb128 0
	.uleb128 0xd
	.4byte	.LASF31
	.sleb128 1
	.uleb128 0xd
	.4byte	.LASF32
	.sleb128 2
	.uleb128 0xd
	.4byte	.LASF33
	.sleb128 3
	.uleb128 0xd
	.4byte	.LASF34
	.sleb128 4
	.uleb128 0xd
	.4byte	.LASF35
	.sleb128 5
	.byte	0
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0x5
	.byte	0x42
	.4byte	0x16a
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.byte	0xf8
	.4byte	0x1e7
	.uleb128 0xd
	.4byte	.LASF37
	.sleb128 0
	.uleb128 0xd
	.4byte	.LASF38
	.sleb128 1
	.uleb128 0xd
	.4byte	.LASF39
	.sleb128 2
	.uleb128 0xd
	.4byte	.LASF40
	.sleb128 3
	.uleb128 0xd
	.4byte	.LASF41
	.sleb128 4
	.uleb128 0xd
	.4byte	.LASF42
	.sleb128 5
	.uleb128 0xd
	.4byte	.LASF43
	.sleb128 6
	.uleb128 0xd
	.4byte	.LASF44
	.sleb128 7
	.uleb128 0xd
	.4byte	.LASF45
	.sleb128 8
	.uleb128 0xd
	.4byte	.LASF46
	.sleb128 9
	.byte	0
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x5
	.2byte	0x103
	.4byte	0x1a2
	.uleb128 0xf
	.byte	0x8
	.byte	0x5
	.2byte	0x125
	.4byte	0x217
	.uleb128 0x10
	.4byte	.LASF49
	.byte	0x5
	.2byte	0x126
	.4byte	0xc0
	.byte	0
	.uleb128 0x11
	.string	"bss"
	.byte	0x5
	.2byte	0x127
	.4byte	0x2a8
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF51
	.byte	0x40
	.byte	0x7
	.byte	0x98
	.4byte	0x2a8
	.uleb128 0xb
	.4byte	.LASF52
	.byte	0x7
	.byte	0x99
	.4byte	0x589
	.byte	0
	.uleb128 0xb
	.4byte	.LASF53
	.byte	0x7
	.byte	0x9b
	.4byte	0x308
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x7
	.byte	0x9c
	.4byte	0x2f8
	.byte	0xa
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x7
	.byte	0x9d
	.4byte	0x9f
	.byte	0x2a
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x7
	.byte	0x9e
	.4byte	0x9f
	.byte	0x2b
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x7
	.byte	0x9f
	.4byte	0xaa
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x7
	.byte	0xa0
	.4byte	0x197
	.byte	0x30
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x7
	.byte	0xa1
	.4byte	0x9f
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0x7
	.byte	0xa2
	.4byte	0xb5
	.byte	0x36
	.uleb128 0xb
	.4byte	.LASF61
	.byte	0x7
	.byte	0xa3
	.4byte	0xb5
	.byte	0x38
	.uleb128 0xb
	.4byte	.LASF62
	.byte	0x7
	.byte	0xa4
	.4byte	0x536
	.byte	0x3c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x217
	.uleb128 0xe
	.4byte	.LASF63
	.byte	0x5
	.2byte	0x128
	.4byte	0x1f3
	.uleb128 0xf
	.byte	0x28
	.byte	0x5
	.2byte	0x12a
	.4byte	0x2f8
	.uleb128 0x10
	.4byte	.LASF54
	.byte	0x5
	.2byte	0x12b
	.4byte	0x2f8
	.byte	0
	.uleb128 0x10
	.4byte	.LASF55
	.byte	0x5
	.2byte	0x12c
	.4byte	0x9f
	.byte	0x20
	.uleb128 0x10
	.4byte	.LASF53
	.byte	0x5
	.2byte	0x12d
	.4byte	0x308
	.byte	0x21
	.uleb128 0x10
	.4byte	.LASF56
	.byte	0x5
	.2byte	0x12e
	.4byte	0x9f
	.byte	0x27
	.byte	0
	.uleb128 0x8
	.4byte	0x9f
	.4byte	0x308
	.uleb128 0x9
	.4byte	0xe9
	.byte	0x1f
	.byte	0
	.uleb128 0x8
	.4byte	0x9f
	.4byte	0x318
	.uleb128 0x9
	.4byte	0xe9
	.byte	0x5
	.byte	0
	.uleb128 0xe
	.4byte	.LASF64
	.byte	0x5
	.2byte	0x12f
	.4byte	0x2ba
	.uleb128 0xf
	.byte	0x28
	.byte	0x5
	.2byte	0x131
	.4byte	0x362
	.uleb128 0x10
	.4byte	.LASF54
	.byte	0x5
	.2byte	0x132
	.4byte	0x2f8
	.byte	0
	.uleb128 0x10
	.4byte	.LASF55
	.byte	0x5
	.2byte	0x133
	.4byte	0x9f
	.byte	0x20
	.uleb128 0x10
	.4byte	.LASF53
	.byte	0x5
	.2byte	0x134
	.4byte	0x308
	.byte	0x21
	.uleb128 0x10
	.4byte	.LASF65
	.byte	0x5
	.2byte	0x135
	.4byte	0x9f
	.byte	0x27
	.byte	0
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x5
	.2byte	0x136
	.4byte	0x324
	.uleb128 0xf
	.byte	0x2
	.byte	0x5
	.2byte	0x138
	.4byte	0x392
	.uleb128 0x10
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x139
	.4byte	0x9f
	.byte	0
	.uleb128 0x10
	.4byte	.LASF68
	.byte	0x5
	.2byte	0x13a
	.4byte	0x9f
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.4byte	.LASF69
	.byte	0x5
	.2byte	0x13b
	.4byte	0x36e
	.uleb128 0xf
	.byte	0xc
	.byte	0x5
	.2byte	0x13d
	.4byte	0x3cd
	.uleb128 0x11
	.string	"ip"
	.byte	0x5
	.2byte	0x13e
	.4byte	0x118
	.byte	0
	.uleb128 0x10
	.4byte	.LASF70
	.byte	0x5
	.2byte	0x13f
	.4byte	0x118
	.byte	0x4
	.uleb128 0x11
	.string	"gw"
	.byte	0x5
	.2byte	0x140
	.4byte	0x118
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.4byte	.LASF71
	.byte	0x5
	.2byte	0x141
	.4byte	0x39e
	.uleb128 0xf
	.byte	0x7
	.byte	0x5
	.2byte	0x143
	.4byte	0x3fd
	.uleb128 0x11
	.string	"mac"
	.byte	0x5
	.2byte	0x144
	.4byte	0x308
	.byte	0
	.uleb128 0x11
	.string	"aid"
	.byte	0x5
	.2byte	0x145
	.4byte	0x9f
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.4byte	.LASF72
	.byte	0x5
	.2byte	0x146
	.4byte	0x3d9
	.uleb128 0xf
	.byte	0x7
	.byte	0x5
	.2byte	0x148
	.4byte	0x42d
	.uleb128 0x11
	.string	"mac"
	.byte	0x5
	.2byte	0x149
	.4byte	0x308
	.byte	0
	.uleb128 0x11
	.string	"aid"
	.byte	0x5
	.2byte	0x14a
	.4byte	0x9f
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.4byte	.LASF73
	.byte	0x5
	.2byte	0x14b
	.4byte	0x409
	.uleb128 0xf
	.byte	0xc
	.byte	0x5
	.2byte	0x14d
	.4byte	0x45d
	.uleb128 0x10
	.4byte	.LASF57
	.byte	0x5
	.2byte	0x14e
	.4byte	0x62
	.byte	0
	.uleb128 0x11
	.string	"mac"
	.byte	0x5
	.2byte	0x14f
	.4byte	0x308
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF74
	.byte	0x5
	.2byte	0x150
	.4byte	0x439
	.uleb128 0x12
	.byte	0x28
	.byte	0x5
	.2byte	0x152
	.4byte	0x4d3
	.uleb128 0x13
	.4byte	.LASF75
	.byte	0x5
	.2byte	0x153
	.4byte	0x2ae
	.uleb128 0x13
	.4byte	.LASF76
	.byte	0x5
	.2byte	0x154
	.4byte	0x318
	.uleb128 0x13
	.4byte	.LASF77
	.byte	0x5
	.2byte	0x155
	.4byte	0x362
	.uleb128 0x13
	.4byte	.LASF78
	.byte	0x5
	.2byte	0x156
	.4byte	0x392
	.uleb128 0x13
	.4byte	.LASF79
	.byte	0x5
	.2byte	0x157
	.4byte	0x3cd
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x5
	.2byte	0x158
	.4byte	0x3fd
	.uleb128 0x13
	.4byte	.LASF81
	.byte	0x5
	.2byte	0x159
	.4byte	0x42d
	.uleb128 0x13
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x15a
	.4byte	0x45d
	.byte	0
	.uleb128 0xe
	.4byte	.LASF83
	.byte	0x5
	.2byte	0x15b
	.4byte	0x469
	.uleb128 0x14
	.4byte	.LASF84
	.byte	0x2c
	.byte	0x5
	.2byte	0x15d
	.4byte	0x507
	.uleb128 0x10
	.4byte	.LASF85
	.byte	0x5
	.2byte	0x15e
	.4byte	0x1e7
	.byte	0
	.uleb128 0x10
	.4byte	.LASF86
	.byte	0x5
	.2byte	0x15f
	.4byte	0x4d3
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF87
	.byte	0x5
	.2byte	0x160
	.4byte	0x4df
	.uleb128 0xe
	.4byte	.LASF88
	.byte	0x5
	.2byte	0x16c
	.4byte	0x51f
	.uleb128 0x6
	.byte	0x4
	.4byte	0x525
	.uleb128 0x15
	.4byte	0x530
	.uleb128 0x16
	.4byte	0x530
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x507
	.uleb128 0x6
	.byte	0x4
	.4byte	0x9f
	.uleb128 0x8
	.4byte	0x9f
	.4byte	0x54c
	.uleb128 0x9
	.4byte	0xe9
	.byte	0x3f
	.byte	0
	.uleb128 0xa
	.4byte	.LASF89
	.byte	0x67
	.byte	0x7
	.byte	0x34
	.4byte	0x589
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x7
	.byte	0x35
	.4byte	0x2f8
	.byte	0
	.uleb128 0xb
	.4byte	.LASF90
	.byte	0x7
	.byte	0x36
	.4byte	0x53c
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF91
	.byte	0x7
	.byte	0x37
	.4byte	0x9f
	.byte	0x60
	.uleb128 0xb
	.4byte	.LASF53
	.byte	0x7
	.byte	0x38
	.4byte	0x308
	.byte	0x61
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.byte	0x7
	.byte	0x99
	.4byte	0x59e
	.uleb128 0xb
	.4byte	.LASF92
	.byte	0x7
	.byte	0x99
	.4byte	0x2a8
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF93
	.byte	0x8
	.byte	0xcd
	.4byte	0x62
	.uleb128 0x2
	.4byte	.LASF94
	.byte	0x9
	.byte	0x53
	.4byte	0xe0
	.uleb128 0x18
	.4byte	.LASF123
	.byte	0x4
	.byte	0xa
	.byte	0xd
	.4byte	0x5d9
	.uleb128 0xd
	.4byte	.LASF95
	.sleb128 0
	.uleb128 0xd
	.4byte	.LASF96
	.sleb128 1
	.uleb128 0xd
	.4byte	.LASF97
	.sleb128 2
	.uleb128 0xd
	.4byte	.LASF98
	.sleb128 3
	.byte	0
	.uleb128 0xa
	.4byte	.LASF99
	.byte	0x20
	.byte	0xa
	.byte	0x14
	.4byte	0x63a
	.uleb128 0xb
	.4byte	.LASF100
	.byte	0xa
	.byte	0x15
	.4byte	0x5b4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF101
	.byte	0xa
	.byte	0x16
	.4byte	0xf0
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF102
	.byte	0xa
	.byte	0x17
	.4byte	0x108
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF103
	.byte	0xa
	.byte	0x18
	.4byte	0xf0
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF104
	.byte	0xa
	.byte	0x19
	.4byte	0xf0
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF105
	.byte	0xa
	.byte	0x1a
	.4byte	0xf0
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF106
	.byte	0xa
	.byte	0x1b
	.4byte	0xf0
	.byte	0x1c
	.byte	0
	.uleb128 0x19
	.4byte	.LASF113
	.byte	0x1
	.byte	0x17
	.byte	0x1
	.4byte	0x652
	.uleb128 0x1a
	.4byte	.LASF124
	.byte	0x1
	.byte	0x17
	.4byte	0x530
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF125
	.byte	0x1
	.byte	0x9
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x70b
	.uleb128 0x1c
	.4byte	.LASF109
	.byte	0x1
	.byte	0xc
	.4byte	0x54c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1d
	.4byte	.LVL0
	.4byte	0x88c
	.4byte	0x689
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL1
	.4byte	0x8a1
	.4byte	0x6a8
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x67
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL2
	.4byte	0x8be
	.4byte	0x6c5
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL3
	.4byte	0x8be
	.4byte	0x6e3
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC2
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL4
	.4byte	0x8dc
	.4byte	0x6f7
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x71
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL5
	.4byte	0x8f7
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x5
	.byte	0x3
	.4byte	wifi_event_hand_function
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF126
	.byte	0x1
	.byte	0x2a
	.4byte	0x62
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x815
	.uleb128 0x21
	.4byte	.LASF107
	.byte	0x1
	.byte	0x2a
	.4byte	0xf6
	.4byte	.LLST0
	.uleb128 0x21
	.4byte	.LASF108
	.byte	0x1
	.byte	0x2a
	.4byte	0x131
	.4byte	.LLST1
	.uleb128 0x22
	.4byte	.LASF110
	.byte	0x1
	.byte	0x2c
	.4byte	0x815
	.4byte	.LLST2
	.uleb128 0x23
	.4byte	.LASF127
	.byte	0x1
	.byte	0x4f
	.uleb128 0x1d
	.4byte	.LVL8
	.4byte	0x90d
	.4byte	0x76c
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL11
	.4byte	0x90d
	.4byte	0x780
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.byte	0
	.uleb128 0x24
	.4byte	.LVL12
	.4byte	0x90d
	.uleb128 0x1d
	.4byte	.LVL13
	.4byte	0x8be
	.4byte	0x7a0
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC5
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL14
	.4byte	0x90d
	.4byte	0x7b5
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.2byte	0x100
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL15
	.4byte	0x8be
	.4byte	0x7cc
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC7
	.byte	0
	.uleb128 0x24
	.4byte	.LVL16
	.4byte	0x8be
	.uleb128 0x1d
	.4byte	.LVL17
	.4byte	0x922
	.4byte	0x7e9
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x24
	.4byte	.LVL18
	.4byte	0x933
	.uleb128 0x24
	.4byte	.LVL19
	.4byte	0x933
	.uleb128 0x24
	.4byte	.LVL20
	.4byte	0x933
	.uleb128 0x1f
	.4byte	.LVL21
	.4byte	0x933
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x5d9
	.uleb128 0x25
	.4byte	0x63a
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x85f
	.uleb128 0x26
	.4byte	0x646
	.4byte	.LLST3
	.uleb128 0x27
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x26
	.4byte	0x646
	.4byte	.LLST4
	.uleb128 0x1f
	.4byte	.LVL28
	.4byte	0x70b
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
	.4byte	.LASF128
	.byte	0xb
	.byte	0x34
	.4byte	0x5a9
	.uleb128 0x29
	.4byte	.LASF111
	.byte	0xb
	.byte	0x32
	.4byte	0x59e
	.uleb128 0x5
	.byte	0x3
	.4byte	debug
	.uleb128 0x29
	.4byte	.LASF112
	.byte	0xb
	.byte	0x33
	.4byte	0x59e
	.uleb128 0x5
	.byte	0x3
	.4byte	show_critical_only
	.uleb128 0x2a
	.4byte	.LASF115
	.byte	0x5
	.byte	0x6c
	.4byte	0x131
	.4byte	0x8a1
	.uleb128 0x16
	.4byte	0x15f
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF114
	.4byte	0xe0
	.4byte	0x8be
	.uleb128 0x16
	.4byte	0xe0
	.uleb128 0x16
	.4byte	0x62
	.uleb128 0x16
	.4byte	0xe9
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF129
	.byte	0xd
	.byte	0
	.4byte	.LASF130
	.4byte	0xf0
	.4byte	0x8dc
	.uleb128 0x16
	.4byte	0xf0
	.uleb128 0x16
	.4byte	0xfd
	.byte	0
	.uleb128 0x2a
	.4byte	.LASF116
	.byte	0x7
	.byte	0x60
	.4byte	0x131
	.4byte	0x8f1
	.uleb128 0x16
	.4byte	0x8f1
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x54c
	.uleb128 0x2d
	.4byte	.LASF117
	.byte	0x5
	.2byte	0x176
	.4byte	0x131
	.4byte	0x90d
	.uleb128 0x16
	.4byte	0x513
	.byte	0
	.uleb128 0x2a
	.4byte	.LASF118
	.byte	0xc
	.byte	0x42
	.4byte	0xe0
	.4byte	0x922
	.uleb128 0x16
	.4byte	0x89
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF119
	.byte	0xb
	.byte	0x4a
	.4byte	0x933
	.uleb128 0x16
	.4byte	0xe0
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF131
	.byte	0xe
	.byte	0x52
	.uleb128 0x16
	.4byte	0xe0
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
	.uleb128 0x3
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x13
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
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x17
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
	.uleb128 0x13
	.uleb128 0xd
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
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x4
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1e
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL23-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL8-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL8-1-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL24-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL26-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL28-.Ltext0
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
.LASF12:
	.string	"u32_t"
.LASF98:
	.string	"WEBSOCKET_END"
.LASF24:
	.string	"NULL_MODE"
.LASF11:
	.string	"size_t"
.LASF52:
	.string	"next"
.LASF102:
	.string	"WebPort"
.LASF71:
	.string	"Event_StaMode_Got_IP_t"
.LASF111:
	.string	"debug"
.LASF105:
	.string	"WebProtocols"
.LASF90:
	.string	"password"
.LASF28:
	.string	"MAX_MODE"
.LASF10:
	.string	"long long unsigned int"
.LASF47:
	.string	"SYSTEM_EVENT"
.LASF48:
	.string	"addr"
.LASF131:
	.string	"free"
.LASF46:
	.string	"EVENT_MAX"
.LASF103:
	.string	"WebHostName"
.LASF25:
	.string	"STATION_MODE"
.LASF4:
	.string	"int16_t"
.LASF32:
	.string	"AUTH_WPA_PSK"
.LASF9:
	.string	"long long int"
.LASF2:
	.string	"signed char"
.LASF99:
	.string	"ESP_WebInfo"
.LASF30:
	.string	"AUTH_OPEN"
.LASF91:
	.string	"bssid_set"
.LASF116:
	.string	"wifi_station_set_config"
.LASF79:
	.string	"got_ip"
.LASF85:
	.string	"event_id"
.LASF20:
	.string	"long int"
.LASF117:
	.string	"wifi_set_event_handler_cb"
.LASF129:
	.string	"__builtin_strcpy"
.LASF76:
	.string	"connected"
.LASF68:
	.string	"new_mode"
.LASF13:
	.string	"uint8"
.LASF89:
	.string	"station_config"
.LASF127:
	.string	"demo_error"
.LASF18:
	.string	"double"
.LASF110:
	.string	"pwebinfo"
.LASF16:
	.string	"uint32"
.LASF43:
	.string	"EVENT_SOFTAPMODE_STACONNECTED"
.LASF70:
	.string	"mask"
.LASF121:
	.string	"src/wifi_communications.c"
.LASF80:
	.string	"sta_connected"
.LASF84:
	.string	"_esp_event"
.LASF93:
	.string	"nopoll_bool"
.LASF60:
	.string	"freq_offset"
.LASF8:
	.string	"unsigned int"
.LASF83:
	.string	"Event_Info_u"
.LASF19:
	.string	"long unsigned int"
.LASF74:
	.string	"Event_SoftAPMode_ProbeReqRecved_t"
.LASF122:
	.string	"C:\\\\Workspaces\\\\ESP8266\\\\TME4025Project"
.LASF58:
	.string	"authmode"
.LASF120:
	.string	"GNU C 4.8.2 -fpreprocessed -mlongcalls -mtext-section-literals -g -Os -fno-inline-functions -fno-exceptions"
.LASF124:
	.string	"event"
.LASF40:
	.string	"EVENT_STAMODE_AUTHMODE_CHANGE"
.LASF6:
	.string	"short unsigned int"
.LASF104:
	.string	"WebUrl"
.LASF126:
	.string	"esp_demo"
.LASF54:
	.string	"ssid"
.LASF87:
	.string	"System_Event_t"
.LASF36:
	.string	"AUTH_MODE"
.LASF63:
	.string	"Event_StaMode_ScanDone_t"
.LASF130:
	.string	"strcpy"
.LASF86:
	.string	"event_info"
.LASF94:
	.string	"xQueueHandle"
.LASF15:
	.string	"sint16"
.LASF31:
	.string	"AUTH_WEP"
.LASF21:
	.string	"sizetype"
.LASF62:
	.string	"esp_mesh_ie"
.LASF95:
	.string	"WEBSOCKET_START"
.LASF69:
	.string	"Event_StaMode_AuthMode_Change_t"
.LASF77:
	.string	"disconnected"
.LASF82:
	.string	"ap_probereqrecved"
.LASF50:
	.string	"ip_addr"
.LASF26:
	.string	"SOFTAP_MODE"
.LASF72:
	.string	"Event_SoftAPMode_StaConnected_t"
.LASF88:
	.string	"wifi_event_handler_cb_t"
.LASF45:
	.string	"EVENT_SOFTAPMODE_PROBEREQRECVED"
.LASF17:
	.string	"float"
.LASF64:
	.string	"Event_StaMode_Connected_t"
.LASF53:
	.string	"bssid"
.LASF41:
	.string	"EVENT_STAMODE_GOT_IP"
.LASF119:
	.string	"websocket_start"
.LASF29:
	.string	"WIFI_MODE"
.LASF113:
	.string	"wifi_event_hand_function"
.LASF23:
	.string	"_Bool"
.LASF3:
	.string	"unsigned char"
.LASF81:
	.string	"sta_disconnected"
.LASF65:
	.string	"reason"
.LASF5:
	.string	"short int"
.LASF55:
	.string	"ssid_len"
.LASF114:
	.string	"memset"
.LASF107:
	.string	"option"
.LASF67:
	.string	"old_mode"
.LASF61:
	.string	"freqcal_val"
.LASF92:
	.string	"stqe_next"
.LASF44:
	.string	"EVENT_SOFTAPMODE_STADISCONNECTED"
.LASF97:
	.string	"WEBSOCKET_TLS"
.LASF56:
	.string	"channel"
.LASF78:
	.string	"auth_change"
.LASF7:
	.string	"uint32_t"
.LASF108:
	.string	"addr_flag"
.LASF22:
	.string	"char"
.LASF57:
	.string	"rssi"
.LASF35:
	.string	"AUTH_MAX"
.LASF75:
	.string	"scan_done"
.LASF59:
	.string	"is_hidden"
.LASF1:
	.string	"uint8_t"
.LASF112:
	.string	"show_critical_only"
.LASF118:
	.string	"zalloc"
.LASF42:
	.string	"EVENT_STAMODE_DHCP_TIMEOUT"
.LASF38:
	.string	"EVENT_STAMODE_CONNECTED"
.LASF0:
	.string	"int8_t"
.LASF66:
	.string	"Event_StaMode_Disconnected_t"
.LASF27:
	.string	"STATIONAP_MODE"
.LASF51:
	.string	"bss_info"
.LASF96:
	.string	"WEBSOCKET_NORMAL"
.LASF100:
	.string	"WebOption"
.LASF49:
	.string	"status"
.LASF123:
	.string	"WEBSOCKET_CMD"
.LASF109:
	.string	"sta_config"
.LASF33:
	.string	"AUTH_WPA2_PSK"
.LASF125:
	.string	"initwifi"
.LASF37:
	.string	"EVENT_STAMODE_SCAN_DONE"
.LASF101:
	.string	"WebHostIp"
.LASF106:
	.string	"WebOrigin"
.LASF115:
	.string	"wifi_set_opmode"
.LASF128:
	.string	"Web_QueueStop"
.LASF34:
	.string	"AUTH_WPA_WPA2_PSK"
.LASF14:
	.string	"sint8"
.LASF39:
	.string	"EVENT_STAMODE_DISCONNECTED"
.LASF73:
	.string	"Event_SoftAPMode_StaDisconnected_t"
	.ident	"GCC: (GNU) 4.8.2"

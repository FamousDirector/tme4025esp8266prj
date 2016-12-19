/*
 *  LibNoPoll: A websocket library
 *  Copyright (C) 2013 Advanced Software Production Line, S.L.
 *
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this program; if not, write to the Free
 *  Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
 *  02111-1307 USA
 *  
 *  You may find a copy of the license under this software is released
 *  at COPYING file. This is LGPL software: you are welcome to develop
 *  proprietary applications using this library without any royalty or
 *  fee but returning back any change, improvement or addition in the
 *  form of source code, project image, documentation patches, etc.
 *
 *  For commercial support on build Websocket enabled solutions
 *  contact us:
 *          
 *      Postal address:
 *         Advanced Software Production Line, S.L.
 *         Edificio Alius A, Oficina 102,
 *         C/ Antonio Suarez Nº 10,
 *         Alcalá de Henares 28802 Madrid
 *         Spain
 *
 *      Email address:
 *         info@aspl.es - http://www.aspl.es/nopoll
 */

#ifndef __WEBSOCKET_H__
#define __WEBSOCKET_H__

#include <nopoll/nopoll.h>
#include "ssl_compat-1.0.h"
#include "esp_common.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"

nopoll_bool debug;
nopoll_bool show_critical_only;
LOCAL xQueueHandle	Web_QueueStop;

#define local_host_name		"iot.espressif.cn"
#define local_host_url		"v1/datastreams/tem_hum/datapoint"
#define local_host_port		"9000"
#define local_host_ports	"9443"

nopoll_bool ICACHE_FLASH_ATTR test_sending_and_check_echo (noPollConn * conn, const char * label, const char * msg);
void ICACHE_FLASH_ATTR __report_critical (noPollCtx * ctx, noPollDebugLevel level, const char * log_msg, noPollPtr user_data);
noPollCtx ICACHE_FLASH_ATTR * create_ctx (void);

nopoll_bool ICACHE_FLASH_ATTR test_02 (void);
nopoll_bool ICACHE_FLASH_ATTR test_03 (void);
nopoll_bool ICACHE_FLASH_ATTR test_04a (void);
nopoll_bool ICACHE_FLASH_ATTR test_04b (void);
nopoll_bool ICACHE_FLASH_ATTR test_05 (void);
nopoll_bool ICACHE_FLASH_ATTR test_06 (void);
nopoll_bool ICACHE_FLASH_ATTR test_07 (void);
nopoll_bool ICACHE_FLASH_ATTR test_08 (void);
LOCAL int ICACHE_FLASH_ATTR websocket_main (char *argv);
LOCAL void ICACHE_FLASH_ATTR websocket_task(void *pvParameters);
/*start the websocket task*/
void ICACHE_FLASH_ATTR websocket_start(void *optarg);
/*stop the websocket task*/
sint8 ICACHE_FLASH_ATTR websocket_stop(void);
/* end-of-file-found */

#endif

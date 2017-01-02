#ifndef __WIFICOMMUNICATIONS_H__
#define __WIFICOMMUNICATIONS_H__

#include "esp_common.h"

#include "espconn.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"

#include "tcp_client.h"

//todo temporary
#define AP_SSID "Cameron"
#define AP_PASSWORD "allan111"

static int wificonnectedflag;

static ICACHE_FLASH_ATTR void setwificonnectedflag(int value);
extern ICACHE_FLASH_ATTR int getwificonnectedflag();
static ICACHE_FLASH_ATTR void wifi_handle_event_cb(System_Event_t *evt);
extern ICACHE_FLASH_ATTR void connecttowifi(void);
extern ICACHE_FLASH_ATTR char * sendmessage(char * message); //returns the reply message

#endif
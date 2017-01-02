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

static void setwificonnectedflag(int value);

extern int getwificonnectedflag();

static void wifi_handle_event_cb(System_Event_t *evt);
void connecttowifi(void);
char * sendmessage(char * message); //returns the reply message

#endif
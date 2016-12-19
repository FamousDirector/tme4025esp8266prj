#ifndef __WIFICOMMUNICATIONS_H__
#define __WIFICOMMUNICATIONS_H__

#include "esp_common.h"

#include "espconn.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"

#include "tcp_client.h"

#define AP_SSID "Cameron"
#define AP_PASSWORD "allan111"

void wifi_handle_event_cb(System_Event_t *evt);
void connecttowifi(void);
void sendmessage(void);

#endif
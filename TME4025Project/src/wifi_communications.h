#ifndef __WIFICOMMUNICATIONS_H__
#define __WIFICOMMUNICATIONS_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "espconn.h"
#include "websocket.h"

#define ESP_WEBURLSIZE 		256
#define ESP_HOSTNAMESIZE	64

enum WEBSOCKET_CMD{
	WEBSOCKET_START,
	WEBSOCKET_NORMAL,
	WEBSOCKET_TLS,	
	WEBSOCKET_END
};

struct ESP_WebInfo{
	enum WEBSOCKET_CMD WebOption;
	char   *WebHostIp;
	char   WebPort[8];
	char   *WebHostName;
	char   *WebUrl;
	char   *WebProtocols;
	char   *WebOrigin;
};

#define PING_ALIVE 1

extern void initwifi(void);
extern void createtcpsocket(void);
extern void createtcpconnection(void);
extern void wifi_event_hand_function(System_Event_t *event);
extern int esp_demo(char option, bool addr_flag);

#endif
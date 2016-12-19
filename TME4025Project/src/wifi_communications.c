#include "wifi_communications.h"

#define AP_SSID "Cameron"
#define AP_PASSWORD "Allan111"

#define SERVER_IP "192.168.1.124"
#define SERVER_PORT 1001

extern void initwifi(void)
{
    wifi_set_opmode(STATION_MODE);
	struct station_config sta_config;
	bzero(&sta_config, sizeof(struct station_config));

	sprintf(sta_config.ssid, AP_SSID);
	sprintf(sta_config.password, AP_PASSWORD);
	wifi_station_set_config(&sta_config);
	wifi_set_event_handler_cb(wifi_event_hand_function); 

	return;
}

extern void wifi_event_hand_function(System_Event_t *event)
{	
	switch (event->event_id){
		case EVENT_STAMODE_CONNECTED:
			break;
		case EVENT_STAMODE_DISCONNECTED:
			break;
		case EVENT_STAMODE_AUTHMODE_CHANGE:
			break;
		case EVENT_STAMODE_GOT_IP:
			esp_demo(WEBSOCKET_TLS, false);
			break;
		case EVENT_STAMODE_DHCP_TIMEOUT:
			break;
		default:
			break;						
	}
}

extern int esp_demo(char option, bool addr_flag)
{
	struct ESP_WebInfo *pwebinfo = NULL;
	pwebinfo = (struct ESP_WebInfo*)zalloc(sizeof(struct ESP_WebInfo));
	if (pwebinfo == NULL)
		goto demo_error;
	
	if (addr_flag){
		pwebinfo->WebHostName = zalloc(ESP_HOSTNAMESIZE);
		if (pwebinfo->WebHostName == NULL)
			goto demo_error;
		
		sprintf(pwebinfo->WebHostName, "iot.espressif.cn");
	} else {
		pwebinfo->WebHostIp = zalloc(ESP_HOSTNAMESIZE);
		if (pwebinfo->WebHostIp == NULL)
			goto demo_error;
		
		sprintf(pwebinfo->WebHostIp, "iot.espressif.cn");
	}

	pwebinfo->WebUrl = zalloc(ESP_WEBURLSIZE);
	if (pwebinfo->WebUrl == NULL)
		goto demo_error;
	
	sprintf(pwebinfo->WebUrl, "/ws");
	if (option == WEBSOCKET_NORMAL){
		sprintf(pwebinfo->WebPort, "9000");
		pwebinfo->WebOption = WEBSOCKET_NORMAL;
	} else if(option == WEBSOCKET_TLS){
		sprintf(pwebinfo->WebPort, "9443");
		pwebinfo->WebOption = WEBSOCKET_TLS;
	} else
		goto demo_error;

	websocket_start(pwebinfo);
	return 0;
demo_error:
	if (pwebinfo != NULL){
		free(pwebinfo->WebUrl);
		free(pwebinfo->WebHostIp);
		free(pwebinfo->WebHostName);
		free(pwebinfo);
	}
	return -1;
}
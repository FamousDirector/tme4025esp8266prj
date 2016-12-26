#include "wifi_communications.h"

void wifi_handle_event_cb(System_Event_t *evt)
{
    printf("event %x\n", evt->event_id);
    
    switch (evt->event_id) {
         case EVENT_STAMODE_CONNECTED:
             printf("connect to ssid %s, channel %d\n",
             evt->event_info.connected.ssid,
             evt->event_info.connected.channel);
             break;
         case EVENT_STAMODE_DISCONNECTED:
             printf("disconnect from ssid %s, reason %d\n",
             evt->event_info.disconnected.ssid,
             evt->event_info.disconnected.reason);
             break;
         case EVENT_STAMODE_AUTHMODE_CHANGE:
             printf("mode: %d -> %d\n",
             evt->event_info.auth_change.old_mode,
             evt->event_info.auth_change.new_mode);
             break;
         case EVENT_STAMODE_GOT_IP:
             printf("ip:" IPSTR ",mask:" IPSTR ",gw:" IPSTR,
             IP2STR(&evt->event_info.got_ip.ip),
             IP2STR(&evt->event_info.got_ip.mask),
             IP2STR(&evt->event_info.got_ip.gw));
             printf("\n");
             break;
         default:
             break;
 }
} 

void connecttowifi(void)
{
	wifi_set_opmode(STATION_MODE); 
	struct station_config config;
	memset(&config,0,sizeof(config));  //set value of config from address of &config to width of size to be value '0'
	
    //TODO: look at WPS - https://github.com/esp8266/Arduino/issues/1958
    //look for button press (start a task?)
    //would wait and check to look for the WPS being enabled on the router
    //WPS will connect this device to the network
    //get the SSID and password from wifi_station_get_config 
    //store it to the flash with wifi_station_set_config

	sprintf(config.ssid, AP_SSID);
	sprintf(config.password, AP_PASSWORD);
	
	wifi_station_set_config(&config);         
	
	wifi_set_event_handler_cb(wifi_handle_event_cb);
	wifi_station_connect();

    initTCPCient();
}

char * sendmessage(char * message) //add a message to send
{
	//Parse Message
    char * reply = TcpCreateClient(message);
	return;
}

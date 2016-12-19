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
         case EVENT_SOFTAPMODE_STADISCONNECTED:
             printf("EVENT_SOFTAPMODE_STADISCONNECTED");
             break;
         default:
             break;
 }
} 

void connecttowifi(void)
{
	StaConectApConfig(AP_SSID,AP_PASSWORD);
    vTaskDelete(NULL);
}

void sendmessage(void) //TODO add return for failure, add a message to send
{
	
	return;
}

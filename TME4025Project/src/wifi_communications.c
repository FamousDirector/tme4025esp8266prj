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
             setwificonnectedflag(0);
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
             //Upon Successful connect
             setwificonnectedflag(1);
             storewificonfig();
             initTCPCient();
             break;
         default:
             break;
    }
} 

void setwificonnectedflag(int value)
{
    taskENTER_CRITICAL();
    wificonnectedflag = value;
    taskEXIT_CRITICAL();
}

int getwificonnectedflag()
{
    taskENTER_CRITICAL();
    int value = wificonnectedflag;
    taskEXIT_CRITICAL();
    return value;
}

void initwifi(void)
{
    wifi_set_opmode(STATION_MODE); 
}

void storewificonfig(void)
{
    struct station_config config;
    memset(&config,0,sizeof(config));  //set value of config from address of &config to width of size to be value '0'

    //Check to see if there is a stored config
    wifi_station_get_config(&config);

    //sprintf(config.ssid, AP_SSID); //debug
    //sprintf(config.password, AP_PASSWORD); //debug
    
    wifi_station_set_config(&config);         
    wifi_station_set_reconnect_policy(true);
}

void connecttowifi(void)
{	
	wifi_set_event_handler_cb(wifi_handle_event_cb);
	wifi_station_connect();    
}

char * sendmessage(char * message) //add a message to send
{
	//Parse Message
    char * reply = TcpCreateClient(message);
	return;
}

void debugwifisetup(void)
{
  struct station_config config;
  memset(&config,0,sizeof(config));  //set value of config from address of &config to width of size to be value '0'

  sprintf(config.ssid, AP_SSID);
  sprintf(config.password, AP_PASSWORD);
  
  wifi_station_set_config(&config);         
  
  wifi_set_event_handler_cb(wifi_handle_event_cb);
  wifi_station_connect();
    
  initTCPCient();
}

void scan_done(void *arg, STATUS status)
{
  uint8 ssid[33];
  char temp[128];

  if (status == OK)
  {
    struct bss_info *bss_link = (struct bss_info *)arg;
    bss_link = bss_link->next.stqe_next;//ignore the first one , it's invalid.

    while (bss_link != NULL)
    {
      memset(ssid, 0, 33);
      if (strlen(bss_link->ssid) <= 32)
      {
        memcpy(ssid, bss_link->ssid, strlen(bss_link->ssid));
      }
      else
      {
        memcpy(ssid, bss_link->ssid, 32);
      }
      printf("(%d,\"%s\",%d,\""MACSTR"\",%d)\r\n",
                 bss_link->authmode, ssid, bss_link->rssi,
                 MAC2STR(bss_link->bssid),bss_link->channel);
      bss_link = bss_link->next.stqe_next;
    }
  }
  else
  {
     printf("scan fail !!!\r\n");
  }

}

void user_scan(void)
{
    // wifi scan has to after system init done

   if(wifi_get_opmode() == SOFTAP_MODE)
   {
     printf("ap mode can't scan !!!\r\n");
     return;
   }
   wifi_station_scan(NULL,scan_done);

}
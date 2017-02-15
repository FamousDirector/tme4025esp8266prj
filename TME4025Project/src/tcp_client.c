#include "tcp_client.h"

/*-----------------------------------------------------------
                             Tcp Client
-------------------------------------------------------------*/

void initTCPCient(void)
{
	espconn_init();
	resetreplymessage(); 
	setsendfinishflag(0);
	setreadfinishflag(0);
	setconnectedflag(0);
	return;
}

void TcpClientConnectCb(void*arg)
{
    struct espconn* tcp_server_local=arg;
#if TCP_CLIENT_KEEP_ALIVE_ENABLE
	espconn_set_opt(tcp_server_local,BIT(3));//enable keep alive ,this api must call in connect callback

	uint32 keep_alvie=0;
	keep_alvie=TCP_CLIENT_KEEP_ALIVE_IDLE_S;
	espconn_set_keepalive(tcp_server_local,ESPCONN_KEEPIDLE,&keep_alvie);
	keep_alvie=TCP_CLIENT_RETRY_INTVL_S;
	espconn_set_keepalive(tcp_server_local,ESPCONN_KEEPINTVL,&keep_alvie);
	keep_alvie=keep_alvie=TCP_CLIENT_RETRY_INTVL_S;
	espconn_set_keepalive(tcp_server_local,ESPCONN_KEEPCNT,&keep_alvie);
	DBG_PRINT("keep alive enable\n");
#endif
	DBG_LINES("TCP CLIENT CONNECT");
	DBG_PRINT("tcp client ip:%d.%d.%d.%d port:%d\n",tcp_server_local->proto.tcp->remote_ip[0],
		                                          tcp_server_local->proto.tcp->remote_ip[1],
		                                          tcp_server_local->proto.tcp->remote_ip[2],
		                                          tcp_server_local->proto.tcp->remote_ip[3],
		                                          tcp_server_local->proto.tcp->remote_port
		                                          );
	setconnectedflag(1);
	//Dispose
	free(tcp_server_local);
	}

void TcpClientDisConnectCb(void* arg)
{
    struct espconn* tcp_server_local=arg;
	DBG_LINES("TCP CLIENT DISCONNECT");
	DBG_PRINT("tcp client ip:%d.%d.%d.%d port:%d\n",tcp_server_local->proto.tcp->remote_ip[0],
		                                          tcp_server_local->proto.tcp->remote_ip[1],
		                                          tcp_server_local->proto.tcp->remote_ip[2],
		                                          tcp_server_local->proto.tcp->remote_ip[3],
		                                          tcp_server_local->proto.tcp->remote_port
		                                          );
	setconnectedflag(0);
	espconn_delete(tcp_server_local); //delete connection
	//Dispose
	free(tcp_server_local);	
}
void TcpClienSendCb(void* arg)
{
    struct espconn* tcp_server_local=arg;
	DBG_LINES("TCP CLIENT SendCb");
	DBG_PRINT("tcp client ip:%d.%d.%d.%d port:%d\n",tcp_server_local->proto.tcp->remote_ip[0],
		                                          tcp_server_local->proto.tcp->remote_ip[1],
		                                          tcp_server_local->proto.tcp->remote_ip[2],
		                                          tcp_server_local->proto.tcp->remote_ip[3],
		                                          tcp_server_local->proto.tcp->remote_port
		                                          );
	setsendfinishflag(1);
	//Dispose
	free(tcp_server_local);	
}

void TcpRecvCb(void *arg, char *pdata, unsigned short len)
{
   struct espconn* tcp_server_local=arg;  
   DBG_LINES("TCP CLIENT RECIEVED");  
   DBG_PRINT("Recv tcp client ip:%d.%d.%d.%d port:%d len:%d\n",tcp_server_local->proto.tcp->remote_ip[0],
		                                          tcp_server_local->proto.tcp->remote_ip[1],
		                                          tcp_server_local->proto.tcp->remote_ip[2],
		                                          tcp_server_local->proto.tcp->remote_ip[3],
		                                          tcp_server_local->proto.tcp->remote_port,
		                                          len);
   //USE PDATA TO GET THE REPLY
   // os_printf("I got raw:%s\n\r", pdata); //debug
   taskENTER_CRITICAL();
   setreadfinishflag(1);
   setreplymessage((char *)pdata);
   taskEXIT_CRITICAL();
   free(tcp_server_local);

}
void TcpReconnectCb(void *arg, sint8 err)
{
    struct espconn* tcp_server_local=arg;
	DBG_LINES("TCP CLIENT RECONNECT");
	DBG_PRINT("status:%d\n",err);
	DBG_PRINT("tcp client ip:%d.%d.%d.%d port:%d\n",tcp_server_local->proto.tcp->remote_ip[0],
		                                          tcp_server_local->proto.tcp->remote_ip[1],
		                                          tcp_server_local->proto.tcp->remote_ip[2],
		                                          tcp_server_local->proto.tcp->remote_ip[3],
		                                          tcp_server_local->proto.tcp->remote_port\
		                                          );
	setconnectedflag(0);
	//Dispose
	free(tcp_server_local);	
}

void GetHostByNameCb(const char *name, ip_addr_t *ipaddr, void *callback_arg)
{    
	struct espconn* tcp_server_local=callback_arg; //use this to set the IP later
	uint32 addr = (uint32)ipaddr;
	

	DBG_PRINT("Server: 0x%x\n",dns_getserver());

	//Dispose
	free(ipaddr);

}

void setsendfinishflag(int value)
{
	taskENTER_CRITICAL();
	sendflag = value;
	taskEXIT_CRITICAL();
}

int getsendfinishflag()
{
	taskENTER_CRITICAL();
	int value = sendflag;
	taskEXIT_CRITICAL();
	return value;
}

void setreadfinishflag(int value)
{
	taskENTER_CRITICAL();
	readflag = value;
	taskEXIT_CRITICAL();
}

int getreadfinishflag()
{
	taskENTER_CRITICAL();
	int value = readflag;
	taskEXIT_CRITICAL();
	return value;
}

void setconnectedflag(int value)
{
	taskENTER_CRITICAL();
	connectedflag = value;
	taskEXIT_CRITICAL();
}

int getconnectedflag()
{
	taskENTER_CRITICAL();
	int value = connectedflag;
	taskEXIT_CRITICAL();
	return value;
}

static void setreplymessage(const char *message)
{	
	taskENTER_CRITICAL();
	sprintf((char *) &replymessage,message);
	taskEXIT_CRITICAL();
	// os_printf("Set: %s\n\r", message); //debug
}
static char * getreplymessage(void) //TODO doesnt return correctly first time
{
	char * message = "";
	taskENTER_CRITICAL();
	sprintf(message, (char *) &replymessage);
	taskEXIT_CRITICAL();
	// os_printf("Get: %s\n\r", message);//debug
	return message;
}

void resetreplymessage(void)
{
	setreplymessage((char *)EMPTY_MESSAGE_TAG);
	return;
}


char * TcpCreateClient(char *inputmessage) 
{ 
	uint8 con_status=wifi_station_get_connect_status();
	while(con_status!=STATION_GOT_IP){
		con_status=wifi_station_get_connect_status();
        DBG_PRINT("Connect ap %s\n",con_status==STATION_IDLE?"IDLE":con_status==STATION_CONNECTING?\
			                        "Connecting...":con_status==STATION_WRONG_PASSWORD?\
			                        "Password":con_status==STATION_NO_AP_FOUND?\
			                        "ap_not_find":con_status==STATION_CONNECT_FAIL?"Connect fail":"Get ip"\
			                        );
		vTaskDelay(100);
		taskYIELD();
	}

   	//Set Connection Options    
	tcp_client.type=ESPCONN_TCP;
	tcp_client.state = ESPCONN_NONE;
    tcp_client.proto.tcp = (esp_tcp *)os_zalloc(sizeof(esp_tcp));
    tcp_client.proto.tcp->local_port = espconn_port();
    tcp_client.proto.tcp->remote_port = TCP_SERVER_REMOTE_PORT;

	uint32 ipaddr; //TODO: use a domain name to resolve a IP address

    netconn_gethostbyname((const char *) TCP_SERVER_HOSTNAME, &ipaddr); //TODO

    unsigned int bytes[4];
	bytes[0] = (ipaddr >> 24) & 0xFF;
	bytes[1] = (ipaddr >> 16) & 0xFF;
	bytes[2] = (ipaddr >> 8) & 0xFF;
	bytes[3] = ipaddr & 0xFF;

	DBG_PRINT("IP0: %d\n",bytes[3]);
	DBG_PRINT("IP1: %d\n",bytes[2]);
	DBG_PRINT("IP2: %d\n",bytes[1]);
	DBG_PRINT("IP3: %d\n",bytes[0]);

    tcp_client.proto.tcp->remote_ip[0] = bytes[3];
 	tcp_client.proto.tcp->remote_ip[1] = bytes[2];
  	tcp_client.proto.tcp->remote_ip[2] = bytes[1];
  	tcp_client.proto.tcp->remote_ip[3] = bytes[0];

  	//Register Functions
	espconn_regist_connectcb(&tcp_client,TcpClientConnectCb);
	espconn_regist_recvcb(&tcp_client,TcpRecvCb);
	espconn_regist_reconcb(&tcp_client,TcpReconnectCb);
	espconn_regist_disconcb(&tcp_client,TcpClientDisConnectCb);
	espconn_regist_sentcb(&tcp_client,TcpClienSendCb);

	espconn_set_opt(&tcp_client,BIT(1));//disable nagle algorithm during TCP data transmission
	espconn_set_opt(&tcp_client,BIT(0));//free memory after TCP disconnection happen need not wait 2 minutes

	espconn_regist_time(&tcp_client,5,0); //set timeout

	espconn_connect(&tcp_client);

	//TODO - try xTaskNotify() to signal the task

	int count = 0;

	while(getconnectedflag() == 0 && count<RETRYCOUNT)
	{
		vTaskDelay (10/portTICK_RATE_MS); 
		count ++;
	}
	
	//Send Message
	char * message = (char *) concat(inputmessage, (char *) END_OF_MESSAGE_TAG); //add end of message operator

	espconn_send(&tcp_client,message,strlen(message));

	while(getsendfinishflag() == 0 && getconnectedflag())
	{
		vTaskDelay (10/portTICK_RATE_MS); 
	}
	setsendfinishflag(0); //reset flag

	while(getreadfinishflag() == 0 && getconnectedflag()) //wait until message is recieved
	{		
		vTaskDelay (10/portTICK_RATE_MS); 		
	}
	setreadfinishflag(0); //reset flag

	char * reply = (char *) getreplymessage();

	resetreplymessage(); //reset message

	if(getconnectedflag())
	{
		espconn_disconnect(&tcp_client);
	}	

	taskYIELD(); //get off the CPU

	vTaskDelay (100/portTICK_RATE_MS); 

	while(getconnectedflag()) //wait to be disconnected
	{		
		vTaskDelay (10/portTICK_RATE_MS);
	}

	return reply;

}

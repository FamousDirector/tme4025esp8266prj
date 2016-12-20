#include "tcp_client.h"

/*-----------------------------------------------------------
                             Tcp Client
-------------------------------------------------------------*/

void initTCPCient(void)
{
	espconn_init();

	taskENTER_CRITICAL();
	replymessage = "";
	taskEXIT_CRITICAL();
	
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
}

void TcpRecvCb(void *arg, char *pdata, unsigned short len)
{
   struct espconn* tcp_server_local=arg;    
   DBG_PRINT("Recv tcp client ip:%d.%d.%d.%d port:%d len:%d\n",tcp_server_local->proto.tcp->remote_ip[0],
		                                          tcp_server_local->proto.tcp->remote_ip[1],
		                                          tcp_server_local->proto.tcp->remote_ip[2],
		                                          tcp_server_local->proto.tcp->remote_ip[3],
		                                          tcp_server_local->proto.tcp->remote_port,
		                                          len);
   //USE PDATA TO GET THE REPLY
   printf("I got this reply 0:%s\n\r", pdata); //debug
   setreplymessage(pdata);
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
}

static void setreplymessage(char *message)
{	
	taskENTER_CRITICAL();
	replymessage = message;
	taskEXIT_CRITICAL();
}
static char*getreplymessage(void)
{
	taskENTER_CRITICAL();
	char * message = replymessage;
	taskEXIT_CRITICAL();
	return message;
}


char * TcpCreateClient(char *message)
{ 
	//Init
	initTCPCient();

	uint8 con_status=wifi_station_get_connect_status();
	while(con_status!=STATION_GOT_IP){
		con_status=wifi_station_get_connect_status();
        DBG_PRINT("Connect ap %s\n",con_status==STATION_IDLE?"IDLE":con_status==STATION_CONNECTING?\
			                        "Connecting...":con_status==STATION_WRONG_PASSWORD?\
			                        "Password":con_status==STATION_NO_AP_FOUND?\
			                        "ap_not_find":con_status==STATION_CONNECT_FAIL?"Connect fail":"Get ip"\
			                        );
		vTaskDelay(100);
	}

   	//Set Connection Options
    static struct espconn tcp_client;
	tcp_client.type=ESPCONN_TCP;
	tcp_client.state = ESPCONN_NONE;
    tcp_client.proto.tcp = (esp_tcp *)os_zalloc(sizeof(esp_tcp));
    tcp_client.proto.tcp->local_port = espconn_port();
    tcp_client.proto.tcp->remote_port = TCP_SERVER_REMOTE_PORT;

    tcp_client.proto.tcp->remote_ip[0] = TCP_SERVER_IPADDRESS_0;
 	tcp_client.proto.tcp->remote_ip[1] = TCP_SERVER_IPADDRESS_1;
  	tcp_client.proto.tcp->remote_ip[2] = TCP_SERVER_IPADDRESS_2;
  	tcp_client.proto.tcp->remote_ip[3] = TCP_SERVER_IPADDRESS_3;

  	//Register Functions
	espconn_regist_connectcb(&tcp_client,TcpClientConnectCb);
	espconn_regist_recvcb(&tcp_client,TcpRecvCb);
	espconn_regist_reconcb(&tcp_client,TcpReconnectCb);
	espconn_regist_disconcb(&tcp_client,TcpClientDisConnectCb);
	espconn_regist_sentcb(&tcp_client,TcpClienSendCb);
	DBG_PRINT("tcp client connect server,server ip:%d.%d.%d.%d port:%d\n",tcp_client.proto.tcp->remote_ip[0],
		                                          tcp_client.proto.tcp->remote_ip[1],
		                                          tcp_client.proto.tcp->remote_ip[2],
		                                          tcp_client.proto.tcp->remote_ip[3],
		                                          tcp_client.proto.tcp->remote_port\
		                                          );
	espconn_connect(&tcp_client);
	vTaskDelay (5000/portTICK_RATE_MS); //TODO look at espconn_regist_write_finish 
	espconn_send(&tcp_client,message,strlen(message));
	
	while(getreplymessage() == "")
	{
		vTaskDelay (250/portTICK_RATE_MS); //TODO look at espconn_regist_write_finish		
	}

	char * reply = getreplymessage();

	//TODO ensure message is not garbage
	//TODO do a proper handshake (maybe UID + 'recieved')
   	//espconn_send(tcp_server_local,handshake,handshake.length); //send back what was recieved

	setreplymessage((char *) ""); //reset message	
	espconn_disconnect(&tcp_client);

	printf("I got this reply 1:%s\n\r", reply); //debug
	return reply;

}

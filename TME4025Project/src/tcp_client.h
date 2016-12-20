#ifndef __TCPCLIENT_H__
#define __TCPCLIENT_H__

#include "c_types.h"

#include "esp_common.h"
#include "espconn.h"

//TCP CLIENT Config

uint8 tcp_server_ip[4];

#define TCP_SERVER_IPADDRESS_0 192
#define TCP_SERVER_IPADDRESS_1 168
#define TCP_SERVER_IPADDRESS_2 2
#define TCP_SERVER_IPADDRESS_3 182

#define TCP_SERVER_REMOTE_PORT 6969

#define TCP_CLIENT_GREETING "Hello!This is a tcp client test from the ESP8266\n"

#define TCP_CLIENT_KEEP_ALIVE_ENABLE 1

        #define TCP_CLIENT_KEEP_ALIVE_IDLE_S (10)
        #define TCP_CLIENT_RETRY_INTVL_S (5)
        #define TCP_CLIENT_RETRYC_NT     (3)

#define DBG_PRINT(fmt,...)	do{\
	    os_printf("[Dbg]");\
	    os_printf(fmt,##__VA_ARGS__);\
	}while(0)


#define ERR_PRINT(fmt,...) do{\
	    os_printf("[Err] Fun:%s Line:%d ",__FUNCTION__,__LINE__);\
	    os_printf(fmt,##__VA_ARGS__);\
	}while(0)
#define DBG_LINES(v) os_printf("------------------%s---------------\n",v)

void TcpClientConnect(void*arg);
void TcpClientDisConnect(void* arg);
void TcpClienSendCb(void* arg);
void TcpRecvCb(void *arg, char *pdata, unsigned short len);
void TcpReconnectCb(void *arg, sint8 err);
void TcpLocalClient(void);

#endif
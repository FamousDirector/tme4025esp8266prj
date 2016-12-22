#ifndef __TCPCLIENT_H__
#define __TCPCLIENT_H__

#include "c_types.h"

#include "esp_common.h"
#include "espconn.h"

#include "other_commands.h"

//TCP CLIENT Config
#define TCP_SERVER_IPADDRESS_0 192
#define TCP_SERVER_IPADDRESS_1 168
#define TCP_SERVER_IPADDRESS_2 2
#define TCP_SERVER_IPADDRESS_3 182
#define TCP_SERVER_REMOTE_PORT 8266

#define TCP_CLIENT_KEEP_ALIVE_ENABLE 1

#define END_OF_MESSAGE_TAG "<EOM>"
#define EMPTY_MESSAGE_TAG "<EMPTY>"
#define MAX_MESSAGE_SIZE 128

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

//variables
static char replymessage[MAX_MESSAGE_SIZE];

//Init
static void initTCPCient(void);

//Callbacks
static void TcpClientConnect(void*arg);
static void TcpClientDisConnect(void* arg);
static void TcpClienSendCb(void* arg);
static void TcpRecvCb(void *arg, char *pdata, unsigned short len);
static void TcpReconnectCb(void *arg, sint8 err);

//Reply Handling
static void setreplymessage(const char *inputmessage);
static char * getreplymessage(void);
static void resetreplymessage(void);

//External Functions
extern char * TcpCreateClient(char *message);

#endif
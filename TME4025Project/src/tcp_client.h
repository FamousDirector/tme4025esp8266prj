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

#define END_OF_MESSAGE_TAG "<EOM>"
#define EMPTY_MESSAGE_TAG "<EMPTY>"
#define MAX_MESSAGE_SIZE 256

#define TCP_CLIENT_KEEP_ALIVE_ENABLE 0

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
static int sendflag;
static int readflag;
static int connectedflag;

//Init
extern ICACHE_FLASH_ATTR void initTCPCient(void);

//Callbacks
static ICACHE_FLASH_ATTR void TcpClientConnect(void*arg);
static ICACHE_FLASH_ATTR void TcpClientDisConnect(void* arg);
static ICACHE_FLASH_ATTR void TcpClienSendCb(void* arg);
static ICACHE_FLASH_ATTR void TcpRecvCb(void *arg, char *pdata, unsigned short len);
static ICACHE_FLASH_ATTR void TcpReconnectCb(void *arg, sint8 err);

//get&sets
static ICACHE_FLASH_ATTR void setsendfinishflag(int value);
static ICACHE_FLASH_ATTR int getsendfinishflag();

static ICACHE_FLASH_ATTR void setreadfinishflag(int value);
static ICACHE_FLASH_ATTR int getreadfinishflag();

static ICACHE_FLASH_ATTR void setconnectedflag(int value);
static ICACHE_FLASH_ATTR int getconnectedflag();

//Reply Handling
static ICACHE_FLASH_ATTR void setreplymessage(const char *inputmessage);
static ICACHE_FLASH_ATTR char * getreplymessage(void);
static ICACHE_FLASH_ATTR void resetreplymessage(void);

//External Functions
extern ICACHE_FLASH_ATTR char * TcpCreateClient(char *message);

#endif
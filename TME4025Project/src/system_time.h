#ifndef __SYSTEMTIME_H__
#define __SYSTEMTIME_H__

#include "esp_common.h"

#include "espconn.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "lwip/apps/sntp.h"

#include "wifi_communications.h"

#define SNTP_SERVER "time-c.nist.gov"

static int sntpflag;

static ICACHE_FLASH_ATTR void initsystemtime();

extern ICACHE_FLASH_ATTR uint32 gettime(); // Get the current timestamp as an unsigned 32 bit value representing the number of seconds since January 1st 1970 UTC.
extern ICACHE_FLASH_ATTR void printtime(); //debug

#endif
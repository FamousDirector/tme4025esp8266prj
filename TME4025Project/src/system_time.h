#ifndef __SYSTEMTIME_H__
#define __SYSTEMTIME_H__

#include "esp_common.h"

#include "espconn.h"
#include "esp_timer.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "freertos/timers.h"
#include "lwip/apps/sntp.h"

#include <c_types.h>
#include <inttypes.h>

#include "relay_control.h"
#include "wifi_communications.h"

#define SNTP_SERVER "time-c.nist.gov"

#define MAX_TIMER_DELAY 10

static int sntpflag;

static uint32_t lastontimer;
static uint32_t lastofftimer;

extern ICACHE_FLASH_ATTR void initsystemtimers(void);

static ICACHE_FLASH_ATTR void initsntp(void);

static ICACHE_FLASH_ATTR uint32_t gettime(void); // Get the current timestamp as an unsigned 32 bit value representing the number of seconds since January 1st 1970 UTC.
static ICACHE_FLASH_ATTR void printtime(void); //debug

extern ICACHE_FLASH_ATTR void SetOnTime(char * value);
extern ICACHE_FLASH_ATTR void SetOffTime(char * value);

static ICACHE_FLASH_ATTR void ontimercallback();
static ICACHE_FLASH_ATTR void offtimercallback();

static ICACHE_FLASH_ATTR int checktimersset(uint32_t value, int state);

static void setlasttimeronsettime(uint32_t timer);
static uint32_t getlasttimeronsettime(void);

static void setlasttimeroffsettime(uint32_t timer);
static uint32_t getlasttimeroffsettime(void);




#endif
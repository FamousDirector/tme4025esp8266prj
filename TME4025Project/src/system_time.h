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

static void initsystemtime();
static void setsntpflag(int value);
static int getsntpflag();

extern long gettime();

extern void printtime(); //debug

#endif
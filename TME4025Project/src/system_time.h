#ifndef __SYSTEMTIME_H__
#define __SYSTEMTIME_H__

#include "esp_common.h"

#include "espconn.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "lwip/apps/sntp.h"

extern void initsystemtime();

#endif
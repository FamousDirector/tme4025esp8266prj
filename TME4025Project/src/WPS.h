#ifndef __WPS_H__
#define __WPS_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <espressif/esp_wps.h>
#include "gpio.h"

#include "wifi_communications.h"

#define WPS_BUTTON 4

static ICACHE_FLASH_ATTR void wpscallback(int status);

extern ICACHE_FLASH_ATTR void initwpsbutton(void);

extern ICACHE_FLASH_ATTR void beginWPS(void);

#endif
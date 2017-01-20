#ifndef __WPS_H__
#define __WPS_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#define WPS_BUTTON 4

extern ICACHE_FLASH_ATTR void initwpsbutton(void);

extern ICACHE_FLASH_ATTR void beginWPS(void);

#endif
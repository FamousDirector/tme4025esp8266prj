#ifndef __WPS_H__
#define __WPS_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#define WPS_BUTTON 15

static ICACHE_FLASH_ATTR void wps_intr_handler(void);
extern ICACHE_FLASH_ATTR void initwpsbutton(void);

#endif
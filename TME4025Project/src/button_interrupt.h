#ifndef __BUTTONINTTERRUPT_H__
#define __BUTTONINTTERRUPT_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#include "wifisetup.h"
#include "relay_control.h"

#define DEBOUCE_DELAY 500

static void ICACHE_FLASH_ATTR intr_handler(void);

extern void ICACHE_FLASH_ATTR initinterrupts(void);

#endif
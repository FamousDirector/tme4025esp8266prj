#ifndef __USERMAIN_H__
#define __USERMAIN_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"
#include "button_interrupt.h"
#include "relay_control.h"
#include "wifi_communications.h"

 #define ICACHE_RAM_ATTR __attribute__((section(".iram0.text"))) //as per http://www.esp8266.com/viewtopic.php?f=6&t=3266

//added as per: http://bbs.espressif.com/viewtopic.php?t=2492
uint32 ICACHE_FLASH_ATTR user_rf_cal_sector_set(void);

void ICACHE_FLASH_ATTR RelayTestTask (void *pvParameters);
void ICACHE_FLASH_ATTR TemperatureTestTask (void *pvParameters);
void ICACHE_FLASH_ATTR user_init(void);

#endif
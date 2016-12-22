#ifndef __BUTTONINTTERRUPT_H__
#define __BUTTONINTTERRUPT_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#define RELAY_BUTTON 14

static void intr_handler(void);
extern void initrelaybutton(void);

#endif
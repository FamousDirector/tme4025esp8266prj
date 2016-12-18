#ifndef __BUTTONINTTERRUPT_H__
#define __BUTTONINTTERRUPT_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

static void intr_handler();
extern void button_init(void);

#endif
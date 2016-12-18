#ifndef __TEMPERATURESENSOR_H__
#define __TEMPERATURESENSOR_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#define CONVERSIONFACTOR 1

extern int gettemperature(void);

#endif
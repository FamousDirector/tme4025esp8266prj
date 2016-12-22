#ifndef __POWERSENSOR_H__
#define __POWERSENSOR_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#include "mux_control.h"

#define CONVERSIONFACTOR 1

extern int getpower(void);

#endif
#ifndef __MUXCONTROL_H__
#define __MUXCONTROL_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#define MUX_PIN 13

#define MUXTEMPERATURE 0
#define MUXPOWER 1

extern void initmuxcontrol();
extern void setmuxcontrol(int option);

#endif
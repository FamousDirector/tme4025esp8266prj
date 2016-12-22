#ifndef __RELAYCONTROL_H__
#define __RELAYCONTROL_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#define RELAY_PIN 12

static int relaysstate = 0;

extern void initrelaycontrol();
extern void setrelaystate(int newstate);
extern int getrelaystate();
extern void invertrelaystate(void);

#endif
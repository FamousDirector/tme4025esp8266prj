#ifndef __RELAYCONTROL_H__
#define __RELAYCONTROL_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#include "button_interrupt.h"

#define RELAY_ON 1
#define RELAY_OFF 0

#define RELAY_PIN 12

static int relaysstate = 0;

extern void initrelaycontrol(void);
extern void setrelaystate(int newstate);
extern int getrelaystate(void);
extern void invertrelaystate(void);

#endif
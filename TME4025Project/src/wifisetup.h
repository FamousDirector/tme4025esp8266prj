#ifndef __WPS_H__
#define __WPS_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <espressif/esp_wps.h>
#include "gpio.h"

#include "wifi_communications.h"

#define WIFI_BUTTON 4
#define WIFI_INDICATOR 2

static int wifisstate = 0;

extern void invertwifistate(void);
extern void setwifistate(int newstate);
extern int getwifistate(void);


extern void initwifisetup(void);
static void initwifibutton(void);
static void initwifiindictator(void);

#endif
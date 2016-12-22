#ifndef __TASKS_H__
#define __TASKS_H__

#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#include "button_interrupt.h"
#include "mux_control.h"
#include "relay_control.h"
#include "power_sensor.h"
#include "temperature_sensor.h"
#include "wifi_communications.h"
#include "tcp_client.h"

#define TEMPERATURE_LOW_VALUE 10 //CELSIUS

#define SEND_STATUS_INTERVAL 10 //seconds
#define CHECK_TEMPERATURE_INTERVAL 3 //seconds

//Message Tags
#define TEMPERATURE_TAG "<Temperature=%d>"

//Tasks
static void checktemperature_task (void *pvParameters);
static void sendstatus_task (void *pvParameters);

//Start Tasks
extern void StartTasks(void);

#endif
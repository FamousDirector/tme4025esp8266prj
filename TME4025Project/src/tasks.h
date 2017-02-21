#ifndef __TASKS_H__
#define __TASKS_H__

#include <esp_common.h>

#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

#include <user_main.h>
#include "button_interrupt.h"
#include "mux_control.h"
#include "relay_control.h"
#include "power_sensor.h"
#include "temperature_sensor.h"
#include "wifi_communications.h"
#include "system_time.h"
#include "tcp_client.h"

#define TEMPERATURE_LOW_VALUE 10 //CELSIUS

#define SEND_STATUS_INTERVAL 5*60 //seconds
#define CHECK_TEMPERATURE_INTERVAL 30 //seconds

//Message Tags
#define TEMPERATURE_TAG "<Temperature=%d>"
#define POWER_TAG "<Power=%d>"
#define RELAY_TAG "<Relay=%d>"
#define UID_TAG "<UID=%s>"

#define OPEN_MESSAGE_CHAR '<'
#define MESSAGE_DIVIDER_CHAR '='
#define CLOSE_MESSAGE_CHAR '>'

//Tasks
static ICACHE_FLASH_ATTR void checktemperature_task (void *pvParameters);
static ICACHE_FLASH_ATTR void sendstatus_task (void *pvParameters);
static ICACHE_FLASH_ATTR void debug_task (void *pvParameters);
static ICACHE_FLASH_ATTR void scan_task(void *pvParameters);

//Task Function
static ICACHE_FLASH_ATTR void parsemessage (char message[256]);
static ICACHE_FLASH_ATTR void sendstatus (void);

//Start Tasks
extern ICACHE_FLASH_ATTR void StartTasks(void);

#endif
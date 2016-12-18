#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"
#include "button_interrupt.h"
#include "relay_control.h"

//added as per: http://bbs.espressif.com/viewtopic.php?t=2492
uint32 ICACHE_FLASH_ATTR user_rf_cal_sector_set(void)
{
    flash_size_map size_map = system_get_flash_size_map();
    uint32 rf_cal_sec = 0;

    switch (size_map) {
        case FLASH_SIZE_4M_MAP_256_256:
            rf_cal_sec = 128 - 8;
            break;

        case FLASH_SIZE_8M_MAP_512_512:
            rf_cal_sec = 256 - 5;
            break;

        case FLASH_SIZE_16M_MAP_512_512:
        case FLASH_SIZE_16M_MAP_1024_1024:
            rf_cal_sec = 512 - 5;
            break;

        case FLASH_SIZE_32M_MAP_512_512:
        case FLASH_SIZE_32M_MAP_1024_1024:
            rf_cal_sec = 1024 - 5;
            break;

        default:
            rf_cal_sec = 0;
            break;
    }

    return rf_cal_sec;
}

void RelayTestTask (void *pvParameters)
{
    //init
    initrelaycontrol();

    while(1)
    {
        // Delay and turn on
        vTaskDelay (1000/portTICK_RATE_MS);
        setrelaystate(0);
     
        // Delay and LED off
        vTaskDelay (1000/portTICK_RATE_MS);
        setrelaystate(1);
    }
}

void TemperatureTestTask (void *pvParameters)
{
    uint16 value = 0;

    while(1)
    {
        // Delay reading
        vTaskDelay (2000/portTICK_RATE_MS);
        value = gettemperature();
        printf("Temperature is %d \n\r",value); 
    }
}

void user_init(void)
   {
        printf("SDK version:%s\n", system_get_sdk_version());
        printf("HI JAMES THis is V4");
     
        //Configure Interrupts
        button_init();

        //Start Tasks
        xTaskCreate(RelayTestTask, (signed char *)"Blink", 256, NULL, 2, NULL);
        xTaskCreate(TemperatureTestTask, (signed char *)"Read", 256, NULL, 2, NULL);
   
   }
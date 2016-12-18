#include <esp_common.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "gpio.h"

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

void LEDBlinkTask (void *pvParameters)
{
    while(1)
    {
        // Delay and turn on
        vTaskDelay (300/portTICK_RATE_MS);
        GPIO_OUTPUT_SET(2, 0);
        printf("off");
     
        // Delay and LED off
        vTaskDelay (300/portTICK_RATE_MS);
        GPIO_OUTPUT_SET(2, 1);
        printf("on");
    }
}

void ADCREADTask (void *pvParameters)
{
    uint16 value = 0;

    //enable ADC as input (GPIO16)
    gpio16_input_conf();

    while(1)
    {
        // Delay reading
        vTaskDelay (800/portTICK_RATE_MS);
        value = system_adc_read();
        printf("Value is %d",value); 
    }
}

void user_init(void)
   {
        printf("SDK version:%s\n", system_get_sdk_version());
        printf("HI JAMES THis is V2");
     
        // Config pin as GPIO12
        PIN_FUNC_SELECT (PERIPHS_IO_MUX_MTDI_U, FUNC_GPIO12);
     
        //Start Tasks
        xTaskCreate(LEDBlinkTask, (signed char *)"Blink", 256, NULL, 2, NULL);
        xTaskCreate(ADCREADTask, (signed char *)"Read", 256, NULL, 2, NULL);
   
   }
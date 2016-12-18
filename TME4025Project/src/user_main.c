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
    //init
    PIN_FUNC_SELECT(PERIPHS_IO_MUX_MTDI_U, FUNC_GPIO12);

    while(1)
    {
        // Delay and turn on
        vTaskDelay (300/portTICK_RATE_MS);
        GPIO_OUTPUT_SET(12, 0);
        printf("off");
     
        // Delay and LED off
        vTaskDelay (300/portTICK_RATE_MS);
        GPIO_OUTPUT_SET(12, 1);
        printf("on");
    }
}

void ADCREADTask (void *pvParameters)
{
    uint16 value = 0;

    while(1)
    {
        // Delay reading
        vTaskDelay (800/portTICK_RATE_MS);
        value = system_adc_read();
        printf("Value is %d",value); 
    }
}

static void intr_handler() 
{    
    u32 gpio_status = GPIO_REG_READ(GPIO_STATUS_ADDRESS);
    gpio_pin_intr_state_set(GPIO_ID_PIN(14) , GPIO_PIN_INTR_DISABLE);
    GPIO_REG_WRITE(GPIO_STATUS_W1TC_ADDRESS, gpio_status & BIT(14) );

    portENTER_CRITICAL();
    
    //debounce (needs work)
    int i = 0;
    while(i< 5/portTICK_RATE_MS){i++;}  
  
    portEXIT_CRITICAL();

    printf("!!!");    

    gpio_pin_intr_state_set(GPIO_ID_PIN(14) ,GPIO_PIN_INTR_NEGEDGE);
}

void button_init(void)
{
    GPIO_ConfigTypeDef gpio_in_cfg14;
    gpio_in_cfg14.GPIO_Pin  = GPIO_Pin_14;
    gpio_in_cfg14.GPIO_IntrType = GPIO_PIN_INTR_NEGEDGE;
    gpio_in_cfg14.GPIO_Mode = GPIO_Mode_Input;
    gpio_in_cfg14.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&gpio_in_cfg14);

    gpio_intr_handler_register(intr_handler, NULL);
    _xt_isr_unmask(1 << ETS_GPIO_INUM);
}

void user_init(void)
   {
        printf("SDK version:%s\n", system_get_sdk_version());
        printf("HI JAMES THis is V2");
     
        //Configure Interrupts
        button_init();

        //Start Tasks
        xTaskCreate(LEDBlinkTask, (signed char *)"Blink", 256, NULL, 2, NULL);
        xTaskCreate(ADCREADTask, (signed char *)"Read", 256, NULL, 2, NULL);
   
   }
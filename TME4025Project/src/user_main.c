   #include <esp_common.h>
   #include <freertos/FreeRTOS.h>
   #include <freertos/task.h>

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


extern void uart_div_modify(int,int);
void helloTask(void *pvParameters)
{
   while(1)
   {
      printf("Hello world\n");
 
      vTaskDelay(1000 / portTICK_RATE_MS);
   }
}

void ICACHE_FLASH_ATTR user_init(void)
   {
 
      portBASE_TYPE ret;
 
      // Set UART speed to 115200
      uart_div_modify(0, UART_CLK_FREQ / 115200);
      wifi_set_opmode(NULL_MODE);
 
      xTaskHandle t;
      ret = xTaskCreate(helloTask, (const signed char *)"rx", 256, NULL, 2, &t);
 
   }
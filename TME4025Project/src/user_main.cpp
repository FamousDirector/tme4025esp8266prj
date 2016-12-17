extern "C"
{
   #include <esp_common.h>
   #include <freertos/FreeRTOS.h>
   #include <freertos/task.h>
 
   extern void uart_div_modify(int,int);
}

/*
* Simple task that prints "Hello world" every second
*/
void helloTask(void *pvParameters)
{
   while(1)
   {
      printf("Hello world\n");
 
      vTaskDelay(1000 / portTICK_RATE_MS);
   }
}
 
/*
* This is entry point for user code
*/
extern "C"
{
   void ICACHE_FLASH_ATTR user_init(void)
   {
 
      portBASE_TYPE ret;
 
      // Set UART speed to 115200
      uart_div_modify(0, UART_CLK_FREQ / 115200);
      wifi_set_opmode(NULL_MODE);
 
      xTaskHandle t;
      ret = xTaskCreate(helloTask, (const signed char *)"rx", 256, NULL, 2, &t);
 
   }
}
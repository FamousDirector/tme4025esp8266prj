#include "tasks.h"

static void checktemperature_task (void *pvParameters)
{
    while(1)
    {
        // Delay and turn on
        vTaskDelay (CHECK_TEMPERATURE_INTERVAL*1000/portTICK_RATE_MS);

        if(TEMPERATURE_LOW_VALUE>gettemperature())
        {
            setrelaystate(1);
        }
    } //end while
}
static void sendstatus_task (void *pvParameters)
{
    while(1)
    {
        // Delay reading
        vTaskDelay (10000/portTICK_RATE_MS);
        char * reply = sendmessage("Message: Reply to Me!\r\n"); 

        printf("I got this reply:%s\n\r", reply); //debug
    }
}
extern void StartTasks(void)
{
    xTaskCreate(sendstatus_task, (signed char *)"Status", 256, NULL, 2, NULL);
    xTaskCreate(checktemperature_task, (signed char *)"TempCheck", 256, NULL, 2, NULL);                   
}

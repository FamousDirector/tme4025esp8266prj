#include "tasks.h"

static void checktemperature_task (void *pvParameters)
{
    while(1)
    {
        //Interval 
        vTaskDelay (CHECK_TEMPERATURE_INTERVAL*1000/portTICK_RATE_MS);

        //Temperature Check
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
        //Interval
        vTaskDelay (SEND_STATUS_INTERVAL*1000/portTICK_RATE_MS);

        //Send Status
        char status[128] = "";

        //Get UID
        char uid[24] = "";
        sprintf(uid, (char *) UID_TAG, UID);
        strcat(status,uid);

        //Get Relay State
        char state[24] = "";
        sprintf(state, (char *) RELAY_TAG, getrelaystate());
        strcat(status,state);

        //Get Tank Temperature
        char temp[24] = "";
        sprintf(temp, (char *) TEMPERATURE_TAG, gettemperature());
        strcat(status,temp);

        //Get Power Usage
        char power[24] = "";
        sprintf(power, (char *) POWER_TAG, getpower());
        strcat(status,power);

        char reply[128] = ""; 
        sprintf(reply, (char *) sendmessage(status));

        //TODO parse 'reply'
        //TODO use rely info to set variables
        printf("I got this reply:%s\n\r", reply); //debug


        //TODO ensure message is not garbage
        //TODO do a proper handshake (maybe UID + 'recieved')
        
    }
}
extern void StartTasks(void)
{
    xTaskCreate(sendstatus_task, (signed char *)"Status", 512, NULL, 2, NULL);
    xTaskCreate(checktemperature_task, (signed char *)"TempCheck", 128, NULL, 2, NULL);                   
}

#include "system_time.h"

void initsystemtime()
{
    while (getwificonnectedflag() == 0)
    {
        vTaskDelay (250/portTICK_RATE_MS); //TODO wait for AP to be connected 
    }

    sntp_setservername(0,(char *) SNTP_SERVER); //set server
    sntp_set_timezone(0); //default to UTC
    sntp_init(); //"start"

    while (sntp_get_current_timestamp() == 0)
    {
        vTaskDelay (1000/portTICK_RATE_MS); //TODO wait for sntp to be set up 
    }
}

uint32 gettime()
{
    uint32 mtime;

    mtime = sntp_get_current_timestamp();

    if (mtime == 0) //make sure sntp is getting good data
    {
        sntp_stop();
        initsystemtime();
        vTaskDelay (250/portTICK_RATE_MS);
        mtime = gettime();
    }

    return mtime;
}

void printtime()
{    
    printf("Time %s\n\r", (char *) sntp_get_real_time(sntp_get_current_timestamp()));
}
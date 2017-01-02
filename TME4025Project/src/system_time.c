#include "system_time.h"

void initsystemtime()
{
    setsntpflag(0);

    while (getwificonnectedflag() == 0)
    {
        vTaskDelay (250/portTICK_RATE_MS); //TODO wait for AP to be connected 
    }

    sntp_setservername(0,(char *) SNTP_SERVER); //set server
    sntp_set_timezone(0); //default to UTC
    sntp_init(); //"start"

    while (sntp_get_current_timestamp() == 0)
    {
        vTaskDelay (100/portTICK_RATE_MS); //TODO wait for AP to be connected 
    }
    setsntpflag(1);
}
void setsntpflag(int value)
{
    taskENTER_CRITICAL();
    sntpflag = value;
    taskEXIT_CRITICAL();
}

int getsntpflag()
{
    taskENTER_CRITICAL();
    int value = sntpflag;
    taskEXIT_CRITICAL();
    return value;
}

long gettime()
{
    long mtime;

    initsystemtime();

    while (getsntpflag() == 0)
    {
        vTaskDelay (100/portTICK_RATE_MS); //TODO wait for AP to be connected 
    }

    mtime = sntp_get_current_timestamp();

    sntp_stop();
    setsntpflag(0);

    return mtime;
}

void printtime()
{    
    printf("Time %s\n\r", (char *) sntp_get_real_time(sntp_get_current_timestamp()));
}
#include "system_time.h"

void initsystemtimers(void)
{
    //INIT Vars
    setlasttimeronsettime(0);
    setlasttimeroffsettime(0);

}

void initsntp()
{
    //Ensure connected to WIFI
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

uint32_t gettime()
{
    uint32_t mtime;

    mtime = sntp_get_current_timestamp();

    if (mtime == 0) //make sure sntp is getting good data
    {
        sntp_stop();
        initsntp();
        vTaskDelay (250/portTICK_RATE_MS);
        mtime = gettime();
    }

    return mtime;
}

void printtime()
{    
    printf("Time %s\n\r", (char *) sntp_get_real_time(sntp_get_current_timestamp()));
}

void SetOnTime(char * value)
{
    uint32_t inputtime = chartouint32(value);
    if (checktimersset(inputtime,RELAY_ON))
    {
        if (gettime()<inputtime) 
        {
            uint32_t timeinticks = (inputtime - gettime())*1000/portTICK_RATE_MS;
            xTimerStart(xTimerCreate("OnTimer",timeinticks,pdFALSE, (void *) 0, ontimercallback),0);
            printf("Setting timer for turning on relay: %u\n\r",timeinticks); //debug 
        }
        else //time has been missed
        {
            setrelaystate(RELAY_ON);
            printf("Time has been missed, turning on relay\n\r"); //debug        
        }
    }
}
void SetOffTime(char * value)
{
    uint32_t inputtime = chartouint32(value);
    if (checktimersset(inputtime,RELAY_OFF))
    {
        if (gettime()<inputtime) 
        {
            uint32_t timeinticks = (inputtime - gettime())*1000/portTICK_RATE_MS;
            xTimerStart(xTimerCreate("OffTimer",timeinticks,pdFALSE, (void *) 0, offtimercallback),0);
            printf("Setting timer for turning on relay: %u\n\r",timeinticks); //debug     
        }
        else //time has been missed
        {
            setrelaystate(RELAY_OFF);
            printf("Time has been missed, turning off relay\n\r"); //debug
        }
    }
}
void ontimercallback()
{
    setrelaystate(RELAY_ON); //use the timer ID to determine the state of the relay to change to
}
void offtimercallback()
{
    setrelaystate(RELAY_OFF); //use the timer ID to determine the state of the relay to change to
}

int checktimersset(uint32_t value, int state)
{
    if(state == RELAY_ON)
    {
        if(value>getlasttimeronsettime())
        {
            setlasttimeronsettime(value);
            return 1;
        }
    }
    else if(state == RELAY_OFF)
    {
        if(value>getlasttimeroffsettime())
        {
            setlasttimeroffsettime(value);
            return 1;
        }        
    }
    
    //if no conditions are met
    return 0;    
}

void setlasttimeronsettime(uint32_t timer)
{
    taskENTER_CRITICAL();
    lastontimer = timer;
    taskEXIT_CRITICAL();
    return;
}
uint32_t getlasttimeronsettime(void)
{
    taskENTER_CRITICAL();
    uint32_t timer = lastontimer;
    taskEXIT_CRITICAL();
    return timer;
}

static void setlasttimeroffsettime(uint32_t timer)
{
    taskENTER_CRITICAL();
    lastofftimer = timer;
    taskEXIT_CRITICAL();
    return;
}
static uint32_t getlasttimeroffsettime(void)
{
    taskENTER_CRITICAL();
    uint32_t timer = lastofftimer;
    taskEXIT_CRITICAL();
    return timer;
}



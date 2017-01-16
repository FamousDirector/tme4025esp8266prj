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
            setrelaystate(RELAY_ON);
        }
    } //end while
}
static void tempandpowerreaddebug_task (void *pvParameters)
{
    //for debugging values
    while(1)
    {
        //Interval 
        vTaskDelay (2*1000/portTICK_RATE_MS);
        printf("Temperature Read Out: %d\n", gettemperature());
        printf("Power Read Out: %d\n", getpower()); 
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

        //Send Message
        char reply[256] = ""; 
        sprintf(reply, (char *) sendmessage(status)); //sends and recieves a message

        if(strcmp(reply,(char *) EMPTY_MESSAGE_TAG ) != 0) //make sure not an empty string
        {            
            parsemessage(reply);
        }
        else //if empty reply
        {
            //do nothing
        }           
    }
}

static ICACHE_FLASH_ATTR void parsemessage (char message[256])
{
    char dataidentifier[16] = ""; //identifies data
    char datavaluestring[65] = ""; //value of data
    
    //for fors
    int i;
    int j;
    int k;

    int messagelength = strlen(message);

    //parse message
    for(i=0; i<=messagelength; i++) {
        if(message[i] == OPEN_MESSAGE_CHAR ) //start of message found
        {                
            for(j=i+1; j<=messagelength; j++) 
            {
                if (message[j] == MESSAGE_DIVIDER_CHAR ) //found end of divider
                {
                    break;
                } 
            }
            memcpy( dataidentifier, &message[i+1], j-i-1 );  
            dataidentifier[j-i-1] = '\0'; //end string

            for(k=j+1; k<=messagelength; k++) 
            {
                if (message[k] == CLOSE_MESSAGE_CHAR ) //found end of message
                {
                    break;
                } 
            }
             memcpy( datavaluestring, &message[j+1], k-j-1 );
            datavaluestring[k-j-1] = '\0'; //end string

            //DEBUG              
            // printf("Identifier: %s\n", dataidentifier);
            // printf("Value: %s\n", datavaluestring);

            //Handle Messages (cant use switch case statement)
            if (strcmp(dataidentifier, "TimeOn") == 0) 
            {
                SetOnTime((char *)datavaluestring);
            }
            else if (strcmp(dataidentifier, "TimeOff") == 0) 
            {
                SetOffTime((char *)datavaluestring);
            }
            else if (strcmp(dataidentifier, "RelayState") == 0) 
            {
                if (strcmp(datavaluestring, "ON") == 0) 
                {
                    setrelaystate(RELAY_ON);
                }
                else if (strcmp(datavaluestring, "OFF") == 0) 
                {
                    setrelaystate(RELAY_OFF);                    
                }
            }
            
        }            
    }
    //TODO do a proper handshake (maybe UID + 'recieved')
}

extern void StartTasks(void)
{
    xTaskCreate(sendstatus_task, (signed char *)"Status", 1024, NULL, 2, NULL);
    xTaskCreate(checktemperature_task, (signed char *)"TempCheck", 128, NULL, 2, NULL); 
    xTaskCreate(tempandpowerreaddebug_task, (signed char *)"ValueDebug", 128, NULL, 2, NULL); //debug

}

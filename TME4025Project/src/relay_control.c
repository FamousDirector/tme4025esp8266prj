#include "relay_control.h"
#include "button_interrupt.h"

extern void initrelaycontrol()
{
	printf("Init Relay\r\n");
     
	//set relay pin to 12
	PIN_FUNC_SELECT(PERIPHS_IO_MUX_MTDI_U, FUNC_GPIO12);
	relaysstate = 0;
	return;
}

extern void setrelaystate(int newstate)
{
	printf("Turn Relay %d \r\n", newstate); //debug
    
    taskENTER_CRITICAL();
	relaysstate = newstate;
	taskEXIT_CRITICAL();
	GPIO_OUTPUT_SET(12, relaysstate);
	return;
}

extern int getrelaystate()
{
	taskENTER_CRITICAL();
	int newstate = relaysstate;
	taskEXIT_CRITICAL();
	return newstate;
}

extern void invertrelaystate(void)
{
    int state = getrelaystate();
    setrelaystate(!state);
    return;
}
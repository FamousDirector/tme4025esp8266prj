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
	printf("Turn Relay %d \r\n", newstate);
     
	relaysstate = newstate;
	GPIO_OUTPUT_SET(12, relaysstate);
	return;
}

extern int getrelaystate()
{
	return relaysstate;
}

extern void invertrelaystate(void)
{
    int state = getrelaystate();
    setrelaystate(!state);
    return;
}
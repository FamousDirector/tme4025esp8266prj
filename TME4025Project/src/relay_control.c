#include "relay_control.h"

extern void initrelaycontrol(void)
{
	printf("Init Relay\r\n");
    GPIO_ConfigTypeDef relay_cfg;
    relay_cfg.GPIO_Pin  = BIT(RELAY_PIN);
    relay_cfg.GPIO_IntrType = GPIO_PIN_INTR_DISABLE;
    relay_cfg.GPIO_Mode = GPIO_Mode_Output;
    relay_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&relay_cfg);

	relaysstate = 0;
	return;
}

extern void setrelaystate(int newstate)
{
	//printf("Turn Relay %d \r\n", newstate); //debug
    
    taskENTER_CRITICAL();
	relaysstate = newstate;
	taskEXIT_CRITICAL();
	GPIO_OUTPUT_SET(RELAY_PIN, relaysstate);
	return;
}

extern int getrelaystate(void)
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
#include "relay_control.h"

void setrelaystate(int newstate)
{
    //os_printf("Turn Relay %d \r\n", newstate); //debug
    
    taskENTER_CRITICAL();
    relaysstate = newstate;
    taskEXIT_CRITICAL();
    GPIO_OUTPUT_SET(RELAY_INDICATOR, relaysstate);
    GPIO_OUTPUT_SET(RELAY_PIN, !relaysstate);
    return;
}

int getrelaystate(void)
{
    taskENTER_CRITICAL();
    int newstate = relaysstate;
    taskEXIT_CRITICAL();
    return newstate;
}

void invertrelaystate(void)
{
    int state = getrelaystate();
    setrelaystate(!state);
    return;
}


void initrelay(void)
{
    initrelaybutton();
    initrelaycontrol();
    initrelayindicator();
}

void initrelaycontrol(void)
{
	os_printf("Init Relay\r\n");
    GPIO_ConfigTypeDef relay_cfg;
    relay_cfg.GPIO_Pin  = BIT(RELAY_PIN);
    relay_cfg.GPIO_IntrType = GPIO_PIN_INTR_DISABLE;
    relay_cfg.GPIO_Mode = GPIO_Mode_Output;
    relay_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&relay_cfg);

	relaysstate = 0;
    setrelaystate(0);
	return;
}

void initrelaybutton(void)
{
    GPIO_ConfigTypeDef relay_button_cfg;
    relay_button_cfg.GPIO_Pin  = BIT(RELAY_BUTTON);
    relay_button_cfg.GPIO_IntrType = GPIO_PIN_INTR_NEGEDGE;
    relay_button_cfg.GPIO_Mode = GPIO_Mode_Input;
    relay_button_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&relay_button_cfg);
}

void initrelayindicator(void)
{
    GPIO_ConfigTypeDef relay_ind_cfg;
    relay_ind_cfg.GPIO_Pin  = BIT(RELAY_INDICATOR);
    relay_ind_cfg.GPIO_IntrType = GPIO_PIN_INTR_DISABLE;
    relay_ind_cfg.GPIO_Mode = GPIO_Mode_Output;
    relay_ind_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&relay_ind_cfg);
}

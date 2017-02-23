#include "wifisetup.h"

void setwifistate(int newstate)
{   
    taskENTER_CRITICAL();
    wifisstate = newstate;
    taskEXIT_CRITICAL();
    GPIO_OUTPUT_SET(WIFI_INDICATOR, wifisstate);

    //TODO implement

    return;
}

int getwifistate(void)
{
    taskENTER_CRITICAL();
    int newstate = wifisstate;
    taskEXIT_CRITICAL();
    return newstate;
}

void invertwifistate(void)
{
    int state = getwifistate();
    setwifistate(!state);
    return;
}

void initwifibutton(void)
{
    GPIO_ConfigTypeDef wifi_button_cfg;
    wifi_button_cfg.GPIO_Pin  = BIT(WIFI_BUTTON);
    wifi_button_cfg.GPIO_IntrType = GPIO_PIN_INTR_NEGEDGE;
    wifi_button_cfg.GPIO_Mode = GPIO_Mode_Input;
    wifi_button_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&wifi_button_cfg);
}

void initwifiindictator(void)
{
    GPIO_ConfigTypeDef wifi_ind_cfg;
    wifi_ind_cfg.GPIO_Pin  = BIT(WIFI_INDICATOR);
    wifi_ind_cfg.GPIO_IntrType = GPIO_PIN_INTR_DISABLE;
    wifi_ind_cfg.GPIO_Mode = GPIO_Mode_Output;
    wifi_ind_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&wifi_ind_cfg);
}


void initwifisetup(void)
{
	initwifiindictator();
	initwifiindictator();
	
	setwifistate(0);
}

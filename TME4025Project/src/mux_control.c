#include "mux_control.h"

extern void initmuxcontrol()
{
	printf("Init Mux\r\n");
    GPIO_ConfigTypeDef mux_cfg;
    mux_cfg.GPIO_Pin  = BIT(MUX_PIN);
    mux_cfg.GPIO_IntrType = GPIO_PIN_INTR_DISABLE;
    mux_cfg.GPIO_Mode = GPIO_Mode_Output;
    mux_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&mux_cfg);
}
extern void setmuxcontrol(int option)
{	
	GPIO_OUTPUT_SET(MUX_PIN, option);
}
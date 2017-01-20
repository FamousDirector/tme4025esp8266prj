#include "WPS.h"

void initwpsbutton(void)
{
    GPIO_ConfigTypeDef wps_button_cfg;
    wps_button_cfg.GPIO_Pin  = BIT(WPS_BUTTON);
    wps_button_cfg.GPIO_IntrType = GPIO_PIN_INTR_NEGEDGE;
    wps_button_cfg.GPIO_Mode = GPIO_Mode_Input;
    wps_button_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&wps_button_cfg);
}

 void beginWPS(void)
 {
    //TODO
 }


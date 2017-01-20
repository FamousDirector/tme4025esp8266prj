#include "WPS.h"

extern void wps_intr_handler() 
{    
    u32 gpio_status = GPIO_REG_READ(GPIO_STATUS_ADDRESS);
    gpio_pin_intr_state_set(GPIO_ID_PIN(WPS_BUTTON) , GPIO_PIN_INTR_DISABLE); //disable interrupt
    GPIO_REG_WRITE(GPIO_STATUS_W1TC_ADDRESS, gpio_status & BIT(WPS_BUTTON) );

    portENTER_CRITICAL();
    
    //debounce (needs work)
    int i = 0;
    while(i< 5/portTICK_RATE_MS){i++;}  

    //Task to do
    printf("WPS button press!\r\n"); //debug
    //TODO something
  
    portEXIT_CRITICAL();

    gpio_pin_intr_state_set(GPIO_ID_PIN(WPS_BUTTON) ,GPIO_PIN_INTR_NEGEDGE); //enable interrupt
}

extern void initwpsbutton(void)
{
    GPIO_ConfigTypeDef wps_button_cfg;
    wps_button_cfg.GPIO_Pin  = BIT(WPS_BUTTON);
    wps_button_cfg.GPIO_IntrType = GPIO_PIN_INTR_NEGEDGE;
    wps_button_cfg.GPIO_Mode = GPIO_Mode_Input;
    wps_button_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&wps_button_cfg);

    gpio_intr_handler_register(wps_intr_handler, NULL);
    _xt_isr_unmask(1 << ETS_GPIO_INUM);
}

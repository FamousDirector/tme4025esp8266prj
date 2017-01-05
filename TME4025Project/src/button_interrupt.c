#include "button_interrupt.h"

extern void intr_handler() 
{    
    u32 gpio_status = GPIO_REG_READ(GPIO_STATUS_ADDRESS);
    gpio_pin_intr_state_set(GPIO_ID_PIN(RELAY_BUTTON) , GPIO_PIN_INTR_DISABLE); //disable interrupt
    GPIO_REG_WRITE(GPIO_STATUS_W1TC_ADDRESS, gpio_status & BIT(RELAY_BUTTON) );

    portENTER_CRITICAL();
    
    //debounce (needs work)
    int i = 0;
    while(i< 5/portTICK_RATE_MS){i++;}  

    //Task to do
    printf("Button press!\r\n"); //debug
    invertrelaystate();
  
    portEXIT_CRITICAL();

    gpio_pin_intr_state_set(GPIO_ID_PIN(RELAY_BUTTON) ,GPIO_PIN_INTR_NEGEDGE); //enable interrupt
}

extern void initrelaybutton(void)
{
    GPIO_ConfigTypeDef relay_button_cfg;
    relay_button_cfg.GPIO_Pin  = BIT(RELAY_BUTTON);
    relay_button_cfg.GPIO_IntrType = GPIO_PIN_INTR_NEGEDGE;
    relay_button_cfg.GPIO_Mode = GPIO_Mode_Input;
    relay_button_cfg.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&relay_button_cfg);

    gpio_intr_handler_register(intr_handler, NULL);
    _xt_isr_unmask(1 << ETS_GPIO_INUM);
}

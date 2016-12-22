#include "button_interrupt.h"

extern void intr_handler() 
{    
    u32 gpio_status = GPIO_REG_READ(GPIO_STATUS_ADDRESS);
    gpio_pin_intr_state_set(GPIO_ID_PIN(RELAY_BUTTON) , GPIO_PIN_INTR_DISABLE);
    GPIO_REG_WRITE(GPIO_STATUS_W1TC_ADDRESS, gpio_status & BIT(RELAY_BUTTON) );

    portENTER_CRITICAL();
    
    //debounce (needs work)
    int i = 0;
    while(i< 5/portTICK_RATE_MS){i++;}  

    //Task to do
    printf("Button press!\r\n");
    invertrelaystate();
  
    portEXIT_CRITICAL();

    gpio_pin_intr_state_set(GPIO_ID_PIN(RELAY_BUTTON) ,GPIO_PIN_INTR_NEGEDGE);
}

extern void initrelaybutton(void)
{
    GPIO_ConfigTypeDef gpio_in_cfg14;
    gpio_in_cfg14.GPIO_Pin  = BIT(RELAY_BUTTON);
    gpio_in_cfg14.GPIO_IntrType = GPIO_PIN_INTR_NEGEDGE;
    gpio_in_cfg14.GPIO_Mode = GPIO_Mode_Input;
    gpio_in_cfg14.GPIO_Pullup = GPIO_PullUp_EN;
    gpio_config(&gpio_in_cfg14);

    gpio_intr_handler_register(intr_handler, NULL);
    _xt_isr_unmask(1 << ETS_GPIO_INUM);
}

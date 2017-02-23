#include "button_interrupt.h"

extern void intr_handler(void) 
{    
    u32 gpio_status = GPIO_REG_READ(GPIO_STATUS_ADDRESS);
    
    //disable all interrupts
    //Relay Button
    gpio_pin_intr_state_set(GPIO_ID_PIN(RELAY_BUTTON) , GPIO_PIN_INTR_DISABLE); 
    GPIO_REG_WRITE(GPIO_STATUS_W1TC_ADDRESS, gpio_status & BIT(RELAY_BUTTON));
    //WPS Button
    gpio_pin_intr_state_set(GPIO_ID_PIN(WIFI_BUTTON) , GPIO_PIN_INTR_DISABLE); 
    GPIO_REG_WRITE(GPIO_STATUS_W1TC_ADDRESS, gpio_status & BIT(WIFI_BUTTON));
 
    os_printf("Interrupt!\r\n"); //debug    

    //debounce (needs work) Use gpio_input_get(void) ?
    int i = 0;
    while(i< DEBOUCE_DELAY/portTICK_RATE_MS){i++;}  

    //Task to do
    if ((gpio_status & (1<<RELAY_BUTTON)) != 0)
    {
        os_printf("Relay button press!\r\n"); //debug
        invertrelaystate();
    }
    if ((gpio_status & (1<<WIFI_BUTTON)) != 0) 
    {
        os_printf("Wifi button press!\r\n"); //debug
        invertwifistate();
    }

    //Re-enable Interrupts
    //Relay Button
    gpio_pin_intr_state_set(GPIO_ID_PIN(RELAY_BUTTON) , GPIO_PIN_INTR_NEGEDGE); 
    //WIFI Button
    gpio_pin_intr_state_set(GPIO_ID_PIN(WIFI_BUTTON) , GPIO_PIN_INTR_NEGEDGE); 

}

extern void initinterrupts(void)
{
    gpio_intr_handler_register(intr_handler, NULL);
    _xt_isr_unmask(1 << ETS_GPIO_INUM);
}



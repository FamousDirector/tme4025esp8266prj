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

void wpscallback(int status)
{
	if(status == WPS_CB_ST_SUCCESS)
	{
		os_printf("WPS_CB_ST_SUCCES: WPS succeed\r\n");
		wifi_wps_disable();
		connecttowifi();
	}
	else if(status == WPS_CB_ST_FAILED)
	{
		os_printf("WPS_CB_ST_FAILED: WPS fail\r\n");
		wifi_wps_disable();
	}
	else if(status == WPS_CB_ST_TIMEOUT)
	{
		os_printf("WPS_CB_ST_TIMEOUT: WPS timeout, fail\r\n");
		wifi_wps_disable();
	}
	else if(status == WPS_CB_ST_WEP)
	{
		os_printf("WPS_CB_ST_WEP: WPS failed because that WEP is not supported\r\n");
		wifi_wps_disable();		
	}
	else if(status == WPS_CB_ST_SCAN_ERR)
	{
		os_printf("WPS_CB_ST_SCAN_ERR: can not find the target WPS AP\r\n");
	}
}

 void beginWPS(void)
 {
 	wifi_wps_disable();	
    wifi_wps_enable(WPS_TYPE_PBC);
    wifi_set_wps_cb(wpscallback);
    wifi_wps_start();
 }


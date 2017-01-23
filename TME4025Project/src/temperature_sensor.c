#include "temperature_sensor.h"

extern int gettemperature(void)
{
	//Set Mux
	setmuxcontrol(MUXTEMPERATURE);

	int sum = 0;
	int iterations = 100;
	int i ;
	for (i= 0;i<=iterations;i++)
	{
		taskENTER_CRITICAL();
		sum = sum + system_adc_read();
		taskEXIT_CRITICAL();
		vTaskDelay (10/portTICK_RATE_MS);
	}

	int rawvalue = sum/iterations*CONVERSIONFACTOR; 

	return rawvalue;
}
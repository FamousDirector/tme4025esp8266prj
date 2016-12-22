#include "power_sensor.h"

extern int getpower(void)
{
	//Set Mux
	setmuxcontrol(MUXPOWER);

	int sum = 0;
	int iterations = 100;
	int i;
	for (i = 0;i<=iterations;i++)
	{
		sum = sum + system_adc_read();
		vTaskDelay (10/portTICK_RATE_MS);
	}

	int rawvalue = sum/iterations*CONVERSIONFACTOR;

	return rawvalue;
}
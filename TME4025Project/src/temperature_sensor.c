#include "temperature_sensor.h"

extern int gettemperature(void)
{
	int rawvalue = system_adc_read();
	return rawvalue*CONVERSIONFACTOR;
}
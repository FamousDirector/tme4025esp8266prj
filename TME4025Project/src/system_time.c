#include "system_time.h"

void initsystemtime()
{
    sntp_init();
}
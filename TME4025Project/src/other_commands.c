#include "other_commands.h"

extern char * concat(const char *s1, const char *s2)
{
    const size_t len1 = strlen(s1);
    const size_t len2 = strlen(s2);
    char *result = malloc(len1+len2+1);//+1 for the zero-terminator
    //in real code you would check for errors in malloc here
    memcpy(result, s1, len1);
    memcpy(result+len1, s2, len2+1);//+1 to copy the null-terminator
    return result;
}

extern uint32_t chartouint32(char *s)
{
    // os_printf("Value: %s\n", s); //debug
	uint32_t value;
    sscanf(s, "%d", &value);

	return value;
}

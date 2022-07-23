#include <stdio.h>
#include <string.h>

char end_command[] = "bye";

int main()
{
	printf("Will echo back what is typed, type %s to end\n", end_command);

	while(1) {
		char message[512] = "";
		scanf("%s", message);
		if (strcmp(message, end_command) == 0) 
			goto end;
		printf("%s\n", message);
	}
end:
	printf("Good Bye, Have nice day. Tune your vibration, be in non resistive, allowing mode\n");
	return 0;
}

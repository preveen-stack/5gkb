#include <stdio.h>
#include <string.h>

char end_command[] = "bye\n";
char prompt[] = "> ";

int main()
{
	printf("Will echo back what is typed, to end type %s", end_command);
	printf("%s", prompt);

	while(1) {
		char message[512] = "";
		// gets(message); // dangerous
		fgets(message, sizeof(message), stdin); // safe
		if (strcmp(message, end_command) == 0) 
			goto end;
		printf("%s", message);
		printf("%s", prompt);
	}
end:
	puts("Good Bye, Have nice day. Tune your vibration, be in non resistive, allowing mode\n");
	return 0;
}

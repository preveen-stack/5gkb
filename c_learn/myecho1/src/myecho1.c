#include <stdio.h>
#include <string.h>

char end_command[] = "bye\n";
char prompt[] = "> ";
void shuffle(char* message) {
	char* i = message;
	while(*i != '\0') {
		printf("%s\n", i);
		char t = *i;
		if (*(i+1) != '\0' || *(i + 1) != '\n') {
			*i = *(i + 1);
			*(i + 1) = t;
		}
		i++;
	}
}

int main()
{
	int message_count = 0;
	printf("Will echo back what is typed, to end type %s", end_command);
	printf("%s", prompt);

	while(1) {
		char message[512] = "";
		// gets(message); // dangerous
		fgets(message, sizeof(message), stdin); // safe
		if (strcmp(message, end_command) == 0) 
			goto end;
		//shuffle(message);
		printf("%d: %s", ++message_count, message);
		printf("%s", prompt);
	}
end:
	puts("Good Bye, Have nice day. Tune your vibration, be in non resistive, allowing mode\n");
	return 0;
}

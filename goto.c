#include <stdio.h>

char message[] = "Hello World";

int main() {

	printf("%s\n", message);

	goto end_of_main;

	printf("This will not be executed");

	end_of_main:
		return 0;
}

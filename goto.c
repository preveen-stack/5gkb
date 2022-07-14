#include <stdio.h>

char message[] = "Hello World";
char filename[] = "goto.c";

int main(int argc, char* argv[]) {

	printf("%s\n", filename); 

	printf("%s\n", message);

	goto end_of_main;

	printf("This will not be executed");

	end_of_main:
		return 0;
}

#!/usr/bin/bash
mkdir $1
mkdir $1/bin
mkdir $1/src
touch $1/src/$1.c
echo '/*' >> $1/src/$1.c
echo ' *' project $1 >> $1/src/$1.c
echo ' */' >> $1/src/$1.c
echo '' >> $1/src/$1.c
echo '#include <stdio.h>' >> $1/src/$1.c
echo "" >> $1/src/$1.c
echo int main\(\) \{ >> $1/src/$1.c
echo -e '\tprintf("Hello, World\\n");' >>$1/src/$1.c
echo -e '\t'return 0';' >>$1/src/$1.c 
echo \} >> $1/src/$1.c

touch $1/Makefile
echo all: >> $1/Makefile
echo -e '\t'gcc -o bin/$1 src/$1.c >> $1/Makefile
echo run: >> $1/Makefile
echo -e '\t'bin/$1 >> $1/Makefile
echo edit: >> $1/Makefile
echo -e '\t'vi src/$1.c >> $1/Makefile
echo bin/ >> $1/.gitignore
cd $1

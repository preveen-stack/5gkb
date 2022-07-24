#!/usr/bin/bash

if [ $# -lt 1 ] ; then
	echo usage $0 project_name
	exit 1
fi;

mkdir $1
mkdir $1/bin
mkdir $1/src
touch $1/src/$1.c
echo '/*' >> $1/src/$1.c
echo ' *' project $1 >> $1/src/$1.c
echo ' *' `date` >> $1/src/$1.c
echo ' */' >> $1/src/$1.c
echo '' >> $1/src/$1.c
echo '#include <stdio.h>' >> $1/src/$1.c
echo "" >> $1/src/$1.c
echo int main\(int argc, char* argv[]\) \{ >> $1/src/$1.c
echo -e '\tprintf("Hello, World\\n");' >>$1/src/$1.c
echo -e '\t'return 0';' >>$1/src/$1.c 
echo \} >> $1/src/$1.c

touch $1/Makefile

echo all: >> $1/Makefile
echo -e '\t'@grep '^[^#[:space:]].*:' Makefile >> $1/Makefile

echo gcc: >> $1/Makefile
echo -e '\t'gcc -Wall -o bin/$1 src/$1.c >> $1/Makefile

echo llvm: >> $1/Makefile
echo -e '\t'clang -Wall -o bin/$1 src/$1.c >> $1/Makefile

echo run: >> $1/Makefile
echo -e '\t'bin/$1 >> $1/Makefile

echo edit: >> $1/Makefile
echo -e '\t'vi src/$1.c >> $1/Makefile

echo vg: >> $1/Makefile
echo -e '\t'valgrind --tool=memcheck --leak-check=yes bin/$1 >> $1/Makefile
echo dbg: >> $1/Makefile
echo -e '\t'gdb bin/$1 >> $1/Makefile

echo gasm: >> $1/Makefile
echo -e '\t'gcc -o bin/$1.s -S src/$1.c >> $1/Makefile
echo -e '\t'less bin/$1.s >> $1/Makefile

echo gasmintel: >> $1/Makefile
echo -e '\t'gcc -o bin/$1.s -S -masm=intel src/$1.c >> $1/Makefile
echo -e '\t'less bin/$1.s >> $1/Makefile

echo lasm: >> $1/Makefile
echo -e '\t'clang -o bin/$1.s -S src/$1.c >> $1/Makefile
echo -e '\t'less bin/$1.s >> $1/Makefile 

echo lasmintel: >> $1/Makefile
echo -e '\t'clang -o bin/$1.s -S -masm=intel src/$1.c >> $1/Makefile
echo -e '\t' less bin/$1.s >> $1/Makefile

echo gprof: >> $1/Makefile
echo -e '\t'gcc -Wall -pg -o bin/$1 src/$1.c >> $1/Makefile
echo -e '\t'bin/$1 >> $1/Makefile
echo -e '\t'gprof bin/$1 gmon.out '>> bin/prof_output' >> $1/Makefile
echo -e '\t'less bin/prof_output >> $1/Makefile

echo bin/ >> $1/.gitignore
echo gmon.out >> $1/.gitignore
cd $1

echo created $1
tree 

#!/usr/bin/bash

if [ $# -lt 1 ] ; then
	echo usage $0 project_name
	exit 1
fi;

mkdir $1
mkdir $1/bin
mkdir $1/src
touch $1/src/$1.cpp
echo '/*' >> $1/src/$1.cpp
echo ' *' project $1 >> $1/src/$1.cpp
echo ' */' >> $1/src/$1.cpp
echo '' >> $1/src/$1.cpp
echo '#include <iostream>' >> $1/src/$1.cpp
echo "" >> $1/src/$1.cpp
echo int main\(\) \{ >> $1/src/$1.cpp
echo -e '\tstd::cout << "Hello, World" << std::endl;' >>$1/src/$1.cpp
echo -e '\t'return 0';' >>$1/src/$1.cpp
echo \} >> $1/src/$1.cpp

touch $1/Makefile
echo all: >> $1/Makefile
echo -e '\t'g++ -o bin/$1 src/$1.cpp >> $1/Makefile
echo run: >> $1/Makefile
echo -e '\t'bin/$1 >> $1/Makefile
echo edit: >> $1/Makefile
echo -e '\t'vi src/$1.cpp >> $1/Makefile
echo bin/ >> $1/.gitignore
cd $1

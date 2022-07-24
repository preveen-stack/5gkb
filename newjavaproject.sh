#!/usr/bin/bash
if [ $# -lt 1 ] ; then
	echo usage $0 project_name
	exit 1
fi;

mkdir $1
mkdir $1/bin
mkdir $1/src
touch $1/src/$1.java
echo '/*' >> $1/src/$1.java
echo ' *' project $1 >> $1/src/$1.java
echo ' */' >> $1/src/$1.java
echo '' >> $1/src/$1.java
echo public class $1 \{ >> $1/src/$1.java
echo "" >> $1/src/$1.java
echo -e '\t'public static void main\(String[] args\) \{ >> $1/src/$1.java
echo -e '\t\tSystem.out.println("'$1': Hello, World");' >>$1/src/$1.java
echo -e '\t' \} >> $1/src/$1.java
echo \} >> $1/src/$1.java

touch $1/Makefile
echo all: >> $1/Makefile
echo -e '\t'javac -d bin src/$1.java >> $1/Makefile
echo run: >> $1/Makefile
echo -e '\t'java -cp bin $1>> $1/Makefile
echo edit: >> $1/Makefile
echo -e '\t'vi src/$1.java >> $1/Makefile
echo bin/ >> $1/.gitignore
cd $1

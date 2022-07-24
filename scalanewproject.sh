#!/usr/bin/bash
if [ $# -lt 1 ] ; then
	echo usage $0 project_name
	exit 1
fi;

mkdir $1
mkdir $1/bin
mkdir $1/src
touch $1/src/$1.scala
echo '/*' >> $1/src/$1.scala
echo ' *' project $1 >> $1/src/$1.scala
echo ' *' `date` >> $1/src/$1.scala
echo ' */' >> $1/src/$1.scala
echo '' >> $1/src/$1.scala
echo object $1 \{ >> $1/src/$1.scala
echo "" >> $1/src/$1.scala
echo -e '\t'def main\(args: Array[String]\): Unit = \{ >> $1/src/$1.scala
echo -e '\t\tprintln("'$1': Hello, World");' >>$1/src/$1.scala
echo -e '\t\toncePerSecond( () => ' >> $1/src/$1.scala
echo -e '\t\t\tprintln("time files like an arrow..."))' >> $1/src/$1.scala
echo -e '\t'\} >> $1/src/$1.scala
echo "" >> $1/src/$1.scala
echo -e '\tdef oncePerSecond(callback: () => Unit): Unit = {' >> $1/src/$1.scala
echo -e '\t\t'"while (true) { callback(); Thread sleep 1000 }" >> $1/src/$1.scala
echo -e '\t'\} >> $1/src/$1.scala
echo \} >> $1/src/$1.scala

touch $1/Makefile
echo all: >> $1/Makefile
echo -e '\t'scalac -d bin src/$1.scala  >> $1/Makefile
echo run: >> $1/Makefile
echo -e '\t'scala -cp bin $1>> $1/Makefile
echo edit: >> $1/Makefile
echo -e '\t'vi src/$1.scala >> $1/Makefile
echo bin/ >> $1/.gitignore
tree $1

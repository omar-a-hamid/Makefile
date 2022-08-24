#! /usr/bin/bash

#echo


#! you should check if name has spaces or empty string and if a file already exsists w/ that name 
if [ $# -eq 0 ]
then 
	echo "input name of files to be created"
	echo ""
	read NAME
else
	NAME=$1
fi



#echo "this script will create a ${NAME}.h and ${NAME}.c"
echo "do you with to creat ${NAME}.h and ${NAME}.c? <y/n>"

read CONF
if [ "$CONF" == "y" ]
then 
	echo creating file
else

	exit 0

fi

 
touch $NAME.h



echo "#ifndef "${NAME^^}"_H" >> $NAME.h
echo "#define "${NAME^^}"_H" >> $NAME.h

echo "" >> $NAME.h
echo "" >> $NAME.h

echo "#endif" >> $NAME.h



touch $NAME.c

echo "#include<stdio.h>" >> $NAME.c
echo '#include "'${NAME}'.h"' >> $NAME.c


echo "" >> $NAME.c
echo "" >> $NAME.c
if [ ${NAME} = main ]
then
	echo "int main(void){" >>${NAME}.c
	echo "" >>${NAME}.c
	echo "" >>${NAME}.c
	echo "return 0;" >>${NAME}.c
	echo "}" >>${NAME}.c


fi


#echo ""
#echo ""

#sleep 1

exit 0
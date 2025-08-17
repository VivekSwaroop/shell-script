#!/bin/bash

ID=$(id -u)
R="\e[31m"
Y="\e[33m"
G="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE= "/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R Error: $2 Failed"
    else
        echo -e "$G Success"
    fi
    }

if [ $ID -ne 0 ]
then 
    echo -e "$R execute with root acceess"
else
    echo -e "$G root user"
fi

# echo " All args passed : $@"

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "Installation of $package"
    else
        echo -e "$package already installed .. $Y..$N"
    fi
done

#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE= "/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 .. $R Failed . $N"
    else
        echo -e "$2 .. $G Success $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e " $R Error : $N You are not root user"
    exit 1
else
    echo -e " $G You are a root user $N"
fi

yum install mysql -y
VALIDATE $? "Installing MySQL"

yum install git -y
VALIDATE $? "Installing GIT"
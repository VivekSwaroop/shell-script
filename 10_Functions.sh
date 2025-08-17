#!/bin/bash

ID= $(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "Error : $2 Failed"
    else
        echo "$2 Passed"
    fi
}

if [ $ID -ne 0 ]
then
    echo "Please run with root access"
    exit 1
else
    echo "You are root user"
fi

yum install mysql -y
VALIDATE $? "Installing MySQL"

yum install git -y
VALIDATE $? "Installing GIT"

#!/bin/bash

ID=$(id -u)

if($ID -ne 0)
then
    echo ("Please run with root access")
    exit 1
else
    echo ("You are root user")
fi

yum install mysql -y

if($? -ne 0)
then 
    echo ("ERROR Installing MySQL is failed")
    exit 1
else
    echo ("MySQL installed")
fi

yum install git -y

if($? -ne 0)
then 
    echo ("ERROR Installing GIT is failed")
    exit 1
else
    echo ("GIT installed")
fi
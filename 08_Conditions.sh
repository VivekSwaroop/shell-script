#!/bin/bash

NUMBER=$1

if ($NUMBER -gt 100)
then
    echo "Number $NUMBER is greater than 100"
else
    echo "Number $NUMBER is not greater than 100"
fi
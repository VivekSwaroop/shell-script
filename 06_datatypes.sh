#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$((NUMBER1+NUMBER2))

echo "Total :$SUM"
echo "How many args passed :$#"
echo "Total args Passed: $@"
echo "Script name: $0"

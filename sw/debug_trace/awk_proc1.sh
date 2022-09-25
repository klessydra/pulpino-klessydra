#!/bin/bash

# Getting this script directory
SCRIPT_DIR=$( cd -- $(dirname $0) > /dev/null ; pwd )


awk '!($1=$2="")' $SCRIPT_DIR/execution_0.txt > $SCRIPT_DIR/trace0.txt
awk '!($1=$2="")' $SCRIPT_DIR/execution_1.txt > $SCRIPT_DIR/trace1.txt
awk '!($1=$2="")' $SCRIPT_DIR/execution_2.txt > $SCRIPT_DIR/trace2.txt


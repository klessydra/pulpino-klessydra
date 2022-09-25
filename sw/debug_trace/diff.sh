#!/bin/bash

# Getting this script directory
SCRIPT_DIR=$( cd -- $(dirname $0) > /dev/null ; pwd )


diff $SCRIPT_DIR/trace0.txt $SCRIPT_DIR/trace_0.txt > $SCRIPT_DIR/diff_0.txt
diff $SCRIPT_DIR/trace1.txt $SCRIPT_DIR/trace_1.txt > $SCRIPT_DIR/diff_1.txt
diff $SCRIPT_DIR/trace2.txt $SCRIPT_DIR/trace_2.txt > $SCRIPT_DIR/diff_2.txt

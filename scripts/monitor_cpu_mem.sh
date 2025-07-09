#!/bin/bash

# CPU and memory usage monitor

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "User: "$2"% System: "$4"% Idle: "$8"%"}'

echo "Memory Usage:"
free -h

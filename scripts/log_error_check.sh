#!/bin/bash

# Check syslog for error keywords

LOG_FILE="/var/log/syslog"

echo "Errors found in $LOG_FILE:"
grep -i "error\|fail\|critical" "$LOG_FILE"

#!/bin/bash
# Script 4: Log File Analyzer (Improved for WSL/Linux)
# This script checks available log files automatically and analyzes them

# Default keyword (if not provided)
KEYWORD=${1:-"error"}
COUNT=0

echo "------ Log File Analysis ------"

# List of possible log files (common in Linux/WSL)
LOGFILES=("/var/log/syslog" "/var/log/messages" "/var/log/auth.log" "/var/log/kern.log" "/var/log/dmesg")

FOUND_FILE=""

# Find the first available log file
for FILE in "${LOGFILES[@]}"; do
    if [ -f "$FILE" ]; then
        FOUND_FILE=$FILE
        break
    fi
done

# If no log file found
if [ -z "$FOUND_FILE" ]; then
    echo "No standard log file found on this system."
    echo "Using dmesg command output instead..."
    dmesg | grep -i "$KEYWORD" > temp_log.txt
    FOUND_FILE="temp_log.txt"
fi

echo "Using log file: $FOUND_FILE"
echo ""

# Count keyword occurrences
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$FOUND_FILE"

echo "Keyword '$KEYWORD' found $COUNT times"
echo ""

# Show last 5 matching lines (for better analysis)
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$FOUND_FILE" | tail -n 5

# Clean temporary file if created
if [ "$FOUND_FILE" == "temp_log.txt" ]; then
    rm temp_log.txt
fi

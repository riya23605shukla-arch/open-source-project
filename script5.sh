#!/bin/bash
# Script 5: Open Source Manifesto Generator
# This script asks the user a few questions and generates a small manifesto

echo "Answer three questions to generate your manifesto."
echo ""

# taking user input
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# storing current date
DATE=$(date '+%d %B %Y')

# output file name (based on username)
OUTPUT="manifesto_$(whoami).txt"

# writing the manifesto
# using >> so that it appends (in case file already exists)
echo "----- Open Source Manifesto -----" >> "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# main paragraph (this is the actual manifesto)
echo "I use $TOOL in my daily life, and it reminds me how powerful open-source can be." >> "$OUTPUT"
echo "To me, freedom means $FREEDOM — the ability to learn, modify, and share without restrictions." >> "$OUTPUT"
echo "In the future, I would love to build $BUILD and share it freely with everyone." >> "$OUTPUT"
echo "I believe open-source connects people and helps innovation grow faster." >> "$OUTPUT"

echo "" >> "$OUTPUT"
echo "--------------------------------" >> "$OUTPUT"

# showing confirmation
echo ""
echo "Manifesto saved to $OUTPUT"

# displaying file content
echo ""
echo "Generated Manifesto:"
cat "$OUTPUT"

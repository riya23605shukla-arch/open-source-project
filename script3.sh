#!/bin/bash
# Script 3: Disk and Permission Auditor
# This script checks some important directories, their permissions and size
# Also checks Git config directory (since my software is Git)

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------"

# looping through each directory
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # getting permissions, owner and group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        
        # getting size (ignoring permission errors)
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo ""
echo "------ Git Config Check ------"

# checking if git config exists
if [ -f ~/.gitconfig ]; then
    echo "Git config file exists"
    
    # showing its permissions
    ls -l ~/.gitconfig
else
    echo "Git config file not found"
fi

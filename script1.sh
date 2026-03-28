#!/bin/bash 
# Script 1: #!/bin/bash
# Script 1: Basic system info + my chosen open source software
# This script just prints details about my system and mentions Git

# storing my name and chosen software
STUDENT_NAME="Riya Shukla"
SOFTWARE_CHOICE="Git"

# collecting system details using simple commands
KERNEL=$(uname -r)          # gets kernel version
USER_NAME=$(whoami)         # shows current logged-in user
UPTIME=$(uptime -p)         # shows how long system is running
DATE=$(date)                # current date and time
DISTRO=$(lsb_release -d | cut -f2)  # gets OS name

# printing everything nicely
echo "--------------------------------"
echo " Open Source Report - $STUDENT_NAME"
echo "--------------------------------"
echo "Software : $SOFTWARE_CHOICE"
echo "Kernel   : $KERNEL"
echo "User     : $USER_NAME"
echo "Uptime   : $UPTIME"
echo "Date     : $DATE"
echo "Distro   : $DISTRO"

# just mentioning license info
echo "Note: Linux kernel is open-source (GPL License)"

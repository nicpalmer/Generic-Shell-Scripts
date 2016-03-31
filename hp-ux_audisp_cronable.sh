#!/usr/bin/ksh
# Version 1.0
# Author: Nic Palmer

#Declare the values of dir for the location of the binary and the location
#where the log needs to reside

file0=/your/audit/log/binary
file1/path/to/your/new/log.log


# Run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#Audisp - Convert binary to file, >> appends the output
/usr/sbin/audisp $file0 >> `date +"%D"`$file1

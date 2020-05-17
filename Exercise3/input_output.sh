#!/bin/bash


#The script demonstrates I/O redirection 



#Redirect STDOUT t a file
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}


# Redirect STDIN to a program
read LINE < ${FILE}
echo "LINE contains: ${LINE}" 


# Redirect 3 lines and overwrite the content
head -n3 /etc/passwd > ${FILE}
echo
echo "Contents ${FILE}"
cat ${FILE}

# To append lines to the file 
head -n3 /etc/passwd >> ${FILE}
echo 
echo "Appended Contents ${FILE}"
cat ${FILE}

# Add random numbers to the file
echo "${RANDOM}${RANDOM}" >> ${FILE}
echo
cat ${FILE}


#Redirect STDIN to a program, using FD0
read LINE 0< ${FILE}
echo
echo "Line contains: ${LINE}"

#Redirect STDOUT to a file using FD1, overwrite the file 
head -n3 /etc/passwd 1> ${FILE}
echo
echo "Contents of ${FILE}" 
cat -n ${FILE}

# Redirect STDERR to a file using FD2
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fake 2> ${ERR_FILE}
#cat ${ERR_FILE}
echo

#Redirect STDIN and STOUT to a file
head -n3 /etc/passwd /fake &> ${FILE}
cat -n ${FILE}

#Redirect STDOUT and STDERR throught a PIPE
echo
head -n3 /etc/passwd /fake |& cat -n

# Send output to STDERR
echo "THis is STDERR!" >&2

#Discard STDOUT
echo
echo "Discarding STDOUT:"
head -n3 /etc/passwd /fakefile > /dev/null

#Discard STDERR
echo
echo "Discarding STDERR:"
head -n3 /etc/passwd /fakefile &> /dev/null

# Clean Up
rm ${FILE} ${ERR_FILE} &> /dev/null

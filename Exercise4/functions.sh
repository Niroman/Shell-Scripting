#!/bin/bash

# Begin writing functions and pass parameters
#log()
#{
# local VERBOSE="${1}"
# shift
# local MESSAGE="${@}"
# if [[ "${VERBOSE}" = 'true' ]]
# then 
#   echo "${MESSAGE}"
# fi
#}
#VERBOSITY='true'
#log "${VERBOSITY}" 'HELLO!'
#log "${VERBOSITY}" 'This is fun!'


# Using Local and Global Variables
# Send message to syslog and to std_outpt
# logger is a shell builtin that stores the message in system log. 
log()
{
 local MESSAGE="${@}"
 if [[ "${VERBOSE}" = 'true' ]]
 then 
   echo "${MESSAGE}"
 fi
 logger -t functions.sh "${MESSAGE}"
}

backup_file()
{
  #This function creates a backup of a file. Returns non-zero status an error
  local FILE="${1}"
 
  # Make Sure the file exists
  if [[ -f "${FILE}" ]]
  then 
    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
    log "Backing up ${FILE} to ${BACKUP_FILE}."

    # The exit status f the function will be the exit status of the cp command
    cp -p ${FILE} ${BACKUP_FILE}
  else
   # This file does not exist, so return a non-zero exit status
   return 1
  fi
}

readonly VERBOSE='true'
log 'HELLO!'
log 'This is fun!'

backup_file '/etc/passwd' 
 
# Make a decision based on the exit status of the function 
if [[ "${?}" -eq '0' ]]
then 
  log 'File Backup succedded'
else
  log 'File backup no succeeded'
  exit 1
fi

 
 
 
 

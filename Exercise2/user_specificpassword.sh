#!/bin/bash

#This script generates a randoom password foor each user specified on the command line

#Display what the user typed on the command line
# Parameter - Variable used inside the shell script
# Positional Parameter

echo "You executed this commmand ${0}" 

#Display the path annd filename of the script
echo "You used $(dirname ${0}) as path to the file $(basename ${0})"

# Storing the path and the filename separately and then displaying

DIRECTORY_NAME=$(dirname ${0})
FILE_NAME=$(basename ${0})

echo "You used ${DIRECTORY_NAME} as the path to the file ${FILE_NAME}"


#Number of arguments passed in
# Inside the script they are parameters, outside the script they are arguments
NUMBER_PARAM="${#}" 
echo "You supplied ${NUMBER_PARAM} arguments on the command line" 

#Make sure they supply atleast one argument
if [[ "${NUMBER_PARAM}" -lt 1 ]]
then
  echo "Usage: ${0} USER_NAME [USER_NAME].."
  exit 1
fi

#Generate and display a password for each parameter
for USER in "${@}"
do 
  PASSWORD=$(date +%s%N | sha256sum | head -c48)
  echo "${USER}: ${PASSWORD}"
done

#Generate and display a pass for parameter using ${*}
for U in "${*}" 
do
  PASS=$(date +%s%N)
  echo "${U}: ${PASS}"
done


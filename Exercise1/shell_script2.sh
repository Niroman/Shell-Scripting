#!/bin/bash

# Display the UID and username of the user executing this script
# Display if the user is the root user or not

#Display the UID
echo "Your UID is ${UID}"

#Display the username
USERNAME=$(id -un)
#USERNAME=`id -un`
echo "Your Username is ${USERNAME}" 

# Dispaly if the user is the root user or not
if [[ "${UID}" -eq 0 ]]
then
  echo 'You are Root'
else
  echo 'You are not Root'
fi


#!/bin/bash

#First Shell Script Execise to create multiple users

# Make sure the script is run with super user privileges
if [[ "${UID}" -ne 0 ]]
then 
  echo 'Please execute the script with super user privileges.'
  exit 1
else
  echo 'Executing the script with super user privileges.'
fi

# Get input from the user for whom the account must be created

read -p 'Enter the login credentials: ' USERNAME
read -p 'Enter the Name of the user: ' COMMENT
read -p 'Enter the password for the user: ' PASSWORD


# Create the another user on the local system 
useradd -c "${COMMENT}" -m ${USERNAME}

#Check if the username is accepted of not
if [[ "${?}" -ne 0 ]]
then 
  echo 'The username was not created' 
  exit 1
else
  echo 'Username Created' 
fi


# Create the password for the user
echo "${PASSWORD}" | passwd --stdin ${USERNAME}

#Check to see if the password command was executed
if [[ "${?}" -ne 0 ]]
then 
  echo 'The password was not created'
  exit 1
else
  echo ' Username Password Created' 
fi
 

#Expire the password for the user and request for a new password for the 1st time
passwd -e ${USERNAME}

#Printing the created username and password and the host who created it 

echo "New Username: ${USERNAME}" 
echo
echo "New Password: ${PASSWORD}"
echo
echo "Host who created it: $(id -un)"
echo
exit 0

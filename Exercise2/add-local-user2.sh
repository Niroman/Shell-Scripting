#!/bin/bash

#Second Shell Script Execise to create multiple users

# Make sure the script is run with super user privileges
if [[ "${UID}" -ne 0 ]]
then
  echo "The script needs Super User Privilege"
  exit 1
else
  echo 'Executing with Super User Privilege' 
fi


#Give a poitional argument to create a username
if [[ "${#}" -lt 1 ]]
then
  echo "Usage:${0} USERNAME [COMMENT].."
  echo "Read the help page for Positional Arguments"
fi

USERNAME="${1}"
echo "Username is: ${USERNAME}" 


# Make all other arguments as the Comments
while [[ "${#}" -gt 1 ]]
do
  COMMENT+="${2} "
  shift
done
echo "The Name is: ${COMMENT}"
# The rest of the parameters are the Account Names
shift
COMMENT1="${@}"
echo "Prof way to create ${COMMENT1}"



# Creating a local User
useradd -c "${COMMENT}" -m ${USERNAME}

#Check if the user is being created or not
if [[ "${?}" -ne 0 ]]
then
  echo "Username already exists"
  exit 1
fi

#Generate a password for the created User
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "Generated Password ${PASSWORD}"

#Assign the generated password to the user created
echo ${PASSWORD} | passwd --stdin ${USERNAME}

#Check if there is a password
if [[ "${?}" -ne 0 ]]
then 
  echo "Password could not be assigned" 
  exit 1
fi

# Forcing to delete the created password in first Login
passwd -e ${USERNAME}

# Printing the created username and password in the screen
echo "Username: ${USERNAME}" 
echo
echo "Password: ${PASSWORD}"
echo
echo "Hostname: ${HOSTNAME}"
echo
exit 0

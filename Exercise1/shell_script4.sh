#!/bin/bash

#This script creates an account on the local system 
#You will be proompted for the account name and password


#Ask for the username 
read -p 'Enter the username to creat: ' USER_NAME

#Ask for the real name
read -p 'Enter the name of the person who this account is for: ' COMMENT

#Ask for the password
read -p 'Enter the password to use for the accoount: ' PASSWORD

#Create a new User Account 
useradd -c "${COMMENT}" -m ${USER_NAME}


#Set the password for the user. 
# To avoid enteering the password of root user
#  | -> Pipes the given input to the standard input to a particular user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

#Force password change on first login. 
passwd -e ${USER_NAME}


#!/bin/bash


#Display the UID and Username of the user executing this script
#Display if the user is the vagrant user or not

#Display the UID
echo "Your UID is ${UID}"

#Display UID only if is 1000
# DRY- > Do not repeat yourself

UID_TO_TEST_FOR='1000'

if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
  echo "Your UID does not match ${UID_TO_TEST_FOR}."
  exit 1
fi

#Display the username
#$(id-un) -> To Capture the output of the command and store it in a variable
USERNAME=$(id -un)

#Test if the Command Succeeded
# ${?} -> Stores the exit status of the last executed command
if [[ "${?}" -ne 0 ]]
then
  echo 'The id command did not execute successfully.'
  exit 1
fi
echo "Your username is ${USERNAME}."

# You can use a string test conditional
USER_NAME_TO_TEST_FOR='vagrant'
if [[ "${USERNAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then 
  echo "Your username matches ${USER_NAME_TO_TEST_FOR}"
fi

#Test for != (Not Equal) for the string
if [[ "${USERNAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then
  echo "Your username does not match ${USER_NAME_TO_TEST_FOR}."
  exit 1
fi

exit 0


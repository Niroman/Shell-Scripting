#!/bin/bash

# The script generates a random passworrd 
# This user can set the password length with -l and add a special character with -s# Verbose mode can be enabled with -v


# A function to display invalid option
usage(){
  echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
  echo "Generate Random Password"
  echo "-l LENGTH Specify the passworrd strength."
  echo "-s        Append a special character to a password"
  echo "-v        Increase Verbosity"
  exit 1
}

# To check if the password is being generated
display(){
  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = 'true' ]]
  then 
    echo "${MESSAGE}"
  fi
}


# Set a default password length 
LENGTH=48

while getopts vl:s OPTION
do 
  case ${OPTION} in 
  v)
   VERBOSE='true'
   display 'Verbose mode on.'
   ;;
  l)
   LENGTH="${OPTARG}"
   ;;
  s)
   USE_SPECIAL_CHARACTER='true'
   ;;
  ?)
   usage
   ;;
  esac
done

display 'Generating a Password'

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGTH})

display 'Done'

# Display the password 
echo "${PASSWORD}" 


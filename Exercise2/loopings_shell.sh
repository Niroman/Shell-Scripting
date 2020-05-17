#!/bin/bash

#Generate the positional parameters
echo "Parameter: ${1}"
echo "Parameter: ${2}"
echo "Parameter: ${3}"



# Loop through all the parameters using the Shell Builtin "SHIFT"
while [[ "${#}" -gt 0 ]]
do
  echo "Number of parameters: ${#}"
  echo "Param 1: ${1}"
  echo "Param 2: ${2}"
  echo "Param 3: ${3}" 
  echo
  shift
done


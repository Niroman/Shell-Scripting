#!/bin/bash 

# Check for root user 
if [[ "${UID}" -ne 0 ]]
then 
   echo "Please run with sudo" >&2
   exit 1
fi

for U in joe aro charles selvaraj
do   
  useradd ${U}
  echo 'pass123' | passwd --stdin ${U}
done


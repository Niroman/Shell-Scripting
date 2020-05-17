#!/bin/bash

# This Shell generates a list of Random Passwords. 


# A random number as a password
# Random is a shell variable hence it must be treated like a variable
PASSWORD="${RANDOM}"
echo "Random Number once ${PASSWORD}"

#Three Random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "Three times random number ${PASSWORD}"

# Use the current date/time as the basis for the password
# date is a shell builtin which can be stored in a varibale to display it
PASSWORD=$(date +%s)
echo "USE DATE/TIME ${PASSWORD}"

# Use nanosecoond to act as randomization 
PASSWORD=$(date +%s%N)
echo "Nanosecond ${PASSWORD}"

# A strong password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "Strong Passwoord ${PASSWORD}"

# An even better password
PASSWORD=$(date +%s%N | sha256sum | head -c48)
echo "Better Password ${PASSWORD}"

#Pass word with special character
SPECIAL_CHARACTER=$(echo '!@#$%^&*()=' | fold -w1 | shuf | head -c4)
echo "Password with special characters ${PASSWORD}${SPECIAL_CHARACTER}"

#Print today date
DAY=$(date +%A)
echo "Today is a ${DAY}" 

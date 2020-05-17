#!/bin/bash
#To display the contents in the screen
# Display 'Hello'
echo 'Hello'

# Assign a value to a variable
# While Assigning must not give a space
WORD='script'

# Display that value using the variable
echo "$WORD"

# Difference Between Single Quotes in echo vs echo in Double Quotes
echo '$WORD'

# Combine the variable with hard-coded text. 
echo "This is a shell $WORD"

#Display using a differnt dispaly syntax. 
echo "Thus is a shell ${WORD}"

# Append text to the varibale. 
echo "${WORD}ing is fun!"

# Create a new variable and display it. 
ENDING='ed'
echo "This is ${WORD}${ENDING}"

# Reassignment of the varibales

ENDING='ing'
echo "${WORD}${ENDING} is fun"

# Write a new line
NAME='NIROMAN' 

echo "My name is ${NAME}"


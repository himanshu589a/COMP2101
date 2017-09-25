#!/bin/bash

# This script implements the guessing game  from the 3rd presentation

# Get a random number from 1 to 10
mynumber=$(( $RANDOM % 10 + 1 ))

while true; do
# ask the user to guess
read -p "Pick a number from 1 to 10, inclusive: " usernumber
# if they got  it right, tell them and exit
if [ $mynumber -eq $usernumber ]; then
  echo "You got it right!"
  exit
else
   echo "Nope. Guess again"  
fi
#otherwise ask again until they get it right
done

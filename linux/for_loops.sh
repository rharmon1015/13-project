#!/usr/bin/env bash

# Create a loop that looks for 'Hawaii'

states=('Ohio' 'Texas' 'Alaska' 'Hawaii' 'California')

for state in ${states[@]}
do
	if [ $state = 'Hawaii' ];
	then
		echo "Hawaii is the best!"
	else
		echo "I am not fond of Hawaii"
	fi
done


# Bonus: Create a loop that prints out only 3, 5, and 7

nums=$(echo {0..9})

for num in $nums[@];
do
	if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
	then
		echo $num
	fi
done


# Bonus: Create a for loop that prints out each item in your variable that holds the output of the 'ls' command

ls_out=$(ls)

for x in ${ls_out[@]}
do
  echo $x
done


# Super Bonus: Create a for loop to print out suids on one line for each entry

suids=$(find / -type f -perm /4000 2> /dev/null)

for suid in ${suids[@]}
do
  echo $suid
done


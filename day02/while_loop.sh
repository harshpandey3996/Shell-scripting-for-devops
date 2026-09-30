#!/bin/bash

num=1

while [[ $num -le 10 ]] 
do
	if (( num%2==0 )) ; then
		echo "$num is Even NUmber. "
	else 
		echo "$num is Odd Number. "
	fi
	num=$((num+1))
done

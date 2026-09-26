#!/bin/bash

<< disclaimer 
this is just for infotainment purpose
disclaimer

function is_loyal() {

	read -p "$1 ne mud ke kise dekha: " bandi
	read -p "$1 ka pyar % : " pyaar

		if [[ $bandi == "daya bhabhi" ]];
		then
			echo "$1 is loyal"
		elif [[ $pyaar -ge 100 ]];
		then 
			echo "$1 is confirm loyal"
		else
			echo "$1 is not loayal"
		fi
	}

is_loyal "Harsh"

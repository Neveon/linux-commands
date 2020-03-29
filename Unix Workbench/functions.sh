#!/bin/bash
# File: isiteven.sh

function isiteven {
	if [[ $(expr $1 % 2) -eq 0 ]]
	then
		echo true
	fi
}

function nevens {
	local total=0
	for elem in $@
	do
		if [[ $(isiteven $elem) ]]
		then
			let total=total+1
		fi
	done

	echo $total even numbers
}

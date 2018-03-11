#!/bin/bash
a=11
a=22

i=1

isnum(){
	if [ "$i" -le 3 ]
	then
		echo "$i"
		let "i++"
		isnum
		
	fi

}

isnum

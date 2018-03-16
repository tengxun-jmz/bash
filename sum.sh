#!/bin/bash
j=0
e=0
for i in `seq 1 100`
do 
    if [ $(($i%2)) == 0 ]
    then 
	e=`expr $e + $i`
    else
	j=`expr $j + $i`
    fi
done
echo "奇数是：$j"
echo "偶数是：$e"

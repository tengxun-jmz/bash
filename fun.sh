#!/bin/bash

echo "加算计"

selectType(){
	case "$1" in
		+)
			sum "$num1" "$num2"
			return "$?"
			;;
		X|x)
			multiply "$num1" "$num2"
			return "$?"
			;;
		*)
			return "暂无此算法程序" # 这个不要返回中文 只能数字 ????
			;;
		esac
}

sum(){
	return `expr $1 + $2`
}

multiply(){
	return `expr $1 \* $2`
}


# z 字符串长度为0 为true
# n 字符串长度不为0 为true
isnum(){
	if [ -z $1 ]
	then
		echo "计算参数不能为空"
		exit
	fi
}


read -p "请先确认算法[+-%X/]:" -n 1 type
echo ''
read -p "请输入第一个参数:" num1
read -p "请输入第二个参数:" num2


isnum "$num1"
isnum "$num2"

selectType $type
echo "$?"
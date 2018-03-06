#!/bin/bash
num1=$[3+9]
num2=$[6+2]

if [ ${num1} -eq  ${num2} ]
then
	echo '两者相等'
else
	echo '两者不想等'
fi

echo ''
echo '-------------我是和平的分割线-------------'
echo ''
echo '如果使用布尔运算符时(-o -a !) 条件语句中只需要一个[] 即可'
echo '如果使用逻辑运算符时(|| &&) 条件语句中需要两个[] 才行'
echo '下面两个运行结果一样'

if [ $(id -u) -eq 0 -o $(ps -ef |grep bash |awk '{print $1}'|sed -n '1p') -eq 501 ]
then
	echo '你是超级权限'
else
	echo "你的权限级别是$(id -u)"
fi

if [[ $(id -u) -eq 0 || $(ps -ef |grep bash |awk '{print $1}'|sed -n '1p') -eq 501 ]]
then
	echo '你是超级权限'
else
	echo "你的权限级别是$(id -u)"
fi
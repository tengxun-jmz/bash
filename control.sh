#!/bin/bash
echo '$# 获取参数个数;'
echo '$* 获取所有参数并以整个字符串输出;'
echo '$@ 将参数逐步输出;'



echo 'for in 用法'
echo "参数个数:$#"
echo "参数是:$*";
echo "单个输出:"
i=1
for var in "$@"
do
	echo "第${i}个是:${var}"
	let "i++"
done

echo ''
echo '------------------我是和平的分割线1-------------------'
echo ''

echo 'while 添加带两个()'

n=1
while(( "$n"<3 ))
do
	echo $n
	let "n++"
done

echo ''
echo '------------------我是和平的分割线2-------------------'
echo ''


echo 'while 无限循环用法 和case 用法 以及 break 和continue的用法'
while true
do
echo '你输入的数字是:'
	read num
	case "$num" in
		1|2|3|4|5)
			# 1|2|3|4|5)  [Y|y][E|e][S|s]). 两种方式时不一样的,请注意 需要多个选择时使用[],单个的话不需要 语法问题 
  			echo "你输入的数字是$num"
			echo '游戏结束'
			break
		;;
		*)
			echo '请输入到1-5之间的数字'
			continue
		;;
	esac
done


echo ''
echo '------------------我是和平的分割线3-------------------'
echo ''







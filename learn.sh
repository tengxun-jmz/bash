#!/bin/bash
echo '+-----------------+'
echo '|    文件基本操作   |'
echo '+-----------------+'

##文件基本属性
#group(属组) user(属主)

# chgrp 更改文件属组
	# -R 以递归的方式改变某个文件的属组
		# chgrp -R 属主名 文件名 

# chown 更改文件属主,也可以改变改变文件的属组
	# -R  以递归的方式改变某个文件的属组
		 	# chown -R 属主名 文件名
		 	# chown -R 属主名:属组名 文件名

# chmod 更改文件的权限
# r:4     w:2     x:1 
	# -R  以递归的方式改变某个文件的属组
		# chmod -R 777 文件或目录
	# [ugoa] [+-=] [rwx]
	# u user   g group   o others   a all 
	# +  加上   - 减去    = 直接设定
	# r 读权限   w  写权限    x 执行权限
		#  chmod a-x 文件/目录	给文件或目录 所有(a) 减(-) 执行(x)权限
		#   chmod -R u+w 目录    将目录下的文件文件或目录的 user属主(u) 添加(+) 写(w)权限
		#   
		#   



## 文件于目录命令
# ls 列出目录
	# -a 全部的文件 
	# -d 仅列出目录本身
	# -l 长数据串列出

# cd 切换目录

# pwd 显示目前所在的目录

# mkdir 创建新目录
	# -m 直接配置文件权限
	# -p 递归创建目录
		# mkdir -m 777 test
		# mkdir -p test/test1

# rmdir 删除空的目录
	# -p 连同上一级 空的 目录也一起删除
		# rmdir -p shell/test    shell目录下只有一个test目录,所以连同shell也一同删除了

# cp 复制文件或目录 
	# -a 相当于 -pdr 的意思 ,请参照下面的pdr参数说明
	# -d 若来源为连结档的属性(link) 则复制连结档属性而非文件本身
	# -f 为强制的意思若目标文件已存在则已出后再尝试一次
	# -i 若目标档已经存在,则在覆盖时会询问动作的进行
	# -l 进行硬式连结的连结档创建, 而非复制文件本身
	# -p 连同文件的属性一起复制过去, 而非使用默认属性
	# -r 递归持续复制 用于目录的复制行为
	# -s 复制成为富豪连结档, 亦即 捷径 文件
	# -u 若 destination 比 source 旧才升级 destination ！
		# cp [-adfilprsu] 来源档(source) 目标档(destination)
		# cp -i test/fun.sh shell/fun.sh

# rm 移除文件或目录
	# -f
	# -i
	# -r

















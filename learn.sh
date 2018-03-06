#!/bin/bash
echo '+-----------------+'
echo '|    文件基本操作   |'
echo '+-----------------+'



### group(属组) user(属主)   

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
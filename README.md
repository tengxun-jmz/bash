# 文件基本命令、权限、以及shell语法注意事项

## shell语法注意事项

* 关于[[]] 及 [] 一点说明

	数字测试： -eq -ne -lt -le -gt -ge，[[ ]]同 [ ]一致
	文件测试： -r、-l、-w、-x、-f、-d、-s、-nt、-ot，[[ ]]同 [ ]一致
	字符串测试： > < =(同==) != -n -z，不可使用“<=”和“>=”，[[ ]]同 [ ]一致，但在[]中，>和<必须使用\进行转义，即\>和\<
	逻辑测试： []为 -a -o ! [[ ]] 为&& || !
	数学运算： [] 不可以使用 [[ ]]可以使用+ - * / %
	组合： 均可用各自逻辑符号连接的数字（运算）测试、文件测试、字符测试

* 关于(()) 及 () 一点说明

	(())专门来做数值运算，如果表达式求值为 0，则设置退出状态为 1；如果求值为非 0 值，则设置为 0。不需要对 (( 和 )) 之间的操作符转义。算术只对整数进行。除 0 会产生错误，但不会产生溢出。可以执行 C 语言中常见的算术、逻辑和位操作

* 注意

	注意：使用 (( )) 时，不需要空格分隔各值和运算符，使用[]和[[ ]] 时需要用空格分隔各值和运算符。 	



## 文件及权限命令

* 文件基本属性
	* group(属组) user(属主)

* chgrp 更改文件属组
	* -R 以递归的方式改变某个文件的属组
```
	chgrp -R 属主名 文件名 
```

* chwon 更改文件属主
	* -R 以递归的方式改变某个文件的属组
```
	chown -R 属主名 文件名
	chown -R 属主名:属组名 文件名
```


* chmod 更改文件的权限 ( r:4     w:2     x:1) 
	* -R  以递归的方式改变某个文件的属组
	* u user g group o other a all
	* + 增加 - 减去 = 等于
	* r 写权限 w 读权限 x执行权限
```
	chmod -R 权限值 文件或目录
	chmod [ugoa][+-=][rwx] 文件或目录
	chmod a-x 文件/目录					给文件或目录 所有(a) 减(-) 执行(x)权限
	chmod -R u+w 目录    				将目录下的文件文件或目录的 user属主(u) 添加(+) 写(w)权限
```

## 文件于目录命令

* ls 列出目录
	* -l 长数据串列出
	* -d 仅列出目录本身
	* -a 全部的文件

* cd 目录切换

* pwd 显示当前目录

* mkdir 创建新的文件夹
	* -m 直接配置文件夹的权限
	* -p 递归方式创建文件夹
```
	mkdir -m 755 dir
	mkdir -p dir/dir1/dir2
```

* rmdir 删除目录
	* -p 连同上一级的空目录也一起删除
```
	rmdir -p dir/test       如果 dir下面是有一个空目录test的话，那么dir也会被删除
```

* cp 复制或目录
	* -a 相当于-pdr 的意思 ，请参照下面pdr参数讲解
	* -d 若来源为连结档的属性(link) 则复制连结档属性而非文件本身
	* -f 为强制的意思若目标文件已存在则已出后再尝试一次
	* -i 若目标档已经存在,则在覆盖时会询问动作的进行
	* -l 进行硬式连结的连结档创建, 而非复制文件本身
	* -p 连同文件的属性一起复制过去, 而非使用默认属性
	* -r 递归持续复制 用于目录的复制行为
	* -s 复制成为连结档, 亦即 捷径 文件
	* -u 若 destination 比 source 旧才升级 destination ！
```
	cp [-adfilprsu] 来源档(source) 目标档(destination)
	cp -a test /home/test
	cp -i test/fun.sh shell/fun.sh
```

* rm 移除命令
	* -f 强制删除
	* -i 删除前的动作询问
	* -r 递归删除
```
	rm -rf test
```

* cat 由第一行显示内容
	* -A 相当于-vET的整合选项,可列出一些特殊字符而不是空白而已
	* -b 列出行号,仅针对非空白做出显示,空白不标示行号
	* -E 将结尾的断行字节$ 显示出来
	* -n 列印出行号,连同空白行也会有行号,与-b的选项不同
	* -T 将[tab]按键以^|显示出来
	* -v 列出一些看不出来的特殊字符
```
	cat -n test.sh
```

* tac 由最后一行显示内容 与cat正好相反

* nl 显示时顺便输出行号
	* -b 指定行号指定的方式,主要有两种:
		* -b a表示不论是否为空行,也同样列出行号(类似cat -n)
		* -b t如果有空行,空的那一行不要列出行号(默认值);
	* -n 列出行号表示的方法,主要有三种:
		* -n ln 行号在荧幕的最左方显示
		* -n rn 行号在自己栏位的最右方显示 ,且不加0
		* -n rz 行号在自己栏目的最右方显示, 且加0
	* -w 行号栏位的占用的位数.
```
	nl -n ln hello.py
```

* more 一页一页的显示文件内容 空格翻下一页
	* 空白键: 代表向下翻一【页】
	* b    	: 代表 往回翻页,不过这动作只对文件游泳,对管线无用 				无：
	* Enter	: 代表向下翻一【行】
	* /字串	: 代表在这个显示的内容当中,向下搜寻字串这个关键字
	* :f   	: 显示档名 以及目前显示行数    									有：
	* q    	: 代表离开more 不再显示该文件内容    							无：
	

* less 与more类似但比more更好 ,可以上下翻页 
	* 空白键 	: 向下翻动一行
	* pagedown 	: 向下翻动一页
 	* pageup 	: 向上翻动一页
	* /字串     : 向下搜索自串
	* ?字串    	: 向上搜索字串
	* n       	: 重复前一个搜索
	* N       	: 反向的重复前一个搜索
	* q       	: 离开less这个程序

* head 只看头几行
	* -n 后面接数字,代表显示几行的意思 默认显示10行
```
	head -n 20 sum.sh
```

* tail 只看尾巴几行
	* -n 后面接数字,代表显示几行的意思
	* -f 扁丝持续侦测后面所接的档名,要等到按下ctrl-c 才会结束tail侦测
```
	tail -n 20 sum.sh
```


## 用户命令

* useradd 选项 用户名。     添加新的用户账号
	* -c :注释性描述 
 	* -d :指定用户主目录
 	* -g :用户组
 	* -G :附加用户组
 	* -s :shell文件 指定用户的登录shell
 	* -u :用户名
```
	useradd -d /home/test -g test -G root,www,mysql -s /bin/sh -c 'test' test
```

* usermod  修改账号
	* 和useradd 参数一样
```
	usermod -d /home/test1 -g test1 -G developer test
```

* userdel 删除用户名
	* -r 把用户的主目录一起删除
```
	userdel -r test
```

* passwd 选项 用户名        修改用户口令
	* -l 锁定口令
	* -u 口令解锁
	* -d 使账号无口令
	* -f 强迫用户下次登录时修改口令
```
	passwd test                        # 如果时root 需要登录后再passwd
```


```
	cat /etc/passwd
	root:x:0:0:Superuser:/:
	daemon:x:1:1:System daemons:/etc:
	bin:x:2:2:Owner of system commands:/bin:
	sys:x:3:3:Owner of system files:/usr/sys:
	adm:x:4:4:System accounting:/usr/adm:
	uucp:x:5:5:UUCP administrator:/usr/lib/uucp:
	auth:x:7:21:Authentication administrator:/tcb/files/auth:
	cron:x:9:16:Cron daemon:/usr/spool/cron:
	listen:x:37:4:Network daemon:/usr/net/nls:
	lp:x:71:18:Printer administrator:/usr/spool/lp:
	sam:x:200:50:Sam san:/usr/sam:/bin/sh

	用户名:口令:用户标示号:组标示号:注释性描述:目录:登录shell
	                            -c        -d   -s

```


## 用户组管理

* groupadd 选项 用户组
	* -g 指定新用户组的组标示 (GID)
	* -o 一般与-g 选项同时使用,表示新用户的GID可以与系统已有的用户组的GID相同
```
	groupadd -g 101 grouptest
```
* groupmod 选项 用户组
	* -g 为用户组指定新的组标示号
	* -o 一般与-g 选项同时使用,表示新用户的GID可以与系统已有的用户组的GID相同
	* -n 新的用户组的名字改为新名字
```
	groupmod -g 102 -n grouptest1 grouptest        # 将组grouptest的组标示号改为102 并将组名称改为grouptest1
```

* groupdel 用户组
```
	groupdel 用户组
```

```
	cat /etc/group
	
	root::0:root
	bin::2:root,bin
	sys::3:root,uucp
	adm::4:root,adm
	daemon::5:root,daemon
	lp::7:root,lp
	users::20:root,sam
	组名:口令:组标识号:组内用户列表
```




##文件操作命令(文本处理三剑客)

* sed 的选项 、命令、替换标记
	* 命令格式
		* sed [options] 'command' file(s)
		* sed [options] -f scriptfile file(s)
	* 选项
	





























**OS**
[root@rhel-cdh-server100 ~]# uname -a
Linux rhel-cdh-server100.g55lab.aus.hp.com 2.6.32-573.el6.x86_64 #1 SMP Wed Jul 1 18:23:37 EDT 2015 x86_64 x86_64 x86_64 GNU/Linux

RHEL 6.7

**Private infrastructure - NOT AWS**

**hostname**
rhel-cdh-server100.g55lab.aus.hp.com
 
**uptime**
09:10:51 up 22 min,  1 user,  load average: 0.00, 0.00, 0.00
 
 **non CM Host checknative test**
[root@rhel-cdh-server101 ~]# hadoop checknative
-bash: hadoop: command not found
[root@rhel-cdh-server102 ~]# hadoop checknative
-bash: hadoop: command not found
[root@rhel-cdh-server103 ~]# hadoop checknative
-bash: hadoop: command not found
[root@rhel-cdh-server104 ~]# hadoop checknative
-bash: hadoop: command not found

**mysql&cm host repos**
[root@rhel-cdh-server100 ~]# ls /etc/yum.repos.d
local.repo  redhat.repo  rhel-source.repo

**user info**
sebastian:x:2200:2200::/home/sebastian:/bin/bash
ernie:x:2300:2300::/home/ernie:/bin/bash

**group info**
parks:x:2301:sebastian
duckies:x:2302:ernie





Check vm.swappiness on all your nodes : Set the value to 1 if necessary

Checks done:
Instance 1:

[ec2-user@ip-172-31-0-155 ~]$ cat /proc/sys/vm/swappiness
60

[ec2-user@ip-172-31-0-155 ~]$ sudo sysctl vm.swappiness=1
vm.swappiness = 1

Instance 2:

Using username "ec2-user".
Authenticating with public key "imported-openssh-key"
[ec2-user@ip-172-31-0-153 ~]$ cat /proc/sys/vm/swappiness
60
[ec2-user@ip-172-31-0-153 ~]$ sudo sysctl vm.swappiness=1
vm.swappiness = 1


Instance 3:

Using username "ec2-user".
Authenticating with public key "imported-openssh-key"
[ec2-user@ip-172-31-0-156 ~]$ cat /proc/sys/vm/swappiness
60
[ec2-user@ip-172-31-0-156 ~]$ sudo sysctl vm.swappiness=1
vm.swappiness = 1
[ec2-user@ip-172-31-0-156 ~]$


Instance 4:

Using username "ec2-user".
Authenticating with public key "imported-openssh-key"
[ec2-user@ip-172-31-0-157 ~]$ cat /proc/sys/vm/swappiness
60
[ec2-user@ip-172-31-0-157 ~]$ sudo sysctl vm.swappiness=1
vm.swappiness = 1
[ec2-user@ip-172-31-0-157 ~]$


Instance 5:
Using username "ec2-user".
Authenticating with public key "imported-openssh-key"
[ec2-user@ip-172-31-0-154 ~]$
[ec2-user@ip-172-31-0-154 ~]$ cat /proc/sys/vm/swappiness
60
[ec2-user@ip-172-31-0-154 ~]$ sudo sysctl vm.swappiness=1
vm.swappiness = 1
[ec2-user@ip-172-31-0-154 ~]$

----------------------------------------------------------
Set noatime on any non-root volumes you have

[root@ip-172-31-0-154 /]# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvda1      5.8G  2.0G  3.6G  36% /
tmpfs           7.3G     0  7.3G   0% /dev/shm


vi /etc/fstab

Instance 1:
#
# /etc/fstab
# Created by anaconda on Fri Oct 17 14:25:45 2014
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
UUID=3d313faa-dc6e-457c-ae0e-cecae8a464e2 /                       ext4    defaults        1 1
tmpfs                   /dev/shm                tmpfs   defaults,noatime        0 0
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
sysfs                   /sys                    sysfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0

[root@ip-172-31-0-155 ec2-user]# mount -o remount /dev/shm
[root@ip-172-31-0-155 ec2-user]# mount
/dev/xvda1 on / type ext4 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw,noatime)
none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)

Similarly done on all the instances.

----------------------------------------------------------
Set the reserve space on any non-root volumes to 0

tune2fs -m 1 /dev/shm
sudo tune2fs -l /dev/shm | grep 'Reserved block count'

----------------------------------------------------------

Set the user limits to maximum file descriptors and processes

[root@ip-172-31-0-155 shm]# cat /proc/sys/fs/file-max
1517652

----------------------------------------------------------------

Test forward and reverse host lookups for correct resolution

[root@ip-172-31-0-155 shm]# host 54.206.8.200
200.8.206.54.in-addr.arpa domain name pointer ec2-54-206-8-200.ap-southeast-2.compute.amazonaws.com.

host 54.206.64.189
189.64.206.54.in-addr.arpa domain name pointer ec2-54-206-64-189.ap-southeast-2.compute.amazonaws.com

[root@ip-172-31-0-155 shm]# host 54.206.68.46
46.68.206.54.in-addr.arpa domain name pointer ec2-54-206-68-46.ap-southeast-2.compute.amazonaws.com.

[root@ip-172-31-0-155 shm]# host 54.206.67.161
161.67.206.54.in-addr.arpa domain name pointer ec2-54-206-67-161.ap-southeast-2.compute.amazonaws.com.

[root@ip-172-31-0-155 shm]# host 54.206.65.34
34.65.206.54.in-addr.arpa domain name pointer ec2-54-206-65-34.ap-southeast-2.compute.amazonaws.com

Enable the nscd service
[root@ip-172-31-0-155 class]# yum install nscd
Loaded plugins: amazon-id, rhui-lb, security
Setting up Install Process
rhui-REGION-client-config-server-6                                                                                                               | 2.9 kB     00:00
rhui-REGION-client-config-server-6/primary_db                                                                                                    | 6.0 kB     00:00
rhui-REGION-rhel-server-releases                                                                                                                 | 3.7 kB     00:00
rhui-REGION-rhel-server-releases/primary_db                                                                                                      |  38 MB     00:00
rhui-REGION-rhel-server-rh-common                                                                                                                | 3.8 kB     00:00
rhui-REGION-rhel-server-rh-common/primary_db                                                                                                     |  63 kB     00:00
Resolving Dependencies
--> Running transaction check
---> Package nscd.x86_64 0:2.12-1.166.el6_7.7 will be installed
--> Processing Dependency: glibc = 2.12-1.166.el6_7.7 for package: nscd-2.12-1.166.el6_7.7.x86_64
--> Running transaction check
---> Package glibc.x86_64 0:2.12-1.149.el6 will be updated
--> Processing Dependency: glibc = 2.12-1.149.el6 for package: glibc-headers-2.12-1.149.el6.x86_64
--> Processing Dependency: glibc = 2.12-1.149.el6 for package: glibc-common-2.12-1.149.el6.x86_64
--> Processing Dependency: glibc = 2.12-1.149.el6 for package: glibc-devel-2.12-1.149.el6.x86_64
---> Package glibc.x86_64 0:2.12-1.166.el6_7.7 will be an update
--> Running transaction check
---> Package glibc-common.x86_64 0:2.12-1.149.el6 will be updated
---> Package glibc-common.x86_64 0:2.12-1.166.el6_7.7 will be an update
---> Package glibc-devel.x86_64 0:2.12-1.149.el6 will be updated
---> Package glibc-devel.x86_64 0:2.12-1.166.el6_7.7 will be an update
---> Package glibc-headers.x86_64 0:2.12-1.149.el6 will be updated
---> Package glibc-headers.x86_64 0:2.12-1.166.el6_7.7 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

========================================================================================================================================================================
 Package                             Arch                         Version                                  Repository                                              Size
========================================================================================================================================================================
Installing:
 nscd                                x86_64                       2.12-1.166.el6_7.7                       rhui-REGION-rhel-server-releases                       227 k
Updating for dependencies:
 glibc                               x86_64                       2.12-1.166.el6_7.7                       rhui-REGION-rhel-server-releases                       3.8 M
 glibc-common                        x86_64                       2.12-1.166.el6_7.7                       rhui-REGION-rhel-server-releases                        14 M
 glibc-devel                         x86_64                       2.12-1.166.el6_7.7                       rhui-REGION-rhel-server-releases                       986 k
 glibc-headers                       x86_64                       2.12-1.166.el6_7.7                       rhui-REGION-rhel-server-releases                       615 k

Transaction Summary
========================================================================================================================================================================
Install       1 Package(s)
Upgrade       4 Package(s)

Total download size: 20 M
Is this ok [y/N]:

Downloading Packages:
(1/5): glibc-2.12-1.166.el6_7.7.x86_64.rpm                                                                                                       | 3.8 MB     00:00
(2/5): glibc-common-2.12-1.166.el6_7.7.x86_64.rpm                                                                                                |  14 MB     00:00
(3/5): glibc-devel-2.12-1.166.el6_7.7.x86_64.rpm                                                                                                 | 986 kB     00:00
(4/5): glibc-headers-2.12-1.166.el6_7.7.x86_64.rpm                                                                                               | 615 kB     00:00
(5/5): nscd-2.12-1.166.el6_7.7.x86_64.rpm                                                                                                        | 227 kB     00:00
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                    29 MB/s |  20 MB     00:00
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Updating   : glibc-common-2.12-1.166.el6_7.7.x86_64                                                                                                               1/9
  Updating   : glibc-2.12-1.166.el6_7.7.x86_64                                                                                                                      2/9
  Updating   : glibc-headers-2.12-1.166.el6_7.7.x86_64                                                                                                              3/9
  Updating   : glibc-devel-2.12-1.166.el6_7.7.x86_64                                                                                                                4/9
  Installing : nscd-2.12-1.166.el6_7.7.x86_64                                                                                                                       5/9
  Cleanup    : glibc-devel-2.12-1.149.el6.x86_64                                                                                                                    6/9
  Cleanup    : glibc-headers-2.12-1.149.el6.x86_64                                                                                                                  7/9
  Cleanup    : glibc-common-2.12-1.149.el6.x86_64                                                                                                                   8/9
  Cleanup    : glibc-2.12-1.149.el6.x86_64                                                                                                                          9/9
  Verifying  : glibc-devel-2.12-1.166.el6_7.7.x86_64                                                                                                                1/9
  Verifying  : glibc-headers-2.12-1.166.el6_7.7.x86_64                                                                                                              2/9
  Verifying  : nscd-2.12-1.166.el6_7.7.x86_64                                                                                                                       3/9
  Verifying  : glibc-2.12-1.166.el6_7.7.x86_64                                                                                                                      4/9
  Verifying  : glibc-common-2.12-1.166.el6_7.7.x86_64                                                                                                               5/9
  Verifying  : glibc-2.12-1.149.el6.x86_64                                                                                                                          6/9
  Verifying  : glibc-common-2.12-1.149.el6.x86_64                                                                                                                   7/9
  Verifying  : glibc-headers-2.12-1.149.el6.x86_64                                                                                                                  8/9
  Verifying  : glibc-devel-2.12-1.149.el6.x86_64                                                                                                                    9/9

Installed:
  nscd.x86_64 0:2.12-1.166.el6_7.7

Dependency Updated:
  glibc.x86_64 0:2.12-1.166.el6_7.7   glibc-common.x86_64 0:2.12-1.166.el6_7.7   glibc-devel.x86_64 0:2.12-1.166.el6_7.7   glibc-headers.x86_64 0:2.12-1.166.el6_7.7

Complete!

[root@ip-172-31-0-155 class]# service nscd start
Starting nscd:                                             [  OK  ]
[root@ip-172-31-0-155 class]#

[root@ip-172-31-0-155 class]# service nscd start
Starting nscd:                                             [  OK  ]
[root@ip-172-31-0-155 class]# chkconfig nscd  on



Enable the ntpd service
[root@ip-172-31-0-155 class]# service ntpd start
Starting ntpd:                                             [  OK  ]

Similar installation and configuration on all the nodes.
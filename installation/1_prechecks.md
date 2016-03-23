Swappiness
```
[ec2-user@ip-172-31-51-34 ~]$ sudo sysctl vm.swappiness=1  
vm.swappiness = 1  
[ec2-user@ip-172-31-51-34 ~]$ cat /proc/sys/vm/swappiness  
1  
```

noatime
```
[root@ip-172-31-51-34 ~]# mount -o remount,noatime /

[root@ip-172-31-51-34 ~]# cat /etc/fstab

#
# /etc/fstab
# Created by anaconda on Mon Sep 29 08:58:10 2014
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
UUID=9996863e-b964-47d3-a33b-3920974fdbd9 /                       ext4    defaults,noatime       1 1
tmpfs                   /dev/shm                tmpfs   defaults        0 0
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
sysfs                   /sys                    sysfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0
```
Zero reserve space for non-root volumes
```
[root@ip-172-31-51-38 ~]# tune2fs -m 0 /dev/xvda1
tune2fs 1.41.12 (17-May-2010)
Setting reserved blocks percentage to 0% (0 blocks)
```

##################
/etc/security/limits.conf
/etc/security/limits.d/limits
##################

Enable `nscd` and `ntpd`
```
yum install nscd
[root@ip-172-31-51-38 security]# service nscd start
Starting nscd:                                             [  OK  ]

[root@ip-172-31-51-36 security]# service ntpd start
Starting ntpd:                                             [  OK  ]

[root@ip-172-31-51-38 security]# chkconfig nscd on
[root@ip-172-31-51-38 security]# chkconfig ntpd on

```

Check vm.swappiness on all your nodes
1、Set the value to 1 if necessary
#echo "vm.swappiness=1" >>/etc/sysctl.conf
# cat /proc/sys/vm/swappiness 
1 

2、Set noatime on any non-root volumes you have
#cat /etc/fstab
# /etc/fstab
# Created by anaconda on Tue Apr 26 05:05:17 2016
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/vg_zmcdhmanager-lv_root /                       ext4    defaults        1 1
UUID=3e01c308-1db1-4182-8180-cf6b907bbb89 /boot                   ext4    defaults        1 2
/dev/mapper/vg_zmcdhmanager0-lv_tmp /tmp                    ext4    defaults        1 2
/dev/mapper/vg_zmcdhmanager0-lv_var /var                    ext4    defaults,noatime        1 2
/dev/mapper/vg_zmcdhmanager-lv_swap swap                    swap    defaults        0 0
tmpfs                   /dev/shm                tmpfs   defaults        0 0
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
sysfs                   /sys                    sysfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0

3、Set the reserve space on any non-root volumes to 0
# tune2fs -m 0 /dev/mapper/vg_zmcdhmanager0-lv_var
tune2fs 1.41.12 (17-May-2010)
Setting reserved blocks percentage to 0% (0 blocks)

4、Set the user limits to maximum file descriptors and processes
#tail -5 /etc/security/limits.conf
#@student        -       maxlogins       4

# End of file
*       soft    nofile  65536
*       hard    nofile  65536

5、Test forward and reverse host lookups for correct resolution
# more /etc/hosts
128.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
10.111.24.131   bi-cdh-manager
10.111.24.132   bi-cdh-master1
10.111.24.133   bi-cdh-master2
10.111.24.134   bi-cdh-data1
10.111.24.135   bi-cdh-data2

6、Enable the nscd service
# service nscd status
nscd: unrecognized service
7、Enable the ntpd service
# service ntpd start
#chkconfig ntpd on
#service ntpd status
ntpd (pid  2225) is running...


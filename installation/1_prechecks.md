(a) Set vm.swappiness to 1:
cat /proc/sys/vm/swappiness
60

echo "1" > /proc/sys/vm/swappiness

cat /proc/sys/vm/swappiness
1

(b) Set noatime on /mnt

vi /etc/fstab
# Revise this line:
/dev/xvdb       /mnt    auto    defaults,noatime,nofail,comment=cloudconfig

mount -o remount /mnt

(c) Set the reserve space on any non-root volumes to 0

tune2fs -m 0 /dev/xvdb
tune2fs 1.41.12 (17-May-2010)
Setting reserved blocks percentage to 0% (0 blocks)

tune2fs -m 0 /dev/xvdc1
tune2fs 1.41.12 (17-May-2010)
Setting reserved blocks percentage to 0% (0 blocks)

(d) Set the user limits to maximum file descriptors and processes
vi /etc/security/limits.conf
# Set nofile to 32000
*                hard    nofile          32000
*                soft    nofile          32000
# Set soft nproc to 32000
*                soft    nproc           32000

(e) Test forward and reverse host lookups for correct resolution

(f) Enable the nscd service
yum -y install nscd
...
Installed:
  nscd.x86_64 0:2.12-1.166.el6_7.7                                              
Dependency Updated:
  glibc.x86_64 0:2.12-1.166.el6_7.7                                             
  glibc-common.x86_64 0:2.12-1.166.el6_7.7                                      
  glibc-devel.x86_64 0:2.12-1.166.el6_7.7                                       
  glibc-headers.x86_64 0:2.12-1.166.el6_7.7                                     
Complete!

chkconfig nscd on
chkconfig --list | grep nscd

nscd           	0:off	1:off	2:on	3:on	4:on	5:on	6:off

(g) Enable to ntpd service
chkconfig ntpd on

chkconfig --list | grep ntpd
ntpd           	0:off	1:off	2:on	3:on	4:on	5:on	6:off
ntpdate        	0:off	1:off	2:off	3:off	4:off	5:off	6:off

[ec2-user@ip-10-6-3-154 /]$ cat /proc/mounts
rootfs / rootfs rw 0 0
proc /proc proc rw,relatime 0 0
sysfs /sys sysfs rw,seclabel,relatime 0 0
devtmpfs /dev devtmpfs rw,seclabel,relatime,size=7638544k,nr_inodes=1909636,mode=755 0 0
devpts /dev/pts devpts rw,seclabel,relatime,gid=5,mode=620,ptmxmode=000 0 0
tmpfs /dev/shm tmpfs rw,seclabel,relatime 0 0
/dev/xvda1 / ext4 rw,seclabel,relatime,barrier=1,data=ordered 0 0
none /selinux selinuxfs rw,relatime 0 0
devtmpfs /dev devtmpfs rw,seclabel,relatime,size=7638544k,nr_inodes=1909636,mode=755 0 0
/proc/bus/usb /proc/bus/usb usbfs rw,relatime 0 0
none /proc/sys/fs/binfmt_misc binfmt_misc rw,relatime 0 0
/etc/auto.misc /misc autofs rw,relatime,fd=7,pgrp=1135,timeout=300,minproto=5,maxproto=5,indirect 0 0
-hosts /net autofs rw,relatime,fd=13,pgrp=1135,timeout=300,minproto=5,maxproto=5,indirect 0 0

1	Check vm.swappiness on four nodes, only show operations on CDH_Node1
		[root@CDH_Node1 disk1]# cat /proc/sys/vm/swappiness
		60
		set to value 1:
		[root@CDH_Node1 disk1]# sysctl vm.swappiness=1
		[root@CDH_Node1 disk1]# vi /etc/sysctl.conf, add line vm.swappiness=1
		
		Check again:
		[root@CDH_Node1 ~]# cat /proc/sys/vm/swappiness
		1
		
2 Set noatime on /disk1
		[root@CDH_Node3 ~]# vim /etc/fstab		add noatime property and remount the disk.
		[root@CDH_Node1 /]# mount -o remount /disk1
		
3 Set the reserve space on any non-root volumes to 0
		[root@CDH_Node1 /]# tune2fs -l /dev/mapper/vgdisk-lvdisk1 | grep "Reserved block count"
		Reserved block count:     7851212
		[root@CDH_Node1 /]# tune2fs -m 0 /dev/mapper/vgdisk-lvdisk1
		tune2fs 1.41.12 (17-May-2010)
		Setting reserved blocks percentage to 0% (0 blocks)
		[root@CDH_Node1 /]# tune2fs -l /dev/mapper/vgdisk-lvdisk1 | grep "Reserved block count"
		Reserved block count:     0

4 Set the user limits to maximum file descriptors and processes
		[root@CDH_Node1 /]# vim /etc/security/limits.conf 
		change open files to 65535
		
5 Test forward and reverse host lookups for correct resolution
		[root@CDH_Node1 ~]# vim /etc/hosts
		Add four nodes' hostname and ip address.
		Test successfully.

6 Enable the nscd service
		[root@CDH_Node1 ~]# vi /etc/nscd.conf
		add line:  enable-cache            hosts           yes
		[root@CDH_Node1 ~]# service nscd start
		
7 Enable the ntpd service
		Make CDH_Node3	ntp local server, others sychronize with it.
		[root@CDH_Node3 ~]# vim /etc/ntp.conf 
		Add line:
			server 127.127.1.0            # local clock (LCL)
			fudge 127.127.1.0 stratum 10 # LCL is unsynchronized
		Add line on others:
			server 10.43.4.245 iburst
		Restart ntpd services on for nodes:[root@CDH_Node4 ~]# service ntpd restart
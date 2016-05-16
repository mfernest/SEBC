```bash

1. swap

# sysctl -a | grep vm.swap
vm.swappiness = 1

2. mount option

# mount
/dev/vda1 on / type ext4 (rw)
/dev/vdb on /data/disk1 type xfs (rw,noatime,nodiratime,nobarrier,inode64)

3. disk space

# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        40G  1.2G   37G   4% /
tmpfs           7.8G     0  7.8G   0% /dev/shm
/dev/vdb        100G   33M  100G   1% /data/disk1

4. limit

cat /etc/security/limits.conf 
*   soft    nofile 1048576
*   hard    nofile 1048576

5. lookups

[root@cdh01 ~]# ping cdh01
PING cdh01.cs1hypers.com (10.100.196.31) 56(84) bytes of data.
64 bytes from cdh01.cs1hypers.com (10.100.196.31): icmp_seq=1 ttl=64 time=0.081 ms
64 bytes from cdh01.cs1hypers.com (10.100.196.31): icmp_seq=2 ttl=64 time=0.039 ms
^C
--- cdh01.cs1hypers.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1076ms
rtt min/avg/max/mdev = 0.039/0.060/0.081/0.021 ms
[root@cdh01 ~]# ping cdh02
PING cdh02.cs1hypers.com (10.100.196.84) 56(84) bytes of data.
64 bytes from cdh02.cs1hypers.com (10.100.196.84): icmp_seq=1 ttl=64 time=0.823 ms
^C
--- cdh02.cs1hypers.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 918ms
rtt min/avg/max/mdev = 0.823/0.823/0.823/0.000 ms
[root@cdh01 ~]# ping cdh03
PING cdh03.cs1hypers.com (10.100.196.32) 56(84) bytes of data.
64 bytes from cdh03.cs1hypers.com (10.100.196.32): icmp_seq=1 ttl=64 time=0.621 ms
^C
--- cdh03.cs1hypers.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 785ms
rtt min/avg/max/mdev = 0.621/0.621/0.621/0.000 ms
[root@cdh01 ~]# ping cdh04
PING cdh04.cs1hypers.com (10.100.196.33) 56(84) bytes of data.
64 bytes from cdh04.cs1hypers.com (10.100.196.33): icmp_seq=1 ttl=64 time=0.907 ms
^C
--- cdh04.cs1hypers.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 780ms
rtt min/avg/max/mdev = 0.907/0.907/0.907/0.000 ms

6. nscd

yum install ncsd

echo 'enable-cache hosts yes' >> /etc/nscd.conf

service ncsd start

7. ntpd

yum install ntpd

service ntpd start

```

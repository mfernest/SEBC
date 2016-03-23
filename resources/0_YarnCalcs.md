(a) How much RAM should be allocated per impalad process, at least?
16 GB

(b) What percentage of RAM should be earmarked for the OS and system services?
10-20%

(c) Under what condition(s) would you factor two cores per spindle into your calculations?
For most workloads.

(d) Assume a cluster with 20 vcores, 128 GB RAM, and 10 spindles on each of 8 worker nodes.

(d1) Using the Container Formula given in Table 8, calculate an appropriate value for mapreduce.job.maps
112

(d2) List each factor and value leading to your result

Operating system: 2 vcores
YARN NodeManager: 1 vcore	 
HDFS DataNode: 1 vcore
Impala Daemon: 1 vcore
Cloudera Manager agent: 1 vcore
TOTAL for non-YARN workloads: 6 vcores
yarn.nodemanager.resource.cpu-vcores: min(20-6, 2x10) = 14 

HDFS DataNode: 1,024 MB
Impala Daemon: 16,348 MB
Cloudera Manager agent: 1,024 MB
Task overhead: 26,214 MB
TOTAL for non-YARN workloads: 44,610 MB
yarn.nodemanager.resource.memory-mb: 131,072 MB - 44,610 MB = 86,462 MB

yarn.scheduler.minimum-allocation-mb: 2,048 MB
yarn.scheduler.maximum-allocation-mb: 86,462 MB
yarn.scheduler.maximum-allocation-vcores: 14

mapreduce.map.cpu.vcores: 1
mapreduce.map.memory.mb: 2,048 MB

mapreduce.job.maps=
MIN(yarn.nodemanager.resource.memory-mb / mapreduce.map.memory.mb, yarn.nodemanager.resource.cpu-vcores / mapreduce.map.cpu.vcores, number of physical drives x workload factor) x number of worker nodes
= MIN(86462/2048 , 14/1, 10x2) x 8
= MIN(42,14,20) x 8
= 14 x 8 = 112
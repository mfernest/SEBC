<strong>How much RAM should be allocated per impalad process, at least?</strong>  
At least 16 GB RAM for an Impalad process  
<strong>What percentage of RAM should be earmarked for the OS and system services?</strong>  
10-20% of RAM for Linux and its daemon services  
<strong>Under what condition(s) would you factor two cores per spindle into your calculations?</strong>  
The node manager is allocated the lesser of total_vcores - non_yarn_vcores OR 2x phys_disks for DataNode.  
The will be factored in when the second of those two is the lesser.

<strong>Assume a cluster with 20 vcores, 128 GB RAM, and 10 spindles on each of eight worker nodes</strong>  
<strong>Using the Container Formula given in Table 8, calculate an appropriate value for mapreduce.jobs.maps</strong>  
<strong>List each factor and value leading to your result</strong>  


Assume half as much task overhead  

|Resource        |V Cores  |  RAM       |
| ---------------|---------|------------|
|total           | 20      | 131,072 MB |  
|OS              | 2       |  26,214 MB |  
|HDFS Datanode   | 1       |   1,024 MB |
|Overhead        | 0       |  26,214 MB |  
|Impala Daemon   | 1       |  16,348 MB |
|CM Agent        | 1       |   1,024 MB | 
|Yarn Containers |15 (20-5)|  86,465 MB |  


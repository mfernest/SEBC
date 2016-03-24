<strong>How much RAM should be allocated per impalad process, at least?</strong>  
At least 16 GB RAM for an Impalad process  
<strong>What percentage of RAM should be earmarked for the OS and system services?</strong>  
10-20% of RAM for Linux and its daemon services  
<strong>Under what condition(s) would you factor two cores per spindle into your calculations?</strong>  

<strong>Assume a cluster with 20 vcores, 128 GB RAM, and 10 spindles on each of eight worker nodes</strong>  
<strong>Using the Container Formula given in Table 8, calculate an appropriate value for mapreduce.jobs.maps</strong>  
<strong>List each factor and value leading to your result</strong>  



|total            1,048,576 MB      128 GB * 8 worker nodes  
|OS                 209,715 MB      128 GB * 8 * 20%  
|HDFS Datanode        8,129 MB    1,024 MB * 8  
|Overhead           419,432 MB   52,429 MB * 8 estimated for non-Apache Hadoop services|  
|Impala Daemon|      130,784 MB   16,348 MB * 8|
|CM Agent             8,129 MB    1,024 MB * 8|  
|Yarn Containers    272,387 MB   34,048 MB * 8 Total - other processes|  


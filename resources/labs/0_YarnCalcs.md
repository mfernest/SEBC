How much RAM should be allocated per impalad process, at least? 
**16gb**

What percentage of RAM should be earmarked for the OS and system services? 
**8gb / 128gb = 6.25%**

Under what condition(s) would you factor two cores per spindle into your calculations?  
**The workload factor can be set to 2.0 for most workloads. Consider a higher setting for CPU-bound workloads**
*Many other factors can influence the performance of a MapReduce application, including:
Configured rack awareness
Skewed or imbalanced data
Network throughput
Co-tenancy demand (other services or applications using the cluster)
Dynamic resource pooling*

Assume a cluster with 20 vcores, 128 GB RAM, and 10 spindles on each of eight worker nodes.
Using the Container Formula given in Table 8, calculate an appropriate value for mapreduce.jobs.maps
List each factor and value leading to your result

**MIN(yarn.nodemanager.resource.memory-mb / mapreduce.map.memory.mb, 
      yarn.nodemanager.resource.cpu-vcores / mapreduce.map.cpu.vcores, 
	  number of physical drives x workload factor) x number of worker nodes**
	  
	  yarn.nodemanager.resource.memory-mb = 131072
	  mapreduce.map.memory.mb = 2048
	  yarn.nodemanager.resource.cpu-vcores	20 less 8 as an overhead so **12**
	  mapreduce.map.cpu.vcores	2
	
	  number of physical drives 	10
	  Workload factor	2

	  **Max map is 40**
	  
	  
	  

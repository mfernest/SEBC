16/03/23 00:41:23 INFO terasort.TeraSort: starting
16/03/23 00:41:25 INFO input.FileInputFormat: Total input paths to process : 2
Spent 152ms computing base-splits.
Spent 2ms computing TeraScheduler splits.
Computing input splits took 155ms
Sampling 8 splits of 8
Making 10 from 100000 sampled records
Computing parititions took 592ms
Spent 748ms computing partitions.
16/03/23 00:41:25 INFO client.RMProxy: Connecting to ResourceManager at ip-172-31-17-95.us-west-2.compute.internal/172.31.17.95:8032
16/03/23 00:41:26 INFO mapreduce.JobSubmitter: number of splits:8
16/03/23 00:41:26 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1458691659910_0003
16/03/23 00:41:26 INFO impl.YarnClientImpl: Submitted application application_1458691659910_0003
16/03/23 00:41:26 INFO mapreduce.Job: The url to track the job: http://ip-172-31-17-95.us-west-2.compute.internal:8088/proxy/application_1458691659910_0003/
16/03/23 00:41:26 INFO mapreduce.Job: Running job: job_1458691659910_0003
16/03/23 00:41:32 INFO mapreduce.Job: Job job_1458691659910_0003 running in uber mode : false
[###Job Progress###]
16/03/23 00:41:58 INFO mapreduce.Job: Job job_1458691659910_0003 completed successfully
16/03/23 00:41:58 INFO mapreduce.Job: Counters: 50
	File System Counters
		FILE: Number of bytes read=475626938
		FILE: Number of bytes written=950335938
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1073742776
		HDFS: Number of bytes written=1073741800
		HDFS: Number of read operations=54
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=20
	Job Counters 
		Launched map tasks=8
		Launched reduce tasks=10
		Data-local map tasks=7
		Rack-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=70402
		Total time spent by all reduces in occupied slots (ms)=87853
		Total time spent by all map tasks (ms)=70402
		Total time spent by all reduce tasks (ms)=87853
		Total vcore-seconds taken by all map tasks=70402
		Total vcore-seconds taken by all reduce tasks=87853
		Total megabyte-seconds taken by all map tasks=72091648
		Total megabyte-seconds taken by all reduce tasks=89961472
	Map-Reduce Framework
		Map input records=10737418
		Map output records=10737418
		Map output bytes=1095216636
		Map output materialized bytes=472568243
		Input split bytes=976
		Combine input records=0
		Combine output records=0
		Reduce input groups=10737418
		Reduce shuffle bytes=472568243
		Reduce input records=10737418
		Reduce output records=10737418
		Spilled Records=21474836
		Shuffled Maps =80
		Failed Shuffles=0
		Merged Map outputs=80
		GC time elapsed (ms)=1628
		CPU time spent (ms)=109200
		Physical memory (bytes) snapshot=7294709760
		Virtual memory (bytes) snapshot=28449857536
		Total committed heap usage (bytes)=9100066816
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=1073741800
	File Output Format Counters 
		Bytes Written=1073741800
16/03/23 00:41:58 INFO terasort.TeraSort: done
real	0m35.549s
user	0m7.011s
sys	0m0.277s


16/03/23 00:44:32 INFO terasort.TeraSort: starting
16/03/23 00:44:34 INFO input.FileInputFormat: Total input paths to process : 2
Spent 123ms computing base-splits.
Spent 2ms computing TeraScheduler splits.
Computing input splits took 126ms
Sampling 8 splits of 8
Making 10 from 100000 sampled records
Computing parititions took 700ms
Spent 828ms computing partitions.
16/03/23 00:44:35 INFO client.RMProxy: Connecting to ResourceManager at ip-172-31-17-95.us-west-2.compute.internal/172.31.17.95:8032
16/03/23 00:44:35 INFO mapreduce.JobSubmitter: number of splits:8
16/03/23 00:44:35 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1458691659910_0004
16/03/23 00:44:36 INFO impl.YarnClientImpl: Submitted application application_1458691659910_0004
16/03/23 00:44:36 INFO mapreduce.Job: The url to track the job: http://ip-172-31-17-95.us-west-2.compute.internal:8088/proxy/application_1458691659910_0004/
16/03/23 00:44:36 INFO mapreduce.Job: Running job: job_1458691659910_0004
16/03/23 00:44:41 INFO mapreduce.Job: Job job_1458691659910_0004 running in uber mode : false
[###Job Progress###]
16/03/23 00:45:05 INFO mapreduce.Job: Job job_1458691659910_0004 completed successfully
16/03/23 00:45:05 INFO mapreduce.Job: Counters: 50
	File System Counters
		FILE: Number of bytes read=475626938
		FILE: Number of bytes written=950335937
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1073742776
		HDFS: Number of bytes written=1073741800
		HDFS: Number of read operations=54
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=20
	Job Counters 
		Launched map tasks=8
		Launched reduce tasks=10
		Data-local map tasks=7
		Rack-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=69250
		Total time spent by all reduces in occupied slots (ms)=92825
		Total time spent by all map tasks (ms)=69250
		Total time spent by all reduce tasks (ms)=92825
		Total vcore-seconds taken by all map tasks=69250
		Total vcore-seconds taken by all reduce tasks=92825
		Total megabyte-seconds taken by all map tasks=70912000
		Total megabyte-seconds taken by all reduce tasks=95052800
	Map-Reduce Framework
		Map input records=10737418
		Map output records=10737418
		Map output bytes=1095216636
		Map output materialized bytes=472568243
		Input split bytes=976
		Combine input records=0
		Combine output records=0
		Reduce input groups=10737418
		Reduce shuffle bytes=472568243
		Reduce input records=10737418
		Reduce output records=10737418
		Spilled Records=21474836
		Shuffled Maps =80
		Failed Shuffles=0
		Merged Map outputs=80
		GC time elapsed (ms)=1516
		CPU time spent (ms)=108520
		Physical memory (bytes) snapshot=7404576768
		Virtual memory (bytes) snapshot=28487688192
		Total committed heap usage (bytes)=9225371648
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=1073741800
	File Output Format Counters 
		Bytes Written=1073741800
16/03/23 00:45:05 INFO terasort.TeraSort: done
real	0m33.859s
user	0m7.610s
sys	0m0.324s

16/03/23 00:55:49 INFO terasort.TeraSort: starting
16/03/23 00:55:50 INFO input.FileInputFormat: Total input paths to process : 2
Spent 122ms computing base-splits.
Spent 2ms computing TeraScheduler splits.
Computing input splits took 125ms
Sampling 8 splits of 8
Making 10 from 100000 sampled records
Computing parititions took 982ms
Spent 1110ms computing partitions.
16/03/23 00:55:51 INFO client.RMProxy: Connecting to ResourceManager at ip-172-31-17-95.us-west-2.compute.internal/172.31.17.95:8032
16/03/23 00:55:52 INFO mapreduce.JobSubmitter: number of splits:8
16/03/23 00:55:52 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1458691659910_0005
16/03/23 00:55:52 INFO impl.YarnClientImpl: Submitted application application_1458691659910_0005
16/03/23 00:55:52 INFO mapreduce.Job: The url to track the job: http://ip-172-31-17-95.us-west-2.compute.internal:8088/proxy/application_1458691659910_0005/
16/03/23 00:55:52 INFO mapreduce.Job: Running job: job_1458691659910_0005
16/03/23 00:55:59 INFO mapreduce.Job: Job job_1458691659910_0005 running in uber mode : false
[###Job Progress###]
16/03/23 00:56:23 INFO mapreduce.Job: Job job_1458691659910_0005 completed successfully
16/03/23 00:56:23 INFO mapreduce.Job: Counters: 50
	File System Counters
		FILE: Number of bytes read=475626938
		FILE: Number of bytes written=950335930
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1073742776
		HDFS: Number of bytes written=1073741800
		HDFS: Number of read operations=54
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=20
	Job Counters 
		Launched map tasks=8
		Launched reduce tasks=10
		Data-local map tasks=7
		Rack-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=69629
		Total time spent by all reduces in occupied slots (ms)=90039
		Total time spent by all map tasks (ms)=69629
		Total time spent by all reduce tasks (ms)=90039
		Total vcore-seconds taken by all map tasks=69629
		Total vcore-seconds taken by all reduce tasks=90039
		Total megabyte-seconds taken by all map tasks=71300096
		Total megabyte-seconds taken by all reduce tasks=92199936
	Map-Reduce Framework
		Map input records=10737418
		Map output records=10737418
		Map output bytes=1095216636
		Map output materialized bytes=472568243
		Input split bytes=976
		Combine input records=0
		Combine output records=0
		Reduce input groups=10737418
		Reduce shuffle bytes=472568243
		Reduce input records=10737418
		Reduce output records=10737418
		Spilled Records=21474836
		Shuffled Maps =80
		Failed Shuffles=0
		Merged Map outputs=80
		GC time elapsed (ms)=1723
		CPU time spent (ms)=110020
		Physical memory (bytes) snapshot=7439110144
		Virtual memory (bytes) snapshot=28470792192
		Total committed heap usage (bytes)=8999927808
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=1073741800
	File Output Format Counters 
		Bytes Written=1073741800
16/03/23 00:56:23 INFO terasort.TeraSort: done
real	0m34.960s
user	0m7.373s
sys	0m0.331s
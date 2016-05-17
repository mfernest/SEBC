[root@bi-cdh-manager hadoop-mapreduce]# sudo -u hdfs hadoop jar hadoop-*-examples.jar  terasort -Dmapred.reduce.tasks=50 /user/rootbi/b /user/rootbi/b-terasort
16/05/17 14:56:33 INFO terasort.TeraSort: starting
16/05/17 14:56:34 INFO input.FileInputFormat: Total input paths to process : 50
Spent 239ms computing base-splits.
Spent 4ms computing TeraScheduler splits.
Computing input splits took 244ms
Sampling 10 splits of 50
Making 50 from 100000 sampled records
Computing parititions took 827ms
Spent 1073ms computing partitions.
16/05/17 14:56:35 INFO client.RMProxy: Connecting to ResourceManager at bi-cdh-master1/10.111.24.132:8032
16/05/17 14:56:36 INFO mapreduce.JobSubmitter: number of splits:50
16/05/17 14:56:36 INFO Configuration.deprecation: mapred.reduce.tasks is deprecated. Instead, use mapreduce.job.reduces
16/05/17 14:56:36 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1463466290232_0002
16/05/17 14:56:36 INFO impl.YarnClientImpl: Submitted application application_1463466290232_0002
16/05/17 14:56:36 INFO mapreduce.Job: The url to track the job: http://bi-cdh-master1:8088/proxy/application_1463466290232_0002/
16/05/17 14:56:36 INFO mapreduce.Job: Running job: job_1463466290232_0002
16/05/17 14:56:42 INFO mapreduce.Job: Job job_1463466290232_0002 running in uber mode : false
16/05/17 14:56:42 INFO mapreduce.Job:  map 0% reduce 0%
16/05/17 14:56:49 INFO mapreduce.Job:  map 6% reduce 0%
16/05/17 14:56:50 INFO mapreduce.Job:  map 12% reduce 0%
16/05/17 14:56:55 INFO mapreduce.Job:  map 14% reduce 0%
16/05/17 14:56:56 INFO mapreduce.Job:  map 20% reduce 0%
16/05/17 14:56:57 INFO mapreduce.Job:  map 24% reduce 0%
16/05/17 14:57:03 INFO mapreduce.Job:  map 28% reduce 0%
16/05/17 14:57:04 INFO mapreduce.Job:  map 32% reduce 0%
16/05/17 14:57:05 INFO mapreduce.Job:  map 36% reduce 0%
16/05/17 14:57:08 INFO mapreduce.Job:  map 38% reduce 0%
16/05/17 14:57:10 INFO mapreduce.Job:  map 40% reduce 0%
16/05/17 14:57:11 INFO mapreduce.Job:  map 44% reduce 0%
16/05/17 14:57:12 INFO mapreduce.Job:  map 48% reduce 0%
16/05/17 14:57:15 INFO mapreduce.Job:  map 50% reduce 0%
16/05/17 14:57:17 INFO mapreduce.Job:  map 54% reduce 0%
16/05/17 14:57:18 INFO mapreduce.Job:  map 60% reduce 0%
16/05/17 14:57:21 INFO mapreduce.Job:  map 62% reduce 0%
16/05/17 14:57:22 INFO mapreduce.Job:  map 64% reduce 0%
16/05/17 14:57:23 INFO mapreduce.Job:  map 68% reduce 0%
16/05/17 14:57:24 INFO mapreduce.Job:  map 72% reduce 0%
16/05/17 14:57:27 INFO mapreduce.Job:  map 74% reduce 0%
16/05/17 14:57:28 INFO mapreduce.Job:  map 76% reduce 0%
16/05/17 14:57:29 INFO mapreduce.Job:  map 80% reduce 0%
16/05/17 14:57:30 INFO mapreduce.Job:  map 82% reduce 0%
16/05/17 14:57:31 INFO mapreduce.Job:  map 84% reduce 0%
16/05/17 14:57:33 INFO mapreduce.Job:  map 86% reduce 0%
16/05/17 14:57:34 INFO mapreduce.Job:  map 90% reduce 0%
16/05/17 14:57:35 INFO mapreduce.Job:  map 92% reduce 0%
16/05/17 14:57:36 INFO mapreduce.Job:  map 94% reduce 0%
16/05/17 14:57:41 INFO mapreduce.Job:  map 100% reduce 1%
16/05/17 14:57:43 INFO mapreduce.Job:  map 100% reduce 6%
16/05/17 14:57:46 INFO mapreduce.Job:  map 100% reduce 8%
16/05/17 14:57:47 INFO mapreduce.Job:  map 100% reduce 10%
16/05/17 14:57:48 INFO mapreduce.Job:  map 100% reduce 12%
16/05/17 14:57:49 INFO mapreduce.Job:  map 100% reduce 14%
16/05/17 14:57:51 INFO mapreduce.Job:  map 100% reduce 18%
16/05/17 14:57:52 INFO mapreduce.Job:  map 100% reduce 20%
16/05/17 14:57:54 INFO mapreduce.Job:  map 100% reduce 24%
16/05/17 14:57:57 INFO mapreduce.Job:  map 100% reduce 26%
16/05/17 14:57:59 INFO mapreduce.Job:  map 100% reduce 32%
16/05/17 14:58:00 INFO mapreduce.Job:  map 100% reduce 34%
16/05/17 14:58:01 INFO mapreduce.Job:  map 100% reduce 36%
16/05/17 14:58:04 INFO mapreduce.Job:  map 100% reduce 40%
16/05/17 14:58:07 INFO mapreduce.Job:  map 100% reduce 48%
16/05/17 14:58:10 INFO mapreduce.Job:  map 100% reduce 50%
16/05/17 14:58:11 INFO mapreduce.Job:  map 100% reduce 52%
16/05/17 14:58:13 INFO mapreduce.Job:  map 100% reduce 56%
16/05/17 14:58:15 INFO mapreduce.Job:  map 100% reduce 60%
16/05/17 14:58:16 INFO mapreduce.Job:  map 100% reduce 62%
16/05/17 14:58:18 INFO mapreduce.Job:  map 100% reduce 64%
16/05/17 14:58:20 INFO mapreduce.Job:  map 100% reduce 68%
16/05/17 14:58:21 INFO mapreduce.Job:  map 100% reduce 70%
16/05/17 14:58:22 INFO mapreduce.Job:  map 100% reduce 72%
16/05/17 14:58:23 INFO mapreduce.Job:  map 100% reduce 74%
16/05/17 14:58:25 INFO mapreduce.Job:  map 100% reduce 76%
16/05/17 14:58:27 INFO mapreduce.Job:  map 100% reduce 78%
16/05/17 14:58:28 INFO mapreduce.Job:  map 100% reduce 84%
16/05/17 14:58:29 INFO mapreduce.Job:  map 100% reduce 86%
16/05/17 14:58:31 INFO mapreduce.Job:  map 100% reduce 88%
16/05/17 14:58:34 INFO mapreduce.Job:  map 100% reduce 94%
16/05/17 14:58:35 INFO mapreduce.Job:  map 100% reduce 96%
16/05/17 14:58:36 INFO mapreduce.Job:  map 100% reduce 98%
16/05/17 14:58:38 INFO mapreduce.Job:  map 100% reduce 100%
16/05/17 14:58:38 INFO mapreduce.Job: Job job_1463466290232_0002 completed successfully
16/05/17 14:58:38 INFO mapreduce.Job: Counters: 49
	File System Counters
		FILE: Number of bytes read=475654774
		FILE: Number of bytes written=957120065
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1073747700
		HDFS: Number of bytes written=1073741800
		HDFS: Number of read operations=300
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=100
	Job Counters 
		Launched map tasks=50
		Launched reduce tasks=50
		Data-local map tasks=50
		Total time spent by all maps in occupied slots (ms)=253166
		Total time spent by all reduces in occupied slots (ms)=281701
		Total time spent by all map tasks (ms)=253166
		Total time spent by all reduce tasks (ms)=281701
		Total vcore-seconds taken by all map tasks=253166
		Total vcore-seconds taken by all reduce tasks=281701
		Total megabyte-seconds taken by all map tasks=259241984
		Total megabyte-seconds taken by all reduce tasks=288461824
	Map-Reduce Framework
		Map input records=10737418
		Map output records=10737418
		Map output bytes=1095216636
		Map output materialized bytes=469603811
		Input split bytes=5900
		Combine input records=0
		Combine output records=0
		Reduce input groups=10737418
		Reduce shuffle bytes=469603811
		Reduce input records=10737418
		Reduce output records=10737418
		Spilled Records=21474836
		Shuffled Maps =2500
		Failed Shuffles=0
		Merged Map outputs=2500
		GC time elapsed (ms)=4084
		CPU time spent (ms)=266620
		Physical memory (bytes) snapshot=33541767168
		Virtual memory (bytes) snapshot=157428695040
		Total committed heap usage (bytes)=45002260480
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
16/05/17 14:58:38 INFO terasort.TeraSort: done
[root@bi-cdh-manager hadoop-mapreduce]# sudo -u hdfs hadoop jar hadoop-*-examples.jar  terasort -Dmapred.reduce.tasks=50 /user/rootbi/b /user/rootbi/b-terasort2  >/var/soft/b-terasort2.log
16/05/17 15:18:51 INFO terasort.TeraSort: starting
16/05/17 15:18:53 INFO input.FileInputFormat: Total input paths to process : 50
16/05/17 15:18:54 INFO client.RMProxy: Connecting to ResourceManager at bi-cdh-master1/10.111.24.132:8032
16/05/17 15:18:54 INFO mapreduce.JobSubmitter: number of splits:50
16/05/17 15:18:54 INFO Configuration.deprecation: mapred.reduce.tasks is deprecated. Instead, use mapreduce.job.reduces
16/05/17 15:18:54 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1463468694463_0001
16/05/17 15:18:55 INFO impl.YarnClientImpl: Submitted application application_1463468694463_0001
16/05/17 15:18:55 INFO mapreduce.Job: The url to track the job: http://bi-cdh-master1:8088/proxy/application_1463468694463_0001/
16/05/17 15:18:55 INFO mapreduce.Job: Running job: job_1463468694463_0001
16/05/17 15:19:02 INFO mapreduce.Job: Job job_1463468694463_0001 running in uber mode : false
16/05/17 15:19:02 INFO mapreduce.Job:  map 0% reduce 0%
16/05/17 15:19:09 INFO mapreduce.Job:  map 6% reduce 0%
16/05/17 15:19:11 INFO mapreduce.Job:  map 12% reduce 0%
16/05/17 15:19:15 INFO mapreduce.Job:  map 14% reduce 0%
16/05/17 15:19:16 INFO mapreduce.Job:  map 18% reduce 0%
16/05/17 15:19:19 INFO mapreduce.Job:  map 24% reduce 0%
16/05/17 15:19:21 INFO mapreduce.Job:  map 26% reduce 0%
16/05/17 15:19:22 INFO mapreduce.Job:  map 28% reduce 0%
16/05/17 15:19:23 INFO mapreduce.Job:  map 30% reduce 0%
16/05/17 15:19:25 INFO mapreduce.Job:  map 34% reduce 0%
16/05/17 15:19:26 INFO mapreduce.Job:  map 36% reduce 0%
16/05/17 15:19:27 INFO mapreduce.Job:  map 38% reduce 0%
16/05/17 15:19:28 INFO mapreduce.Job:  map 40% reduce 0%
16/05/17 15:19:29 INFO mapreduce.Job:  map 42% reduce 0%
16/05/17 15:19:32 INFO mapreduce.Job:  map 46% reduce 0%
16/05/17 15:19:33 INFO mapreduce.Job:  map 50% reduce 0%
16/05/17 15:19:34 INFO mapreduce.Job:  map 52% reduce 0%
16/05/17 15:19:35 INFO mapreduce.Job:  map 54% reduce 0%
16/05/17 15:19:39 INFO mapreduce.Job:  map 60% reduce 0%
16/05/17 15:19:40 INFO mapreduce.Job:  map 64% reduce 0%
16/05/17 15:19:41 INFO mapreduce.Job:  map 66% reduce 0%
16/05/17 15:19:45 INFO mapreduce.Job:  map 68% reduce 0%
16/05/17 15:19:46 INFO mapreduce.Job:  map 74% reduce 0%
16/05/17 15:19:47 INFO mapreduce.Job:  map 78% reduce 0%
16/05/17 15:19:50 INFO mapreduce.Job:  map 80% reduce 0%
16/05/17 15:19:52 INFO mapreduce.Job:  map 82% reduce 0%
16/05/17 15:19:53 INFO mapreduce.Job:  map 86% reduce 0%
16/05/17 15:19:54 INFO mapreduce.Job:  map 90% reduce 0%
16/05/17 15:19:56 INFO mapreduce.Job:  map 92% reduce 0%
16/05/17 15:19:58 INFO mapreduce.Job:  map 94% reduce 0%
16/05/17 15:20:00 INFO mapreduce.Job:  map 96% reduce 0%
16/05/17 15:20:03 INFO mapreduce.Job:  map 98% reduce 1%
16/05/17 15:20:04 INFO mapreduce.Job:  map 100% reduce 1%
16/05/17 15:20:06 INFO mapreduce.Job:  map 100% reduce 5%
16/05/17 15:20:07 INFO mapreduce.Job:  map 100% reduce 8%
16/05/17 15:20:09 INFO mapreduce.Job:  map 100% reduce 10%
16/05/17 15:20:11 INFO mapreduce.Job:  map 100% reduce 12%
16/05/17 15:20:13 INFO mapreduce.Job:  map 100% reduce 14%
16/05/17 15:20:17 INFO mapreduce.Job:  map 100% reduce 22%
16/05/17 15:20:19 INFO mapreduce.Job:  map 100% reduce 24%
16/05/17 15:20:21 INFO mapreduce.Job:  map 100% reduce 26%
16/05/17 15:20:24 INFO mapreduce.Job:  map 100% reduce 28%
16/05/17 15:20:25 INFO mapreduce.Job:  map 100% reduce 30%
16/05/17 15:20:26 INFO mapreduce.Job:  map 100% reduce 36%
16/05/17 15:20:27 INFO mapreduce.Job:  map 100% reduce 38%
16/05/17 15:20:29 INFO mapreduce.Job:  map 100% reduce 40%
16/05/17 15:20:32 INFO mapreduce.Job:  map 100% reduce 44%
16/05/17 15:20:34 INFO mapreduce.Job:  map 100% reduce 48%
16/05/17 15:20:35 INFO mapreduce.Job:  map 100% reduce 52%
16/05/17 15:20:39 INFO mapreduce.Job:  map 100% reduce 54%
16/05/17 15:20:40 INFO mapreduce.Job:  map 100% reduce 56%
16/05/17 15:20:41 INFO mapreduce.Job:  map 100% reduce 58%
16/05/17 15:20:42 INFO mapreduce.Job:  map 100% reduce 64%
16/05/17 15:20:46 INFO mapreduce.Job:  map 100% reduce 66%
16/05/17 15:20:47 INFO mapreduce.Job:  map 100% reduce 68%
16/05/17 15:20:48 INFO mapreduce.Job:  map 100% reduce 70%
16/05/17 15:20:49 INFO mapreduce.Job:  map 100% reduce 72%
16/05/17 15:20:50 INFO mapreduce.Job:  map 100% reduce 76%
16/05/17 15:20:53 INFO mapreduce.Job:  map 100% reduce 78%
16/05/17 15:20:54 INFO mapreduce.Job:  map 100% reduce 80%
16/05/17 15:20:55 INFO mapreduce.Job:  map 100% reduce 84%
16/05/17 15:20:58 INFO mapreduce.Job:  map 100% reduce 88%
16/05/17 15:20:59 INFO mapreduce.Job:  map 100% reduce 90%
16/05/17 15:21:01 INFO mapreduce.Job:  map 100% reduce 92%
16/05/17 15:21:02 INFO mapreduce.Job:  map 100% reduce 96%
16/05/17 15:21:05 INFO mapreduce.Job:  map 100% reduce 98%
16/05/17 15:21:06 INFO mapreduce.Job:  map 100% reduce 100%
16/05/17 15:21:06 INFO mapreduce.Job: Job job_1463468694463_0001 completed successfully
16/05/17 15:21:06 INFO mapreduce.Job: Counters: 49
	File System Counters
		FILE: Number of bytes read=475654774
		FILE: Number of bytes written=957105465
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1073747700
		HDFS: Number of bytes written=1073741800
		HDFS: Number of read operations=300
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=100
	Job Counters 
		Launched map tasks=50
		Launched reduce tasks=50
		Data-local map tasks=50
		Total time spent by all maps in occupied slots (ms)=250682
		Total time spent by all reduces in occupied slots (ms)=288702
		Total time spent by all map tasks (ms)=250682
		Total time spent by all reduce tasks (ms)=288702
		Total vcore-seconds taken by all map tasks=250682
		Total vcore-seconds taken by all reduce tasks=288702
		Total megabyte-seconds taken by all map tasks=256698368
		Total megabyte-seconds taken by all reduce tasks=295630848
	Map-Reduce Framework
		Map input records=10737418
		Map output records=10737418
		Map output bytes=1095216636
		Map output materialized bytes=469603811
		Input split bytes=5900
		Combine input records=0
		Combine output records=0
		Reduce input groups=10737418
		Reduce shuffle bytes=469603811
		Reduce input records=10737418
		Reduce output records=10737418
		Spilled Records=21474836
		Shuffled Maps =2500
		Failed Shuffles=0
		Merged Map outputs=2500
		GC time elapsed (ms)=4093
		CPU time spent (ms)=263440
		Physical memory (bytes) snapshot=33377222656
		Virtual memory (bytes) snapshot=157517893632
		Total committed heap usage (bytes)=44664619008
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
16/05/17 15:21:06 INFO terasort.TeraSort: don

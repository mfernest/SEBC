WITHOUT SHORT CIRCUIT ENABLED RUN 1    
  
[root@ip-172-31-51-35 ec2-user]# time hadoop jar /opt/cloudera/parcels/CDH-5.6.0-1.cdh5.6.0.p0.45/jars/hadoop-examples.jar terasort /user/LouisErnst/teragen /user/LouisErnst/terasort2^C  
[root@ip-172-31-51-35 ec2-user]# time hadoop jar /opt/cloudera/parcels/CDH-5.6.0-1.cdh5.6.0.p0.45/jars/hadoop-examples.jar terasort /user/LouisErnst/teragen /user/LouisErnst/terasort2  
16/03/24 18:18:15 INFO terasort.TeraSort: starting  
16/03/24 18:18:16 INFO hdfs.DFSClient: Created HDFS_DELEGATION_TOKEN token 120 for LouisErnst on 172.31.51.35:8020  
16/03/24 18:18:17 INFO security.TokenCache: Got dt for hdfs://ip-172-31-51-35.ec2.internal:8020; Kind: HDFS_DELEGATION_TOKEN, Service: 172.31.51.35:8020, Ident: (HDFS_DELEGATION_TOKEN token 120 for LouisErnst)  
16/03/24 18:18:17 INFO input.FileInputFormat: Total input paths to process : 2  
Spent 295ms computing base-splits.  
Spent 2ms computing TeraScheduler splits.  
Computing input splits took 298ms  
Sampling 8 splits of 8  
Making 6 from 100000 sampled records  
Computing parititions took 669ms  
Spent 969ms computing partitions.  
16/03/24 18:18:17 INFO client.RMProxy: Connecting to ResourceManager at ip-172-31-51-35.ec2.internal/172.31.51.35:8032  
16/03/24 18:18:18 INFO mapreduce.JobSubmitter: number of splits:8  
16/03/24 18:18:18 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1458857375383_0002  
16/03/24 18:18:18 INFO mapreduce.JobSubmitter: Kind: HDFS_DELEGATION_TOKEN, Service: 172.31.51.35:8020, Ident: (HDFS_DELEGATION_TOKEN token 120 for LouisErnst)  
16/03/24 18:18:18 INFO impl.YarnClientImpl: Submitted application application_1458857375383_0002  
16/03/24 18:18:18 INFO mapreduce.Job: The url to track the job: http://ip-172-31-51-35.ec2.internal:8088/proxy/application_1458857375383_0002/  
16/03/24 18:18:18 INFO mapreduce.Job: Running job: job_1458857375383_0002  
16/03/24 18:18:26 INFO mapreduce.Job: Job job_1458857375383_0002 running in uber mode : false  
[### JOB PROGRESS###]  
16/03/24 18:19:08 INFO mapreduce.Job: Job job_1458857375383_0002 completed successfully  
16/03/24 18:19:08 INFO mapreduce.Job: Counters: 49  
        File System Counters  
                FILE: Number of bytes read=443032498  
                FILE: Number of bytes written=884818902  
                FILE: Number of read operations=0  
                FILE: Number of large read operations=0  
                FILE: Number of write operations=0  
                HDFS: Number of bytes read=1000001136  
                HDFS: Number of bytes written=1000000000  
                HDFS: Number of read operations=42  
                HDFS: Number of large read operations=0  
                HDFS: Number of write operations=12  
        Job Counters  
                Launched map tasks=8  
                Launched reduce tasks=6  
                Data-local map tasks=8  
                Total time spent by all maps in occupied slots (ms)=77723  
                Total time spent by all reduces in occupied slots (ms)=53843  
                Total time spent by all map tasks (ms)=77723  
                Total time spent by all reduce tasks (ms)=53843  
                Total vcore-seconds taken by all map tasks=77723  
                Total vcore-seconds taken by all reduce tasks=53843  
                Total megabyte-seconds taken by all map tasks=79588352  
                Total megabyte-seconds taken by all reduce tasks=55135232  
        Map-Reduce Framework  
                Map input records=10000000  
                Map output records=10000000  
                Map output bytes=1020000000  
                Map output materialized bytes=440143734  
                Input split bytes=1136  
                Combine input records=0  
                Combine output records=0  
                Reduce input groups=10000000  
                Reduce shuffle bytes=440143734  
                Reduce input records=10000000  
                Reduce output records=10000000  
                Spilled Records=20000000  
                Shuffled Maps =48  
                Failed Shuffles=0  
                Merged Map outputs=48  
                GC time elapsed (ms)=1880  
                CPU time spent (ms)=93880  
                Physical memory (bytes) snapshot=7623581696  
                Virtual memory (bytes) snapshot=21968900096  
                Total committed heap usage (bytes)=8872525824  
        Shuffle Errors  
                BAD_ID=0  
                CONNECTION=0  
                IO_ERROR=0  
                WRONG_LENGTH=0  
                WRONG_MAP=0  
                WRONG_REDUCE=0  
        File Input Format Counters  
                Bytes Read=1000000000  
        File Output Format Counters  
                Bytes Written=1000000000  
16/03/24 18:19:08 INFO terasort.TeraSort: done  
  
real    0m54.018s  
user    0m7.702s  
sys     0m0.335s  
  
______________________________________________________________________________  
WITHOUT SHORT CIRCUIT ENABLED RUN 2  
  
[root@ip-172-31-51-35 ec2-user]# time hadoop jar /opt/cloudera/parcels/CDH-5.6.0-1.cdh5.6.0.p0.45/jars/hadoop-examples.jar terasort /user/LouisErnst/teragen /user/LouisErnst/terasort2  
16/03/24 18:14:52 INFO terasort.TeraSort: starting  
16/03/24 18:14:54 INFO hdfs.DFSClient: Created HDFS_DELEGATION_TOKEN token 119 for LouisErnst on 172.31.51.35:8020  
16/03/24 18:14:54 INFO security.TokenCache: Got dt for hdfs://ip-172-31-51-35.ec2.internal:8020; Kind: HDFS_DELEGATION_TOKEN, Service: 172.31.51.35:8020, Ident: (HDFS_DELEGATION_TOKEN token 119 for LouisErnst)  
16/03/24 18:14:54 INFO input.FileInputFormat: Total input paths to process : 2  
Spent 315ms computing base-splits.  
Spent 2ms computing TeraScheduler splits.  
Computing input splits took 318ms  
Sampling 8 splits of 8  
Making 6 from 100000 sampled records  
Computing parititions took 721ms  
Spent 1043ms computing partitions.  
16/03/24 18:14:55 INFO client.RMProxy: Connecting to ResourceManager at ip-172-31-51-35.ec2.internal/172.31.51.35:8032  
16/03/24 18:14:55 INFO mapreduce.JobSubmitter: number of splits:8  
16/03/24 18:14:56 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1458857375383_0001  
16/03/24 18:14:56 INFO mapreduce.JobSubmitter: Kind: HDFS_DELEGATION_TOKEN, Service: 172.31.51.35:8020, Ident: (HDFS_DELEGATION_TOKEN token 119 for LouisErnst)  
16/03/24 18:14:56 INFO impl.YarnClientImpl: Submitted application application_1458857375383_0001  
16/03/24 18:14:57 INFO mapreduce.Job: The url to track the job: http://ip-172-31-51-35.ec2.internal:8088/proxy/application_1458857375383_0001/  
16/03/24 18:14:57 INFO mapreduce.Job: Running job: job_1458857375383_0001  
16/03/24 18:15:06 INFO mapreduce.Job: Job job_1458857375383_0001 running in uber mode : false  
[### JOB PROGRESS###]  
16/03/24 18:15:47 INFO mapreduce.Job: Job job_1458857375383_0001 completed successfully  
16/03/24 18:15:47 INFO mapreduce.Job: Counters: 49  
        File System Counters  
                FILE: Number of bytes read=443032498  
                FILE: Number of bytes written=884818902  
                FILE: Number of read operations=0  
                FILE: Number of large read operations=0  
                FILE: Number of write operations=0  
                HDFS: Number of bytes read=1000001136  
                HDFS: Number of bytes written=1000000000  
                HDFS: Number of read operations=42  
                HDFS: Number of large read operations=0  
                HDFS: Number of write operations=12  
        Job Counters  
                Launched map tasks=8  
                Launched reduce tasks=6  
                Data-local map tasks=8  
                Total time spent by all maps in occupied slots (ms)=80675  
                Total time spent by all reduces in occupied slots (ms)=54410  
                Total time spent by all map tasks (ms)=80675  
                Total time spent by all reduce tasks (ms)=54410  
                Total vcore-seconds taken by all map tasks=80675  
                Total vcore-seconds taken by all reduce tasks=54410  
                Total megabyte-seconds taken by all map tasks=82611200  
                Total megabyte-seconds taken by all reduce tasks=55715840  
        Map-Reduce Framework  
                Map input records=10000000  
                Map output records=10000000  
                Map output bytes=1020000000  
                Map output materialized bytes=440143734  
                Input split bytes=1136  
                Combine input records=0  
                Combine output records=0  
                Reduce input groups=10000000  
                Reduce shuffle bytes=440143734  
                Reduce input records=10000000  
                Reduce output records=10000000  
                Spilled Records=20000000  
                Shuffled Maps =48  
                Failed Shuffles=0  
                Merged Map outputs=48  
                GC time elapsed (ms)=2015  
                CPU time spent (ms)=94120  
                Physical memory (bytes) snapshot=7462813696  
                Virtual memory (bytes) snapshot=22041780224  
                Total committed heap usage (bytes)=8246001664  
        Shuffle Errors  
                BAD_ID=0  
                CONNECTION=0  
                IO_ERROR=0  
                WRONG_LENGTH=0  
                WRONG_MAP=0  
                WRONG_REDUCE=0  
        File Input Format Counters  
                Bytes Read=1000000000  
        File Output Format Counters  
                Bytes Written=1000000000  
16/03/24 18:15:47 INFO terasort.TeraSort: done  
  
real    0m55.822s  
user    0m7.614s  
sys     0m0.331s  
  
______________________________________________________________________________  
WITH SHORT CIRCUIT ENABLED  
  
  
[root@ip-172-31-51-35 ec2-user]# time hadoop jar /opt/cloudera/parcels/CDH-5.6.0-1.cdh5.6.0.p0.45/jars/hadoop-examples.jar terasort /user/LouisErnst/teragen /user/LouisErnst/terasort  
16/03/24 18:02:36 INFO terasort.TeraSort: starting  
16/03/24 18:02:38 INFO hdfs.DFSClient: Created HDFS_DELEGATION_TOKEN token 118 for LouisErnst on 172.31.51.35:8020  
16/03/24 18:02:38 INFO security.TokenCache: Got dt for hdfs://ip-172-31-51-35.ec2.internal:8020; Kind: HDFS_DELEGATION_TOKEN, Service: 172.31.51.35:8020, Ident: (HDFS_DELEGATION_TOKEN token 118 for LouisErnst)  
16/03/24 18:02:38 INFO input.FileInputFormat: Total input paths to process : 2  
Spent 277ms computing base-splits.  
Spent 2ms computing TeraScheduler splits.  
Computing input splits took 281ms  
Sampling 8 splits of 8  
Making 6 from 100000 sampled records  
Computing parititions took 2587ms  
Spent 2870ms computing partitions.  
16/03/24 18:02:41 INFO client.RMProxy: Connecting to ResourceManager at ip-172-31-51-35.ec2.internal/172.31.51.35:8032  
16/03/24 18:02:42 INFO mapreduce.JobSubmitter: number of splits:8  
16/03/24 18:02:42 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1458844022803_0059  
16/03/24 18:02:42 INFO mapreduce.JobSubmitter: Kind: HDFS_DELEGATION_TOKEN, Service: 172.31.51.35:8020, Ident: (HDFS_DELEGATION_TOKEN token 118 for LouisErnst)  
16/03/24 18:02:42 INFO impl.YarnClientImpl: Submitted application application_1458844022803_0059  
16/03/24 18:02:42 INFO mapreduce.Job: The url to track the job: http://ip-172-31-51-35.ec2.internal:8088/proxy/application_1458844022803_0059/  
16/03/24 18:02:42 INFO mapreduce.Job: Running job: job_1458844022803_0059  
16/03/24 18:02:50 INFO mapreduce.Job: Job job_1458844022803_0059 running in uber mode : false  
[### JOB PROGRESS###]  
16/03/24 18:03:31 INFO mapreduce.Job: Job job_1458844022803_0059 completed successfully  
16/03/24 18:03:31 INFO mapreduce.Job: Counters: 50  
        File System Counters  
                FILE: Number of bytes read=443032498  
                FILE: Number of bytes written=884818874  
                FILE: Number of read operations=0  
                FILE: Number of large read operations=0  
                FILE: Number of write operations=0  
                HDFS: Number of bytes read=1000001136  
                HDFS: Number of bytes written=1000000000  
                HDFS: Number of read operations=42  
                HDFS: Number of large read operations=0  
                HDFS: Number of write operations=12  
        Job Counters  
                Launched map tasks=8  
                Launched reduce tasks=6  
                Data-local map tasks=7  
                Rack-local map tasks=1  
                Total time spent by all maps in occupied slots (ms)=78197  
                Total time spent by all reduces in occupied slots (ms)=52888  
                Total time spent by all map tasks (ms)=78197  
                Total time spent by all reduce tasks (ms)=52888  
                Total vcore-seconds taken by all map tasks=78197  
                Total vcore-seconds taken by all reduce tasks=52888  
                Total megabyte-seconds taken by all map tasks=80073728  
                Total megabyte-seconds taken by all reduce tasks=54157312  
        Map-Reduce Framework  
                Map input records=10000000  
                Map output records=10000000  
                Map output bytes=1020000000  
                Map output materialized bytes=440143734  
                Input split bytes=1136  
                Combine input records=0  
                Combine output records=0  
                Reduce input groups=10000000  
                Reduce shuffle bytes=440143734  
                Reduce input records=10000000  
                Reduce output records=10000000  
                Spilled Records=20000000  
                Shuffled Maps =48  
                Failed Shuffles=0  
                Merged Map outputs=48  
                GC time elapsed (ms)=2034  
                CPU time spent (ms)=93240  
                Physical memory (bytes) snapshot=7414329344  
                Virtual memory (bytes) snapshot=21975658496  
                Total committed heap usage (bytes)=8739356672  
        Shuffle Errors  
                BAD_ID=0  
                CONNECTION=0  
                IO_ERROR=0  
                WRONG_LENGTH=0  
                WRONG_MAP=0  
                WRONG_REDUCE=0  
        File Input Format Counters  
                Bytes Read=1000000000  
        File Output Format Counters  
                Bytes Written=1000000000  
16/03/24 18:03:31 INFO terasort.TeraSort: done  
  
real    0m55.651s  
user    0m8.443s  
sys     0m0.464s  

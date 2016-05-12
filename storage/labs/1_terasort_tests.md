**short circuit disabled**

[root@rhel-cdh-server01 bin]#  time sudo -u hdfs hadoop jar /opt/cloudera/parcels/CDH-5.7.0-1.cdh5.7.0.p0.45/jars/hadoop-examples.jar terasort /ghealy/tg1 /ghealy/tg1sorted
16/05/12 13:13:55 INFO terasort.TeraSort: starting
16/05/12 13:13:56 INFO input.FileInputFormat: Total input paths to process : 2
Spent 180ms computing base-splits.
Spent 3ms computing TeraScheduler splits.
Computing input splits took 184ms
Sampling 8 splits of 8
Making 8 from 100000 sampled records
Computing parititions took 859ms
Spent 1046ms computing partitions.
16/05/12 13:13:57 INFO client.RMProxy: Connecting to ResourceManager at rhel-cdh-server01.g55lab.aus.hp.com/10.7.2.10:8032
16/05/12 13:13:58 INFO mapreduce.JobSubmitter: number of splits:8
16/05/12 13:13:58 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1463005900169_0006
16/05/12 13:13:58 INFO impl.YarnClientImpl: Submitted application application_1463005900169_0006
16/05/12 13:13:58 INFO mapreduce.Job: The url to track the job: http://rhel-cdh-server01.g55lab.aus.hp.com:8088/proxy/application_1463005900169_0006/
16/05/12 13:13:58 INFO mapreduce.Job: Running job: job_1463005900169_0006
16/05/12 13:14:06 INFO mapreduce.Job: Job job_1463005900169_0006 running in uber mode : false
16/05/12 13:14:06 INFO mapreduce.Job:  map 0% reduce 0%
16/05/12 13:14:18 INFO mapreduce.Job:  map 29% reduce 0%
16/05/12 13:14:19 INFO mapreduce.Job:  map 58% reduce 0%
16/05/12 13:14:20 INFO mapreduce.Job:  map 92% reduce 0%
16/05/12 13:14:21 INFO mapreduce.Job:  map 100% reduce 0%
16/05/12 13:14:32 INFO mapreduce.Job:  map 100% reduce 25%
16/05/12 13:14:34 INFO mapreduce.Job:  map 100% reduce 50%
16/05/12 13:14:35 INFO mapreduce.Job:  map 100% reduce 88%
16/05/12 13:14:36 INFO mapreduce.Job:  map 100% reduce 100%
16/05/12 13:14:36 INFO mapreduce.Job: Job job_1463005900169_0006 completed successfully
16/05/12 13:14:36 INFO mapreduce.Job: Counters: 49
        File System Counters
                FILE: Number of bytes read=443030807
                FILE: Number of bytes written=885075087
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=1000001088
                HDFS: Number of bytes written=1000000000
                HDFS: Number of read operations=48
                HDFS: Number of large read operations=0
                HDFS: Number of write operations=16
        Job Counters
                Launched map tasks=8
                Launched reduce tasks=8
                Data-local map tasks=8
                Total time spent by all maps in occupied slots (ms)=91058
                Total time spent by all reduces in occupied slots (ms)=82907
                Total time spent by all map tasks (ms)=91058
                Total time spent by all reduce tasks (ms)=82907
                Total vcore-seconds taken by all map tasks=91058
                Total vcore-seconds taken by all reduce tasks=82907
                Total megabyte-seconds taken by all map tasks=93243392
                Total megabyte-seconds taken by all reduce tasks=84896768
        Map-Reduce Framework
                Map input records=10000000
                Map output records=10000000
                Map output bytes=1020000000
                Map output materialized bytes=440145104
                Input split bytes=1088
                Combine input records=0
                Combine output records=0
                Reduce input groups=10000000
                Reduce shuffle bytes=440145104
                Reduce input records=10000000
                Reduce output records=10000000
                Spilled Records=20000000
                Shuffled Maps =64
                Failed Shuffles=0
                Merged Map outputs=64
                GC time elapsed (ms)=2069
                CPU time spent (ms)=122920
                Physical memory (bytes) snapshot=7179132928
                Virtual memory (bytes) snapshot=25204838400
                Total committed heap usage (bytes)=9083289600
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
16/05/12 13:14:36 INFO terasort.TeraSort: done

real    0m42.792s
**user    0m8.675s
sys     0m0.323s**


** Short Circuit enabled **
[root@rhel-cdh-server01 bin]#  time sudo -u hdfs hadoop jar /opt/cloudera/parcels/CDH-5.7.0-1.cdh5.7.0.p0.45/jars/hadoop-examples.jar terasort /ghealy/tg1 /ghealy/tg1sorted
16/05/12 13:18:37 INFO terasort.TeraSort: starting
16/05/12 13:18:39 INFO input.FileInputFormat: Total input paths to process : 2
Spent 152ms computing base-splits.
Spent 2ms computing TeraScheduler splits.
Computing input splits took 155ms
Sampling 8 splits of 8
Making 8 from 100000 sampled records
Computing parititions took 678ms
Spent 836ms computing partitions.
16/05/12 13:18:39 INFO client.RMProxy: Connecting to ResourceManager at rhel-cdh-server01.g55lab.aus.hp.com/10.7.2.10:8032
16/05/12 13:18:40 INFO mapreduce.JobSubmitter: number of splits:8
16/05/12 13:18:40 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1463005900169_0007
16/05/12 13:18:40 INFO impl.YarnClientImpl: Submitted application application_1463005900169_0007
16/05/12 13:18:40 INFO mapreduce.Job: The url to track the job: http://rhel-cdh-server01.g55lab.aus.hp.com:8088/proxy/application_1463005900169_0007/
16/05/12 13:18:40 INFO mapreduce.Job: Running job: job_1463005900169_0007
16/05/12 13:18:49 INFO mapreduce.Job: Job job_1463005900169_0007 running in uber mode : false
16/05/12 13:18:49 INFO mapreduce.Job:  map 0% reduce 0%
16/05/12 13:19:01 INFO mapreduce.Job:  map 38% reduce 0%
16/05/12 13:19:02 INFO mapreduce.Job:  map 58% reduce 0%
16/05/12 13:19:03 INFO mapreduce.Job:  map 96% reduce 0%
16/05/12 13:19:04 INFO mapreduce.Job:  map 100% reduce 0%
16/05/12 13:19:15 INFO mapreduce.Job:  map 100% reduce 25%
16/05/12 13:19:16 INFO mapreduce.Job:  map 100% reduce 62%
16/05/12 13:19:17 INFO mapreduce.Job:  map 100% reduce 99%
16/05/12 13:19:18 INFO mapreduce.Job:  map 100% reduce 100%
16/05/12 13:19:18 INFO mapreduce.Job: Job job_1463005900169_0007 completed successfully
16/05/12 13:19:18 INFO mapreduce.Job: Counters: 49
        File System Counters
                FILE: Number of bytes read=443030807
                FILE: Number of bytes written=885075069
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=1000001088
                HDFS: Number of bytes written=1000000000
                HDFS: Number of read operations=48
                HDFS: Number of large read operations=0
                HDFS: Number of write operations=16
        Job Counters
                Launched map tasks=8
                Launched reduce tasks=8
                Data-local map tasks=8
                Total time spent by all maps in occupied slots (ms)=90323
                Total time spent by all reduces in occupied slots (ms)=85375
                Total time spent by all map tasks (ms)=90323
                Total time spent by all reduce tasks (ms)=85375
                Total vcore-seconds taken by all map tasks=90323
                Total vcore-seconds taken by all reduce tasks=85375
                Total megabyte-seconds taken by all map tasks=92490752
                Total megabyte-seconds taken by all reduce tasks=87424000
        Map-Reduce Framework
                Map input records=10000000
                Map output records=10000000
                Map output bytes=1020000000
                Map output materialized bytes=440145104
                Input split bytes=1088
                Combine input records=0
                Combine output records=0
                Reduce input groups=10000000
                Reduce shuffle bytes=440145104
                Reduce input records=10000000
                Reduce output records=10000000
                Spilled Records=20000000
                Shuffled Maps =64
                Failed Shuffles=0
                Merged Map outputs=64
                GC time elapsed (ms)=1721
                CPU time spent (ms)=119910
                Physical memory (bytes) snapshot=7032520704
                Virtual memory (bytes) snapshot=25188450304
                Total committed heap usage (bytes)=9082241024
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
16/05/12 13:19:18 INFO terasort.TeraSort: done

real    0m42.241s
**user    0m7.992s
sys     0m0.293s**

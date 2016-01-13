<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> <a name="hdfs_section"/>HDFS<p>

* Review and reinforcement
    * <a href="#hdfs_namenode_ha">NameNode HA</a>
    * <a href="#hdfs_benchmarking">Benchmarking</a>
    * <a href="#namenode_web_ui">NameNode Web UI</a>
    * <a href="#using_safemode">What safemode does</a>
* <a href="#hdfs_c5">HDFS for C5</a>    

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_namenode_ha"/> NameNode HA

* CM 5 supports a [NameNode HA wizard](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_hdfs_hi_avail.html)
    * {HDFS service} -> Actions -> Enable High Availability
    * [Locating the Journal Quorum Managers](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_hdfs_hi_avail.html?scroll=cmug_topic_5_12_1_unique_1)
    * [Understanding Zookeeper's role](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HDFSHighAvailabilityWithQJM.html)
* You may want to relocate services as a cluster grows
* Best practices vary with cluster size
    * Few nodes: master & workers combined, utility & edge roles combined 
    * Many nodes: dedicated roles per host
    * You may have hardware designed for each role
        * Fewer disks, RAID on master nodes
        * RAM, many spindles on worker nodes

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_benchmarking"/> Benchmarking

* Benchmarking: smoke test or performance test?
* Common tools used in the field
    * [TeraSort Suite: teragen, terasort, teravalidate](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#terasort-benchmark-suite)
    * A few use [TestDFSIO](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#testdfsio)
* For more robust performance testing    
    * [<strong>S</strong>tatistical <strong>W</strong>orkload <strong>I</strong>njector for <strong>M</strong>apReduce](https://github.com/SWIMProjectUCB/SWIM/wiki) (SWIM)    
    * Used by Cloudera's Partner Engineering
    * Not a ready-to-deploy field tool
* Consider testing the NameNode first: [nnbench](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#namenode-benchmark-nnbench)

[Michael G. Noll's blog post](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/) reviews many of these tools (not SWIM).

---
<div style="page-break-after: always;"></div>

## <center> <a name="namenode_web_ui"/> NameNode Web UI

* Use [Vijay Thakorlal's breakdown/annotation article](http://vijayjt.blogspot.com/2013/02/hadoop-namenode-web-interface.html) if you're not familiar
    * Significant changes from earlier Hadoop releases
    * You should know it well
* SNN's web UI port: 50090
    * One place to find the Hadoop version in use
    * Use when the NameNode itself is very busy

---
<div style="page-break-after: always;"></div>

## <center> <a name="using_safemode"/>A note on safemode

* Entered while fsimage is reloaded 
    * Write requests will be delayed or refused
    * Read requests are OK
* The NN may take 30 seconds or more before leaving safemode
    * If at least one cycle of replays takes place
* Safemode can used to suspend all writes during maintenance
    * <code>hadoop dfsadmin -safemode</code>

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_c5"/> C5 Goals for HDFS

The strategic goals for C5:

* Take advantage of larger RAM complements
* Perform faster backups
* Provide more data recovery options
* Provide more client access options

---
<div style="page-break-after: always;"></div>

## <center> Key HDFS Features in C5

* <a href="#hdfs_dir_caching">Directory caching </a> 
* <a href="#hdfs_dir_snapshots"> Directory snapshots </a>
* <a href="#nfs_gateway"> NFS Gateway</a>
* <a href="#hdfs_backups"/>Backups

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_dir_caching"/> Directory caching: Use case
### <center> Repeating a query (cache effect)

<img src="http://blog.cloudera.com/wp-content/uploads/2014/08/hdfs-cache-f1.jpg">

---
<div style="page-break-after: always;"></div>

## <center> Problem: Performance on Repeated Queries

* The NameNode knows which DataNodes stores which blocks
    * It doesn't know [which nodes currently have them cached](https://issues.apache.org/jira/browse/HDFS-4949)
    * A repeat job could pay disk I/O cost up to three times
    * This cost is arguably transparent to MapReduce jobs
    * With [Impala](http://impala.io/) or other NRT use cases, however, lag is  notable
        * Common ad hoc queries => double- and triple-caching
    
---
<div style="page-break-after: always;"></div>

## <center> Solution: [HDFS Read Caching](http://blog.cloudera.com/blog/2014/08/new-in-cdh-5-1-hdfs-read-caching/)
    
Adds cache locality to NN reports<p>

* Specify to the NN a HDFS file/directory you want cached
* The DN receives a cache command and pulls the data into memory
    * Will cache block copies up to the replica limit
    * Stored off-heap: no impact on DataNode GC
* Cache-local clients can be made aware of this advantage <a href="#scr_and_zcr">one of two ways</a>:
    * Short-circuit read (SCR) API
    * Zero-copy read (ZCR) API

---
<div style="page-break-after: always;"></div>

## <center> Directory caching: Implementation<p>

<center><img src="https://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/images/caching.png" height="325" width="400"></center>

---
<div style="page-break-after: always;"></div>

## <center> Directory caching: Roles and responsibilities

* HDFS admin
    1. Create a cache pool (used to enforce quotas)
    2. Assigns directive(s)
    3. CLI: <code># sudo -u hdfs hdfs cacheadmin ...</code>
    4. Can add/modify/remove cache pools & directives, list stats
* DataNodes
    1. Maps blocks to system memory as requested
    2. Report cached state to NameNode
* Job client
    1. Queries NN for DNs with cached blocks
    2. Uses Zero Copy Read (ZCR) or Short Circuit Read (SCR) API 

---
<div style="page-break-after: always;"></div>

## <center> Directory caching: Other notes

* [Documentation](https://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_hdfs_caching.html)
* The next question: how do we balance memory demand?
    * Queries with [NRT expectations](http://stackoverflow.com/questions/5267231/what-is-the-definition-of-realtime-near-realtime-and-batch-give-examples-of-ea)
    * MR jobs favoring parallel efficiency, low cost, simple scheduling
    * We'll dig deeper this afternoon in the <a href="#yarn_rm">YARN RM</a> section
    
---     
<div style="page-break-after: always;"></div>

## <center> <a name="scr_and_zcr"/> Notes on SCR and ZCR

* Short-circuit Read
    * [HDFS-2246](https://issues.apache.org/jira/browse/HDFS-2246): Lets a client read the local DataNode's process map
    * Uses [file descriptor passing](http://poincare.matf.bg.ac.rs/~ivana/courses/tos/sistemi_knjige/pomocno/apue/APUE/0201433079/ch17lev1sec4.html)
    * [Configurable via CM or hdfs-site.xml file](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/admin_hdfs_short_circuit_reads.html) 
* Zero-copy Read
    * [Uses mmap() to read system page$](https://issues.apache.org/jira/browse/HDFS-4953)
    * Client implements the [ZCR API](https://issues.apache.org/jira/browse/HDFS-5191) 
* On the roadmap
    * Write caching: [HDFS-5851](https://issues.apache.org/jira/browse/HDFS-5851)
    * Proposed: dynamic caching based on workload/hints

---    
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_dir_snapshots"/> HDFS Snapshots

* Capabilities
    * Lets user with write permissions retrieve a deleted file
    * Lets users track additions to a directory over time
    * Uses [copy-on-write](http://en.wikipedia.org/wiki/Copy-on-write) to associate NN directories with DN block locations + timestamp 
    * Deleted files may be retrieved from a version folder
    * Similar to .Trash concept, but no expiration
    * Subdirectories are included
* [Apache page on the CLI](http://archive.cloudera.com/cdh5/cdh/5/hadoop/hadoop-project-dist/hadoop-hdfs/HdfsSnapshots.html) 
* Using [Cloudera Manager](http://www.cloudera.com/content/cloudera/en/documentation/core/v5-2-x/topics/cm_bdr_managing_hdfs_snapshots.html) -- requires active trial or Enterprise license

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_backups"/> HDFS Backups

* Top-level tab in CM home page
    * AKA Cloudera Enterprise BDR (Backup and Data Recovery)
* Centralized configuration, monitors, alerts
    * Includes snapshots & replication
    * Files or directory-based
    * Executes a distCp job
    * Preserves file attributes
* Secure clusters will not back up to or receive backups from unsecured clusters
 
---
<div style="page-break-after: always;"></div>

## <center> <a name="nfs_gateway"/> NFS Gateway

* NFSv3 service to HDFS
    * Useful for file browsing and transfers
    * Alternative to webHDFS or httpfs
* Any NFS-capable HDFS client can be a gateway
* Properties kept in <code>hdfs-site.xml</code>
* Depends on OS rpcbind/portmapper services: [HDFS-4763](https://issues.apache.org/jira/browse/HDFS-4763)

---
<div style="page-break-after: always;"></div>

## <center> HDFS Problems/Diagnoses/Solutions

### <center>HDFS Labs Overview

* Replicate data to a classmate's cluster 
* Use teragen and terasort
* Enable NameNode HA
* Snapshot, delete, and recover a file

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Replicate to another cluster

* Choose a replication partner in class
* Configure a replication directory for your lab partner
* Teragen a ~400MB file 
    * Replicate to the directory your partner made for you
* Email a screenshot showing the received files exist on your system
    * You can use thre HDFS File Browser in Cloudera Manager if you wish

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Test HDFS performance

* Use the steps outlined in [Michael Noll's blog](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/) as a guide.
* Run terasort twice
    * Use the <code>time</code> command to capture each run
    * Use <code>terasort</code> on the file you created in the last lab
    * Use <code>terasort</code> on the file replicated to your HDFS
* Email the results of these runs; be sure to include the <code>time</code> results.
    * Please omit the task completion percentages from the output.

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Enable HDFS HA

* Use the CM Wizard to enable HA
* Capture/email your HDFS service main page when complete 
* Add an <code>instructor</code> user in CM 
    * Assign the Operator role to this user
    * Use the password <code>cloudera</code>
* Email the URL of your CM instance when this account is ready

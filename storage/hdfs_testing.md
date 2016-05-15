<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> <a name="hdfs_section"/>HDFS<p>

* Review and reinforcement
* HDFS Basics
    * <a href="#hdfs_namenode_ha">NameNode HA</a>
    * <a href="#hdfs_benchmarking">Benchmarking</a>
    * <a href="#hdfs_c5">HDFS & C5</a>    

---
<div style="page-break-after: always;"></div>

## <center>Notes on Service Deployment</center>

* Plan to relocate services as more nodes are added
* Cloudera uses four role models to guide service placement 
    * Master nodes control executive and supervisory processes
        * HDFS NameNode, YARN ResourceManager, HBaseMaster
        * Impala Catalog Server & StateStore
    * Worker nodes provide storage and processing resources
        * DataNode, NodeManager, HBase RegionServer
        * Impala daemons
    * Edge: Client access, data ingestion
        * HUE, Oozie
        * Flume, Sqoop
        * May be secured from internal cluster services
    * Utility: Administration
        * Cloudera Manager and management services
        * Database server (MySQL, PostgreSQL, Oracle)

---
<div style="page-break-after: always;"></div>

## <center>Node count also influences the architecture

* With fewer nodes, some roles can be combined 
    * <10 nodes: master & workers combined, utility & edge roles combined 
    * 20-80 nodes: masters and workers separated, dedicated utility & edge node
    * 100+ nodes: more utility, master, and edge machines depending on use case
    * More nodes -> differentiated hardware for each role
        * Four disks, RAID OS volume on master nodes
        * More RAM and spindles on worker nodes
        * VMs for edge/utility roles

---
<div style="page-break-after: always;"></div>


## <center> <a name="hdfs_namenode_ha"/> NameNode HA

* CM 5 offers a [NameNode HA wizard](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_hdfs_hi_avail.html)
    * In CML *{HDFS service} -> Actions -> Enable High Availability*
    * You'll need to [place the Journal Quorum Managers](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_hdfs_hi_avail.html?scroll=cmug_topic_5_12_1_unique_1)
    * You should [understand Zookeeper's role in maintaining state] (https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HDFSHighAvailabilityWithQJM.html)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_benchmarking"/> Benchmarking

* We test after installation for hardware and network problems
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

## <center> <a name="hdfs_c5"/> C5 Goals for HDFS

Strategic storage goals for C5:

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

* The NameNode relates file paths to block locations on DataNodes
    * Locality is based on disk storage [not in-memory cache](https://issues.apache.org/jira/browse/HDFS-4949)
    * Repeat queries could pay disk I/O cost up to number of data replicas
    * Not significant to MapReduce jobs
    * [Impala](http://impala.io/) and other NRT use cases will feel it.
    
---
<div style="page-break-after: always;"></div>

## <center> Solution: [HDFS Read Caching](http://blog.cloudera.com/blog/2014/08/new-in-cdh-5-1-hdfs-read-caching/)
    
Adds cache locality to NN reports<p>

* Specify to the NN a HDFS file/directory you want cached
* The DN receives a cache command and pulls the data into memory
    * Will cache block copies up to the replica limit
    * Stored off-heap: no impact on DataNode GC
* A cache-local client such as impalad can exploit this <a href="#scr_and_zcr">programmatically</a>
    * Short-circuit read (SCR) API
    * Zero-copy read (ZCR) API

---
<div style="page-break-after: always;"></div>

## <center> Directory caching: Implementation<p>

<center><img src="http://www.cloudera.com/documentation/enterprise/latest/images/caching.png" height="325" width="400"></center>

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

* [Caching documentation is here] (http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_hdfs_caching.html)
* The follow-on question: how do we balance memory demand between this and other memory-hungry features? 
    * MR jobs favor parallel efficiency, low cost, simple scheduling
    * Query users have ["NRT" expectations](http://stackoverflow.com/questions/5267231/what-is-the-definition-of-realtime-near-realtime-and-batch-give-examples-of-ea)
    * We'll detail this subject when we discuss YARN and resource management
    
---     
<div style="page-break-after: always;"></div>

## <center> <a name="scr_and_zcr"/> Technical Notes on SCR and ZCR

* General advice: take time to map key upstream features to their [JIRAs] (https://issues.apache.org/jira)
* [Short-circuit Reads] (https://issues.apache.org/jira/browse/HDFS-2246)
    * Lets a client examine the local DataNode's process map for data blocks in system cache
    * Uses [file descriptor passing](http://poincare.matf.bg.ac.rs/~ivana/courses/tos/sistemi_knjige/pomocno/apue/APUE/0201433079/ch17lev1sec4.html) 
    * [Configurable via CM](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/admin_hdfs_short_circuit_reads.html) 
* Zero-copy Read
    * [Uses mmap() to read system page$](https://issues.apache.org/jira/browse/HDFS-4953)
    * Client implements the [ZCR API](https://issues.apache.org/jira/browse/HDFS-5191) 
* On the roadmap
    * Write caching: [HDFS-5851](https://issues.apache.org/jira/browse/HDFS-5851)
    * Proposed enhancement: dynamic caching based on workload/hints

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
* [Apache docs on the CLI](http://archive.cloudera.com/cdh5/cdh/5/hadoop/hadoop-project-dist/hadoop-hdfs/HdfsSnapshots.html) 
* [Snapshots using Cloudera Manager] (http://www.cloudera.com/documentation/enterprise/latest/topics/cm_bdr_snapshot_intro.html) requires an active trial or Enterprise license

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

* It's just Linux NFSv3 ported to HDFS
    * Useful for file browsing and NAS transfers
    * Alternative to webHDFS or httpfs
* Any NFS-capable HDFS client can be a gateway
* Properties kept in `hdfs-site.xml`
* Depends on OS rpcbind/portmapper services: [HDFS-4763](https://issues.apache.org/jira/browse/HDFS-4763)

---
<div style="page-break-after: always;"></div>

## <center> HDFS Problems/Diagnoses/Solutions

### <center>HDFS Labs Overview

* Replicate data to a classmate's cluster 
* Use `teragen` and `terasort` to smoke-test your cluster
* Configure NameNode HA
* Snapshot, delete, and recover a file

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Replicate to another cluster

Note: actual data replication will only occur on AWS only if the
two clusters are in the same Availability Zone. You will probably
not transfer data to your partner's cluster, but you can still get
the job to start.

* Choose a partner in class
* Create a source directory using your GitHub handle
* Create a target directory using your partner's GitHub handle
* Use `teragen` to create 1 GB of records
* Try replicating your partner's file to the target directory your made for them 
* Using the HDFS Browser, get a screenshot that shows your partner's target directory
    * Name this file `storage/labs/0_partnerGitHub_yourGitHub.png`

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Test HDFS performance

* Disable Short Circuit Reads in Cloudera Manager
* Run `terasort` twice
    * Use the `time` command to capture each run's duration
    * Use the file you created with `teragen` in the previous lab
    * To use one directory for all runs, remember to delete the previous job's output
* Enable HDFS Short Circuit Reads, and run one more `terasort`
* Record the output and duration of all jobs
    * Replace all map/reduce percentage output lines in each job with one line that reads [###Job Progress###]
    * Place all this in the file `storage/labs/1_terasort_tests.md` 

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Enable HDFS HA

* Use the Cloudera Manager wizard to enable HA
    * Once configured, get a screenshot of the HDFS Instances tab
        * Name the file `storage/2_HDFS_HA.png` 
* Add a CM user and name it with your GitHub handle
    * Assign the `Full Administrator` role to this user
    * Assign the password `cloudera` to this user
    * Re-assign the 'admin' user to the `Limited Operator` role
    * Take a screenshot of your users page; save it to <code>storage/labs/3_CM_users.png</code>
* Email the instructors once you have completed these labs.

<!-- CSS work goes here for the time being -->

<!-- set a:link text-decoration to none -->

<!-- set a:hover text-decoration to underline -->

<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---

# <center> Cloudera SI/Partner Bootcamp </center>
# <center> Monday PM: Introduction </center>

---
<div style="page-break-after: always;"></div>


## <center> Introductions & Overview

- <a href="#instructor">Instructors</a>
- <a href="#audience">Audience Expectations</a>
- <a href="#selfcheck">Self-check questions</a>
- <a href="#design_layout">Course design & layout</a>

<div style="page-break-after: always;"></div>

---

## <center> <a name="instructor"/> Instructors

* Michael Ernest (Sr. Consultant, Course Developer/Facilitator)
    * mfernest@cloudera.com
* Jeff Field (Solution Architect, Field Expert)
    * jfield@cloudera.com

---
<div style="page-break-after: always;"></div>

## <center> <a name="audience"/> Audience

We will address you as field technicians who:

* Have attended Cloudera's Hadoop/Administrators Course
* Have hands-on exposure to CDH install/config work
    * Includes shadowing, tech support, maintenance
* Can complete exercises without step-by-step direction
* Read and write shell scripts regularly
* Can find Linux and CDH documentation on their own

---
<div style="page-break-after: always;"></div>

## <center> <a name="selfcheck"/> Self-check questions</p>

<strong> Can you answer the following questions in five minutes or less? </strong>

* Name three ways to retrieve the Hadoop version of a CDH cluster?
* Which terminal command lists only the JVM-based processes on a machine?
* What is the default port used by a Kerberos 5 KDC server? 
* What is the default port assigned to the NameNode's Web UI?
* Pick all that apply: HDFS block replication may be set by
    * a) a cluster receiving a file write request
    * b) a client sending a file write request
    * c) the job processing the file
    * d) all of the above
* Installing a CDH parcel requires root privilege (T/F)

---
<div style="page-break-after: always;"></div>

## <center> <a name="design_layout"/a>Course Overview

* <a href="#sections_timing">Sections & Timing</a>
* <a href="#discussion_format">Discussion Format</a>
* <a href="#scored_labs">Scored Labs</a>
* <a href="#scored_challenges">Scored Challenges</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="sections_timing"/> Sections & Timing

* Seven topics: one each morning and afternoon
    * <a href="#cm_cdh_installation_section">Cloudera Manager & CDH installation</a>
    * <a href="#hdfs_section">HDFS</a>
    * <a href="#yarn_rm_section">YARN & Resource Management</a>
    * <a href="#cm_monitor_customize_section">CM Monitoring & Customizing</a>
    * <a href="#cdh_security_section">CDH Security</a>
    * <a href="#hue_services_admin_section">HUE Services & Administration</a>
    * <a href="#troubleshooting_practices_section">Troubleshooting Practices</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="discussion_format"/> Discussion Format

* Morning: Two-hour discussion, up to two hours for lab work
    * Including the lunch hour, unattended
    * One hour should suffice
* Afternoon: Three-hour discussion, up to two hours for lab work
    * Including 5-6 pm, unattended
    * Occasional bonus labs for the super-motivated

---
<div style="page-break-after: always;"></div>

## <center> <a name="scored_labs"/> Scored Labs

* Lab work is required
    * How you do the work matters
    * It's a good idea to keep notes
* Core objectives for this training:
	* Prepare for Cloudera field work
	* Receive feedback on your readiness
	* Identify areas for further study and practice
<p/>

* We evaluate lab work with **competence** in mind, not speed or flair.

---
<div style="page-break-after: always;"></div>

## <center> <a name="scored_challenges"/> Scored Challenges

* Friday morning: six challenges, in stages
* Credit for completing each stage
* You may be asked to explain how you completed a stage by
    * Explaining the method you used
    * Identifying any pitfalls/bugs you encountered
    * Writing a test to prove your results

---
<div style="page-break-after: always;"></div>

## <center> Monday PM
## <center> <a name="cm_cdh_installation_section"/>Cloudera Manager & CDH Install

* <a href="#cm_cdh_key_points">CM and CDH Key Points</a>
* <a href="#parcels">Understanding Parcels</a>
* <a href="#install_methods">Installation Methods</a>
* <a href="#custom_installs">Customizing the Install</a>
* <a href="#cm_ui_overview">Cloudera Manager UI Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_cdh_key_points"/> High-level CM and CDH Points

* CM and CDH releases are not exclusive pairs
    * You can administer older CDH clusters with newer CM versions
* [CM agents](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ag_agent_config.html) are configured to report to one CM server
* We recommend deploying CDH with parcels 
    * We support package- and tarball-based installs
* CM supports a REST API for browser-based and script-driven tasks
    * Each successive API has a superset of available calls
    * <code>http://<i>your_cm_host</i>:7180/api/version</code> gives the latest version
    * Recent API calls may not apply to earlier CDH releases
        * The CM API [is here](http://cloudera.github.io/cm_api/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="parcels"/> What is a Parcel?

Parcels are [binarized CDH installation files](https://github.com/cloudera/cm_ext/wiki/Parcels:-What-and-Why%3F). We use them to

* Bundle all elements of a CDH release into one file
    * Version-matching is built in
    * Separate components (such as Accumulo) have their own parcel 
* Separate CDH from Linux platform install tools and requirements
    * Default install path: <code>/opt/cloudera/parcels</code>
    * Doesn't need superuser privileges
* Add a lifecycle scheme to CDH deployment
    * You can store multiple parcel versions without conflict 
* Support rolling upgrades and (less painful) downgrades
* Support easy access (HTTP-based repos)
    *  URL may be altered in CM's configuration

---
<div style="page-break-after: always;"></div>

## <center> The Parcels Vision

<center> <img src="http://blog.cloudera.com/wp-content/uploads/2013/05/parcels1.png"> </center> 

* Managing parcels via CM is [documented here](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Installation-Guide/cm5ig_parcels.html).

---
<div style="page-break-after: always;"></div>

## <center> Parcels Features

* Lifecycle actions
    * Download
    * Distribute
    * Activate/deactivate
    * Remove
    * Delete<p/>
* File naming convention: <code>*objectname*-*version*-*[distro suffix](https://github.com/cloudera/cm_ext/wiki/Parcel-distro-suffixes)*.parcel</code> 
* Tar format with [simple layout requirements](https://github.com/cloudera/cm_ext/wiki/Building-a-parcel)
    * List of contents is kept in <code>meta/parcel.json</code> 
    * Client download checks are available in a separate <code>manifest.json</code> file
* The directory <code>/opt/cloudera/parcels/CDH</code> links to the active bundle
    * Each bundle is identified by its <font color=magenta>parcel name</font> and <font color=orange>version</font>
    * For example, <code><font color=magenta>CDH</font>-<font color=orange>5.1.0-1.cdh5.1.0.p0.53</font></code> 

---
<div style="page-break-after: always;"></div>

## <center> [Custom Service Descriptors](https://github.com/cloudera/cm_ext/wiki/CSD-Overview)

* Parcels make it easier to distribute and install CDH software
    * They do ***not*** support process or service integration
* CM uses CSDs to tie cluster services into
    * Monitoring and charting
    * Resource management
    * Service lifecycle controls
    * Property configuration
    * Host/instance role assignments
* Customers may ask about using CSDs for in-house integration
    * Determine if the effort supports their use case
    * Do you need a single admin pane for a cluster app?
    * [One partner says](http://blog.cloudera.com/blog/2014/04/how-to-extend-cloudera-manager-with-custom-service-descriptors/) they're useful for supporting gateway/edge nodes

---
<div style="page-break-after: always;"></div>

## <center> <a name="install_methods"/> CM Installation Methods

* <a href="#cm_install_paths">Documented installation paths</a>
* <a href="#cm_install_milestones">Installation milestones</a>
* <a href="#cm_install_logging">Install logging</a>
* <a href="#word_on_cloudera_director">Cloudera Director</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_paths"/>Installation procedures

* Called A, B, and C "paths" in our documentation:
    * [Path A: CM install with parcels and wizards](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_a.html)
    * [Path B: Linux packages and install tools](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_b.html)
    * [Path C: tarballs for the hardcore DIYer](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_c.html)
    
---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_milestones"/> Installation milestones

1. Set up server for [CM databases](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html?scroll=cmig_topic_5_2_unique_1#cmig_topic_5_1_unique_1)
    * Embedded server is PostgreSQL -- not recommended for production
2. Install CM server software (on one node)
3. Install CM agent software (all specified nodes)
4. Install CDH software (all specified nodes)
5. Configure and enable desired services<p/>

**You can [customize a path](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/4.5.3/Cloudera-Manager-Enterprise-Edition-Installation-Guide/cmeeig_topic_21.html) to suit customer needs such as:</p>

    * Adding CM to an unmanaged CDH cluster
    * Integrating CM with existing tools, such as Puppet
    * Adjusting to network restrictions (no internet access)
    * Conforming to other site and security policies

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_logging"/>Installation logging and troubleshooting

* In a clean installation, CM creates six log files in <code>/var/opt/cloudera-scm-server</code> as it works: 
    * <code>0.check-selinux.log</code>
    * <code>1.install-repo-pkg.log</code>
    * <code>2.install-jdk.x86_64.log</code>
    * <code>3.install-cloudera-manager-server.log</code>
    * <code>4.install-cloudera-manager-server-db.log</code>
    * <code>5.init-embedded-db.log</code>
    * <code>6.start-embedded-db.log</code>
    * <code>7.start-scm-server.log</code>
* Additional log files are created if components are removed, such as:
    * <code>8.remove-cloudera-manager-daemons.log</code>
    * <code>9.remove-cloudera-manager-repository.log</code> 
* Use the presence of these files to isolate failure or review the process to date.
* Well-known install problems are [documented here](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_troubleshooting.html).
* Review [known issues and workarounds](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_rn_known_issues.html) of a release before installing it.
* Review [fixed issues too](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_rn_fixed_issues.html).

---
<div style="page-break-after: always;"></div>

## <center> <a name="word_on_cloudera_director"/>[Cloudera Director](http://www.cloudera.com/content/cloudera/en/products-and-services/director.html)

* Automate/expedite cloud-based deployments
    * Supports [Amazon VPC](http://aws.amazon.com/vpc/)
    * Uses [Cloudera's AWS Reference Architecture](http://www.cloudera.com/content/cloudera/en/resources/library/whitepaper/cloudera-enterprise-reference-architecture-for-aws-deployments.html)
* Internal project name: Launchpad
* See the [User Guide](http://www.cloudera.com/content/cloudera/en/documentation/cloudera-director/latest/PDF/cloudera-director.pdf) for v1.0.0

---
<div style="page-break-after: always;"></div>

## <center> <a name="custom_installs"/>Custom Install Topics

* <a href="#cm_service_dbs">CM Service Databases</a>
* <a href="#cm_replace_default_db">Replacing the embedded database server</a>
* <a href="#cm_replicate_db">CM database replication for HA</a>
* <a href="#other_install_methods">Other Installation Methods</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_service_dbs"/>[CM Service Databases](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html) 

The following services use databases that CM's server controls:

* Activity Monitor 
* Reports Manager
* Sentry Server (new with C5.1)
* Cloudera Navigator Audit Server
* Cloudera Navigator Metadata Server
* Hive Metastore

*CM's Host Monitor and Service Monitor use [LevelDB](https://github.com/google/leveldb) for their storage layer.

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_replace_default_db"/> Replacing CM's Embedded Database</a> 

In practice, the server that ships with CM (PostgreSQL) doesn't scale well. We recommend using MySQL. Some customers prefer Oracle, which is also supported.

* Most of the field recommends installing MySQL before installing CM
    * Some prefer replacing PostgreSQL after the install -- take your pick
* You can migrate a standing CM instance's database server
    * It may be tedious and require service outages    
* The same server will support [Oozie](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_oozie_service.html#cmig_topic_14_unique_1) and [HUE](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_hue_service.html#cmig_topic_15_unique_1). Customers who delegate db administration to another group will require this.

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_replicate_db"/> MySQL Replication for HA </a></p>

* Many customers want an HA solution for CM. 
    * MySQL [replication](http://dev.mysql.com/doc/refman/5.0/en/replication-howto.html) is a common approach. 
    * It's easiest to do this before you install CM. 

---
<div style="page-break-after: always;"></div>

## <center> <a name="other_install_methods"/>Other Install Methods

* <a href="http://whirr.apache.org/">Apache Whirr</a>: interest seems to be be dwindling
* Headless installs come up now and then
* Puppet Labs <a href="https://forge.puppetlabs.com/tags/cdh">has a Cloudera-certified CDH install helper</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_ui_overview"/>Cloudera Manager UI Overview

* Clusters menu for managing 
* Role assignments page
* Options shown in <code>Administration -> Settings</code>
* Wizards include
    * Express Install
    * Add Service/Role
    * Upgrade CM and CDH 
    * Enable HA (NameNode, JobTracker, Oozie, YARN RM)
* Some useful ones are buried here and there
    * <code><i>Service</i>->Instances->Add Role Instances->View By Host</code> (button)

---
<div style="page-break-after: always;"></div>

## <center> CM Install Labs

* Prepare Four EC2 nodes
* <a href="#linux_config_lab">Linux Configuration Check</a>
* <a href="#mysql_replication_lab">Deploy MySQL with replication</a>
* <a href="#parcels_repo_lab">Create a Parcels repository</a>
* <a href="#scripted_install_lab">Further study: Scripting an Install</a>

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="linux_config_lab"/>[Linux Configuration Check](http://tiny.cloudera.com/7steps)

1. Check swappiness on all your nodes 
    * <code># cat /proc/sys/vm/swappiness </code> <p>
2. Set <code>noatime</code> on node-specific volumes
    * ex. <code>/dev/sdc /data01 ext3 defaults,noatime 0; mount -o remount /data02 </code><p>
3. Reserve zero disk space for root on DN disks
    * <code> mkfs.ext3 -m 0 /dev/sdc; tune2fs -m 0 /dev/sdc </code> <p>
4. Maximize open file descriptors and concurrent processes
    * <code> echo {hdfs|mapred|hbase} - {nofile 32768|nproc 32768} >> /etc/security/limits.conf </code> <p>
5. Dedicate a disk to the OS and log files.<p>
6. Test name resolution in both directions
    a. <code>/etc/hosts</code>: List the FQDN first, aliases second  
    b. <code>127.0.0.1</code> **must** resolve to <code>localhost</code>
    c. DNS: ensure the hostname matches the FQDN <p>
7. Do not enable nscd until you've tested your name resolver service!
    a. Enabling without System Security Services Daemon (SSSD)
        * <code># chkconfig --level 345 nscd on; service nscd start; nscd -g </code>
    b. [Enabling with SSSD](http://goo.gl/68HTMQ)

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="mysql_replication_lab"/>Deploy MySQL with Replication

<!-- Need an appearance fix for steps 7 and 8 -->

1. Install the following MySQL packages on your CM and replica nodes
    a. <code>mysql</code>
    b. <code>mysql-server</code>
    c. <code>mysql-connector-java</code> <p>
2. Configure <code>/etc/my.cnf</code> **before** starting your MySQL processes. A starter file is available in the course repository. Put the file on both master and slave nodes, and watch for values that must differ between master and slave. <p>
3. Run <code>mysql_install_db</code> and start the <code>mysqld</code> service on both nodes<p>
4. Run <code>/usr/bin/mysql_secure_installation</code> on both nodes. Answer the questions according to these instructions: 
    a. Do set (and record!) the root password
    b. Remove the permission for anonymous users
    c. Allow for remote login
    d. Remove the test database
    e. Reload the privilege table<p>
5. Grant replication privileges on all databases to the MySQL user of your choice.
    a. Log in to the MySQL master node with <code>mysql -p</code> 
    b. To authorize replication, you'll need the MySQL user/password and the FQDN of the replication node. *Note: This command will not validate your input. Do not use an IP address lieu of a FQDN.*
    c. <code>mysql> **GRANT REPLICATION SLAVE ON \*.\* TO '*user*'@'*FQDN*' IDENTIFIED BY '*password*';**</code>
    d. <code>mysql> **SET GLOBAL binlog_format = 'ROW';** </code>
    e. <code>mysql> **FLUSH TABLES WITH READ LOCK;</code>**<p>
6. For the next step, you can suspend the current MySQL session (^Z) and use the same terminal window or open another one and log in again to the server.<p>
7. In this new session, report the server's status to get the current replication offset
    a. <code>mysql> **SHOW MASTER STATUS;**</code>
    b. Note the file and position from the output of the last command. The slave instance uses this data to sync to the master.
    c. Close the second session. Remove the lock on the first session. Close the first session if you like.
    d. <code>mysql> **UNLOCK TABLES;**</code><p>
8. Log in to the replica instance and set the environment to locate the master:</p>
    <code>mysql> **CHANGE MASTER TO**<br> **MASTER_HOST='*master host*',**<br> **MASTER_USER='*replica user*',**<br> **MASTER_PASSWORD='*replica password*',**<br> **MASTER_LOG_FILE='*master file*',**<br> **MASTER_LOG_POS=*master file position*;**</code><p>
9. Initiate slave operation and determine its status. 
    a. <code>mysql> **START SLAVE;**</code>
    b. <code>mysql> **SHOW SLAVE STATUS \G**</code>
    c. If successful, the <code>Slave_IO_State</code> field in the output will report <code>Waiting for master to send event</code>
    d. Otherwise, check the log file for errors.<p>

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="parcels_repo_lab"/>Create a local parcels repo (manual)

* Click the parcel indicator in CM's navigation bar
    * Under Settings, note the Remote Parcel Repository URLs value
* Default parcels links include:
    * [Latest CDH5 release](http://archive.cloudera.com/cdh5/parcels/latest)
    * [Latest CDH4 release](http://archive.cloudera.com/cdh4/parcels/latest)
    * Components not yet integrated into a parcels bundle (Impala, Search)
* Follow these [steps in the documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Installation-Guide/cm5ig_create_local_parcel_repo.html).
* Set CM to use the new repository
    * Administration -> Settings -> Parcels

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab (Optional)
## <center> <a name="scripted_install_lab"/>Auto-deploy CM

* Fork/clone [Justin Hayes' auto-deployment work](https://github.com/justinhayes/cm_api/tree/master/python/examples/auto-deploy)
* Follow instructions, including validation test of the install

---
<div style="page-break-after: always;"></div>

# <center> Tuesday AM
# <center> <a name="hdfs_section"/>HDFS<p>

* Review and reinforcement
    * <a href="#hdfs_namenode_ha">NameNode HA</a>
    * <a href="#hdfs_benchmarking">Benchmarking</a>
    * <a href="#namenode_web_ui">NameNode Web UI</a>
    * <a href="#using_safemode">What safemode does</a>
* <a href="#hdfs_c5">HDFS for C5</a>    

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_namenode_ha"/>NameNode HA

* CM 5 provides a wizard for [HDFS HA](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_hdfs_hi_avail.html)
    * {HDFS service} -> Actions -> Enable High Availability
* [Locating Quorum-based Storage](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_hdfs_hi_avail.html?scroll=cmug_topic_5_12_1_unique_1)
- [Understanding Zookeeper's Role](http://hadoop.apache.org/docs/r2.3.0/hadoop-yarn/hadoop-yarn-site/HDFSHighAvailabilityWithQJM.html#Deploying_ZooKeeper)
- Relocating services in an expanding cluster

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_benchmarking"/>Benchmarking

* First things first: what's the difference between benchmarking and performance?
    * And what's the difference between baseline and workload measurement? 
* What tools do we use in the field?
    * [TeraSort Suite: teragen, terasort, teravalidate](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#terasort-benchmark-suite)
    * [TestDFSIO](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#testdfsio)
    * [<strong>S</strong>tatistical <strong>W</strong>orkload <strong>I</strong>njector for <strong>M</strong>apReduce](https://github.com/SWIMProjectUCB/SWIM/wiki)
        * Used by Cloudera Partner Engineering
        * Not an OOB tool
* My advice: always start with NameNode testing: [nnbench](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#namenode-benchmark-nnbench)

[Michael G. Noll's blog post](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/) provides a thorough review of these tools (not including SWIM).

---
<div style="page-break-after: always;"></div>

## <center> <a name="namenode_web_ui"/> NameNode Web UI

* [Vijay Thakorlal's breakdown/annotation article](http://vijayjt.blogspot.com/2013/02/hadoop-namenode-web-interface.html) is a useful review/refresh
* It's received a significant facelift in recent Hadoop releases
    * Browse and navigate it if you haven't!
* SNN's web UI port: 50090
    * One place to find the Hadoop version in use
    * (I use this interface when the NameNode is in any kind of trouble)

---
<div style="page-break-after: always;"></div>

## <center> <a name="using_safemode"/>Using safemode

* Engaged while fsimage is reloaded 
    * Writes are delayed or refused
    * Read requests are still acceptable
* The NN can wait 30 seconds or more before leaving safemode
    * Assuming at least one cycle of replays takes place
* Safemode be used to suspend writes during maintenance
    * <code>hadoop dfsadmin -safemode</code>

---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_c5"/> C5 Goals for HDFS

* Exploit larger memory complements
* Faster backups
* Data recovery options
* More client access options

---
<div style="page-break-after: always;"></div>

## <center> Key Features in C5

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

* The NameNode knows which DataNodes stores blocks for a given request
    * It doesn't know [which nodes may have cached them](https://issues.apache.org/jira/browse/HDFS-4949)
    * Any repeated job that uses a different replica pays disk-transfer cost twice
    * Probably washes out with the overhead of a Hive job
    * With [Impala queries](http://impala.io/), though, it could lead to inefficient (redundant) caching
    
---
<div style="page-break-after: always;"></div>

## <center> Solution: Directory caching
    
* Adds a degree of locality for cached blocks
    1. NN directory data used to specify cacheable HDFS blocks
    2. The DN reads a block into page cache associated with a specific directory, notifies the NN
    3. The NN prefers any DN with a cached copy of a requested block
    3. Clients can be made cache-aware <a href="#scr_and_zcr">one of two ways</a>
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
    1. Creates a cache pool
    2. Assigns directive(s)
    3. CLI: <code># sudo -u hdfs hdfs cacheadmin </code>
    4. May add/modify/remove cache pools & their directives
* DataNodes
    1. Map file blocks to memory
    2. Report cached blocks to NameNode
* Job client
    1. Queries NN for DNs with cached blocks
    2. Can apply Zero Copy Read (ZCR) or Short Circuit Read (SCR) API 

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
    * [HDFS-2246](https://issues.apache.org/jira/browse/HDFS-2246): Let a local client read a datanode's process map
    * Uses [file descriptor passing](http://infohost.nmt.edu/~eweiss/222_book/222_book/0201433079/ch17lev1sec4.html) capability
    * [Configurable via CM or hdfs-site.xml file](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/admin_hdfs_short_circuit_reads.html) 
* Zero-copy Read
    * [Forget the DN: just use mmap() to read page$](https://issues.apache.org/jira/browse/HDFS-4953)
    * Client implements [ZCR API](https://issues.apache.org/jira/browse/HDFS-5191) 
    * The dream: can we bypass page cache completely?
* On the roadmap
    * Mark directories for caching based on workload
    * Automatically cache job results (for workflow/pipeline jobs)
    
---    
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_dir_snapshots"/> Directory snapshots

* Capabilities
    * Let users (who had write permissions) retrieve a deleted file
    * Based on [copy-on-write](http://en.wikipedia.org/wiki/Copy-on-write) technique to associate HDFS directories with DN block locations
    * Files may be retrieved through a versioned folder
    * Similar to .Trash/ but without an expiry setting

* CLI Usage
    * <code>hdfs dfsadmin [dis]allowSnapshot <i>path</i> </code>
    * <code>hdfs dfs {create|delete|rename}Snapshot <i>opts</i> </code>
    * <code>hdfs isSnapshottableDir</code>
    * <code>hdfs snapshotDiff <i>path snap1 snap2</i></code> to compare a snapshot to the present 
    * Also manageable via CM

<i>Can you delete a snapshotted file, create a new one using the same name, and recover the old?</i>

* Side effects, limitations
    * Monitoring HDFS quotas could be confusing 
    * No support for nested snapshots

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
    * For legacy clients or NFS-oriented shops
* Daemons
    * <code>rpcbind</code> or <code>portmap</code> (platform specific)
    * <code>mountd</code> & <code>nfsd</code> (needed by Gateway) 
* Useful for file browsing and {up|down}loads
* Any NFS-enabled HDFS client machine can be a gateway
* Properties stored in <code>hdfs-site.xml</code>
* <code>dfs.namenode.accesstime.precision</code> (in ms)
    * Honor client atime updates. Set to 0 if clients don't use it.
    * Requires service restart if changed
* <code>dfs.nfs3.dump.dir</code>
    * Provides room for worst-case reordering of writes
* <code>dfs.nfs.exports.allowed.hosts</code>
    * Semicolon-delimited list, {rw|ro*} permissions
    * Restart gateway service to accept changes
* Logging
    * <code>log4j.logger.org.apache.hadoop.hdfs.nfs=DEBUG</code>
    * <code>log4j.logger.org.apache.hadoop.hdfs.oncrpc=DEBUG</code>
* Service depends on OS's rpcbind/portmapper services ([HDFS-4763](https://issues.apache.org/jira/browse/HDFS-4763))

---
<div style="page-break-after: always;"></div>

## <center> HDFS Problems/Diagnoses/Solutions

### <center>Expected lab outcomes

* Before resuming class, will the instructors be able to:
    * Access your HDFS via NFS Gateway?
    * Kill your active NameNode without losing HDFS access?
    * Create a snapshot of a file in the directory you specify?

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Replicate to another cluster

* Choose a replication partner in class
* Name a directory for your partner to use
* Teragen a small file and back it up to your partner's cluster

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Test HDFS performance

* Follow the steps outlined in [Michael Noll's blog article](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/).
    * Consult the instructors if you are not sure what to do.

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Enable HDFS HA

* Completing this lab will depend on the resources available in your AWS cluster.
* Find and use the CM Wizard for enabling HA.
* Find the log that records this change
    * Prepare to show this to your instructors as evidence of completion

---
<div style="page-break-after: always;"></div>

# <center> Tuesday PM
# <center> <a name="yarn_rm_section"/>YARN & RM

* <a href="#mrv1_review">MRv1 Design and Configuration</a>
* <a href="#mrv2_review">MRv2 Design and Configuration</a>
* <a href="#YARN_overview">What YARN is for</a>
* <a href="#migrating_mrv1_mrv2">Migrating from MRv1 to MRv2</a>
* <a href="#RM_overview">Resource Management Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="mrv1_review"/> MRv1: Design and Configuration

### <center> Graphic overview

<center><img src="http://www.ibm.com/developerworks/library/bd-yarn-intro/fig01.png"/></center>

---
<div style="page-break-after:always;"></div>

## <center> MRv1: Roles & Pain Points

* Job Tracker manages
    * Scheduling
    * Cluster resources
    * Job configuration, status, recent history
    * TaskTracker status
* Cluster resources divided into <i>slots</i> that accept either a map or reduce task
    * Configuring slots to avoid under-utilization or saturation is as much art as science    
* JobTracker hits a wall: ~4k TaskTracker nodes
    * JT HA: More often discussed than deemed necessary

---
<div style="page-break-after: always;"></div>

## <center> <a name="mrv2_review"/> MRv2: Design & Configuration

### <center> Graphic overview

<center><img src="http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/yarn_architecture.gif"></center>

---
<div style="page-break-after: always;"></div>

## <center> MRv2: Roles

* Resource Manager (RM)
    * Supervises NodeManagers, schedules jobs
    * Default port 8088
* NodeManager
    * Launches/manages containers
    * Updates the Resource Manager 
* Container
    * Provides a resource base for an AM or task 
* Application Master (AM)
    * Container-based job manager
    * Specific to application type (e.g., MRAppMaster)
* JobHistory Server
    * Logs job status feedback from NodeManagers
    * Deafult port: 19888

[Operator overview of MR migration](http://blog.cloudera.com/blog/2013/11/migrating-to-mapreduce-2-on-yarn-for-operators/)</br>
[MRv1->MRv2 Migration Guide](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_mapreduce_to_yarn_migrate.html)

---
<div style="page-break-after: always;"></div>

## <center> YARN Job Control (MR)

1. Client submits a job to a YARN-powered cluster
2. RM provides an AM based on the job type
3. AM gets data block locations from the NN
4. AM requests (localized) containers from the RM
5. RM maps AM requests to available containers, returns a list
6. AM invokes container starts via Node Managers -- mappers run
7. RM invokes an auxiliary shuffle service 
8. AM requests containers for reducing
9. As tasks complete, the AM releases containers and updates RM
10. RM provides info to the Job History server

---
<div style="page-break-after: always;"></div>

## <center> <a name="YARN_overview"/>What YARN Changes

* MRv2 rewrites MRv1
    * Removes the JobTracker
    * Uses an Application Master (AM) to schedule, execute, supervise, and request resource for MR jobs
* YARN = <strong>Y</strong>et <strong>A</strong>nother <strong>R</strong>esource <strong>N</strong>egotiator
    * A framework for [applications](http://wiki.apache.org/hadoop/PoweredByYarn), including MRv2, to get resources in a Hadoop cluster
        * See the term [NextGenMapReduce](http://wiki.apache.org/hadoop/NextGenMapReduce) for more on the motivations behind YARN
        * Most important: better scaling @ 4k nodes and up
* Adds an explicit layer of resource management for better control

---
<div style="page-break-after: always;"></div>

## <center> Benefits of YARN: Perceived and Intended</center>

* Better cluster utilization
    * More apparent than real -- demonstrated for specific workloads so far
* Better RM scalability
    * If you've hit the 4000-node wall
* Performance
    * Significant boost for large clusters running many small jobs
    * Significant improvements in balancing MapReduce and Impala
        * [Performance under multi-tenancy](http://blog.cloudera.com/blog/2013/06/configuring-impala-and-mapreduce-for-multi-tenant-performance/) is a key selling point
    * [Documented steps for a multi-tenant CDH 4.8 cluster](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/latest/Cloudera-Manager-Installation-Guide/cmig_impala_res_mgmt.html)
* The intention: one service-based RM for a (very large) cluster
    * Also support for user/group and tag-based classifiers
    * Custom, pluggable classifiers is on the roadmap 
    * In practice, RM HA is not a big talking point

---
<div style="page-break-after: always;"></div>

## <center> <a name="migrating_mrv1_mrv2"/> Migrating from MRv1 to MRv2

* See <a href="http://blog.cloudera.com/blog/2014/04/apache-hadoop-yarn-avoiding-6-time-consuming-gotchas/">the documentation</a> for a walk-through
* Read <a href="http://blog.cloudera.com/blog/2014/04/apache-hadoop-yarn-avoiding-6-time-consuming-gotchas/">Jeff Bean's blog post on common gotchas</a>, including:
    * Account for the change from MRv1 slot allocation to YARN resource allocation.
    * Ensure an apples-to-apples performance comparison
    * Note that accounting for JVM heap requirements is different
    * Remember that YARN logs messages for all frameworks, not just MRv2
        * Messages may seem more generic; changes in naming conventions
    * Bug: too many Application Masters can starve task resources (<a href="https://issues.apache.org/jira/browse/YARN-1913">YARN-1913</a>)
* Ensure [apples-to-apples performance](http://blog.cloudera.com/blog/2014/02/getting-mapreduce-2-up-to-speed/) comparisons!

---
<div style="page-break-after: always;"></div>


## <center> <a name="RM_overview"/>Resource Management

<p><i>Resource Management strategy is divided into three layers of focus</i></p>

1. <a href="rm_service_isolation">Service-level isolation</a>
    * Allotting resources by app framework
2. <a href="#admission_control">Admission Control</a>
    * Scheduling based on request and/or service type
3. <a href="#dynamic_prioritization">Dynamic prioritization</a>
    * Allotting resources by user/group on demand

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_service_isolation"/>Service-level Isolation (cgroups)

* Intended for non-YARN services running in the cluster
    * HBase, Search, SAS, MRv1 jobs
* CM implements/exposes [Linux Control Groups](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_cgroups.html)
    * Supports CPU, memory, disk I/O, network controls (subject to OS support)
    * *Cluster > ClusterName > Static Service Pools*
    * New to cgroups? [A useful, hands-on intro](http://riccomini.name/posts/hadoop/2013-06-14-yarn-with-cgroups/)
* Good for coarse-grained, policy-driven resource management

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_admission_control"/> Admission Control

* [Throttle and queue control for Impala queries only](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/Impala/Installing-and-Using-Impala/ciiu_admission.html)
* Supported in CDH4 only for Impala
* Enabled by default in CDH5 if Impala 1.3 or later is present 
* Supported arrangements in CDH5:
    1. YARN manages all RM
    2. YARN sets Impala memory limit; Impala uses AC
    3. YARN manages pools; Impala operates on pools with queries
* See [Dynamic Resource Pools](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_resource_pools.html) in CM
    * <i>Configuration sets</i> define groups (e.g., prod, mktg)
    * <i>Scheduling rules</i> use configuration sets
    * Pools may be defined by authorization, query count, queue size, memory demand
* CM UI, Cluster > ClusterName > Dynamic Resource Pools

---
<div style="page-break-after: always;"></div>

## <center> AC Decision-making </center>

* Uses the same pool/user definitions as YARN
* Three actions: execute, queue, or reject a submitted query
* Decision based on:
    * Currently running queries
    * Resources available (only memory supported at present)
    * Pending (queued) queries
* Decided by local impalad using cached global data
    * Caching latency can result in over-admission
    * In that sense, the configured limits are "soft"  
* Impalad's decisions prefer keeping tasks alive over improving utilization
    * Work to improve this area is ongoing

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_dynamic_prioritization"/> Dynamic Prioritization

* The ideal: ongoing, mediated balance of resources to workload
    * Multiple scheduler queues
    * Opportunistic processing to raise utilization
    * In particular: integrating low-latency and batch processing tasks
* Ongoing effort to improve resource estimates and allocation
* One proposal: a <strong>Low</strong>-<strong>L</strong>atency <strong>A</strong>pplication <strong>MA</strong>ster ([LLAMA](http://cloudera.github.io/llama/)) for Impala
    * Available for CDH5 only as beta software
    * Goal: manage all Impala queries with one AM instance
    * Cache resources, minimize interaction with RM

---
<div style="page-break-after: always;"></div>

## <center> Current Practices for RM

* Given a choice, prefer Admission Control over RM
* Impala/LLAMA is an evolving relationship
    * Difficult to isolate certain configuration choices to runtime behavior
    * Distributed systems + dynamic allocation = "should work" 
    * Performance here is always measured over time by the m 
* Best practice for now:
    * Static Resource Pools (cgroups) for service isolation
    * Impala and AC to set resource demands per-user/group
    * Watch developments on [LLAMA](http://cloudera.github.io/llama/) -- that's where we're headed

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Setting up an MRv2 Cluster

* Read the section [For Administrators: Configuring and Running MRv2](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_mapreduce_to_yarn_migrate.html)
* Answer the questions given to you by the instructor

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Installing LLAMA

* Follow the steps [documented here](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_llama_installation.html)

---
<div style="page-break-after: always;"></div>

# <center> Wednesday AM
# <center> <a name="cm_monitor_customize_section"/>CM Monitoring & Customizing

* <a href="#cm_overview">CM's vocabulary</a>
* <a href="#cm_search_bar">CM search bar features</a>
* <a href="#cm_users_roles">CM users and roles</a>
* <a href="#cm_commands_history">Recent commands and history</a>
* <a href="#cm_monitors">Monitoring services and resources</a>
* <a href="#cm_alerts">Adding Alerts</a>
* <a href="#cm_health_checks">Health checks</a>
* <a href="#cm_charting_time_series">Charting time-series data</a>
* <a href="#cm_property_settings">Managing property settings</a>
* <a href="#cm_api_sampler">Sample CM API calls</a> 

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_overview"/>CM Overview

<center> <img src="http://blog.cloudera.com/wp-content/uploads/2013/07/ClouderaManagerVocabulary.png" height="390" width="600"> </center>

---
<div style="page-break-after: always;"></div>

## <center> Notes on Cloudera Manager vocabulary<p>

<i>"Boy those French! They have a different word for everything!"</i> --Steve Martin

* [Philip Zeyliger's blog article on CM's design and operation](http://blog.cloudera.com/blog/2013/07/how-does-cloudera-manager-work/)  
* CM has a [full lexicon of descriptors](http://cloudera.github.io/cm_api/docs/cm-concepts/) that evolves as new features emerge 
    * [Primer for CM 4](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/latest/Cloudera-Manager-Introduction/cmi_primer.html) 
    * [Primer for CM 5](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Introduction/cm5i_primer.html)
* For deep-divers: compare the CM API [4.7](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/latest/Cloudera-Manager-Introduction/cmi_api.html) (v5), with [5.x](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Introduction/cm5i_api.html), (v6, v7)
* Colloquial terms
    * Canary: a test to determine a running service is functional
    * Safety valve: configuration change intended to correct  

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_search_bar"/> CM Search Bar Features

* Search bar in the upper right expands when selected
* The "/" hotkey lists searches by rank (Google Analytics)
* Type-ahead feature: try "spa"
* Entering a property name returns a config link
    * Try "dfs.datanode.max.xciever"
    * Try "Transceiver"
* The Configuration tab for each service hosts a context-limited search bar
    * Go to the Flume service's Configuration tab and type "Solr"
* Notice the search results are <i>typed</i>
<!-- * Adding FAQs and KB articles to search is on the roadmap -->

---
<div style="page-break-after: always;"></div>

## <center> Search listing types

* Also searchable (except those that are starred)
    * chart
    * command*
    * config
    * global
    * host*
    * link
    * role*
    * service

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_users_roles"/>Users and roles

* Administration -> Users
    * Adding users recommended to differentiate admins
    * Supports role-based access limits
* CM 5.0x supports five roles
    * Administrator
    * Configurator
    * Operator
    * Limited Operator
    * Read-Only
* CM: Administration -> Users -> Add Users button
    * Select a role to see a description of its privileges

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_commands_history"/> Recent commands and history

* Home -> All Recent Commands
    * Up to 250 current/finished commands per display
    * Reports context (service), command status, start and finish times. 
* Use the Audits tab to find past events
    * Available in home, service, role, and host instance pages 
    * Time range filter from last 30m to last 30d (as of CM 5.1)
    * [Several other filters available](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Diagnostics-Guide/cm5dg_audits.html)
* Logs can also be downloaded

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_monitors"/>Monitoring services and resources</a>

* Type "monitor" in any Configuration tab search bar
* [Eight general types ](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Diagnostics-Guide/cm5dg_monitoring_settings.html)
    * [Health for services, roles](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Diagnostics-Guide/cm5dg_service_monitoring.html)
    * [Resource management](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Diagnostics-Guide/cm5dg_resource_management_monitoring.html)
    * Directory free space
    * (MRv1) Activity
        * Includes job duration thresholds
    * YARN Applications
        * Visibility settings
    * Impala Queries
        * Memory cache thresholds
    * Alerts
    * Log Events 

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_alerts">[Adding Alerts](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Diagnostics-Guide/cm5dg_monitoring_settings.html#concept_lmd_tss_1l_unique_1)</a>

* Administration -> Alerts
* Delivers to email or as SNMP traps
* May be associated with
    * Activity Monitor
    * Configuration changes (enable/disable only)
    * HBase (errors, poor region health)
    * Health metric thresholds (<font color="red">Bad</font> or <font color="orange">Concerning</font> result)
    * Log messages (regex matching)

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_health_checks"> [Health checks](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Diagnostics-Guide/cm5dg_health.html)</a>

* Cover services, roles, and hosts
* Two types
    * Pass-fail
    * ["Metric"](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/4.7.1/Cloudera-Manager-Metrics/Cloudera-Manager-Metrics.html) - set to some numeric threshold
    * [Complete health tests list for CM5](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Health-Tests/Cloudera-Manager-Health-Tests.html#xd_583c10bfdbd326ba--43d5fd93-1410993f8c2--7ed7)
* Condition may be <font color="green">Good</font>, <font color="orange">Concerning</font>, or <font color="red">Bad</font>
    * Service results may be "rolled up" from subordinate tests (roles, instances)
        * A single Bad or Concerning result affects the whole
    * Some metric tests can also be <a href="#cm_charting_time_series">charted</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_charting_time_series"> Charting metrics (time-series data) </a>

* CM 5's charts include a drop-down menu
* Charts are searchable by type or name
    * Try "canary duration"
* Chart builder and dashboard editor: CM -> Charts
    * [Documentation, CDH 5.1.1](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Diagnostics-Guide/cm5dg_chart_time_series_data.html)
    * A set of charts is called a [view](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/4.7.1/Cloudera-Manager-Diagnostics-Guide/cmdg_views.html) in 4.x, a [dashboard](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Diagnostics-Guide/cm5dg_dashboards.html) in 5.x
* [Metric aggregations](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Diagnostics-Guide/cm5dg_metric_aggregation.html) 
    * metric + timestamp pair + aggregating functions (min, max, avg, and stddev)
    * Sampling interval is determined by the monitor (Service or Host)
* Some 'cross-entity' aggregations provided
    * Cross-entity examples: all datanodes in the cluster, all datanodes in one rack
    * Aggregate examples: <code>fd_open_across_datanodes, total_fd_open_across_datanodes</code>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_property_settings"> Managing property settings</a>

* [CDH properties by version](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Configuration-Properties/Cloudera-Manager-Configuration-Properties.html)
    * Organized by service
* [Host configuration properties](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Configuration-Properties/cm5config_host.html)
    * System services, directory free space, etc.
* [CM Server properties](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Configuration-Properties/cm5config_cmserver.html)
    * [Cloudera Management Service Properties](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Configuration-Properties/cm5config_mgmtservice.html)

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_api_sampler">Sample CM API calls</a>

* Version-based tours: cloudera.github.io/cm_api/apidocs/v[4567]/tutorial.html
    * Not a lot of variation from one to the next -- a good thing.
* [Examples using curl](http://cloudera.github.io/cm_api/docs/quick-start/)
* [Examples using Python](http://cloudera.github.io/cm_api/docs/python-client/)
* [Example using Java](http://cloudera.github.io/cm_api/docs/java-client/)
* Mark Brooks's script for [listing cluster service ports](https://github.com/onefoursix/cm-get-ports)
* Some often talked-about goals with the API
    * Fully automated, client-driven CM/CDH install
    * Dynamic multi-tenancy monitoring, utilization and tuning
    * The holy grail: [chargebacks](http://en.wikipedia.org/wiki/IT_chargeback_and_showback)

---
<div style="page-break-after: always;"></div>

## <center> CM Monitoring Lab

<strong> Use the search feature to answer these questions </strong>

* What is ubertask optimization?
* What is the default port for a Parcels proxy server?
* Where in CM is the Kerberos Security Realm value maintained? Which service hosts the enabling property for Kerberos authentication?
* Where in CM's UI is the Enable Kerberos wizard located? 
* What is the property query for charting CPU utilization by Hue?
* List the three roles that comprise the Hive service
* T/F: The Enable Kerberos Wizard can install an MIT KDC for you, but not an Active Directory instance.

---
<div style="page-break-after: always;"></div>

## <center> CM Lab
## <center> (Optional) Add CM to a CDH Cluster<p>

Follow the [instructions here](https://wiki.cloudera.com/display/FieldTechServices/Deploying+Cloudera+Manager+on+un-managed+CDH+clusters).

---
<div style="page-break-after: always;"></div>

## <center> CM Lab
## <center> Create a Custom Dashboard

* Create a new CM user 'dash' in your cluster
* Assign this user the Configurator role
* 

---
<div style="page-break-after: always;"></div>

# <center> Wednesday PM
# <center> <a name="cdh_security_section"/>CDH Security

* <a href="#security_review">Quick basics overview</a>
* <a href="#security_authentication">Strong Authentication</a> 
* <a href="#security_authorization">Better Authorization</a>
* <a href="#security_encryption">Encryption</a>
* <a href="#security_cm_configuration">CM-based Configuration</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_review">Quick basics overview</a>

* Enterprise functional requirements
    * Perimeter access
        * Physical network, firewall, IP filtering
        * Strong authentication
    * Restricted visibility to data
        * Proxy services (for client transparency), data encryption
    * Controlled access
        * File permissions and ACLs
        * Object-level (database) permissions
    * Restricted metadata visibility
        * Auditing logs
        * Lineage data

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_authentication"/>Strong Authentication/Kerberos</a>

* ["Hadoop in Secure Mode"](http://hadoop.apache.org/docs/r2.3.0/hadoop-project-dist/hadoop-common/SecureMode.html) lists four areas of authentication concern. All of them depend on Kerberos, directly or indirectly
    * Users
    * Hadoop services
    * Web consoles
    * Data confidentiality

* Linux supports [MIT Kerberos](http://web.mit.edu/kerberos/)
    * See your [Hadoop for Administrators](http://university.cloudera.com/course/administrator) notes for an overview
* ["Hadoop in Secure Mode"](http://hadoop.apache.org/docs/r2.3.0/hadoop-project-dist/hadoop-common/SecureMode.html) relies on Kerberos
    * Data encryption services available out of the box
    * Browser authentication supported by [HTTP SPNEGO](http://en.wikipedia.org/wiki/SPNEGO)
* LDAP/Active Directory integration
    * Applying existing user databases to Hadoop cluster is a common ask       

---
<div style="page-break-after: always;"></div>

## <center> Active Directory Integration </center>

* Cloudera recommends a [one-way cross-realm trust to customer's AD](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_hadoop_security_active_directory_integrate.html)
    * Requires MIT Kerberos realm in Hadoop cluster
    * Avoids adding principals to AD 
* Common sticking points
    * Misremembered details
    * Undocumented changes/updates
    * Other settings that "shouldn't be a problem"

---
<div style="page-break-after: always;"></div>

## <center> Common Direct-to-AD Issues </center>

* <code>/etc/krb5.conf</code> doesn't authenticate to KDC
    * Test with <code>kinit *AD_user*</code>
* Required encryption type isn't supported by JDK
* Suported encryption types are disjoint

* To trace Kerberos & Hadoop
    * <code>export KRB5_TRACE=/dev/stderr</code> 
    * Include <code>-Dsun.security.krb5.debug=true</code> in <code>HADOOP_OPTS</code> (& export it )
    * <code>export HADOOP_ROOT_LOGGER="DEBUG,console"</code>

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_authorization">Fine-grained Authorization</a>

* <a href="#hdfs_perms_acls">HDFS permissions & ACLs</a>
    * Need principal definitions beyond user-group-world
    * Relief from edge cases and implications of hierarchical data
    * Can provide permissions for a restricted list of users and groups
* [Apache Sentry (incubating)](https://sentry.incubator.apache.org/)
    * Database servers need files for storage, managed by admins
    * Authorizations needed for database objects may be disjoint 
    
---
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_perms_acls"/>[HDFS Permissions](http://hadoop.apache.org/docs/r2.4.1/hadoop-project-dist/hadoop-hdfs/HdfsPermissionsGuide.html) </center>

* Plain HDFS permissions are largely POSIX-ish
    * Execution bit doesn't work except as a sticky bit
    * Applied to simple or Kerberos credentials
        * The NameNode process owner <i>is</i> the HDFS superuser
* [POSIX-style ACLs also supported](http://hadoop.apache.org/docs/r2.4.1/hadoop-project-dist/hadoop-hdfs/HdfsPermissionsGuide.html#ACLs_Access_Control_Lists)
    * Disabled by default (<code>dfs.namenode.acls.enabled</code>)
    * Additional permissions for named users, groups, other, and the mask
        * chmod operates on mask filter -> effective permissions
    * Best used to refine, not replace, file permissions
        * Some overhead to store/process them

---
<div style="page-break-after: always;"></div>

## <center> [Apache Sentry Basics](http://blog.cloudera.com/blog/2013/07/with-sentry-cloudera-fills-hadoops-enterprise-security-gap/) </center>

* Designed for access control at the [database] object level
    * Objects: server, database, table, view, URI
    * Privileges: SELECT, INSERT, ALL
* Now an [incubating Apache project]
    * Useful resources located on Cloudera sites for now
* Support for Hive (via [HiveServer2](http://blog.cloudera.com/blog/2013/07/how-hiveserver2-brings-security-and-concurrency-to-apache-hive/)) and Impala out of the box
* Sentry policy is defined by 1:1 mappings
    * Local/LDAP groups -> Sentry roles
    * Sentry roles -> database object, privileges
    * Global settings file -> per-database file
        * For mapping to multiple databases with disjoint policies

---
<div style="page-break-after: always;"></div>

## <center> Sentry Design </center>

### <center> Graphic overview</center>

<center><img src="http://blog.cloudera.com/wp-content/uploads/2013/07/Untitled.png"></center>

---
<div style="page-break-after: always;"></div>

## <center> Sentry Design Notes

* <a href="http://en.wikipedia.org/wiki/Mediator_pattern">Mediator design</a> implementation
* Client-side interfaces for binding to the policy engine
    * Hooks for impalad and HiveServer2 supply the hooks
* Service Provider interfaces for persisting policies to a store
    * Support for file storage to HDFS or local filesystem
* The policy engine grants/denies access
    * Rules applied to user, object and permission requested
* A full-figured [config example is here](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH4/4.6.0/CDH4-Security-Guide/cdh4sg_Sentry.html?scroll=concept_iw1_5dp_wk_unique_1)
* Short [video overview is here](http://vimeo.com/79936560)
<!-- can also throw in my own "Notes on Configuring Sentry" as a handout

---
<div style="page-break-after: always;"></div>

## <center> Sentry and [HiveServer2](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_hiveserver2_configure.html)

<center><img src="https://blogs.apache.org/sentry/mediaresource/1554e24d-1365-4feb-9d0d-5832ecb90628"></center>

---
<div style="page-break-after: always;"></div>

## <center> [Sentry as a Service](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_sentry_service.html)

* DB-based provider 
    * Available in CDH 5.1.x/CM 5.1.x
    * Will store to CM's embedded database or custom database
* CM supports migration from file-based policies
    * CLI version: <code>sentry --command config-tool --policyIni *policy_file* --import</code>
    * File-based provider must be disabled for the service to work
* May be enabled for Hive or Impala or both
    * Legacy Hive users can retain file provider if desired
    * Impala users do not have to inherit from Hive configuration

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_encryption">Encryption</a></center>

* [Network ("in-flight") encryption](http://blog.cloudera.com/blog/2013/03/how-to-set-up-a-hadoop-cluster-with-network-encryption/)
    * For HTTP-based communications among services
        * RPC support already in place
    * Digital certificates, private key stores
    * Support includes MR shuffling, Web UI, HDFS data and fsimage transfers
* At-rest encryption
    * [Project Rhino](http://blog.cloudera.com/blog/2014/06/project-rhino-goal-at-rest-encryption/), originally driven by Intel
        * Encryption/decryption that is transparent to Hadoop applications
        * Need: Key-based protection
        * Need: Minimal performance cost [HDFS-10693](https://issues.apache.org/jira/browse/HADOOP-10693)
    * [HDFS extended attributes](http://blog.cloudera.com/blog/2014/06/why-extended-attributes-are-coming-to-hdfs/) for client transparency
        * Originated as a hook for 
        * [HDFS-2006](https://issues.apache.org/jira/browse/HDFS-2006)
        * Descriptive properties for files and directories
        * Parameters for function-specific clients

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_cm_configuration">Preparing Kerberos Configuration</a>

* Know the [network ports that CDH and third-party software use](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_cdh5_ports_configure.html)
* Set up a dedicated Kerberos Domain Controller
    * KRB5 MIT [instructions are here](http://web.mit.edu/Kerberos/krb5-1.8/krb5-1.8.6/doc/krb5-install.html#Realm-Configuration-Decisions)
    * Cloudera [slightly higher-level instructions are here](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Configuring-Hadoop-Security-with-Cloudera-Manager/cm5chs_authentication_cm.html)
    * Make sure your KDC allows renewable tickets
    * Create a KDC account for the Cloudera Manager user

---
<div style="page-break-after: always;"></div>

## <center> Security Lab
## <center> [Enabling Kerberos with CM](https://wiki.cloudera.com/display/FieldTechServices/Enabling+Kerberos+using+Cloudera+Manager) </center> 

* Find the wizard in CM and follow it.
* Use the links given during presentation to answer the wizard's prerequisites

<!-- Do I need permission to share this wiki article with a non-employee audience? -->

---
<div style="page-break-after: always;"></div>

## <center> Optional challenge
## <center>[JDBC Connections in a Kerberised Cluster](http://blog.cloudera.com/blog/2014/05/how-to-configure-jdbc-connections-in-secure-apache-hadoop-environments/)</center>

* There's quite a bit of work to this lab, but if you want to do it all, don't need much hands-on guidance and have the resources, you can:
    * Set up CDH 5
    * Test for client connectivity (using JDBC)
    * Set up and/or integrate an Active Directory instance
    * Test for a secured client connection
    * Enable Kerberos
    * Add a Sentry configuration to the mix
    * Test client connection on last itme
 
Then the steps in this blog are a one-stop shop. If you're fluent with these tools, it may take a little more than one hour. Let your instructor know if you plan to attempt this lab as part of the class.

---
<div style="page-break-after: always;"></div>

## <center> Security Lab (Choose A or B)

Complete *one* of the following labs:

A. [Sentry Policy File Configuration](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_sentry.html)
B. [Sentry Service Configuration (new in CDH 5.1)](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_sentry_service.html)

---
<div style="page-break-after: always;"></div>

# <center> Thursday AM
# <center> <a name="hue_services_admin_section"/>HUE Services & Administration

* <a href="#hue_design_goals">HUE Design and Goals</a>
* <a href="#hue_services">Services</a>
* <a href="#hue_deployment_tools">Deployment Tools</a>
* <a href="#hue_admin_features">Admin features</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_design_goals">HUE Design & Goals</a>

* Customizable service portal
    * [RainStor Embraces HUE](http://rainstor.com/rainstor-embraces-hue/)
* Client authentication proxy
* Graphical browsing and reporting
* Application UIs
* LDAP/Kerberos support
* Index for support, tutorials, demos

---
<div style="page-break-after: always;"></div>

## <center> Current Version & Resources

* HUE 3.5 released in December, 2013
   * Pluggable app additions follow CDH version releases
* Self-help resource site: [gethue.com](http://gethue.com)
* Walk-throughs [hosted on Vimeo](http://vimeo.com/search?q=gethue)
    * Short and compressed -- play them repeatedly or stop-and-start
* The front end for [Cloudera Live](http://www.cloudera.com/content/cloudera/en/products-and-services/cloudera-live.html)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_services">HUE's Services</a>

* <a href="hue_query_editors">Query editors</a>
* <a href="hue_data_browsers">Data browsers</a>
* <a href="#hue_workflow_tools">Workflow tools</a>
* <a href="#hue_search_console">Cloudera Search console</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_query_editors">Query Editors</a>

* [Hive](http://hive.apache.org)
    * [Beeswax editor](http://demo.gethue.com/beeswax/#query)
* [Impala](http://impala.io/)
    * [Graphical SQL data browser and query interface](http://demo.gethue.com/impala/#query)
* [DB Query](http://demo.gethue.com/rdbms/)
    * Library support for MySQL, PostgreSQL, Oracle, and SQLite
* [Pig](http://demo.gethue.com/pig/)
* [Job Designer](http://demo.gethue.com/jobsub/#list-designs)
    * Form-based editor for Oozie actions, job submission
* [Spark Igniter](http://demo.gethue.com/spark/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_data_browsers">Data Browsers</a>

* [Hive Metastore](http://demo.gethue.com/metastore/tables/)
* [HBase](http://demo.gethue.com/hbase/#Cluster)
* [Sqoop Transfer](http://demo.gethue.com/sqoop/#jobs)
* [ZooKeeper](http://demo.gethue.com/zookeeper/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_workflow_editors">Workflow Tools</a>

* [(Oozie) Dashboard](http://demo.gethue.com/oozie/)
* [Editor, AKA Workflow Manager](http://demo.gethue.com/oozie/list_workflows/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_search_console">Cloudera Search Console</a>

* [Twitter Demo](http://demo.gethue.com/search/?collection=10000001)
* [Yelp Demo](http://demo.gethue.com/search/?collection=10000002)
* [Logfiles Demo](http://demo.gethue.com/search/?collection=10000003)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_deployment_tools">Deployment Tools</a>

* [Manual installation](http://cloudera.github.io/hue/docs-3.5.0/manual.html)
    * Depends on [system libraries to use](http://cloudera.github.io/hue/docs-3.5.0/manual.html#_install_hue), more [for development](for development)
    * Does require CDH, does not require CM
    * Useful as a client proxy tool
* Parcels installation (Cloudera Manager)
    * See /opt/cloudera/parcels/CDH/lib/hue on host
    * Can run multiple service instances
    * [HA service configuration](http://gethue.com/hadoop-tutorial-high-availability-of-hue/) 

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_admin_features">HUE Administrative Features</a>

* Hue's database stores user accounts, Hive queries, job submissions
* Inspectable: <code>sqlite3 /var/lib/hue/desktop.db</code>  
* Embedded database is <code>(SQLite)</code>
    * Supported alternatives: [MySQL, PostgreSQL, Oracle](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Requirements-and-Supported-Versions/cdhrsv_db.html)

---
<div style="page-break-after: always;"></div>

## <center> UI Walk-through

* [Demo a query (Impala)](http://blog.cloudera.com/blog/2013/10/explore-the-impala-app-in-hue/)
* [Demo a job submission](http://gethue.com/hadoop-tutorial-submit-any-oozie-jobs-directly-from/)
* File/job browsing
* User administration
* [Single sign-on (SSO) Support](http://blog.cloudera.com/blog/2013/10/enabling-sso-authentication-in-hue/)
* [LDAP integration](http://blog.cloudera.com/blog/2014/02/how-to-make-hadoop-accessible-via-ldap/)

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Standalone Installation </center>

1. Use [this documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_hue_installation.html), perform the following steps:
2. Package-install HUE on any non-CM node in your cluster.
3. TBD this
4. TBD that
5. TBD third task
6. Review the processes TBD
7. Review the logs TBD
8. Review the database schema 

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Run Sample Job via Workflow

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Add Security Component

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Run HUE Service on CM

---
<div style="page-break-after: always;"></div>

# <center> Thursday PM
# <center> <a name="troubleshooting_practices_section"/>Troubleshooting

* <a href="#troubleshooting_philosophy">Cloudera's Partner Philosophy</a>
* <a href="#troubleshooting_enabling_partners">Enabling field partners</a>
* <a href="#troubleshooting_docs_assistance">Using documentation, getting assistance</a>
* <a href="#troubleshooting_problems_bugs_issues">Defining problems, bugs, and customer issues</a>
* <a href="#troubleshooting_methodology">Troubleshooting methodology</a> 
* <a href="#troubleshooting_examples">Example problems</a>
* <a href="#troubleshooting_challenges">Preparing for Friday challenges</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_philosophy"/> Cloudera's Partner Training Philosophy </center>

* You're hearing it right now
    * This event is a pilot for a broader field-readiness program.
    * We can't scale with mentoring and shadowin
    * Cloudera University training is user, not partner oriented 
* We're learning how best to share our field knowledge and resources
    * Feedback helps: how can we support you in the field?
    * Which resources can contribute most to your success?

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_enabling_partners"> General Resources to Have</a>

* [ASF account for reporting/reviewing bugs](https://issues.apache.org/jira/secure/Dashboard.jspa)
* [Cloudera Connect - partner portal](http://www.cloudera.com/content/cloudera/en/partners.html)
* [Github account](https://github.com/)
<!-- Other partner resources I'm not aware of --> 

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_docs_assistance"> Documentation & Support </a>

* We must review all materials customers can access
    * Follow and participate in [Cloudera's forums](http://community.cloudera.com)
    * Always ask which CM/CDH versions are in use?
    * [Documentation starts here](http://www.cloudera.com/content/support/en/documentation.html) 
* Review all Technical Service Bulletins
* Learn to use the [Diagnostic Bundle Collector](http://www.cloudera.com/content/support/en/support-info/cluster-statistics.html)

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_problems_bugs_issues"/> Defining Problems, Bugs, Customer Issues

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_methodology"/> Troubleshooting Wisdom

*Potential measures by how much you lost* -- my college track coach

* Fixing a recurring or well-known problem quickly is a common pitfall 
* You need a method you can recite when you encounter new/unfamiliar territory
    * To remind yourself what you know
    * To recall tools that can tell you what you don't know
    * To remember tools don't solve problems, they help reveal them
    * To write down what you've learned so you can share it

---
<div style="page-break-after: always;"></div>

## <center> Methodology: Guidance<p>

We have many technologies to consider. A good general-purpose book for articulating your practice is *Debugging*, by David J. Agans. These nine points are the focus:

1. Understand the System
2. Check the Plug
3. Divide and Conquer
4. Make It Fail
5. Quit Thinking and Look
6. Change One Thing at a Time
7. Keep an Audit Trail
8. Get a Fresh View
9. If You Didn't Fix It, It Ain't Fixed

Note: Apply #7 to **documenting your fix**, and adding it to the community's knowledge

---
<div style="page-break-after: always;"></div>

## <center> Miscellany: Associating Patch to a Release

* Thanks to <a href="mailto:brock@cloudera.com">Brock Noland</a>
* Start with [the change logs](http://archive-primary.cloudera.com/cdh5/cdh/5/)
* Search the [relevant CDH project](http://jira.cloudera.com) with the JIRA name in double quotes
* Grep the code! An example using FLUME-2245 with CDH 5.0.x:
    * <code>$ **git clone https://github.com/cloudera/flume-ng** </code>
    * <code>$ **cd flume-ng** </code>
    * <code>$ **git branch -a** </code>
    * <code>$ **git log origin/cdh5-1.4.0_5.0.2 | grep 'FLUME-2245'** </code>
    * <code>$ **git log origin/cdh5-1.4.0_5.0.3 | grep 'FLUME-2245'** </code><br><code>FLUME-2245. Pre-close flush failure can cause HDFS Sinks to not process events</code>
    * To get patch updates: <code>$ **git fetch origin** </code>

---
<div style="page-break-after: always;"></div>


## <center> <a name="troubleshooting_examples"/> Example Problems

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_challenges"/> Friday Challenges

---
<div style="page-break-after: always;"></div>

## <center> Lab: Review time

---
<div style="page-break-after: always;"></div>

# <center> Friday AM
# <center> Challenges

* You're going to build a C5.1 cluster and kerberise it
* You will document your progress largely by emails to me and Jeff
    * mfernest@cloudera.com, jfield@cloudera.com
* Your email timestamps help us gauge the complexity of the challenge -- don't be hasty, don't wait to the last minute.
* When you run into trouble, follow the steps we outlined yesterday
    * Understand your problem first! If there's time, then fix it.
* It is less important to complete all stages than being able to show/explain your work 

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1 - Install an external db server for CM

* Add a MySQL server on any instance that does not host CM
    * Don't replicate it
    * Send your instrutors a screenshot of a login session and test query 

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2

* Install and configure Cloudera Manager 5.1
* Use the MySQL server you created as its database
* Create an Instructor account with the password bootcamp
   * Assign Administrator privileges to this account
* Email the URL of your CM instance when done

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3

* Install a CDH parcel
* Enable at minimum the following services: HDFS, YARN, Hive, HUE
* Email a screenshot of any config errors you first encounter
* Email a second screenshot once you have cleared as many config errors as you can

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4

* Use teragen and terasort to run a benchmark on HDFS
* Choose a file size you feel should complete sorting in 10 minutes or less
* Email the instructors with the output of your test

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5

* Kerberise your cluster
* This is a problematic challenge
    * You have until 11:50a to get as far as you can
* Email a scfreenshot of the CM home page and HDFS service at that time
* Include details on the last problem you were working on and what you think needs fixing  

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6

* Evaluate this course -- address the high and low points as you see fit
* Evaluate your own readiness. Based on your work today and learning over the last wee:
    * Could you install a cluster at a customer site by yourself?
    * Which technical area are you strongest?
    * Which areasdo you need to work on?
    * What else do you need to prepare yourself?
* Email this feedback to us. 

---
<div style="page-break-after: always;"></div>

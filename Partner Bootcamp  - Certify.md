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

* <a href="#instructor">Instructor</a>
* <a href="#audience">Audience</a>
* <a href="#selfcheck">Self-check questions</a>
* <a href="#design_layout">Course design & layout</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="instructor"/> Instructors

* Michael Ernest (Sr. Consultant, Course Developer/Facilitator)
    * mfernest@cloudera.com
* Benjamin Spivey (Solution Architect, Field Expert)
    * ben@cloudera.com

---
<div style="page-break-after: always;"></div>

## <center> <a name="audience"/> Audience

* You've attended Cloudera's Hadoop/Administrators Course
* You have hands-on exposure to field work (shadowing, support cases, project contributions)
    * You may none of this. You will work very hard this week. 
* You can complete exercises without step-by-step direction
* You can read and write shell scripts
* You have strong and broad Linux command knowledge
    * And you can (quickly) find docs/support when necessary 

---
<div style="page-break-after: always;"></div>

## <center> <a name="selfcheck"/> Self-check questions

<strong> Can you answer the following questions in five minutes or less? </strong>

* Recall three ways to report the Hadoop version of a CDH cluster?
* Which terminal command will list all JVM-based processes on a machine?
* Which network port does a Kerberos 5 KDC server use? 
* What is the default port assigned to the NameNode Web UI?
* Pick all that apply: HDFS block replication can be set by
    * a) the cluster receiving a file write request
    * b) a client sending a file write request
    * c) the job processing the file
    * d) all of the above
* T/F: The Pig client does not work on Windows, except in local mode. 

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

* Seven topics: one per morning and afternoon
    * <a href="#cm_cdh_installation">Cloudera Manager & CDH installation</a>
    * HDFS
    * YARN & Resource Management
    * CM Monitoring & Customizing
    * CDH Security (Kerberos, Sentry)
    * HUE Services & Administration
    * Diagnostics & Troubleshooting Practice

---
<div style="page-break-after: always;"></div>

## <center> <a name="discussion_format"/> Discussion Format

* Morning: 2 hours discussion, up to 2 hours lab work
    * Including the lunch hour to finish, if you need it 
    * Target audience should need ~1 hour
* Afternoon: 3 hours discussion, up to 2 hours lab work
    * Including 5-6 pm, if you need it
    * May also be used for bonus labs for the extra-motivated

---
<div style="page-break-after: always;"></div>

## <center> <a name="scored_labs"/> Scored Labs

* In other words, required. Not self-evaluated.
    * Checks are not (yet) automated -- we'll review your work.
    * How you do the work matters -- keep notes!
* Core objectives in this training:
    * Prepare you for Cloudera field work
    * Offer feedback on your readiness
    * Advise you on your study and practice
* We evaluate lab work with ***competence*** in mind.<br>
    * Mistakes in process subtract more than finesse adds.
    * For example, unnecessary cluster restarts are a bad sign.

---
<div style="page-break-after: always;"></div>

## <center> <a name="scored_challenges"/> Scored Challenges

* Friday morning: six half-hour troubleshooting scenarios
* You get credit for solving the problem, of course
* It's (way) better if you can explain and demonstrate what you did.
    * Articulate the problem
    * Identify likely causes
    * Implement the fix
    * Showing your fix addresses the problem or rules out a hypothesis <p/>
* There's partial credit for making progress without solving a problem
    * And for fixing a problem without explaining how you did it. 

---
<div style="page-break-after: always;"></div>

# <center> Monday PM
## <center> <a name="cm_cdh_installation"/>Cloudera Manager & CDH Installs

* <a href="#cm_cdh_key_points">CM and CDH Key Points</a>
* <a href="#parcels">Understanding Parcels</a>
* <a href="#install_methods">Installation Methods</a>
* <a href="#custom_installs">Customizing the Install</a>
* <a href="#cm_ui_overview">Cloudera Manager UI Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_cdh_key_points"/> High-level CM and CDH Points

* A CM version is not tied to one CDH release
    * You can administer CDH4 clusters with CM5
* CM agents placed on each cluster node talk back to the CM server
    * Ergo, you cannot connect to any cluster with any CM instance    
* Cloudera recommends deploying CDH with parcels 
    * Package- and tarball-based deployment are also supported
* CMs supports REST API for browser-based and script-driven tasks
    * API versions are supersets of previous versions (with some inconsistencies)
    * http://<i>your_cm_host</i>:7180/api/version returns the latest supported release
    * Some API calls may not pertain to earlier CDH releases
        * (We'll review the [CM API](http://cloudera.github.io/cm_api/) on Wednesday)

---
<div style="page-break-after: always;"></div>

## <center> <a name="parcels"/> What's a Parcel?

A [binarized installation object](https://github.com/cloudera/cm_ext/wiki/Parcels:-What-and-Why%3F) that:

* Bundles one CDH release
    * Built-in version-matching of Hadoop services
    * Supports add-on and third-party parcels (Impala at one time, now Accumulo) 
* Independent of Linux package formats, tools, requirements
    * Default install path: <code>/opt/cloudera/parcels</code>
    * Don't need root user or sudo privileges
* Adds deployment lifecycle semantics to CDH deployment
    * You can store alternate CDH parcels on-disk without conflict 
* Supports rolling upgrades
    * Also makes downgrading easier
* Simple HTTP-based repository
    *  URL may be set in CM

---
<div style="page-break-after: always;"></div>

## <center> The Parcels Vision

<center> <img src="http://blog.cloudera.com/wp-content/uploads/2013/05/parcels1.png"> </center> 

* How to manage parcels via CM is [documented here](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Installation-Guide/cm5ig_parcels.html)

---
<div style="page-break-after: always;"></div>

## <center> Parcels Features

* Lifecycle actions
    * Download
    * Distribute
    * Activate/deactivate
    * Remove
    * Delete
* File convention: <code>*objectname*-*version*-*[distro suffix](https://github.com/cloudera/cm_ext/wiki/Parcel-distro-suffixes)*.parcel</code> 
* Tar structure with [internal layout requirements](https://github.com/cloudera/cm_ext/wiki/Building-a-parcel)
    * Content list kept in <code>meta/parcel.json</code> 
    * Client download info is served in a separate <code>manifest.json</code> file
* The symbolc link <code>/opt/cloudera/parcels/<font color=cyan>CDH</font></code> refers to the active bundle
    * <font color=magenta>parcel name</font>-<font color=orange>version</font> only: <code><font color=magenta>CDH</font>-<font color=orange>5.1.0-1.cdh5.1.0.p0.53</font></code> 

---
<div style="page-break-after: always;"></div>

## <center> Custom Service Descriptors (CSDs)

* We use parcels to distribute and install software
    * See CM's Administration settings
    * Parcels separate CDH software management from the OS
    * Parcels do not support processes or services 
* CM uses [CSDs to configure and integrate services](https://github.com/cloudera/cm_ext/wiki/CSD-Overview)
    * Ideal for ISV partners to integrate with CM
    * Customers sometimes ask if CSDs can help them integrate their tools
    * Usual answer: probably not. Expensive effort for a one-time effort 
* CSDs support integration with CM features including:
    * Monitoring
    * Resource management
    * Service lifecycles
    * Setting properties
    * Host/instance assignments

---
<div style="page-break-after: always;"></div>

## <center> <a name="install_methods"/> CM Installation Methods

* <a href="#cm_install_paths">Documented installation paths</a>
* <a href="#cm_install_milestones">Installation milestones</a>
* <a href="#cm_install_logging">Install logging</a>
* <a href="#word_on_launchpad">Launchpad</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_paths"/>Documented installation paths

* SImple called A, B, and C paths in our documentation:
    * [Path A uses CM's installer, parcels, and wizards](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/latest/Cloudera-Manager-Installation-Guide/cmig_install_path_A.html)
    * [Path B use Linux package and installer tools](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/4.7.0/Cloudera-Manager-Installation-Guide/cmig_install_path_B.html)
    * [Path C uses tarballs (Hardcore DIY)](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/4.7.1/Cloudera-Manager-Installation-Guide/cmig_install_path_C.html)
    
---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_milestones"/> Installation milestones

For any path, these five milestones comprise a CM-led install process:

1. Set up CM databases
    * PostgreSQL is bundled with CM (we say "embedded")
2. Install CM server software (one node, two for HA)
3. Install CM agent software (all nodes supporting CDH services)
4. Install a CDH distribution
5. Configure/enable desired CDH services<p/>

You can use [or devise](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/4.5.3/Cloudera-Manager-Enterprise-Edition-Installation-Guide/cmeeig_topic_21.html) the approach that suits your customer's needs. 

* Common challenges include
    * Adding CM to an unmanaged CDH cluster
    * Integrating CM with popular tools such as Puppet
    * Working with restrictive firewalls, no internet access, etc.
    * Adhering to site-, security- and DBA-driven policies

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_logging"/>Installation logging

* As CM installs, it writes up to six log files:
    * check-selinux.log
    * install-repo-pkg.log
    * install-jdk.x86_64.log
    * {install CM server}.log
    * {install CM server db}.log
    * {start embedded database}.log
    * {start cloudera-scm-server}.log

---
<div style="page-break-after: always;"></div>

## <center> <a name="word_on_launchpad"/>Launchpad (Informational Only)

* Automate production-ready CM cluster deployment
    * Will first support Amazon VPC (Virtual Private Cloud) only
    * Uses Cloudera's AWS Reference Architecture
* Currently in testing with platinum customers
* GA release expected with C5.2

---
<div style="page-break-after: always;"></div>

## <center> <a name="custom_installs"/>Customizing Installation

* <a href="#cm_replace_default_db">Replacing the default database</a>
* <a href="#cm_replicate_db">Database Replication for HA</a>
* <a href="#other_install_methods">Other Install Methods</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_replace_default_db"/> Replacing CM's Default Database 

* The CM database manages schema and records for management services.
    *  We'll detail these on Wednesday.
* The embedded database (PostgreSQL) has not scaled well in practice.
* Some shops require a particular database (if supported).
* We recommend MySQL and prefer to install it before CM.
    * You can install with MySQL from scratch (manual process)
    * You can replace the embedded server with external PostgreSQL or other supported database.
    * Migrating from an embedded PostgreSQL can be messy, time-consuming, interrupt other services. 
* The CM db server can also host [Oozie](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/4.5.1/Cloudera-Manager-Enterprise-Edition-Installation-Guide/cmeeig_topic_14.html) data and the [Hive Metastore](http://www.cgoogle.loudera.com/content/cloudera-content/cloudera-docs/CDH4/4.2.0/CDH4-Installation-Guide/cdh4ig_topic_18_4.html), and other databases if desired.
    * Reasonable when minimizing administration is a good idea.
        * Dev and POC clusters, for example

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_replicate_db"/> Database Replication for HA (MySQL)

* When using MySQL for CM and other Hadoop services (Oozie, Hive Metastore), customers often want replication to ensure availability.

You can configure this before putting MySQL into service. If CM/CDH are already running, it's more time-consuming to replicate existing data.

---
<div style="page-break-after: always;"></div>

## <center> <a name="other_install_methods"/>Other Installation Methods

* Using <a href="http://whirr.apache.org/">Apache Whirr</a>
* Headless (terminal screens only)
    *  The CM installer binary supports this
    *   Administering CDH services without a browser poses a steep learning curve.
* <a href="https://forge.puppetlabs.com/tags/cdh">Puppet</a>
    * Cloudera-certified partner
    * Support for CDH installation is well-received

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_ui_overview"/>Cloudera Manager UI Overview

* Clusters menu (collapsible in CM 5.1)
* Role assignments page
* Options shown in <code>Administration -> Settings</code>
* Wizard-driven support includes
    * Express Install
    * Add Service/Role
    * Upgrade CM 
    * Upgrade CDH
    * Enable HA (NameNode, JobTracker, Oozie, YARN RM)
* Some wizards are buried here and there
    * <code><i>Service</i>->Instances->Add Role Instances->View By Host</code> (button)

---
<div style="page-break-after: always;"></div>

## <center> CM Pre-install Lab
## <center> Deploy MySQL server with replica 

1. Install the following MySQL packages on your target nodes
    * <code>mysql</code>
    * <code>mysql-server</code>
    * <code>mysql-connector-java</code><p>
2. Configure <code>/etc/my.cnf</code> **before** starting any MySQL process. 
    * Use the <code>my.cnf</code> file included in this repo as your configuration file.
    * Review the settings in this file; some are commented for your information.
    * Create any directories specified in the config that do not exist
    * Give the mysql user permission to write to them.
    * Copy the file to the <code>/etc</code> directory on the master and replica nodes.
    * Set the server-id property in the replica node copy to 2.<p>
3. Run <code>mysql_install_db</code> before starting the <code>mysqld</code> service on both nodes<p>
4. Run <code>/usr/bin/mysql_secure_installation</code> on both nodes. Answer the questions using these instructions: 
    * Set (and record!) the root password
    * Remove anonymous users
    * Allow remote login
    * Remove the test database
    * Reload the privilege table<p>
5. Grant replication privileges on all databases to the MySQL user of your choice.
    * Log in to the MySQL master node with <code>mysql -p</code> 
    * To authorize replication, you will need a valid MySQL user/password and the FQDN for the replication node.
        * MySQL does not verify this data.
        * An IP address will not work; you must supply a FQDN.
    * <code>mysql> **GRANT REPLICATION SLAVE ON \*.\* TO '*user*'@'*FQDN*' IDENTIFIED BY '*password*';**</code>
    * <code>mysql> **SET GLOBAL binlog_format = 'ROW';** </code>
    * <code>mysql> **FLUSH TABLES WITH READ LOCK;</code>**<p>
6. Suspend your MySQL session (using ^Z) or open another terminal window; log in again to the MySQL server.<p>
7. In the new session, display the server's status to retrieve the replication offset
    * <code>mysql> **SHOW MASTER STATUS;**</code>
    * Note the file and position; the replicant uses this data to sync with the master.
    * Close this session. Remove the lock in the original session; you can then close the session if you like.
    * <code>mysql> **UNLOCK TABLES;**</code><p>
8. Log in to the replica instance and set the environment to locate the master. You may break the line after each comma if you wish (in SQL, a semicolon indicates the end of a command).
    * <code>mysql> **CHANGE MASTER TO** **MASTER_HOST='*master host*',** **MASTER_USER='*replica user*',**  **MASTER_PASSWORD='*replica password*',**  **MASTER_LOG_FILE='*master file*',**  **MASTER_LOG_POS=*master file position*;**</code><p>
9. Initiate slave operation and determine its status. 
    * <code>mysql> **START SLAVE;**</code>
    * <code>mysql> **SHOW SLAVE STATUS \G**</code>
    * If successful, the <code>Slave_IO_State</code> field will show <code>Waiting for master to send event</code>
    * Otherwise, check the log file for errors.<p>

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> Create a local parcels repo (manual)

* Click the parcel indicator in CM's navigation bar
    * Under Settings, note the Remote Parcel Repository URLs value
* Default parcels links include:
    * [Latest CDH5 release](http://archive.cloudera.com/cdh5/parcels/latest)
    * [Latest CDH4 release](http://archive.cloudera.com/cdh4/parcels/latest)
    * Components not yet integrated into a parcels bundle (Impala, Search)
* Follow these [steps in the documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Installation-Guide/cm5ig_create_local_parcel_repo.html).
* Configure CM to use the new repository
    * Administration -> Settings -> Parcels

---
<div style="page-break-after: always;"></div>

## <center> CM Post-Install Lab
## <center> [Linux Configuration Check](http://tiny.cloudera.com/7steps)

1. Check swappiness on all your nodes 
    * <code># cat /proc/sys/vm/swappiness </code>
2. Set <code>noatime</code> on node-specific volumes
    * ex. <code>/dev/sdc /data01 ext3 defaults,noatime 0; mount -o remount /data02 </code>
3. Reserve zero disk space for root on DN disks
    * <code> mkfs.ext3 -m 0 /dev/sdc; tune2fs -m 0 /dev/sdc </code>
4. Maximize open file descriptors and concurrent processes
    * <code> echo {hdfs|mapred|hbase} - {nofile 32768|nproc 32768} >> /etc/security/limits.conf </code>
5. Dedicate a disk to the OS and log files.
6. Test name resolution in both directions
    * <code>/etc/hosts</code>: List the FQDN first, aliases second  
    * <code>127.0.0.1</code> **must** resolve to <code>localhost</code>
    * DNS: ensure the hostname matches the FQDN
7. Do not enable nscd until name resolution has been tested!
    * Without System Security Services Daemon (SSSD)
        * <code> # chkconfig --level 345 nscd on</code> 
        * <code> # service nscd start </code> 
        * <code> # nscd -g </code>
    * [With SSSD](http://goo.gl/68HTMQ)

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab (Optional)
## <center> Auto-deploy CM

* Fork/clone [Justin Hayes' auto-deployment work](https://github.com/justinhayes/cm_api/tree/master/python/examples/auto-deploy)
* Follow instructions, including validation test of the install

---
<div style="page-break-after: always;"></div>


# <center> Tuesday AM: HDFS<p>
## <center>Topic Overview

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

* [TeraSort Suite: teragen, terasort, teravalidate](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#terasort-benchmark-suite)
* [TestDFSIO](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#testdfsio)
* [<strong>S</strong>tatistical <strong>W</strong>orkload <strong>I</strong>njector for <strong>M</strong>apReduce](https://github.com/SWIMProjectUCB/SWIM/wiki)
    * Preferred by Cloudera's Partner Engineering group
* NameNode only: [nnbench](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/#namenode-benchmark-nnbench)

[Michael G. Noll's blog post](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/) provides a thorough review of these tools (not including SWIM).

---
<div style="page-break-after: always;"></div>

## <center> <a name="namenode_web_ui"/> NameNode Web UI

* [Vijay Thakorlal's breakdown/annotation article](http://vijayjt.blogspot.com/2013/02/hadoop-namenode-web-interface.html) is a useful review/refresh
* Significant facelift in newer Hadoop versions
    * Browse and navigate it if you haven't!
* SNN's web UI is at port 50090
    * Also reports the Hadoop version in use

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

## <center> Problem: Repeated Query Performance

* The NameNode knows which DataNodes stores blocks for a given request
    * It doesn't know [which nodes may have cached them](https://issues.apache.org/jira/browse/HDFS-4949)
    * Any repeat job that uses a different replica pays disk-transfer cost twice
    * Probably washes out in MR performance
    * For queries ([Impala](http://impala.io/) in particular)<p>, mitigates having more memory to hold working sets<p>
    
---
<div style="page-break-after: always;"></div>

## <center> Solution: Directory caching
    
* 'Globalizing' cache, or supplying locality for cached blocks to NN
    1. Specify HDFS objects for caching in advance
    2. Let DN read associated block into page cache, notify the NN
    3. Let NN prefer DNs with cache-local blocks
    3. Provide support to clients via <a href="#scr_and_zcr">fastlane-aware API</a>
        * Short-circuit read (SCR)
        * Zero-copy read (ZCR)    

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
* For some it begs the question: how we balance cluster resources
    * Queries with [NRT expectations](http://stackoverflow.com/questions/5267231/what-is-the-definition-of-realtime-near-realtime-and-batch-give-examples-of-ea)
    * MR jobs favoring parallel efficiency, low cost, simple scheduling
    * We'll go deeper in <a href="yarn_rm">YARN RM</a>
    
---     
<div style="page-break-after: always;"></div>

## <center> <a name="scr_and_zcr"/> Notes on SCR and ZCR

* Short-circuit Read
    * [HDFS-2246](https://issues.apache.org/jira/browse/HDFS-2246): Let local clients read DN's process map
    * Uses [file descriptor passing](http://infohost.nmt.edu/~eweiss/222_book/222_book/0201433079/ch17lev1sec4.html) capability in Linux
* Zero-copy Read
    * [Bypass the DN, use mmap() to read page$](https://issues.apache.org/jira/browse/HDFS-4953)
    * For clients that implement [ZCR API](https://issues.apache.org/jira/browse/HDFS-5191) 
    * The dream: bypass page$ altogether for hardware speed
* Future goals
    * Caching directories based on workload
    * Automatic output file caching (to expedite pipelined jobs)
    
---    
<div style="page-break-after: always;"></div>

## <center> <a name="hdfs_dir_snapshots"/>Directory snapshots

* Capabilities
    * Let users (who had write permissions) retrieve a deleted file
    * Based on [copy-on-write](http://en.wikipedia.org/wiki/Copy-on-write) technique to associate HDFS directories with DN block locations
    * Files may be retrieved through a versioned folder
    * Similar to .Trash but without an expiry setting

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

# <center> <a name="yarn_rm"/>Tuesday PM: YARN & RM

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
# <center> CM Monitoring/Customizing

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
## <center> (Optional) Adding CM to a CDH Cluster<p>

Current instructions are internal to Cloudera and must be vetted
-- I'll add them to the course once I'm sure they work as advertised.

Follow the [instructions
here](https://wiki.cloudera.com/display/FieldTechServices/Deploying+Cloudera+Manager+on+un-managed+CDH+clusters).

---
<div style="page-break-after: always;"></div>

## <center> CM Lab
## <center> Create a Custom Dashboard

* Create a new CM user 'dash' in your cluster
* Assign this user the Configurator role
* Log out of CM and log back in as the dash user
* Choose 2-3 charts visible from CM's home page
    * Modify them according to the docs given in presentation
    * Save them to your own dashboard

---
<div style="page-break-after: always;"></div>

# <center> Wednesday PM: CDH Security

* <a href="#security_review">Quick basics overview</a>
* <a href="#security_authentication">Strong Authentication</a> 
* <a href="#security_authorization">Better Authorization</a>
* <a href="#security_encryption">Encryption</a>
* <a href="#security_cm_configuration">CM-based Configuration</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_review">Common security concerns </a>

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

* The Apache documentation ["Hadoop in Secure Mode"](http://hadoop.apache.org/docs/r2.3.0/hadoop-project-dist/hadoop-common/SecureMode.html) lists four areas of concern.
    * Users
    * Hadoop services
    * Web consoles
    * Data confidentiality
* "Hadoop in Secure Mode" notes presume Kerberos is the answer 
    * Provides data encryption services out of the box
    * Supports browser-based authentication via [HTTP SPNEGO](http://en.wikipedia.org/wiki/SPNEGO)
* Linux supports [MIT Kerberos](http://web.mit.edu/kerberos/)
    * Review your [Hadoop for Administrators](http://university.cloudera.com/course/administrator) notes for a high-level refresh
* LDAP/Active Directory integration
    * Leveraging these resources is a common request       

---
<div style="page-break-after: always;"></div>

## <center> Active Directory Integration </center>

* Prior to the release of C5.1, Cloudera recommended a [one-way cross-realm trust to a customer's AD](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_hadoop_security_active_directory_integrate.html)
    * Requires an MIT Kerberos realm in Hadoop cluster
    * Avoids having to add principals in AD 
* Common sticking points
    * Misremembered details of AD configuration
    * Ongoing changes/updates
    * Site-preferred settings that "shouldn't be a problem"

---
<div style="page-break-after: always;"></div>

## <center> Common Direct-to-AD Misfires </center>

* <code>/etc/krb5.conf</code> configuration doesn't work with KDC
    * Looks like it should
    * Testing with <code>kinit *AD_user*</code> works
* Required encryption type isn't supported by JDK
* Suported encryption types are disjoint between clients and server
* To trace Kerberos & Hadoop interaction
    * <code>export KRB5_TRACE=/dev/stderr</code> 
    * Include <code>-Dsun.security.krb5.debug=true</code> in <code>HADOOP_OPTS</code> (& export it )
    * <code>export HADOOP_ROOT_LOGGER="DEBUG,console"</code>

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_authorization">Fine-grained Authorization</a>

* <a href="#hdfs_perms_acls">HDFS permissions & ACLs</a>
    * Need access control finer than  user-group-world
    * Answers edge cases brought about by multi-user, hierarchical data
        * E.g., DBA vs. platform/Linux administrator
    * Restricts permissions to an explicit list of users/groups
* [Apache Sentry (incubating)](https://sentry.incubator.apache.org/)
    * Database servers need file storage, managed by admins
    * Authorizations needed to retrieve database objects are often disjoint 
    
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

## <center> Security Lab: Sentry

* Choose one to complete:
    * [Sentry Policy File Configuration](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_sentry.html)
    * [Sentry Service Configuration (new in CDH 5.1)](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_sentry_service.html)

---
<div style="page-break-after: always;"></div>

# <center> Thursday AM
# <center> HUE Services & Administration

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
# <center> Troubleshooting

* <a href="#troubleshooting_philosophy">Cloudera's Partner Philosophy</a>
* <a href="#troubleshooting_enabling_partners">Enabling field partners</a>
* <a href="#troubleshooting_docs_assistance">Using documentation, getting assistance</a>
* <a href="#troubleshooting_problems_bugs_issues">Defining problems, bugs, and customer issues</a>
* <a href="#troubleshooting_methodology">Troubleshooting methodology</a> 
* <a href="#troubleshooting_examples">Example problems</a>
* <a href="#troubleshooting_challenges">Preparing for Friday challenges</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_philosophy"/> Cloudera's Partner Philosophy </center>

* You're soaking in it!
    * This event is a pilot for a field-readiness program .
    * Mentoring and shadowing experts on assignment won't scale
    * Initial training is public, not partner-oriented 
* We're now learning how best to share field knowledge and resources
    * While observing internal constraints we encounter, of course 
* Feedback helps
    * How can we support you in the field?
    * What are the best applications of our resources to your success?

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_enabling_partners"> General Resources to Have</a>

* [ASF account for reporting/reviewing bugs](https://issues.apache.org/jira/secure/Dashboard.jspa)
* [Cloudera Connect - partner portal](http://www.cloudera.com/content/cloudera/en/partners.html)
* [Github account](https://github.com/)
* <!-- Other partner resources I'm not aware of --> 

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_docs_assistance"> Documentation & Support </a>

* We must cover what customers can get on their own
    * At minimum, follow http://community.cloudera.com
    * Even better: participate!
* Documentation: the price of freedom is constant vigilance
    * Always ask: which versions CM/CDH?
    * [Start here](http://www.cloudera.com/content/support/en/documentation.html) to select the version you need 
* Be aware of Technical Service Bulletins as they are published

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

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6

---
<div style="page-break-after: always;"></div>

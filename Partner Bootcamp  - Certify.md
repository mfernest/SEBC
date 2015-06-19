<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---

# <center> Cloudera Services Enablement Boot Camp </center>
# <center> Monday PM: Introductions/Installation </center>
## <center> June 15-19, 2015 </center>
## <center> Palo Alto, CA </center>


---
<div style="page-break-after: always;"></div>


## <center> Introductions & Overview

- <a href="#instructor">Instructors</a>
- <a href="#audience">Audience Expectations</a>
- <a href="#selfcheck">Self-check questions</a>
- <a href="#design_layout">Course design</a>

<div style="page-break-after: always;"></div>

---

## <center> <a name="instructor"/> Instructors

* Michael Ernest (Senior Solutions Consultant)
    * mfernest@cloudera.com

---
<div style="page-break-after: always;"></div>

## <center> <a name="audience"/> Audience

We will address you as experienced field technicians who:

* Attended Cloudera's Hadoop for Administrators Course
* Have installed CDH on multi-node clusters before
* Can complete labs without step-by-step directions
* Read and write shell scripts all the time
* Are self-motivated; you will read/apply docs to your tasks

---
<div style="page-break-after: always;"></div>

## <center> <a name="selfcheck"/> Quick knowledge check</p>

<strong> Can you answer the following questions in five minutes or less? </strong>

* Name three ways to retrieve the Hadoop version of a CDH cluster.
* Which command reports only the JVM-based processes on a machine?
* What is the default port used by a Kerberos 5 KDC server? 
* What is the default port used by the NameNode web UI?
* How can you find the replication of a specific HDFS file?
* Installing CDH parcels requires superuser privilege (T/F)

---
<div style="page-break-after: always;"></div>

## <center> <a name="design_layout"/a>Course Design

* <a href="#sections_timing">Sections & Timing</a>
* <a href="#discussion_format">Discussion Format</a>
* <a href="#scored_labs">Scored Labs</a>
* <a href="#scored_challenges">Scored Challenges</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="course_objectives"/a> Objectives

* Prepare for Cloudera field work
* Receive feedback on your readiness
* Identify areas to study and practice further

---
<div style="page-break-after: always;"></div>


## <center> <a name="sections_timing"/> Sections & Timing

* Seven topics prior to testing
    * <a href="#cm_cdh_installation_section">CM/CDH installation</a>
    * <a href="#hdfs_section">HDFS features</a>
    * <a href="#yarn_rm_section">YARN & Resource Management</a>
    * <a href="#cm_monitor_customize_section">CM Monitors & Customizations</a>
    * <a href="#cdh_security_section">CDH Security & Kerberos</a>
    * <a href="#hue_services_admin_section">HUE Services & Administration</a>
    * <a href="#troubleshooting_practices_section">Troubleshooting Resources</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="discussion_format"/> Class Format

* Mornings: Two-hour discussion, 1-2 hours lab work
    * Includes the lunch hour
    * One hour will often suffice
* Afternoon: Three-hour discussion, 1-2 hours lab work
    * Includes 5-6 pm
    * Occasional bonus labs for the quick/motivated

---
<div style="page-break-after: always;"></div>

## <center> <a name="scored_labs"/> Submitting lab work for review 

* You'll be asked to summarize and/or submit lab work
    * We want to see how you do the work
    * Be prepared to describe your methods/process
* We evaluate with **competence** in mind.
    * Good: you can diagnose your own missteps
    * Better: you can reproduce them
    * Best: you can describe ways to avoid them

---
<div style="page-break-after: always;"></div>

## <center> <a name="scored_challenges"/> Friday Morning: Challenges

* Six challenges, increasingly difficult
* Credit for completing and documenting each stage
* You may have to explain problems you encounter
    * The hypothesis you used to identify a problem
    * The method you used to demonstrate a problem 
    * The test you used to show resolution

---
<div style="page-break-after: always;"></div>

## <center> Monday PM
## <center> <a name="cm_cdh_installation_section"/>Cloudera Manager & CDH Installation

* <a href="#install_methods">Installation Methods</a>
* <a href="#parcels">Understanding Parcels</a>
* <a href="#db_setup">Setting up the database</a>
* <a href="#cm_cdh_key_points">CM and CDH Key Points</a>
* <a href="#cm_ui_overview">Cloudera Manager UI Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="install_methods"/> CM/CDH Install Methods

* <a href="#cm_install_paths">Documented paths</a>
* <a href="#cm_install_milestones">Using installation milestones</a>
* <a href="#cm_install_logging">Logging milestones</a>
* <a href="#word_on_cloudera_director">Cloudera Director</a>

---
<div style="page-break-after: always;"></div>

## <center> Cloudera Manager architecture

<center> <img src="http://www.cloudera.com/content/cloudera/en/documentation/core/latest/images/cm_arch.jpg"> </center>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_paths"/>Installation paths

* [Path A: One-stop binary installer](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_a.html)
    * Short-term, no-admin projects (pilots, POCs, dev)
* [Path B: Install CM as a package](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_b.html)
    * Intended for long-term use and production clusters
* [Path C: tarballs ](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_c.html)
    * No root/sudo access
    * You've got your own deployment tools
    
---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_milestones"/> Path B Steps

1. Install a DB server for [Cloudera Manager](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html?scroll=cmig_topic_5_2_unique_1#cmig_topic_5_1_unique_1)
    * CDH services can hop on: Hive Metastore, Oozie, HUE 
2. Install CM Server package
3. Distribute agent software (packages or through CM)
4. Distribute/activate CDH packages or parcels
5. Assign CDH services<p/>

**[Common side requests include](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/4.5.3/Cloudera-Manager-Enterprise-Edition-Installation-Guide/cmeeig_topic_21.html):</p>

    * Adding CM to a standing CDH cluster
    * Integrating CM with tools such as Puppet
    * Working with no internet access
    * Working with site/security policies

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_logging"/>Installation logging and troubleshooting

* CM separates stages by log file in <code>/var/opt/cloudera-scm-server</code>: 
    * <code>0.check-selinux.log</code>
    * <code>1.install-repo-pkg.log</code>
    * <code>2.install-jdk.x86_64.log</code>
    * <code>3.install-cloudera-manager-server.log</code>
    * <code>4.install-cloudera-manager-server-db.log</code>
    * <code>5.init-embedded-db.log</code>
    * <code>6.start-embedded-db.log</code>
    * <code>7.start-scm-server.log</code>
* Enumeration include back-out steps:
    * <code>8.remove-cloudera-manager-daemons.log</code>
    * <code>9.remove-cloudera-manager-repository.log</code> 
* Review well-known install problems [documented here](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_troubleshooting.html).
* Review [known issues and workarounds](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_rn_known_issues.html) before installing.
* Also review [fixed issues](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_rn_fixed_issues.html).

---
<div style="page-break-after: always;"></div>

## <center> <a name="parcels"/> What is a Parcel?

<p>Parcels are [minimally structured tar files](https://github.com/cloudera/cm_ext/wiki/Parcels:-What-and-Why%3F). We use them to:</p>

* Bundle components for one CDH release
    * Version-matching is a given
    * New components (Accumulo, Kafka) delivered as add-on parcels 
* Separate from Linux packaging
    * Default location: <code>/opt/cloudera/parcels</code>
    * Avoids superuser privileges
* Adds lifecycle scheme to deployment
    * Store multiple CDH parcels without conflict
    * Only one is active at a time
    * Supports rolling upgrade and (less painful) downgrade
* Uses HTTP-based repos
    *  CM can point to a local repo as needed 

---
<div style="page-break-after: always;"></div>

## <center> Parcel Lifecycle</p>

<center> <img src="http://blog.cloudera.com/wp-content/uploads/2013/05/parcels1.png"> </center> 

* [How to manage parcels via CM](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Installation-Guide/cm5ig_parcels.html).

---
<div style="page-break-after: always;"></div>

## <center> Parcels Features

* Lifecycle actions
    * Download
    * Distribute
    * Activate/deactivate
    * Remove
    * Delete<p/>
* Naming convention: <code>*objectname*-*version*-*[distro suffix](https://github.com/cloudera/cm_ext/wiki/Parcel-distro-suffixes)*.parcel</code> 
* Just a tar with [simple layout requirements](https://github.com/cloudera/cm_ext/wiki/Building-a-parcel)
    * List of contents kept in <code>meta/parcel.json</code> 
    * Client download checks via a <code>manifest.json</code> file kept by server
* The directory <code>/opt/cloudera/parcels/CDH</code> links to the active bundle
    * Each bundle has a <font color=magenta>parcel name</font> and <font color=orange>version</font>
    * For example, <code><font color=magenta>CDH</font>-<font color=orange>5.1.0-1.cdh5.1.0.p0.53</font></code> 

---
<div style="page-break-after: always;"></div>

## <center> <a name="word_on_cloudera_director"/>[Notes on Cloudera Director](http://www.cloudera.com/content/cloudera/en/products-and-services/director.html)

* Automates cloud-based CM/CDH deployment
    * Supports [Amazon VPC](http://aws.amazon.com/vpc/)
    * Internalizes [Cloudera's AWS Reference Architecture](http://www.cloudera.com/content/cloudera/en/resources/library/whitepaper/cloudera-enterprise-reference-architecture-for-aws-deployments.html)
* See [User Guide v1.0.0](http://www.cloudera.com/content/cloudera/en/documentation/cloudera-director/latest/PDF/cloudera-director.pdf)
* Cloud-based deployment is **not** discussed in this boot camp.

---
<div style="page-break-after: always;"></div>

## <center> <a name="db_setup"/>Setting up the database

* <a href="#cm_service_dbs">Services that use a database</a>
* <a href="#cm_embedded_db">CM's embedded database</a>
* <a href="#cm_replicate_db">CM database replication for HA</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_service_dbs"/>[Service Databases](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html) 

The following services require a database:

* CM Activity Monitor (MRv1 only; not used by YARN)
* CM Reports Manager
* Sentry Server (C5.1 and later)
* Cloudera Navigator Audit & Metadata Servers
* Hive Metastore
* [Oozie](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_oozie_service.html#cmig_topic_14_unique_1)
* [HUE](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_hue_service.html#cmig_topic_15_unique_1) (*H*adoop *U*ser *E*nvironment)

*CM's Host Monitor and Service Monitor use a [LevelDB](https://github.com/google/leveldb)-based storage layer.

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_embedded_db"/> CM's embedded database</a> 

The database bundled with CM's binary installer is not production-oriented. Cloudera supports an Oracle, MySQL, and PostgreSQL as external servers.  

* Some field people will use Path A and ignore the embedded instance
* You can also migrate later if necessary
    * Can be tedious and require service outages
* Note: some customers delegate all DBs to an administrative group.

---
<div style="page-break-after: always;"></div>G

## <center> <a name="cm_replicate_db"/> MySQL Replication for HA </a></p>

* Many customers want to de-SPOF Cloudera Manager itself. 
    * [Replicating the DB](http://dev.mysql.com/doc/refman/5.0/en/replication-howto.html) addresses one piece. 
    * Configuring CM agents for failover is not documented for public use
    * Configuring agents to failover: not yet documented for public use

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_ui_overview"/>Cloudera Manager UI Overview 

* Clusters menu 
* Hosts page
* Role assignments page
* Options under <code>Administration -> Settings</code>
    * Adding a CM user 
* Confirm the REST API version

---
<div style="page-break-after: always;"></div>

## <center> CM Install Labs - *Before* You Start

* Email both instructors with this subject line:
    * [Your Name] - Boot Camp Lab Work
    * Ex. [Michael Ernest] - Boot Camp Lab Work
* Use this thread for all submissions through Thursday
    * This step saves us a lot of time
* Follow the instructions in each lab on what to submit
* Show the host information in every terminal screen capture
* Show the cluster identity in every UI capture

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab - AWS

* You have an AWS account and have practiced with it. 
    * If not, [you've got some work ahead of you](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html). 
* Create 4-5 EC2 nodes
    * Spot instances are risky; you're working under deadlines in this course
    * Use five nodes if you want to separate Cloudera Manager from the rest 
    * Instance Family/Type; m3.large will suffice 
    * Use a [Cloudera-supported version](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_cm_requirements.html) of RHEL/CentOS.
    * AWS Marketplace [can help you](https://aws.amazon.com/marketplace/pp/B00IOYDTV6) 
    * You'll need [an extra volume to play with](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-add-volume-to-instance.html)
    * Hint: wide-open security makes for less work

---
<div style="page-break-after: always;"></div>

## <center> CM Install Labs - Overview

* Submit the public IPs of your EC2 nodes to the instructors     
* Run <a href="#linux_config_lab">OS configuration checks</a>
* Install [MySQL](<a href="#mysql_replication_lab">)
* Follow Installation Path B (guidance below)
* <a href="#parcels_repo_lab">Create a Parcels repository</a>
* <a href="#scripted_install_lab">Bonus work: Scripting your pre-checks</a>

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="linux_config_lab"/>Linux Configuration Check

This checklist uses a [presentation on Slideshare](http://tiny.cloudera.com/7steps) and is a small sample of an install precheck. 

For this lab, show the commands you used and the output for each step in a screenshot. Make sure the screenshot includes the host that was used. 

1. Check swappiness on all your nodes, then set the recommended value
    * Set the value to 1 for current and future boots
2. Set <code>noatime</code> on DN volumes
    * For labs, do this on your root volume 
3. Set reserve space for root on DN volumes to 0
    * For labs, do this on your root volume
4. Check the user resource limits for max file descriptors and processes
5. Test forward and reverse lookups for both file-based and DNS name services
    a. Note: <code>/etc/hosts</code>, the [FQDN](https://en.wikipedia.org/wiki/Fully_qualified_domain_name) must be listed first  
    b. Note: <code>127.0.0.1</code> **must** resolve to <code>localhost</code>
6. Enable nscd
    a. Note: consult documentation before [running nscd with SSSD](http://goo.gl/68HTMQ)

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="mysql_replication_lab"/>Deploy MySQL with Replication

**Plan One**: follow the steps [documented here](http://www.cloudera.com/content/cloudera/en/documentation/core/v5-3-x/topics/cm_ig_mysql.html?scroll=cmig_topic_5_5#cmig_topic_5_5_1_unique_1).<br>
**Plan Two**: Follow the steps given below.<br>
**Plan Three**: Do your own thing.

**Email the instructors with your intended plan before you start**.

**Details of Plan Two**

1. Install MySQL packages on your CM and one other node
    * <code>mysql</code>
    * <code>mysql-server</code>
    * Download and install [the JDBC connector](http://dev.mysql.com/downloads/connector/j/5.1.html).<p>
2. Edit your <code>/etc/my.cnf</code> **before** you start MySQL. 
    * The starter file in the course repo is mostly complete/correct.
    * Mind the settings related to the master and slave roles. <p>
3. Run the <code>mysql_install_db</code> on both nodes before starting the <code>mysqld</code> service<p>
4. Run <code>/usr/bin/mysql_secure_installation</code> on each node: 
    a. Set the root password (and write it down!)
    b. Remove permissions for anonymous users
    c. Allow remote login
    d. Remove the test database
    e. Reload the privilege table
    f. Start the mysqld service<p>
5. On the master, grant replication privileges for all databases:
    a. Log in with <code>mysql -p</code> 
    b. You will need the FQDN of your replica's host.
    c. <code>mysql> **GRANT REPLICATION SLAVE ON \*.\* TO '*user*'@'*FQDN*' IDENTIFIED BY '*password*';**</code>
    d. <code>mysql> **SET GLOBAL binlog_format = 'ROW';** </code>
    e. <code>mysql> **FLUSH TABLES WITH READ LOCK;</code>**<p>
6. Start another MySQL session. In the new session, show the master's status:
    a. <code>mysql> **SHOW MASTER STATUS;**</code>
    b. Note the file name and byte offset. The replica needs this data to sync with the master.
    c. Close the second session and remove the lock on the first session.
    d. <code>mysql> **UNLOCK TABLES;**</code><p>
7. Open a session on the replica. Set the environment to locate the master:</p>
    <code>mysql> **CHANGE MASTER TO**<br> **MASTER_HOST='*master host*',**<br> **MASTER_USER='*replica user*',**<br> **MASTER_PASSWORD='*replica password*',**<br> **MASTER_LOG_FILE='*master file name*',**<br> **MASTER_LOG_POS=*master file offset*;**</code><p>
8. Initiate slave operation and determine its status. 
    a. <code>mysql> **START SLAVE;**</code>
    b. <code>mysql> **SHOW SLAVE STATUS \G**</code>
    c. If successful, the <code>Slave_IO_State</code> field in the output will report <code>Waiting for master to send event</code>
    d. Capture this output by screenshot and email it to the instructors.
    e. If unsuccessful, review <code>/var/log/mysqld.log</code> for errors.<p>

---
<div style="page-break-after: always;"></div>

## <center> CM/CDH Install Lab
## <center> Path B using Cloudera 5.3.x 

[The full rundown is here](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_b.html?scroll=cmig_topic_6_6). Make the following choices:

* Don't prepare for single user mode
* Use Cloudera's standard repositories
* Ignore all steps marked "(Optional)"
* Install the Data Hub Edition 
* Install CDH using parcels
* Name your cluster after you  
* Add the Coreset of CDH services -- memory is tight
    * Assign a ZooKeeper role to three hosts
* Capture your CM home page and email it when you're done   

[Go here](http://www.cloudera.com/content/cloudera/en/documentation/core/v5-3-x/topics/cm_ig_uninstall_cm.html) if your installation doesn't complete.

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab: Bonus
## <center> <a name="parcels_repo_lab"/>Create a local parcel repo (manual)

* Click the parcel indicator in CM's navigation bar
    * Under Settings, note the Remote Parcel Repository URLs value
* Default parcels links include:
    * [Latest CDH5 release](http://archive.cloudera.com/cdh5/parcels/latest)
    * [Latest CDH4 release](http://archive.cloudera.com/cdh4/parcels/latest)
    * Standalone components (such as Accumulo or Kafka)
* Follow the [documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Installation-Guide/cm5ig_create_local_parcel_repo.html).
* Set the new repository in CM
* Capture this setting and email to the instructors

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab: Bonus Material
## <center> <a name="scripted_install_lab"/>Auto-deploy CM

* Fork/clone [Justin Hayes' auto-deployment work](https://github.com/justinhayes/cm_api/tree/master/python/examples/auto-deploy)
* Follow instructions, including validation test of the install

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_cdh_key_points"/> Summary Points

* Your CM release can be >= your CDH release
    * Some customers use CM 5.x to monitor CDH 4.x installations
* The [CM agent](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ag_agent_config.html) is configured to report to one CM server 
    * Configuring CM HA is [documented as of Cloudera 5.4](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/admin_cm_ha_overview.html)
* CM isn't needed to deploy CDH, but a huge convenience
* CM supports a REST API
    * Each API version is a superset of all prior versions
    * Try <code>http://<i>your_cm_host</i>:7180/api/version</code>
    * Some later-version endpoints won't pertain to older CDH releases
        * Browse the [CM API here](http://cloudera.github.io/cm_api/)

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

## <center> <a name="hdfs_namenode_ha"/> NameNode HA

* CM 5 supports a [NameNode HA wizard](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_hdfs_hi_avail.html)
    * {HDFS service} -> Actions -> Enable High Availability
    * [Locating the Journal Quroum Managers](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_hdfs_hi_avail.html?scroll=cmug_topic_5_12_1_unique_1)
    * [Understanding Zookeeper's role](http://hadoop.apache.org/docs/r2.3.0/hadoop-yarn/hadoop-yarn-site/HDFSHighAvailabilityWithQJM.html#Deploying_ZooKeeper)
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
    * Uses [file descriptor passing](http://infohost.nmt.edu/~eweiss/222_book/222_book/0201433079/ch17lev1sec4.html) capability
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
* Email a screenshot showing 

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Test HDFS performance

* Use the steps outlined in [Michael Noll's blog](http://www.michael-noll.com/blog/2011/04/09/benchmarking-and-stress-testing-an-hadoop-cluster-with-terasort-testdfsio-nnbench-mrbench/) as a guide.
* Run terasort twice
    * Use the time command to capture each run
    * terasort the file you created in the previous lab
    * terasort the replicated file you received
* Email the results of these runs, including the time results.
    * You can omit the task completion percentages from the output.

---
<div style="page-break-after: always;"></div>

## <center> HDFS Lab: Enable HDFS HA

* Use the CM Wizard to enable HA
* Capture/email your HDFS service main page when complete 
* Add an "instructor" user in CM 
    * Assign the Operator role
    * Use the password cloudera
* Email the URL to your CM instance when this account is ready

---
<div style="page-break-after: always;"></div>

# <center> Tuesday PM
# <center> <a name="yarn_rm_section"/>YARN & RM

* <a href="#mrv1_review">MRv1 Design</a>
* <a href="#mrv2_review">YARN/MRv2 Design</a>
* <a href="#YARN_overview">What YARN Does</a>
* <a href="#migrating_mrv1_mrv2">Migrating from MRv1 to YARN</a>
* <a href="#RM_overview">Resource Management Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="mrv1_review"/> MRv1 Design

### <center> Graphic overview

<center><img src="http://www.ibm.com/developerworks/library/bd-yarn-intro/fig01.png"/></center>

---
<div style="page-break-after:always;"></div>

## <center> MRv1: Roles & Pain Points

* JobTracker manages scheduling, TaskTrackers, job status, and recent history
* TaskTrackers set a number of <i>slots</i> that are map- or reduce-specific
    * Slot count factors include cores, spindles, and workload -- art and science
    * Under-utilization is hard to avoid
    * Over-utilization can lead you down a difficult path
* At ~4k TaskTrackers, JobTracker allegedly becomes a bottleneck
* You can overrun JT cache with too many fast-failing jobs

---
<div style="page-break-after: always;"></div>

## <center> <a name="mrv2_review"/> YARN/MRv2: Design

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
* Containers provide execution resources
* Application Master (AM)
    * Manages one job from a container
    * Application-specific (e.g., MRAppMaster)
* JobHistory Server
    * Logs job status info from NodeManagers
    * Default port: 19888

[Operator overview of MR migration](http://blog.cloudera.com/blog/2013/11/migrating-to-mapreduce-2-on-yarn-for-operators/)</br>
[MRv1->MRv2 Migration Guide](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_mapreduce_to_yarn_migrate.html)

---
<div style="page-break-after: always;"></div>

## <center> YARN Job Control (MR)

1. Client submits a job to YARN
2. RM launches the right AM
3. AM requests data block locations from the NN
4. AM requests containers from the RM
5. RM finds open containers, returns a list to the AM
6. AM invokes containers via their Node Manager -- mappers start
7. RM invokes an auxiliary shuffle service 
8. AM requests containers for reducing tasks
9. The AM releases containers, updates RM as tasks complete
10. RM updates the Job History server

---
<div style="page-break-after: always;"></div>

## <center> <a name="YARN_overview"/>What YARN Changes

* MRv2 service recasts MRv1
    * No JobTracker
    * The Application Master (AM) schedules, executes, supervises, and gets resources for its jobs
* YARN = <strong>Y</strong>et <strong>A</strong>nother <strong>R</strong>esource <strong>N</strong>egotiator
    * Separates resource management from application type    * A [general application framework](http://wiki.apache.org/hadoop/PoweredByYarn), starting with MRv2
    * See the term [NextGenMapReduce](http://wiki.apache.org/hadoop/NextGenMapReduce) for more on the motivation behind YARN

---
<div style="page-break-after: always;"></div>

## <center> Benefits of YARN</center>

* Better resource utilization
* Better RM scalability
    * For very large clusters
* Better performance for some cases
    * Large clusters running many small jobs
    * Balancing MapReduce (batch) and Impala (NRT queries)
        * [Performance under multi-tenancy](http://blog.cloudera.com/blog/2013/06/configuring-impala-and-mapreduce-for-multi-tenant-performance/) is a key selling point
* The Big Idea: one RM control for all cluster
    * Support for user/group and tag-based classifiers
    * Custom, pluggable classifiers: on the roadmap 
    * RM HA is available

---
<div style="page-break-after: always;"></div>

## <center> <a name="migrating_mrv1_mrv2"/> Migrating from MRv1 to MRv2

* Common mistake: assuming YARN roles map 1:1 to MRv1 roles
* Common mistake: assuming CM manages the complexityt
* Read <a href="http://blog.cloudera.com/blog/2014/04/apache-hadoop-yarn-avoiding-6-time-consuming-gotchas/">Jeff Bean's blog post on common gotchas</a>, including:
    * The change from slot count to container sizing is just one part.
    * Comparing apples-to-apples for performance is hard
    * JVM heap calculations are different
    * YARN logs all framework messages, not just MRv2
        * Messages are more generic; naming conventions are different
    * [Too many AMs can ball YARN up](https://issues.apache.org/jira/browse/YARN-1913)
* Ensure [a proper comparison](http://blog.cloudera.com/blog/2014/02/getting-mapreduce-2-up-to-speed/)

---
<div style="page-break-after: always;"></div>


## <center> <a name="RM_overview"/>Resource Management

<p><i>YARN's Resource Management strategy is divided into three layers</i></p>

1. <a href="rm_service_isolation">Service-level isolation</a>
    * Sets minimum resources for all cluster services, including YARN
    * E.g., HDFS, HBase, Impala, Search, MRv1
2. <a href="#admission_control">Scheduling/Impala's Admission Control</a>
    * Resource priority based on request, service type
3. <a href="#dynamic_prioritization">Dynamic prioritization</a>
    * Allocating resources by rule

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_service_isolation"/>Service-level Isolation (cgroups)

* Sets minimum resource guarantee for each service, under contention
* CM uses [Linux Control Groups](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_cgroups.html)
    * Will support CPU, memory, disk I/O, and network limits (subject to OS support)
    * *Cluster > ClusterName > Static Service Pools*
    * [A hands-on intro to cgroups](http://riccomini.name/posts/hadoop/2013-06-14-yarn-with-cgroups/)
* Coarse-grained, policy-driven resource management

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_admission_control"/> Impala Admission Control

* [Throttle and queue control for Impala queries only](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/Impala/Installing-and-Using-Impala/ciiu_admission.html)
* Enabled in CDH5 if Impala 1.3 or later is present
* Various arrangements with YARN in CDH5:
    1. YARN manages all Impala resources
    2. YARN only sets Impala's memory limit; Impala uses AC
    3. YARN uses pools; Impala operates on pools with queries
* See [Dynamic Resource Pools](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_resource_pools.html) in CM
    * <i>Configuration sets</i> define client groups (e.g., prod, mktg)
    * <i>Scheduling rules</i> apply to configuration sets
    * Pools can be constrained by authorization, query count, queue size, memory requirements
* CM UI, Cluster > ClusterName > Dynamic Resource Pools

---
<div style="page-break-after: always;"></div>

## <center> More on Admission Control </center>

* Uses the same pool definitions as YARN
* Three actions: execute, queue, or reject a query
* Decision based on:
    * Currently running queries
    * Resources available (only memory is checked at present)
    * Current queue length
* The local impalad decides, using cached global data
    * Given possible delays, admission control is soft
* Favors keeping tasks alive over maintaining headroom
    * Work to improve this area is ongoing

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_dynamic_prioritization"/> Dynamic Prioritization

* Ongoing, mediated balance of resources to workload
    * Use multiple scheduler queues
    * Apply opportunistic processing to improve utilization
    * The trick is balancing low-latency and batch processing tasks
* Effort is ongoing to improve resource estimation
* One project: a <strong>L</strong>ow-<strong>L</strong>atency <strong>A</strong>pplication <strong>MA</strong>ster ([LLAMA](http://cloudera.github.io/llama/)) for Impala
    * Released on CDH5 as a beta component
    * Goal: to run all Impala queries using one ApplicationMaster
        * Cache resources, minimize interaction with RM
    * Like YARN for CDH4, not production-ready

---
<div style="page-break-after: always;"></div>

## <center> Current Practices for YARN & Impala

* Prefer Admission Control over straight RM
* LLAMA is experimental
    * Feedback is great -- if the customer is up for it
* Current best practices
    * Use Static Resource Pools for coarse-grained service isolation
    * Impala with AC to set resource limits by user/group
    * Try [LLAMA](http://cloudera.github.io/llama/) on Pilot/Dev/Staging

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Doing the Math

* [Use this guide](http://www.cloudera.com/content/cloudera/en/documentation/core/v5-3-x/topics/cdh_ig_yarn_tuning.html), if needed, to answer the following questions. 
    * How much RAM does an Impalad process need, at minimum?
    * What percentage of RAM should be earmarked for the OS and system services?
    * Under what condition(s) would you allot two cores per spindle in your calculations?
    * Assume 20 vcores, 128 MB RAM, and ten spindles on eight worker nodes. Using the Container Formulas listed in Table 8, what is the derived value for mapreduce.jobs.maps? Show your work carefully.
    
Email these questions and your answers to them to the instructors.     

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Tuning for YARN

* Review the file <code>yarn/YARNtest.sh</code> in the course repository
    * It may be broken but still execute
* Copy it to a cluster node and get it working
    * You can limit the loops to one value each in this phase
* Run the tests 
    * Raise the parameters to max out your cluster, if necessary
* Email the instructors with
    * The final version of your script (hint: useful comments are good)
    * The results of your least and most efficient runs

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Static Service Pools

* In CM, navigate by menu: Clusters->YARN Applications or by service: YARN(MR2 Included) -> Applications
    * Click the Charts tab and capture the page.
* Navigate to Clusters -> Static Service Pools
    * Allocate 25% to HDFS and 75% to YARN and click Continue
    * On the Step 2 of 4 page, review the sections and proposed values
    * Complete the wizard: redeploy client configurations and restart the cluster
    * Capture the Step 1 of 4 page after the restart
* Email the captures to your instructors

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

<!-- material to add

* Wizards include
    * Express Install
    * Add Service/Role
    * Upgrade CM and CDH 
    * Enable HA (NameNode, JobTracker, Oozie, YARN RM)
* Some useful ones are buried here and there
    * <code><i>Service</i>->Instances->Add Role Instances->View By Host</code> (button)

-->

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_overview"/>CM Overview

<center> <img src="http://blog.cloudera.com/wp-content/uploads/2013/07/ClouderaManagerVocabulary.png" height="390" width="600"> </center>

---
<div style="page-break-after: always;"></div>

## <center> Cloudera Manager Server Implementation

* Written in Java
* Manages and monitors -- **not** a cluster console


---
<div style="page-break-after: always;"></div>

## <center> Cloudera Manager Agent Implementation</center>

* Written in Python
* Configuration file: <code>/etc/cloudera-scm-agent/config.ini</code>
* Resources: <code>/usr/lib64/cmf/agent</code>
* Process control: <code>/var/run/cloudera-scm-agent</code>
    * Config files that operate on services live in <code>process/</code>
* Uses [supervisord](http://supervisord.org/) for process control

---
<div style="page-break-after: always;"></div>

## <center> Notes on Cloudera Manager vocabulary<p>

* [Philip Zeyliger's blog article on CM's design and operation](http://blog.cloudera.com/blog/2013/07/how-does-cloudera-manager-work/)  
* CM uses [service descriptors](http://cloudera.github.io/cm_api/docs/cm-concepts/) that evolve as new features emerge 
    * [Primer for CM 4](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/latest/Cloudera-Manager-Introduction/cmi_primer.html) 
    * [Primer for CM 5](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Introduction/cm5i_primer.html)
* For deep-divers: compare the CM API [4.7](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/latest/Cloudera-Manager-Introduction/cmi_api.html) (v5), with [5.x](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Introduction/cm5i_api.html), (v6, v7)
* Colloquial terms
    * Canary: a test to determine a running service is functional
    * Safety valve: used to override/correct   

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_search_bar"/> CM Search Bar Features

* Search bar in the upper right expands when selected
* The "/" hotkey lists searches by rank
    * Type-ahead feature: try "/sq" vs. "sq"
* Entering a property name returns a config link
    * Try "dfs.datanode.max.xciever"
    * Try "Transceiver"
* The Configuration tab for each service hosts a context-limited search bar
    * Go to the Flume service's Configuration tab and type "Solr"
* Notice the search results are <i>typed</i>
    * Roadmap: adding FAQs, KB articles to search

---
<div style="page-break-after: always;"></div>

## <center> Global search types

* Most types are searchable
    * chart*
    * command
    * config*
    * global*
    * host
    * link*
    * role
    * service

Enter an object type in the search bar

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

## <center> Note on [Custom Service Descriptors](https://github.com/cloudera/cm_ext/wiki/CSD-Overview)

* Cloudera uses parcels to bundle CDH and other software
* We use CSDs to integrate software with Clouidera Manager's services
    * Monitoring and charting
    * Resource management (cgroups)
    * Service lifecycle controls
    * Property configuration
    * Host/role assignments
* A customer may ask about using CSDs
    * We do encourage adding third-party apps to HUE
    * But CM features are admin-driven, not user-driven
    * [One partner says they're useful](http://blog.cloudera.com/blog/2014/04/how-to-extend-cloudera-manager-with-custom-service-descriptors/) for supporting gateway/edge nodes

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

* Client-side interfaces for binding to the policy engine
    * Hooks for impalad and HiveServer2 supply the hooks
* Service Provider interfaces for persisting policies to a store
    * Support for file storage to HDFS or local filesystem
* The policy engine grants/revokes access
    * Rules applied to user, the objects requested and the necessary permission
* A fully-formed [config example is here](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH4/4.6.0/CDH4-Security-Guide/cdh4sg_Sentry.html?scroll=concept_iw1_5dp_wk_unique_1)
* You can watch a short [video overview here](http://vimeo.com/79936560)
<!-- can also throw in my own "Notes on Configuring Sentry" as a handout

---
<div style="page-break-after: always;"></div>

## <center> Sentry and [HiveServer2](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_hiveserver2_configure.html)

<center><img src="https://blogs.apache.org/sentry/mediaresource/1554e24d-1365-4feb-9d0d-5832ecb90628"></center>

---
<div style="page-break-after: always;"></div>

## <center> [Sentry as a Service](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_sentry_service.html)

* Relational model and storage 
    * Introduced in CDH 5.1.0/CM 5.1.0
    * Can leverage CM database server
* CDH supports migration to database from file-based policies
    * CLI version: <code>sentry --command config-tool --policyIni *policy_file* --import</code>
* Mutually exclusive with file-based provider
    * Cannot use Sentry service in parallel with File-based configuration
* However, the service can be enabled for Hive only or Impala only
    * Allows Impala privileges to evolve separately rather than inherit from Hive

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
    * Or you can use [RedHat's documentation](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Managing_Smart_Cards/installing-kerberos.html)
    * Make sure your KDC allows renewable tickets
    * Create a KDC account for the Cloudera Manager user

---
<div style="page-break-after: always;"></div>

## <center> Security Lab
## <center> [Enabling Kerberos with CM](http://www.cloudera.com/content/cloudera/en/documentation/cloudera-manager/v5-1-x/Configuring-Hadoop-Security-with-Cloudera-Manager/cm5chs_s4_kerb_wizard.html)

* Find the wizard in CM and follow it.
* Use the links given with this presentation to answer the wizard

---
<div style="page-break-after: always;"></div>

## <center> Optional challenge - Test-driven setup
## <center>[JDBC Connections in a Kerberised Cluster](http://blog.cloudera.com/blog/2014/05/how-to-configure-jdbc-connections-in-secure-apache-hadoop-environments/)</center>

* There's more work to this lab. If you choose to do it, you will:
    * Ignore the section on setting up CDH 5 (you've done that)
    * Test client connectivity with JDBC
    * Set up and integrate an Active Directory instance
    * Test with a secured client connection
    * Enable Kerberos
    * Add a Sentry configuration to the mix
    * Test client connection again
 
If you're familiar with AD already, this may take an hour. Let your
instructor know if you will attempt this lab instead of the shorter
one. There's no need to do both unless you want the practice.

---
<div style="page-break-after: always;"></div>

## <center> Security Lab (Choose A or B)

Complete *one* of the following labs:<p>

* [Sentry Policy File Configuration](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_sentry.html)
* [Sentry as a Service Configuration (new in CDH 5.1)](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_sentry_service.html)

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

* HUE 3.7 released in October, 2014
* Your self-help resource site: [gethue.com](http://gethue.com)
* Several walk-throughs [available on Vimeo](http://vimeo.com/search?q=gethue)
    * These are short/compressed 
* Provides the front end for [Cloudera Live](http://www.cloudera.com/content/cloudera/en/products-and-services/cloudera-live.html)

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
    * Can also use HiveServer2
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

* [Oozie Dashboard](http://demo.gethue.com/oozie/)
* [Workflow Manager](http://demo.gethue.com/oozie/list_workflows/)

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
* Embedded database is <code>(SQLite)</code>
    * Also supported: [MySQL, PostgreSQL, Oracle](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Requirements-and-Supported-Versions/cdhrsv_db.html)
* Inspectable: <code>sqlite3 /var/lib/hue/desktop.db</code>  

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Self-guided walk-throughs

* [Demo a query (Impala)](http://blog.cloudera.com/blog/2013/10/explore-the-impala-app-in-hue/)
* [Demo a job submission](http://gethue.com/hadoop-tutorial-submit-any-oozie-jobs-directly-from/)
* [Single sign-on (SSO) Support](http://blog.cloudera.com/blog/2013/10/enabling-sso-authentication-in-hue/)
* [LDAP integration](http://blog.cloudera.com/blog/2014/02/how-to-make-hadoop-accessible-via-ldap/)

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Standalone Installation </center>

* Use [this documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_hue_installation.html)
* Install a standalone instance of HUE on one of your worker nodes
* Have a lab partner access your instance and explore
    * Let them add/delete a file, etc.
* Add the user/password: instructor/cloudera
* Email a capture of this HUE instance along with the URL **in** **text** 

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Connect to Sentry Service

* If you set up Sentry with a file-based provider, go back and install it as a service
* Use [this tutorial](http://gethue.com/apache-sentry-made-easy-with-the-new-hue-security-app) to connect to the service
* Email your hue.ini file when it is complete and working

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Authenticate using Linux users/groups

* Do this work on your standalone HUE instance
* Add a Linux user account 'bootcamper' with the password 'cloudera' to that host. 
* [Use this guide](http://gethue.com/hadoop-tutorial-how-to-integrate-unix-users-and-groups/) to log into HUE with the bootcamper account.
* You can show this working to either instructor -- no other report is required.

---
<div style="page-break-after: always;"></div>

## <center> HUE Bonus Lab: Speeding up HUE Service 

* Your HUE standalone installation should be version 3.8
* If so, [follow this guide](http://gethue.com/using-nginx-to-speed-up-hue-3-8-0/) to accelerate HUE responsiveness 
* Capture the screen for nginx and email it.

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

* The mantra: we need partners to win
    * The program, on the other hand: slowly forming
    * Cloudera University training is user, not field-partner oriented 
    * This is the third delivery for field training.
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

* You're going to build a C5.x cluster and kerberise it
* You will document your progress by emails 
    * mfernest@cloudera.com
* Submit challenges as you complete them. Do not wait until the end and submit them all.
* If you brick your cluster and determine you can't continue, let me know immediately.
* Occasionally I ask for explanations of your results. If you miss them, the stage is considered incomplete.

---
<div style="page-break-after: always;"></div>

## <center> Before You Start

* Include in an email with the subject line: <Your Name> - Boot Camp Challenges
    * A list of your EC2 nodes' DNS names
    * Indicate which node will have the utility role
    * Attach a terminal-based screen capture that shows this node's uptime.
    * Also show the results for the command <code>hadoop fs -ls /</code>
    * Create a Linux user account, using your own first name, with a UID of 1500
* You may begin after this email is submitted.

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1 - Install an external db server for CM

* Install a MySQL 5.6 server on any non-utility node 
    * Add a repo; install the server and client packages only
    * Download and install the JDBC connector JAR file
* Add databases for Cloudera Management Services and Hive Metastore
* Submit the following components as screen captures:
    * The node hosting your MySQL server
    * The login/password for each database you added
    * The full text of your MySQL repo file
    * Describe the method you used to retrieve to connector, or submit the command-line invocation.

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2 - Install Cloudera Manager

* Install the Cloudera repo on your utility node
* Install the latest version of Cloudera Manager
* Create a MyOverlord account with the password is_michael
   * Assign Full Administrator privileges to this account
* Submit the following components:
    * List of files in <code>/var/log/cloudera-scm-server</code>
    * Full output from the CM API endpoint <code>api/v10/cm/deployment</code>
    * Indicate the new CM account has been tested and is ready to use

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Install CDH 5.3.0
* Enable ZooKeeper, HDFS, YARN and Hive **only**
* Enable NameNode HA
* Name this cluster <code>NHBC</code>
* Create an HDFS directory <code>/user/*youraccount*</code>
* Submit the following components
    * Node hosting the Standby NameNode
    * Full output from the CM API endpoint <code>api/v10/cm/deployment</code>
    * Username/password to the Metastore database in MySQL
    * Output of <code>hdfs dfs -ls /user</code>

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - Testing

* Tune YARN using the findings from your lab exercise
* Run the following tests on **each** node
    * <code>hdparm -t</code> on the node's volume(s)
    * <code>dd if=/dev/zero bs=1M count=2048 | md5sum</code>
    * Retain the results for the fastest and slowest runs only
* teragen/terasort a file of 102,400,000 records 
    * Use <code>time(1)</code> to record process duration
    * Enforce a 64MB block size
    * Change the default mapper count, if you wish
    * Write the results to your user's HDFS directory
* Submit the following components
    * Results of the <code>hdparm</code> and <code>dd</code> commands as specified above
    * The full <code>terasort</code> and <code>teragen</code> commands you used
    * The elapsed time for each command
    * Output of <code>hdfs dfs -ls /user</code>

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Secure your cluster as follows:
    * Create a KDC to support the realm <code>CHALLENGE.FCE</code>
    * Authenticate with your user account. Keep the commands/output from both <code>kinit</code> and <code>klist</code>  
* Enable Kerberos using the Cloudera Manager wizard
* Run a small 
* Submit the following:
    * The transcript od your command-line authentication
    * The full text of your <code>kdc.conf</code> file
    * A screen shot of the <code>Credentials</code> tab from your <code>Administration -> Kerberos</code> screen

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Configure Sentry as a Service

* Add a database for Sentry in your MySQL server
* Enable and configure the Sentry service
* Create an admin role in Sentry and map your user account to it.
* Submit the following:
    * <code>SHOW TABLES</code> output for your Sentry database
    * <code>SHOW GRANTS</code> output too
* If you've still got time, run a validation query on Hive from Hue and capture/submit the result.
     
* <strong>EMAIL WHAT YOU HAVE NO LATER THAN 11:45 AM, PDT</strong>

* Please complete the course survey: <code>http://tinyurl.com/fce-bc-survey</code>

* <strong>In one last email</strong>: I want you to evaluate, in your own words, a) this course; and b) your own readiness. Specifically, I want you to note:
    * How long would you need to finish the challenges today (assuming you didn't)?
    * Which section of this course helped you the most? The least?
    * Which aspect of this course did you like the most? The least?
    * What other resources do you need to improve (training, practice time, mentoring)?

---
<div style="page-break-after: always;"></div>
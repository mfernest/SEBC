<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---

## <center> <a name="cm_cdh_installation_section"/>Cloudera Manager & CDH Installation

* <a href="#install_methods">Installation Methods</a>
* <a href="#parcels">Understanding Parcels</a>
* <a href="#db_setup">Embedded vs. external database</a>
* <a href="#cm_cdh_key_points">Supplemental CM/DH Points</a>
* <a href="#cm_ui_overview">Cloudera Manager UI Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="install_methods"/> CM/CDH Installation

* We use Cloudera  Manager to:
    * Manage host systems
    * Create host clusters and deploy services
    * Track and adjust service properties
    * Automate tasks such as HA NameNode, Active Directory integration
    * Monitor hosts and services via agent processes

---
<div style="page-break-after: always;"></div>

## <center> Cloudera Manager architecture

<center> <img src="http://www.cloudera.com/content/cloudera/en/documentation/core/latest/images/cm_arch.png"> </center>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_paths"/>Installation paths

* [Path A: One-stop binary installer](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_a.html)
    * Used for short-term, throwaway projects 
    * Embedded PostgreSQL server 
* [Path B: Install CM, CM deploys CDH](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_b.html)
    * Production clusters
    * Supports Oracle, MySQL, and PostgreSQL servers
    * Installs CDH with Linux packages or [Parcels](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_ig_parcels.html)
* [Path C: Tarballs](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_c.html)
    * Privileged access is not available
    * Other deployment tools will be used
    * Integration with CM not important

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_logging"/>CM Installation Milestones with Path A []()

* Linux configuration/prechecks
* Install package repositories for database server and Cloudera Manager
* Install Oracle JDK package
* Install database server
* Install Cloudera Manager
* Add hosts, then deploy cluster

* Field engineers typically prepare for an install engagement by reviewing:
    * [Well-known issues](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_troubleshooting.html)
    * [Ongoing problems and workarounds](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_rn_known_issues.html)
    * [Recently closed JIRAs](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_rn_fixed_issues.html) too.

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_milestones"/> Path B Steps []()

0. Review hardware, OS, disk, and network/kernel settings
1. Install Oracle JDK
    * Included with Cloudera Manager's package repo 
    * OpenJDK is not supported by Cloudera
2. Install [database server](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html?scroll=cmig_topic_5_2_unique_1#cmig_topic_5_1_unique_1)
3. Install the CM server and agent packages
    * Add JDBC database connector to all nodes
4. Distribute CM agent software 
5. Distribute CDH (with packages or parcels)
6. Deploy and enable services<p>

---
<div style="page-break-after: always;"></div>

## <center> <a name="parcels"/> Installing CDH with Parcels

Parcels are [CM-dedicated packages](https://github.com/cloudera/cm_ext/wiki/Parcels:-What-and-Why%3F)

* Bundle Cloudera's supported Hadoop components into one distribution 
    * With supplementary parcels for some components
* Simpler than managing Linux packages
    * Default location requires no privileges: <code>/opt/cloudera/parcels</code>
    * Easy to create and maintain a local parcels repo 
* Components bind to CM through [Custom Service Descriptors] (https://github.com/cloudera/cm_ext/wiki/CSD-Overview)
* Tarball with [manifest and layout rules](https://github.com/cloudera/cm_ext/wiki/Building-a-parcel)
    * List of contents kept in <code>meta/parcel.json</code> 
    * Client download checks via a <code>manifest.json</code> file kept by server

---
<div style="page-break-after: always;"></div>

## <center> Parcel Lifecycle</p>

<center> <img src="http://blog.cloudera.com/wp-content/uploads/2013/05/parcels1.png"> </center> 

* [How to manage parcels](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Installation-Guide/cm5ig_parcels.html)

---
<div style="page-break-after: always;"></div>

## <center> Parcels Lifecycle 

* Lifecycle actions
    * Download
    * Distribute
    * Activate/deactivate
    * Remove
    * Delete<p/>
* The directory <code>/opt/cloudera/parcels/CDH</code> always links to the active parcel

---
<div style="page-break-after: always;"></div>

## <center> <a name="db_setup"/>Setting up the database

* <a href="#cm_service_dbs">Services that use a database</a>
* <a href="#cm_embedded_db">CM's embedded database</a>
* <a href="#cm_replicate_db">CM database replication for HA</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_service_dbs"/>[Databases and Other Stores](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html) 

* Management Services (one CM instance)
    * Reports Manager (aka <code>rman</code>)
    * Navigator Audit & Metadata Servers (not covered this week)
    * Activity Monitor (<code>amon</code>) is used by the MapReduce service only
    * Host and Service Monitors implement [LevelDB](https://github.com/google/leveldb) 
* CDH Services 
    * Hive Metastore
    * Sentry 
    * [Oozie](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_oozie_service.html#cmig_topic_14_unique_1)
    * [Hue](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_hue_service.html#cmig_topic_15_unique_1) 
    * Sqoop2 (Derby and PostgreSQL only)

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_replicate_db"/> MySQL Replication for HA </a></p>

* Several prerequisites to configure Cloudera Manager for active-passive HA
    * Load balancer(s) that can proxy multiple ports
    * An HA network store for Management Services
    * Heartbeat package for fail-fast detection
    * Database server configured for HA
        * We'll [install MySQL and replicate the server](http://dev.mysql.com/doc/refman/5.0/en/replication-howto.html) 

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_ui_overview"/>Path A Install Demo 

<center> <img src="CM5_Installer_Screen.png"/>

---
<div style="page-break-after: always;"></div>

## <center> CM Install Labs - *Before* You Start

* Verify you have been added as a Collaborator to the SEBC repo
    * Fork the repo to your own GitHub Account
    * In the Settings tab of your fork, enable the Issues feature
    * Add instructors as Collaborators (mfernest, dbeech)
    * Each lab section tells you what to submit and how
    * Clone your repo to your laptop
* Submit work in plain text, Markdown, or PNG for screen captures
    * Please do not operate directly on the upstream repo

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab - AWS

* You should already have an AWS account and have practiced creating EC2 nodes.
    * If not, [there's a lot of work ahead of you](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html). 
* Create 4-5 EC2 nodes
    * <code>m3.xlarge</code> instances are good; <code>m3.large</code> are adequate
    * Don't get spot instances
    * Use five nodes if you want a separate instance for Cloudera Manager and client access
    * Be sure to use a [Cloudera-supported OS](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_cm_requirements.html), preferably CentOS.
    * You can AWS Marketplace [to find a proper AMI](https://aws.amazon.com/marketplace/pp/B00IOYDTV6) 
    * [Get all the free volume space you can](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-add-volume-to-instance.html)
    * Keep security constraints to a bare minimum

---
<div style="page-break-after: always;"></div>

## <center> CM Install Labs - Path B Installation Overview

* Add your nodes' public IPs to <code>installation/0_nodeIPs.txt</code>
* Document your configuration checks in 1_preinstall.txt</a>
    * For bonus points, script it as a TDD exercise
* Install a MySQL server and replica
* Install the latest versions of CM & CDH
* <a href="#parcels_repo_lab">Bonus: create a Parcels repository</a>

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="linux_config_lab"/>Linux Configuration Checks

The checklist below is culled from this [overview of critical
settings] (http://tiny.cloudera.com/7steps). It is a small part of
a typical pre-engagement checklist.

Follow the steps below. In each case, use a command to show the
current value of each property covered. Show the command you used
to correct a value if needed, followed by the first command again
to show the change.

Capture this work in the file <code>installation/1_prechecks.txt</code>.
Although you will check each node in your cluster, you only have
to report the work for one of them.

1. Check <code>vm.swappiness</code> on all your nodes
    * Set the value to <code>1</code> if necessary
2. Set <code>noatime</code> on any non-root volumes you have
3. Set the reserve space on any non-root volumes to 0
4. Set the user limits to maximum file descriptors and processes
5. Test forward and reverse host lookups for correct resolution
6. Enable the <code>nscd</code> service
7. Enable the <code>ntpd</code> service

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="mysql_replication_lab"/>Configure MySQL with a replica server

Choose one of these plans to follow:

**Plan One**: follow the steps [documented here](http://www.cloudera.com/content/cloudera/en/documentation/core/v5-3-x/topics/cm_ig_mysql.html?scroll=cmig_topic_5_5#cmig_topic_5_5_1_unique_1).<br>
**Plan Two**: Follow the steps given below<br>
**Plan Three**: Freestyle it

Email both instructor(s) with your chosen plan **before** you start.

**Details of Plan Two**

1. Install the following MySQL 5.5 packages
    * <code>mysql</code> on all nodes
    * <code>mysql-server</code> on the server and replica nodes
    * Download and copy [the JDBC
    connector](http://dev.mysql.com/downloads/connector/j/5.1.html) to
    all nodes as required. Do **not** install the connector from a package.<p>
2. You should not need to edit your <code>/etc/my.cnf</code> file
    * The starter file in the repo is a MySQL 5.1.x example, and is incomplete.
    * You will need to add proper settings to enable replication. Consult MySQL documentation.<p>
3. Run the <code>mysql_install_db</code> program as the <code>mysql</code> user on the master and replica nodes node before you start the <code>mysqld</code> service. This should create files with the correct permissions.<p>
4. Start the <code>mysqld</code> service.
4. Use <code>/usr/bin/mysql_secure_installation</code> to:<br>
    a. Set password protection for the server<br>
    b. Revoke permissions for anonymous users<br>
    c. Permit remote privileged login<br>
    d. Remove test databases<br>
    e. Refresh privileges in memory<br>
    f. Refreshes the <code>mysqld</code> service<p>
5. On the master MySQL node, grant replication privileges for your replica node:<br>
    a. Log in with <code>mysql -u ... -p</code> <br>
    b. Note the FQDN of your replica host.<br>
    c. <code>mysql> **GRANT REPLICATION SLAVE ON \*.\* TO '*user*'@'*FQDN*' IDENTIFIED BY '*password*';**</code><br>
    d. <code>mysql> **SET GLOBAL binlog_format = 'ROW';** </code><br>
    e. <code>mysql> **FLUSH TABLES WITH READ LOCK;</code>**<p>
6. In a second terminal session, log into the MySQL master and show its  status:<br>
    a. <code>mysql> **SHOW MASTER STATUS;**</code><br>
    b. Capture the file name and byte offset. The replica uses this info to sync to the master.<br>
    c. Logout and dismiss the second session; remove the lock on the first with <code>mysql> **UNLOCK TABLES;**</code><p>
7. Now log on to the replica. Use the following statements to coneect with the master:<br>
    <code>mysql> **CHANGE MASTER TO**<br> **MASTER_HOST='*master host*',**<br> **MASTER_USER='*replica user*',**<br> **MASTER_PASSWORD='*replica password*',**<br> **MASTER_LOG_FILE='*master file name*',**<br> **MASTER_LOG_POS=*master file offset*;**</code><p>
8. Next, initiate slave operations and confirm sync up.<br>
    a. <code>mysql> **START SLAVE;**</code><br>
    b. <code>mysql> **SHOW SLAVE STATUS \G**</code><br>
    c. If successful, the <code>Slave_IO_State</code> field will read <code>Waiting for master to send event</code><br>
    d. Once successful, capture this output and store it in <code>installation/2_replica_working.txt</code><br>
    e. If unsuccessful, review your log (<code>/var/log/mysqld.log</code>) for errors. If stuck, consult with a colleague or instructor.<p>

---
<div style="page-break-after: always;"></div>

## <center> CM/CDH Install Lab
## <center> Path B using Cloudera 5.5.x

[The full rundown is here](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_b.html?scroll=cmig_topic_6_6). Ensure the following settings:

* Do not use single user mode when asked
* Use only Cloudera's standard repositories
* Ignore all wizard steps marked "(Optional)"
* Use the Data Hub Edition 
* Install CDH using parcels
* Rename your cluster to your GitHub name
* Enable the Coreset of CDH services **only** if you are using <code>m3.large</code> instances. 
* Assign three ZooKeeper instances, not one.
* Take a screenshot of your CM home page 
    * Rename the file to <code>3_cm_installed.png</code> and add it to your <code>installation/</code> directory.
* Email your instructors with the URL for your CM server

---
<div style="page-break-after: always;"></div>

## <center> Cluster install: Bonus lab
## <center> <a name="parcels_repo_lab"/>Create a local parcel repo (manual)

* Click the parcel indicator in CM's navigation bar
    * Under Settings, note the Remote Parcel Repository URLs value
* Default parcel links include:
    * [Latest CDH5 release](http://archive.cloudera.com/cdh5/parcels/latest)
    * [Latest CDH4 release](http://archive.cloudera.com/cdh4/parcels/latest)
    * Standalone components (such as Accumulo or Kafka)
* Follow the [documentation] (http://www.cloudera.com/documentation/enterprise/latest/topics/cm_ig_create_local_parcel_repo.html)
* Set the new repository location in Cloudera Manager
* Capture this change in a screenshot and move it to <code>installation/4_local_repo.png</code> 

---
<div style="page-break-after: always;"></div>

## <center> Cluster install: Bonus Material
## <center> <a name="scripted_install_lab"/>Auto-deploy CM

* If you are interested in learning about automated installs:
    * Fork/clone [Justin Hayes' auto-deployment work](https://github.com/justinhayes/cm_api/tree/master/python/examples/auto-deploy)
    * Follow instructions, including validation test of the install, as given in the README
* No submissions are needed for this lab, but add any notes you wish to keep.

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_cdh_key_points"/> Summary Points

* The CM release may be any later version than the CDH release
    * Several customers use CM 5.x to monitor CDH 4.x clusters
* Configuring CM HA is [publicly documented as of Cloudera 5.4](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/admin_cm_ha_overview.html)
* CDH has no dependencies on Cloudera Manager. There are however features in CM that are not part of upstream Hadoop.
* CM has a REST API
    * Each API version is a superset of all prior versions
    * Try <code>http://<i>your_cm_host</i>:7180/api/version</code> in your browser
    * Note some recent  endpoints won't apply to 4.x CDH releases
        * You can browse the [CM API here] (http://cloudera.github.io/cm_api/)


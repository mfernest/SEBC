<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---

## <center> Monday PM
## <center> <a name="cm_cdh_installation_section"/>Cloudera Manager & CDH Installation

* <a href="#install_methods">Installation Methods</a>
* <a href="#parcels">Understanding Parcels</a>
* <a href="#db_setup">Installing an external database</a>
* <a href="#cm_cdh_key_points">Supplmental CM/DH Points</a>
* <a href="#cm_ui_overview">Cloudera Manager UI Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="install_methods"/> CM/CDH Installation

* <a href="#cm_install_paths">Documented paths</a>
* <a href="#cm_install_milestones">Using installation milestones</a>
* <a href="#cm_install_logging">Logging milestones</a>
* <a href="#word_on_cloudera_director">Cloudera Director</a>

---
<div style="page-break-after: always;"></div>

## <center> Cloudera Manager architecture

<center> <img src="http://www.cloudera.com/content/cloudera/en/documentation/core/latest/images/cm_arch.png"> </center>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_paths"/>Installation paths

* [Path A: One-stop binary installer](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_a.html)
    * For short-term, admin-lite clusters (pilots, POCs, dev)
    * Uses "embedded" PostgreSQL database server
* [Path B: You install CM, CM installs CDH](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_b.html)
    * Long-term or production-ready cluster
    * External database server (Oracle, MySQL, PostgreSQL)
* [Path C: Tarballs](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_c.html)
    * No root/sudo access 
    * Complements other deployment tools
    * Cloudera Manager not required

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_milestones"/> Path B Steps []()

0. Verify supported platform and appropriate settings
1. Install Oracle JDK
    * Included with Cloudera Manager package repo
2. Install a [DB server supported by Cloudera Manager](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html?scroll=cmig_topic_5_2_unique_1#cmig_topic_5_1_unique_1)
    * Used by Management Services: Service Monitor, Host Monitor, Navigator, etc.
    * CDH services backed by db: Hive Metastore, Oozie, Hue 
3. Install the CM Server package
    * Omit the embedded database package
4. Distribute CM agent software (by hand or with CM)
5. Distribute CDH (packages or parcels)
6. Deploy CDH services<p>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_logging"/>CM Installation Milestones []()

* Linux configuration/prechecks
* Install package repositories for database server and Cloudera Manager
* Install Oracle JDK package
* Install/configure/initialize database server
* Install/configure/initialize Cloudera Manager
* Add hosts, then deploy cluster

* Review [well-known conditions](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_troubleshooting.html)
* Review [known problems and workarounds](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_rn_known_issues.html) before installing.
* Review [recently fixed issues](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_rn_fixed_issues.html) too.

---
<div style="page-break-after: always;"></div>

## <center> <a name="parcels"/> Installing CDH with Parcels

Parcels are [CM-specific packages](https://github.com/cloudera/cm_ext/wiki/Parcels:-What-and-Why%3F) used to:

* Bundle services of one CDH release
* Work around Linux packaging requirements
    * Non-privileged location: <code>/opt/cloudera/parcels</code>
    * Multiple parcel versions can coexist 
    * Making a local parcels repo is straightforward
* Encapsulate CM integration hooks (Custom Service Descriptors)
* Minimizes upgrade and downgrade windows 

---
<div style="page-break-after: always;"></div>

## <center> Parcel Lifecycle</p>

<center> <img src="http://blog.cloudera.com/wp-content/uploads/2013/05/parcels1.png"> </center> 

* [How to manage parcels](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Installation-Guide/cm5ig_parcels.html)

---
<div style="page-break-after: always;"></div>

## <center> Parcels Lifecycle and Administrivia

* Lifecycle actions
    * Download
    * Distribute
    * Activate/deactivate
    * Remove
    * Delete<p/>
* Naming convention: <code>*objectname*-*version*-*[distro suffix](https://github.com/cloudera/cm_ext/wiki/Parcel-distro-suffixes)*.parcel</code> 
* Tarball with [manifest and layout rules](https://github.com/cloudera/cm_ext/wiki/Building-a-parcel)
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
* See the latest [User Guide](http://www.cloudera.com/content/cloudera/en/documentation/cloudera-director/latest/PDF/cloudera-director.pdf)
* Automating a cloud deployments is not part of this boot camp.

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

* Management Services
    * Reports Manager
    * Navigator Audit & Metadata Servers
* CDH Services
    * Hive Metastore
    * Sentry 
    * [Oozie](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_oozie_service.html#cmig_topic_14_unique_1)
    * [HUE](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_hue_service.html#cmig_topic_15_unique_1) 

*The Host and Service Monitors use [LevelDB](https://github.com/google/leveldb).

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_embedded_db"/> CM's embedded database</a> 

The PostgreSQL server bundled with CM is not production-oriented.
We support Oracle, MySQL, and PostgreSQL as external servers.

* Some people install with Path A because fast means awesome.
* You can migrate to an external database later, but:
    * It's tedious
    * It forces service restarts
    * It trades a little savings up front for a lot of extra work later on
* Some customers silo all database creation -- this is ok.

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_replicate_db"/> MySQL Replication for HA </a></p>

* Many customers want to de-SPOF everything, no questions asked. 
    * [Replicating MySQL](http://dev.mysql.com/doc/refman/5.0/en/replication-howto.html) is one piece. 
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

* Email both instructor with this subject line:
    * [Your Name] - Boot Camp Lab Work
    * Like this: [Michael Ernest] - Boot Camp Lab Work
* Use one thread for all submissions 
    * This step saves me a lot of time evaluating your work
* Each lab tells you what to submit and when
* Include host/cluster information in every requested screen shot

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab - AWS

* You should have an AWS account established and practiced creating EC2 nodes.
    * If not, [you've got work ahead of you](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html). 
* Create 4-5 EC2 nodes
    * Don't use spot instances; you have deadlines for coursework
    * Use five nodes if you want to have a separate Cloudera Manager node 
    * Use m3.large instances (or larger)
    * Use a [Cloudera-supported version](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_cm_requirements.html) of RHEL/CentOS.
    * Use AWS Marketplace [to find a suitable AMI](https://aws.amazon.com/marketplace/pp/B00IOYDTV6) 
    * [Get more volume space to work with](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-add-volume-to-instance.html)
    * Hint: keeping security wide-open is easier to practice with

---
<div style="page-break-after: always;"></div>

## <center> CM Install Labs - Overview

* Submit the public IPs of your EC2 nodes to the instructor(s)
* Run <a href="#linux_config_lab">OS configuration checks</a>
* Install <a href="#mysql_replication_lab"> MySQL</a>
* Follow Installation Path B (guidance below)
* <a href="#parcels_repo_lab">Create a Parcels repository</a>
* <a href="#scripted_install_lab">Bonus work: Write a script for your pre-checks</a>

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="linux_config_lab"/>Linux Configuration Check

This checklist draws from a [presentation on Slideshare](http://tiny.cloudera.com/7steps). It is a small sample of a full install precheck. 

For this lab, complete the steps below. Show the commands you used and the output for each step in a separate screenshot. Make sure the screenshot indicates the host. 

1. Check <code>vm.swappiness</code> on all your nodes
    * Set the value to <code>1</code> if necessary
2. Set <code>noatime</code> on your supplementary volumes
3. Set the reserve space for your supplementary volumes to 0
4. Verify the user resource limits for max file descriptors and processes
5. Test forward and reverse host lookups. If you use the <code>/etc/hosts</code> file: 
    * The [FQDN](https://en.wikipedia.org/wiki/Fully_qualified_domain_name) must be listed first  
    * The IP address <code>127.0.0.1</code> must resolve to <code>localhost</code><p>
6. Enable the <code>nscd</code> service
7. Enable the <code>ntpd</code> service

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="mysql_replication_lab"/>Configure MySQL with a replica server

**Plan One**: follow the steps [documented here](http://www.cloudera.com/content/cloudera/en/documentation/core/v5-3-x/topics/cm_ig_mysql.html?scroll=cmig_topic_5_5#cmig_topic_5_5_1_unique_1).<br>
**Plan Two**: Follow the steps given below<br>
**Plan Three**: Do your own thing

Important: Email the instructor(s) with your chosen plan **before** you start.

**Details of Plan Two**

1. Install the following MySQL 5.5 packages on your CM node; any other node may host the replica 
    * <code>mysql</code>
    * <code>mysql-server</code>
    * Download and install [the JDBC connector](http://dev.mysql.com/downloads/connector/j/5.1.html).<p>
2. Edit your <code>/etc/my.cnf</code> **before** you start MySQL. 
    * The starter file in the course repo is incomplete.
    * Mind the settings related to the master and slave roles.<p>
3. Run the <code>mysql_install_db</code> as the <code>mysql</code> user on each node before starting the <code>mysqld</code> service. This will create files with correct permissions.<p>
4. The <code>/usr/bin/mysql_secure_installation</code> script does the following:<br>
    a. Sets the root password<br>
    b. Removes permissions for anonymous users<br>
    c. Allows remote login<br>
    d. Removes the test database<br>
    e. Reloads the privileges table into memory<br>
    f. Refreshes the <code>mysqld</code> service<p>
5. On the master MySQL node, grant replication privileges for all databases:<br>
    a. Log in with <code>mysql -p</code> <br>
    b. Provide the FQDN of your replica's host.<br>
    c. <code>mysql> **GRANT REPLICATION SLAVE ON \*.\* TO '*user*'@'*FQDN*' IDENTIFIED BY '*password*';**</code><br>
    d. <code>mysql> **SET GLOBAL binlog_format = 'ROW';** </code><br>
    e. <code>mysql> **FLUSH TABLES WITH READ LOCK;</code>**<p>
6. Start another terminal session and log into to MySQL. In the new session, show the master's status:<br>
    a. <code>mysql> **SHOW MASTER STATUS;**</code><br>
    b. Note the file name and byte offset. The replica needs this data to sync with the master.<br>
    c. Close the second session and remove the lock on the first session.<br>
    d. <code>mysql> **UNLOCK TABLES;**</code><p>
7. Open a session on the replica. Set the environment to locate the master:<br>
    <code>mysql> **CHANGE MASTER TO**<br> **MASTER_HOST='*master host*',**<br> **MASTER_USER='*replica user*',**<br> **MASTER_PASSWORD='*replica password*',**<br> **MASTER_LOG_FILE='*master file name*',**<br> **MASTER_LOG_POS=*master file offset*;**</code><p>
8. Initiate slave operation and determine its status.<br>
    a. <code>mysql> **START SLAVE;**</code><br>
    b. <code>mysql> **SHOW SLAVE STATUS \G**</code><br>
    c. If successful, the <code>Slave_IO_State</code> field in the output will report <code>Waiting for master to send event</code><br>
    d. Capture this output by screenshot and email it to the instructor.<br>
    e. If unsuccessful, review <code>/var/log/mysqld.log</code> for errors.<p>

---
<div style="page-break-after: always;"></div>

## <center> CM/CDH Install Lab
## <center> Path B using Cloudera 5.5.0 

[The full rundown is here](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_b.html?scroll=cmig_topic_6_6). Make the following choices:

* Do not use single user mode when asked
* Use Cloudera's standard repositories
* Ignore all steps marked "(Optional)"
* Install the Data Hub Edition 
* Install CDH using parcels
* Rename your cluster to your name
* Enable only the Coreset of CDH services -- memory is tight
* Assign a ZooKeeper role to three hosts
* Once complete, take a screenshot of your CM home page 
    * Attach the screenshot to an email addressed to the instructors
    * In the email body, give the URL of your Cloudera Manager server along with the <code>admin</code> account password.

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
* Capture this setting in CM and email it to the instructors

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


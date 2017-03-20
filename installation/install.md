<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---

## <center> <a name="cm_cdh_installation_section"/>Cloudera Manager & CDH Installation

* <a href="#install_methods">Installation Methods</a>
* <a href="#parcels">Understanding Parcels</a>
* <a href="#db_setup">Embedded vs. external database</a>
* <a href="#cm_cdh_key_points">Supplemental CM/CDH Points</a>
* <a href="#cm_ui_overview">Cloudera Manager UI Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="install_methods"/> CM/CDH Installation

* We use Cloudera  Manager to:
  * Monitor each member node's status 
  * Create clusters and deploy services
  * Modify service configurations
  * Expedite complex tasks, such as:
    * Update host agent software
    * Setting up NameNode HA
    * Integrating Kerberos & LDAP services
    * Configure & enable HDFS Encryption

---
<div style="page-break-after: always;"></div>

## <center> Cloudera Manager architecture </center>

<center> <img src="png/cm_arch.png"/> </center>

---
<div style="page-break-after: always;"></div>

## <center> Cloudera Manager features </center>

* Cloudera Manager server supports 
  * Administrative console 
  * Package and parcel repository links
  * Management Services: reports, logging, auditing
    * Uses RDBMS server for support
  * Host and Service monitoring

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_paths"/>Installation paths

* [Path A: One-stop binary installer](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_a.html)
    * Useful for short-term, throwaway projects
    * Relies on embedded, hard-configured PostgreSQL server
* [Path B: Install CM and database manually](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_b.html)
    * Any cluster standing for more than 3-6 months
    * Can use Oracle, MySQL/MariaDB, or PostgreSQL server
    * Can deploy CDH using Linux packages or [CM parcels](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_ig_parcels.html)
* [Path C: Tarballs](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_install_path_c.html)
    * DIY-oriented
    * Useful with other deployment tools (Chef, Puppet)

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_ui_overview"/>For future reference: Path A Install Screen

<center> <img src="png/CM5_Installer_Screen.png"/> </center>

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_logging"/>Installation Steps with Path A []()

* Exits if SELinux is enabled
* Installs YUM repos for [CM packages:](http://archive.cloudera.com/cm5/redhat/5/x86_64/cm/5/RPMS/x86_64/)
 * Cloudera-packaged PostgreSQL server
 * Oracle JDK 
    * Cloudera does not test/certify against OpenJDK
 * Cloudera Manager server and agents
* Install packages, configure & start Cloudera Manager
* Wizard to create a cluster and deploys services 
  * Some 'smart' configuration is baked in 
    * e.g., HDFS block limit default set to 128 MiB
    * A variety of default directories

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_install_milestones"/> Installation Checkpoints with Path B []()

* Review key hardware, OS, disk, and network/kernel settings
* Install supported Oracle JDK
* Install/configure [database server](https://www.cloudera.com/documentation/enterprise/5-9-x/topics/cm_ig_installing_configuring_dbs.html)
* Create databases & grant CM/CDH services access to them
    * Accessing MySQL/MariaDB or Oracle requires a JDBC connector
* CM will then
  * Distribute agent software
  * Distribute CDH software
  * Deploy and activate CDH services<p>

---
<div style="page-break-after: always;"></div>

## <center> <a name="parcels"/> Installing CDH with Parcels

Parcels are [CM-specific code blobs](https://github.com/cloudera/cm_ext/wiki/Parcels:-What-and-Why%3F)

* Core CDH components in one distribution
  * CM can track a list of add-on parcel locations
  * Parcels are served over http
* Easier to manage than per-product Linux packages
  * Default installation path is <code>/opt/cloudera</code>
* Most CDH components bind to CM through a [custom service descriptor](https://github.com/cloudera/cm_ext/wiki/CSD-Overview)
* A parcel is just a tarball with its own [manifest and layout](https://github.com/cloudera/cm_ext/wiki/Building-a-parcel)
  * Content list: <code>meta/parcel.json</code>
  * CM verifies a parcel's signature via a <code>manifest.json</code>
    * Ignores parcel location if signature doesn't match
    * This file is stored on the repo server only
    * Parcel files are [specific to distribution and major release[(http://archive.cloudera.com/cdh5/parcels/5.9.1/)

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
* The path <code>/opt/cloudera/parcels/CDH</code> points to the activated parcel

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_service_dbs"/>[Database Support](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_installing_configuring_dbs.html)
* Management Services (one per CM server)
  * Reports Manager
  * Navigator Audit & Metadata Servers*
  * The Host and Service Monitors don't use a relational db
    * Both use a [LevelDB](https://github.com/google/leveldb) implementation
* CDH services that need a database server
    * Hive Metastore
    * Sentry service
    * [Oozie](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_oozie_service.html#cmig_topic_14_unique_1)
    * [Hue](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_mc_hue_service.html#cmig_topic_15_unique_1)
    * [Sqoop Server](http://www.cloudera.com/documentation/enterprise/5-6-x/topics/install_sqoop_ext_db.html#concept_y53_jyf_4r), aka Sqoop2 (not discussed)

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_replicate_db"/> MySQL/MariaDB Replication for HA </a></p>

* A true, complete HA solution for Cloudera Manager is complex and expensive
* [Public documentation is here](https://www.cloudera.com/documentation/enterprise/latest/topics/admin_cm_ha_overview.html#concept_bhl_cvc_pr)
* A full HA solution required
  * A load balancer between active & passive CM instances
  * Redundant networked storage for filesystem-based stores
  * Redundant database servers
  * Heartbeat Demon software (Cloudera-supported only)
* For today's lab, we'll implement [MySQL](http://dev.mysql.com/doc/refman/5.5/en/replication-howto.html)/[MariaDB](https://mariadb.com/kb/en/mariadb/setting-up-replication/)

---
<div style="page-break-after: always;"></div>

## <center> CM Install Labs - *Before* You Start

* [Follow these instructions](../README.md) if you haven't yet
* Submit all work in Markdown format for text or PNG files for screen captures
    * Use code formatting at a minimum
* Create an Issue in your repo called `Installation Lab`
     * Add it to the `Labs` milestone
     * Assign the label `started`
* Use this Issue to journal your lab progress
    * Use comments to note each section you have finished
    * If you run into errors or other blockers, note them in the Issue
    * Also log how you fixed it

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab - Prepare your instances

* If using AWS, use the closest available data center
* Create five `m3.xlarge` nodes
  * Do not use spot instances
  * **Set your volume space to the maximum free amount**
    * The AWS default per instance (8 GB) is not enough.
* For GCE, use `n1-highmen-2` nodes
  * Do not use preemptible instances
* Make sure the AMI you choose is a Cloudera-supported OS
  * These platforms are supported for [CM 5.9.0](http://www.cloudera.com/downloads/manager/5-9-0.html)
* Use one instance to host Cloudera Manager server and edge/client-facing services
  * This includes Hue and Apache Oozie

---
<div style="page-break-after: always;"></div>

## <center> CM Install Lab
## <center> <a name="linux_config_lab"/>System Configuration Checks

Using the steps below, verify your instances for readiness. Modify
them when necessary. When putting your work in `labs/1_preinstall.md`, 
**list the command that produces each output.**

1. Check `vm.swappiness` on all your nodes
    * Set the value to `1` if necessary
2. Show the mount attributes of your volume(s)
3. If you have `ext`-based volumes, list the reserve space setting
    * XFS volumes do not support reserve space
4. Disable transparent hugepage support
4. List your network interface configuration
5. Show correct forward and reverse host lookups
  * For `/etc/hosts`, use `getent`
  * For DNS, use `nslookup`
6. Show the <code>nscd</code> service is running
7. Show the <code>ntpd</code> service is running<br>

---
<div style="page-break-after: always;"></div>

## <center> MySQL/MariaDB Installation Lab
## <center> <a name="mysql_replication_lab"/>Configure MySQL with a replica server

Choose one of these plans to follow:

* You can use the steps [documented here for
MariaDB](http://www.cloudera.com/documentation/enterprise/latest/topics/install_cm_mariadb.html)
or [here for MySQL](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_ig_mysql.html).<br>
* The steps below are MySQL-specific.
  *  If you are using RHEL/CentOS 7.x, **use MariaDB**.

---
<div style="page-break-after: always;"></div>

## <center> MySQL installation - Plan Two Detail

1. Download and implement the [official MySQL repo](http://dev.mysql.com/downloads/repo/yum/)
    * Enable the repo to install MySQL 5.5
    * Install the <code>mysql</code> package on all nodes
    * Install <code>mysql-server</code> on the server and replica nodes
    * Download and copy [the JDBC connector](https://dev.mysql.com/doc/connector-j/5.1/en/connector-j-binary-installation.html) to all nodes.
2. You should not need to build a <code>/etc/my.cnf</code> file to start your MySQL server
    * You will have to modify it to support replication. Check MySQL documentation.<p>
3. Start the <code>mysqld</code> service.
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
    b. Make note of the file name and byte offset. The replica needs this info to sync to the master.<br>
    c. Logout of the second session; remove the lock on the first with <code>mysql> **UNLOCK TABLES;**</code><p>
7. Login to the replica server and configure a connection to the master:<br>
    <code>mysql> **CHANGE MASTER TO**<br> **MASTER_HOST='*master host*',**<br> **MASTER_USER='*replica user*',**<br> **MASTER_PASSWORD='*replica password*',**<br> **MASTER_LOG_FILE='*master file name*',**<br> **MASTER_LOG_POS=*master file offset*;**</code><p>
8. Initiate slave operations on the replica<br>
    a. <code>mysql> **START SLAVE;**</code><br>
    b. <code>mysql> **SHOW SLAVE STATUS \G**</code><br>
    c. If successful, the <code>Slave_IO_State</code> field will read <code>Waiting for master to send event</code><br>
    d. Once successful, capture this output and store it in <code>labs/2_replica_working.md</code><br>
    e. Review your log (<code>/var/log/mysqld.log</code>) for errors. If stuck, consult with a colleague or instructor.<p>

---
<div style="page-break-after: always;"></div>

## <center> CM/CDH Install Lab
## <center> Path B install using Cloudera 5.9.x

[The full rundown is here](https://www.cloudera.com/documentation/enterprise/5-9-x/topics/cm_ig_install_path_b.html)

Notice that you must configure the correct repo. The default is always the latest available version (5.10).

Ensure you adhere to the following requirements:

* Do not use Single User Mode. Do not. Don't do it.
* Ignore all steps in the CM wizard marked `(Optional)`
* Install the Data Hub Edition
* Install CDH using parcels
* **Rename your cluster**: use your GitHub name
* Deploy **only** the `Coreset` of CDH services.
* Deploy **three** ZooKeeper instances.
    * CM does not prompt you to do this, but complaints if you don't
* Once you've renamed your cluster and it is healthy, take a screenshot of the home page
    * Name this file `labs/3_cm_installed.png`.
* Mark your Issue 'submitted' unless you go on to the Bonus Lab.

---
<div style="page-break-after: always;"></div>

## <center> Cluster install: Bonus Lab
## <center> <a name="parcels_repo_lab"/>Create a local parcel repo (manual)

* Click the parcel icon in CM's navigation bar
    * Note the `Remote Parcel Repository URL` values
* Follow the [documentation](http://www.cloudera.com/documentation/enterprise/latest/topics/cm_ig_create_local_parcel_repo.html) to configure a local repo
* Add the local URL to Cloudera Manager's parcel configuration
* Show the parcel repo registers in CM as available
* Mark your Issue `submitted`

---
<div style="page-break-after: always;"></div>

## <center> Cluster install: For Further Reading
## <center> <a name="scripted_install_lab"/>Auto-deployment

* If you are interested to learn about automating installs:
    * Fork/clone [Justin Hayes' auto-deploy project](https://github.com/justinhayes/cm_api/tree/master/python/examples/auto-deploy)
* No submissions are needed; you can browse this repository as you wish.

---
<div style="page-break-after: always;"></div>

## <center> <a name="cm_cdh_key_points"/> Summary Points

* See the graphic of install paths in the `tools/` subdirectory.
* You can review a full CM HA [configuration here](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/admin_cm_ha_overview.html)
* Note that CDH operation does not depend on Cloudera Manager's state 
* CM supports a REST API
  * Each API version is a superset of all prior versions
  * Try `http://<i>your_cm_host</i>:7180/api/version` in your browser
  * The CM API [is documented here](http://cloudera.github.io/cm_api/)

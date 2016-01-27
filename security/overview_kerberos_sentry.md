<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

# <center> <a name="cdh_security_section"/>CDH Security

* <a href="#security_review">Quick basics overview</a>
* <a href="#security_authentication">Strong Authentication</a>
* <a href="#security_authorization">Better Authorization</a>
* <a href="#security_encryption">Encryption</a>
* <a href="#security_cm_configuration">CM-based Configuration</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_review">Quick basics overview</a>

* Perimeter
    * Firewalls, iptables
* Authentication & Authorization
    * Strong authentication
    * Granular access to HDFS files, Hive/Impala objects
* Encryption
    * Transport Layer Security (TLS)
    * On-the-wire encryption
    * Data at rest
* Data Visibility
    * Separation of concerns: storage management vs. data stewardship
    * Anonymizing sensitive fields
    * Auditing data practices without exposing content


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

* Cloudera recommends Direct-to-AD integration as preferred practice.
* The alternative is a [one-way cross-realm trust to AD](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_hadoop_security_active_directory_integrate.html)
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

* Cloudera project moved to Apache incubating
* Supports authorization for database objects
    * Objects: server, database, table, view, URI
    * Authorizations: <code>SELECT</code>, <code>INSERT</code>, <code>ALL</code>
* Supports [HiveServer2](http://blog.cloudera.com/blog/2013/07/how-hiveserver2-brings-security-and-concurrency-to-apache-hive/) and Impala
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

* Each service has to bind to a policy engine
    * Currently <code>impalad</code> and HiveServer2 have hooks
    * Cloudera Search integration is a workaround
* Service Provider interfaces for persisting policies to a store
    * Support for file storage to HDFS or local filesystem
* The policy engine grants access based on the group, the object(s) wanted and the permission type (<code>SELECT</code>, <code>INSERT</code>)
* Consider the [example here](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH4/4.6.0/CDH4-Security-Guide/cdh4sg_Sentry.html?scroll=concept_iw1_5dp_wk_unique_1)
* You can also watch this [short video](http://vimeo.com/79936560)
<!-- can also throw in my own "Notes on Configuring Sentry" as a handout -->

---
<div style="page-break-after: always;"></div>

## <center> Sentry and [HiveServer2](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_hiveserver2_configure.html)

<center><img src="https://blogs.apache.org/sentry/mediaresource/1554e24d-1365-4feb-9d0d-5832ecb90628"></center>

---
<div style="page-break-after: always;"></div>

## <center> [Sentry as a Service](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_sentry_service.html)

* Relational model and storage
* Introduced in C5.1
* Uses a database to store policies
* CDH supports migrating file-based authorization
    * <code>sentry --command config-tool --policyIni *policy_file* --import</code>
* Impala & Hive must use the same provider (db or file)
* Cloudera Search can only use the file provider

---
<div style="page-break-after: always;"></div>

## <center> <a name="security_encryption">Encryption in transit </a></center>

* Also called [in-flight encryption](http://blog.cloudera.com/blog/2013/03/how-to-set-up-a-hadoop-cluster-with-network-encryption/)
* Used HTTP-based communications
* Based on digital certificates, private key stores
* Support includes MR shuffling, Web UI, HDFS data and fsimage transfers

---
<div style="page-break-after: always;"></div>

## <center> Encryption at rest

* First, there was [Project Rhino](http://blog.cloudera.com/blog/2014/06/project-rhino-goal-at-rest-encryption/) sponsored by Intel
* Now called Transparent Encryption for HDFS
* Per-user key used to encrypt data on write, decrypt on read
    * Apache supports Java key store out of the box
    * Cloudera offers Key Trustee Server, more robust providers

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

* Start the CM Kerberos wizard and review the prerequisites.
* Create an MIT KDC
* Create a Linux account with your GitHub name
* Once your integration works, add these files in <code>security/</code>:
    * <code>/etc/krb5.conf</code>
    * <code>/var/kerberos/krb5kdc/kdc.conf</code>
    * <code>/var/kerberos/krb5kdc/kadm.acl</code>
* Create a file <code>kinit.md</code> that includes:
    * A <code>kinit</code> command to authenticate your Linux user
    * A <code>klist</code> command and output
* Create a file <code>cm_creds.png</code> that shows the principals CM has created

---
<div style="page-break-after: always;"></div>

## <center> Optional challenge - Test-driven setup
## <center>[JDBC Connections in a Kerberized Cluster](http://blog.cloudera.com/blog/2014/05/how-to-configure-jdbc-connections-in-secure-apache-hadoop-environments/)</center>

* There's a lot work in this lab. If you choose to do it, be sure to:
* Ignore the steps to set up CDH 5 (already done)
* Test client connectivity with JDBC
* Set up and integrate an Active Directory instance
* Test with a secured client connection
* Enable Kerberos
* Add a Sentry configuration to the mix
* Test client connection again

If you're comfortable with AD, this may take an hour. If not, maybe 2-3 hours. Let your instructors know if you want to attempt this lab.

---
<div style="page-break-after: always;"></div>

## <center> Security Lab (Choose A or B)

Complete *one* of the following labs:<p>

* [Sentry Policy File Configuration](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_sentry.html)
* [Sentry as a Service Configuration (new in CDH 5.1)](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Security-Guide/cdh5sg_sentry_service.html)

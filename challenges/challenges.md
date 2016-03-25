<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - March 25, 2016 - Palo Alto, California

* Overview
    * Build a CM-managed CDH cluster and secure it
* All text output will go in Markdown files
    * Formatting for readability counts!
* Submit screenshots in PNG format
* If you brick your cluster or get stuck for more than 20 minutes, tell an instructor
* Always push to your GitHub repo before starting a new challenge.

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup (Required)

* Create the Issue `Challenges underway`
    * Add it to the `Challenges` milestone
    * Label it `Started`
* Use the file `0_setup.md` for the following info
    * List the OS version, AMI, and AWS region of your nodes
    * List the node that will host Cloudera Manager server
* Run the `uptime` command on your CM Server node
    * The session should be < 60 minutes old
* Run `hadoop fs -ls /user` on any other node.
    * Run `df -h` on the same node
* Create the following Linux user accounts 
    * User `statler` with a UID of `2001`
    * User `waldorf` with a UID of `2002`
* List the `/etc/passwd` entries for both accounts 
* Commit and push to your GitHub repo when done

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1 - Install a MySQL server

* Create the Issue `MySQL enabled`
    * Add it to the `Challenges` milestone
    * Label it `Started`
* Use the file `1_mysql.md` for any text output required
* Install a MySQL 5.6 server
    * It must be on a separate node from Cloudera Manager server
* Install the MySQL client package and JDBC connector on all nodes
* Create databases for
    * Management Services, but not Navigator
    * Hive Metastore
    * Oozie
    * Hue
* Once `mysqld` is running, capture the following:
    * The hostname running your  MySQL server
    * The command and output for `mysql --version`
    * The statement and output of `SELECT * FROM information_schema.user_privileges WHERE privilege_type = 'usage';`
    * The statement and output of `SHOW DATABASES;`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2 - Install Cloudera Manager

* Create the Issue `CM installed`
    * Add it to the `Challenges` milestone
    * Label it `Started`
* Install a package repository for Cloudera Manager 5.5.3
* Install and configure, but do not start, Cloudera Manager
* Submit the following:
    * The contents of `/etc/yum.repos.d/cloudera-manager.repo` in `2_cm_repo.md`
    * The command and output from `grep export /etc/default/cloudera-scm-server` in `2_cm_exports.md`
    * The output from `ls /usr/share/java` in `2_connector.md`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Create the Issue `CDH installed`
    * Add it to the `Challenges` milestone
    * Label it `Started`
* Start Cloudera Manager
* Install CDH 5.5.1
* Install the Coreset + Spark
* Name your cluster using your GitHub handle
* Create user directories in HDFS for `statler` and `waldorf`
* Submit the following:
    * The CM API call `api/v10/cm/deployment` in `3_deployment.md`
    * The output from `hdfs dfs -ls /user` in `3_user_directories.md`
    * The tables in your Reports Manager database in `3_rman_tables.md`
    * A screenshot of the CM home page in `3_cluster_health.png`
        * If any services are not green, explain why in the Issue 
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `HDFS Tested`
    * Add it to the `Challenges` milestone
    * Label it `Started`
* As user `statler`, use `teragen` to generate 51,200,000 records.
    * Set the block size to 32 MB
    * Use the `time` command to capture the job's duration
    * Name the target directory `tgen`
* Submit the following in `4_teragen_command.md`
    * The full command you used 
    * The command and output of `hdfs dfs -ls tgen` 
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Configure TLS and Kerberize the cluster

* Create the Issue `Cluster Secured`
    * Add it to the `Challenges` milestone
    * Label it `Started`
* Configure your cluster with TLS Level 1 security
    * Put the contents of one agent config file in `5_agent_tls.md`
    * Put a CM screenshot showing TLS Level 1 is enabled in `5_cm_tls.md`
* Create a Kerberos realm named after your GitHub handle + .SEBC 
* Create a Kerberos principal for `waldorf` 
* Kerberize the cluster
* Run the `pi` test program as `waldorf`
    * Store the command and output in `5_pi.md`
* Run the `pi` program with as the user `statler`
    * Add the command and output to `5_pi.md`
* Also submit:
    * A proper `kinit` and `klist` result for a Hive principal in `5_hive.md`
    * The `klist` command and output for `waldorf` in `5_waldorf.md`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - CM API 

* Create the Issue `API Tests`
    * Add it to the `Challenges` milestone
    * Label it `Started`
* Using the API, store the command and output for:
    * Running cluster services in `6_services.md`
    * The HDFS service configuration `6_HDFS.md`
    * A usage report for YARN in `6_YARN.md`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Once time is called...

* Push any last changes you have made
* Complete [this quick survey](https://docs.google.com/forms/d/1cFfvTHKz8TEYZgkkZSQFAYtULxsuc-S1qE2kiDFSrBo/viewform)
* Also provide course feedback in a file called `7_feedback_final.md`. We do not provide an 
evaluation without this file! Please include the following:
    * Was this boot camp useful, difficult, challenging? How so?
    * Which topic was least familiar to you? Which topic was most familiar?
    * What topic did you enjoy the most? Which topic was least helpful to you?
    * How long do you need to prepare for a solo installation engagement?

---
<div style="page-break-after: always;"></div>

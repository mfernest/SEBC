<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - January 29, 2016 - Paris, France

* Overview
    * Build a CM-managed CDH cluster and secure it
* Submit all text results in plain-text or Markdown format
* Submit all screenshots in PNG format
* We will use GitHub Issues to mark challenge milestones
    * You can update any challenge at any time if needed
* If you brick your cluster or get stuck for more than 20 minutes, tell an instructor
* Update your GitHub repo before starting the next challenge.

---
<div style="page-break-after: always;"></div>

## <center> Before you begin

* You should have 4-5 nodes running on a Cloudera-supported OS.
    * Document the OS version, AMI, and AWS region you're using.
    * Show the result of `uptime` on your utility node. It should be < 60 minutes.
* You can put master roles on your utility node if you have four nodes
* Run `hadoop fs -ls /user` on any other node.
* Create Linux user accounts called `plenum` and `riser`
    * Show the `/etc/passwd` entries for both accounts
* Store the output in `0_setup.txt`
* Push this work to your GitHub repo
* Create the Issue `Challenges underway`

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1 - Install a MySQL server

* Install a MySQL 5.5 server on your utility node
* Install the MySQL client package and JDBC connector on all nodes
* Create databases for
    * Management Services
    * Hive Metastore
    * Oozie
    * Hue
* Once `mysqld` is running, capture the following:
    * The output of `mysql --version`
    * The output of `SELECT * FROM information_schema.user_privileges WHERE privilege_type = 'usage';`
    * The output of `SHOW DATABASES;`
* Put these results in `0_challenge.txt`
* Push this work to your GitHub repo
* Create the Issue `MySQL enabled`

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2 - Install Cloudera Manager

* Install a package repository for Cloudera Manager 5.5.0
* Install and configure Cloudera Manager. Don't start it yet.
* Submit the following:
    * The contents of `/etc/yum.repos.d/cloudera-manager.repo` in `1_cm_repo.txt`
    * The output from `grep export /etc/default/cloudera-scm-server` in `2_cm_exports.txt`
    * The output from `ls /usr/share/java` in `3_connector.txt`
* Push this work to your GitHub repo
* Create the Issue `CM installed`

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Start Cloudera Manager
* Install CDH 5.5.0
* Install the Coreset of services + Spark
* Rename your cluster using your GitHub handle
* Create user directories in HDFS for each account created above
* Submit the following:
    * The CM API call `api/v10/cm/deployment` in `4_deployment.md`
    * The output from `hdfs dfs -ls /user` in `5_user_directories.txt`
    * The tables in your Reports Manager database in `6_rman_tables.txt`
    * A screenshot of the CM home page in `7_cluster_health.png`
* Push this work to your GitHub repo
* Create the Issue `CDH installed`

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* As user `plenum`, use `teragen` to generate 51,200,000 records.
    * Set the block size 64 MB
    * Use `time` to capture job duration
    * Set the mapper count to double the worker nodes
    * Name the target directory `tgen`
* Submit the following:
    * The full command in `8_teragen_job.txt`
    * Add the console output, without the progress lines
    * Also add the command `hdfs dfs -ls tgen` and output
* Push this work to your GitHub repo
* Create the Issue `HDFS Tested`

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create a Kerberos realm `[YOUR_GITHUBNAME].SEBC`
* Create a user principal for `riser`
* Kerberize the cluster
* Run the `pi` test program as `riser`
* Run `pi` again using `plenum`
* Submit the following:
    * `9_kdc.conf` and `9_kadm5.acl`
    * The output of both `pi` commands in `9_pi.txt`
    * The `kinit` command for `riser` in `9_riser.txt`
    * Add the `klist` output for `riser`
    * A list of user principals in `9_principals.txt`
* Push this work to your GitHub repo
* Create the Issue `Cluster Kerberized`

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Fun with the CM API

* Use the API to list
    * The services running on your cluster
    * The configuration of your HDFS service
    * A usage report for your YARN service
* List the commands and output in `A_cm_api.txt`
* Push this work to your GitHub repo
* Create the Issue `API Tests Complete`
---
<div style="page-break-after: always;"></div>

## <center> Once time is called...

* Make one last push.
* Complete [this quick survey](https://docs.google.com/forms/d/1cFfvTHKz8TEYZgkkZSQFAYtULxsuc-S1qE2kiDFSrBo/viewform)

* Provide feedback on the course in a file called
`feedback_final.txt`. Feedback
on your course work is contingent on this feedback. Please include the following:
    * Summarizing your overall boot camp experience. Was it useful, difficult, challenging? How so?
    * How long would it take, right now, for you to finish all six challenges? What more skills wold you need to complete the challenge, if any?
    * In which topic are you least familiar? In which topic are you most familiar?
    * What topic did you enjoy the most? The least?
    * How long do you think you'd to prepare for an installation engagement on your own?

---
<div style="page-break-after: always;"></div>

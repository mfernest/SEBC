<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - April 8, 2016 - Palo Alto, California

* Overview
    * Build a CM-managed CDH cluster and secure it
* Put all text output to Markdown or other Markdown-like format
    * Readability counts!
* Submit screenshots in PNG format
* If you brick your cluster or get stuck, tell Pete or me. Don't be brave and quiet.
* Consult with each other and research online all you want, but submit your own work.
* Always push to your GitHub repo before starting a new challenge.

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup (Required)

* Create the Issue `Challenges Setup`
    * Add it to your `Challenges` milestone
    * Label it `Started`
* Use the file `0_setup.md` to store the following:
    * The OS version you're using
    * The AMI you're using
    * The AWS region your nodes are in
    * The FQDN of the node that will host Cloudera Manager server
* The command and output of `uptime` on your CM Server node
    * This session should be less than 60 minutes old
* Run `hadoop checknative` on any node that will not host CM
* Run `ls /etc/yum.repos.d` on the node that will host MySQL
    * This node may not be the same as the CM node
* Create the following Linux entities on all nodes
    * User `sebastian` with a UID of `2200`
    * User `ernie` with a UID of `2300`
    * Create the group `parks` and make `sebastian` a member of it
    * Create the group `duckies` and make `ernie` a member of it
* List the `/etc/passwd` entries for `sebastian` and `ernie`
* List the `/etc/group` entries for `parks` and `duckies`
* Push changes to your GitHub repo when you're done
* Add the label `review` to the Issue

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install MySQL`
    * Add it to the `Challenges` milestone
    * Label it `started`
* Use the file `1_mysql.md` for any output required below
* Install a MySQL 5.5.x server using a YUM repository
    * Place it on the node you chose in the setup challenge.
    * Capture the output of `yum repolist enabled`
* Install the MySQL client package and JDBC connector on all nodes
* Create:
    * A Cloudera Manager database called `scm` 
    * A Reports Manager database called `repman`
    * A Hive Metastore database called `HMS`
    * An Oozie database called `works`
    * A Hue database called `huey`
* Capture the following to your file:
    * The command and output for `mysql --version`
    * The statement and output for `SELECT * FROM information_schema.user_privileges WHERE privilege_type = 'usage';`
    * The statement and output for `SELECT user, host FROM mysql.user`
    * The statement and output of `SHOW DATABASES;`
* Push this work to your GitHub repo
* Add the label `review` to the Issue

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager

* Create the Issue `Install CM`
    * Add it to the `Challenges` milestone
    * Label it `started`
* Install a package repository for Cloudera Manager 5.6.0
* Get Cloudera Manager up and running; do not login to the console yet
* Submit the following:
    * The invocation you used for `scm_prepare_database.sh` and the output
    * A list of tables in the `scm` database
    * The result of `SELECT SERVICE_TYPE FROM SERVICES\G` in this database
* Push this work to your GitHub repo
* Add the label `review` to the Issue

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Create the Issue `Install CDH`
    * Add it to the `Challenges` milestone
    * Label it `started`
* Login to Cloudera Manager
* Install CDH 5.5.3
* Install the Coreset + Spark
* Rename your cluster using your GitHub handle
* Create user directories in HDFS for `sebastian` and `ernie`
* Submit the following:
    * The result of `SELECT SERVICE_TYPE FROM SERVICES\G` in the `scm` database in `3_services.md`
    * The command and output for `hadoop checknative` using any node in `3_checknative.md`
    * The output from `hdfs dfs -ls /user` in `3_user_directories.md`
    * A capture of the HDFS service page in `3_cluster_health.png`
* Login to the HUE console and install the Hive sample data
* Push this work to your GitHub repo
* Add the label `review` to the Issue

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `HDFS Tested`
    * Add it to the `Challenges` milestone
    * Label it `tarted`
* As user `ernie`, use `teragen` to generate 51,200,000 records.
    * Set the block size to 16 MB
    * Use the `time` command to capture the job's duration
    * Name the target directory `tgen`
* Submit the following in `4_teragen_command.md`
    * The `teragen` invocation you used to create this file
    * The command and output of `hdfs dfs -ls /user/ernie/tgen` 
* Push this work to your GitHub repo
* Add the label `review` to the Issue

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
    * Add it to the `Challenges` milestone
    * Label it `started`
* Configure a Kerberos realm named `ERNIE4.PREZ`
* Create a Kerberos principal for `sebastian` and `ernie`
* Kerberize the cluster
* Run the `terasort` program as `ernie` on `/user/ernie/tgen`
    * Store the command and output in `5_terasort.md`
* Run the `pi` program as the user `sebastian`
    * Add the command and output to `5_pi.md`
* Also submit:
    * The `klist` command and output for `sebastian` in `5_sebastian.md`
    * A list of principals from your Kerberos database in `5_principals.md`
* Push this work to your GitHub repo
* Add the label `review` to the Issue

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Configure Sentry

* Create the Issue `Configure Sentry`
    * Add it to the `Challenges` milestone
    * Label it `started`
* Install and configure Sentry
* Give Sentry admin rights to `sebastian`
* Login as the `hive` service principal using `beeline` and authenticate as `sebastian`
    * Create a `sentrylord` role with all rights to the `server1` instance
        * Map the `parks` group to this role
    * Create a role called `overlord` with `SELECT` privileges to the Hive Metastore
        * Map the `duckies` group to this role
* Exit from the `beeline` interface
* In the file `6_prediction.md`, list the Hive tables currently available that `ernie` should be able to see
    * Commit this file to your repo with the comment "My prediction"
* Login to the `beeline` interface again; authenticate as `ernie`
    * Put the statement and results for `SHOW TABLES;` in the file `6_results.md`
    * Commit this file to your repo with the comment "My outcome"
* Push all work to your GitHub repo
* Add the label `review` to the Issue

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

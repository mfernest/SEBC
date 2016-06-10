<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - June 10, 2016 - London, UK

* Overview
    * Build a CM-managed CDH cluster and secure it
* Place your work in the `challenges/labs` folder
    * Text output in Markdown (`.md`) files 
    * Screenshots in PNG format
* You can talk with each other and research online
    * Submit only your own work
* Push changes to your GitHub repo immediately -- don't wait until 11:30a!
* If you break your cluster or your cluster shuns you:
    * Tell the instructor
    * Confirm all completed work has been pushed to GitHub
    * Create a new Issue to describe the problem 

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup

* Create the Issue `Challenges Setup`
* Add the requested information below to `challenges/labs/0_setup.md`:
    * Your OS release info source (e.g., `/etc/redhat-release`) and its contents
    * The command and output for `yum repolist enabled`
* The public FQDN of the node that will host your MySQL server
    * The command and output for `ls /etc/yum.repos.d` on this node
* Add the following Linux accounts to all nodes
    * User `cameron` with a UID of `2500`
    * User `johnson` with a UID of `2501`
    * Create the group `leave` and add `johnson` to it
    * Create the group `remain` and add `cameron` to it
* List the `/etc/passwd` entries for `cameron` and `johnson`
* List the `/etc/group` entries for `leave` and `remain`
* Push this work to your GitHub repo 

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install MySQL`
* Use the file `challenges/labs/1_mysql.md` for information requested below:
* Install a MySQL 5.5.x server using a Yum repository
    * Be sure to install this on the node you specified in the Setup 
    * Capture (again) the output of `yum repolist enabled`
* Install on all nodes in your cluster:
    * The MySQL client package (and any dependencies)
    * The MySQL JDBC connector 
* Create the following databases
    * For Cloudera Manager: `scm` 
    * For the Reports Manager: `rman`
    * For Hive Metastore: `HMS` (all upper case)
    * For Oozie: `oozie`
    * For Hue: `HUE` (all upper case)
* Also add the following 
    * The command and output for `mysql --version`
    * The listing for `SHOW DATABASES;`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager

* Create the Issue `Install CM`
* Use the file `challenges/labs/2_cm.md` for the output required below
* List the node that will host Cloudera Manager
    * It cannot be the same node as MySQL
* Configure a Cloudera Manager package repository for the latest 5.5.x release
    * List the repo file name and contents in your file
* Configure and start Cloudera Manager 
* Complete and list the following statements in your file:
    * The permanent generation space allocated to the CM server is _________.
    * The CM file `db.properties` is created by _________.
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Create the Issue `Install CDH`
* Install CDH 5.3.1
* Install the Coreset only
* Name your cluster using your GitHub handle
* Use the file `challenges/labs/3_cm.md` for the output required below
* Create user directories in HDFS for `cameron` and `johnson`
* Submit the following:
    * Output for `hdfs dfs -ls /user`
    * Output for `hadoop classpath`
    * Output for the API call that returns the cluster's full deployment
* Login to the HUE console; install the Hive sample data
    * Capture your Hue home page to `challenges/labs/3_hue_installed.png`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `HDFS Tested`
* As user `cameron`, use `teragen` to generate a 51,200,000-record file
    * Set the block size to 48 MB
    * Use the `time` command to capture job duration
    * Use the output directory `tgen48`
* List the following in `challenges/labs/4_teragen.md`
    * The `teragen` command you used 
    * How long the job took to run
    * The command and output of `hdfs dfs -ls /user/cameron/tgen48`
    * How many blocks were created to store this file
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
* Put a Kerberos server on the node hosting Cloudera Manager
    * Your realm will be your GitHub handle in uppercase, followed by `.UK`
    * Example: `MFERNEST.UK`
* Create Kerberos principals for `cameron` and `johnson`
* Integrate Cloudera Manager with the Kerberos server
* Run the `terasort` program as `cameron` using `/user/cameron/tgen48`
    * Store the command and job output in `challenges/labs/5_terasort.md`
* Run the Hadoop `pi` program as the user `johnson`
    * Add the command and output to `challenges/labs/5_pi.md`
* Submit:
    * The `kinit` and `klist` commands and output in `challenges/labs/5_kinit.md`
    * A list of all Kerberos principals in `challenges/labs/5_principals.md`
    * The configuration files stored in `/var/kerberos/krb5kdc/' 
    * Prepend a `5_` to each file name
    * Append a `.md` to each file name
    * Example: `5_kdc.conf.md`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Configure Sentry

* Create the Issue `Configure Sentry`
* Install and configure Sentry
* Make `johnson` a Sentry administrator
* Login to `beeline` 
    * Create a `minister` role that has rights to the `default` database
        * Map the `remain` group to this role
    * Create an `shadow` role that has `SELECT` privileges on all tables in `default
        * Map the `leave` group to this role
* Login to `beeline` as the principal for `cameron`
    * List the result of `SHOW TABLES;` in `challenges/labs/6_results.md`
* Login to `beeline` as the principal for `johnson`
    * List the result of `SHOW TABLES;` in the same file
* Push all work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> If you finish, or once time is called:

* Make one last push to your GitHb repo, if necessary
* Complete [this quick survey](https://docs.google.com/forms/d/1cFfvTHKz8TEYZgkkZSQFAYtULxsuc-S1qE2kiDFSrBo/viewform)
* Add your course feedback `challenges/labs/7_feedback_final.md`. Remember, your challenges are considered
unfinished without this content.
* Please include the following:
    * Describe this boot camp in your own words: was it camp useful, too difficult, too simple? 
    * Which topic was least familiar to you? Which topic was most familiar?
    * Which topic did you feel was most instructive? Which topic was least helpful to you?
    * How long do you think you'll need to be ready to install a production cluster by yourself? What more do you need to work on?
* It has been a pleasure working with you this week! Safe travels home.
    * `mfernest@cloudera.com`
    * `rafael.arana@cloudera.com`

---
<div style="page-break-after: always;"></div>

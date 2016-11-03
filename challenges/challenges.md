<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - October 14, 2016 - Palo Alto, CA

* Overview
    * Build a CM-managed CDH cluster and secure it
* Place your work in the `challenges/labs` folder
    * All text files should a Markdown (`.md`) extension
    * Store all screenshots in PNG format
* You can talk with each other and research questions online
    * Submit your own work!
* Push changes to your GitHub repo early and often -- don't wait until the end!
* If you break your cluster or your cluster breaks you:
    * Tell an instructor
    * Review the work you have pushed to GitHub
    * Create a new Issue to describe what you think happened

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup

* Create the Issue `Challenges Setup`
* Assign the Issue to yourself and label it `started`
* In the file `challenges/labs/0_setup.md`:
    * List the region in which your instance were created
    * List the CloudCat description of your chosen OS 
    * Declare which node will host your MySQL server
    * The command and output for `ls /usr/java` on this node
* Add the following Linux accounts to all nodes
    * User `kang` with a UID of `2500`
    * User `kodos` with a UID of `2501`
    * Create the group `destroy` and add `kodos` to it
    * Create the group `enslave` and add `kang` to it
* List the `/etc/passwd` entries for `kang` and `kodos` in your setup file
* List the `/etc/group` entries for `destroy` and `enslave` in your setup file
* Push this work to your GitHub repo
* Add the label `finished` (or `submitted`) to your Issue
* Assign the Issue to `mfernest` and `drule`.

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install MySQL`
* Assign the Issue to yourself and label it `started`
* Install MySQL 5.6.x server on the node you declared in `0_setup.md`
    * Use the YUM repository from `dev.mysql.com`
    * Copy `/etc/yum.repos.d/mysql-community.repo` to `challenges/labs/1_mysql-community.repo.md`
* On all cluster nodes:
    * Install the MySQL client package and the MySQL JDBC connector file.
* Start the `mysqld` service
* Delete the `test` database
* Create the following databases
    * `scm`
    * `rman`
    * `hive`
    * `oozie`
    * `hue`
    * `sentry`
* Add the following to the file `challenges/labs/1_mysql.md`
    * The command and output of `mysql --version`
    * The command and output for a list of databases in MySQL
    * The command and output for a list of grants in MySQL
* Push this work to your GitHub repo
* Add the label 'finished` to the Issue
* Assign the issue to the same instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager

* Create the Issue `Install CM`
* Assign the Issue to yourself and label it `started`
* Use a different node to install Cloudera Manager
* Configure the CM repo to install the `5.8.1` release
    * List the command and output of `ls /etc/yum.repos.d` in `challenges/labs/2_cm.md`
    * Copy the `cloudera-manager.repo` file to `challenges/labs/2_cloudera-manager.repo.md`
* Configure Cloudera Manager
    * Grant `scm` access to your MySQL server _only_ from the CM node
    * Copy the `GRANT` statement you used to `challenges/labs/2_cm.md`
* Start the Cloudera Manager server
    * Copy the command `head -1 /var/log/cloudera-scm-server/cloudera-scm-server.log` and its output to `challenges/labs/2_cm.md`
    * Copy the command `grep "Started Jetty server" /var/log/cloudera-scm-server/cloudera-scm-server.log` and its output to the same file
    * Copy the `db.properties` file to `challenges/labs/2_db.properties.md`
* Push to your GitHub repo and add the label 'finished` to the Issue
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Create the Issue `Install CDH`
* Assign the issue to yourself and label it `started`
* Install the CDH 5.8.0; deploy only Coreset services
* Create the file `challenges/labs/3_cm.md`
    * Copy `SHOW GRANTS FOR <database>` and the output for `rman`, `hive`, and `oozie` into the file
* Create user directories in HDFS for `kang` and `kodos`
* Add the following to `3_cm.md`:
    * Command and output for `hdfs dfs -ls /user`
    * The first item output from the CM API call `../api/v13/hosts` 
* Login to the Hue console; install the Hive sample data
    * Get a screenshot of the Hue home page and save as `challenges/labs/3_hue_installed.png`
* Push this work to your GitHub repo and label the Issue `finished`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `HDFS Tested`
* Assign the issue to yourself and label it `started`
* As user `kang`, use `teragen` to generate a 51,200,000-record file
    * Set the block size to 32 MB
    * Use the `time` command to capture job duration
    * Name the target directory `tgen64`
* Put the following in the file `challenges/labs/4_teragen.md`
    * The full `teragen` command you used
    * The output of the `time` command
    * The command and output of `hdfs dfs -ls /user/kang/tgen64`
    * Show how many blocks are used to hold this file's data
* Push this work to your GitHub repo and label the Issue `finished`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
* Assign the issue to yourself and label it `started`
* Install a Kerberos server on the same node as MySQL
    * Your realm will be your GitHub handle in uppercase, followed by `.FNG`
    * For example: `MFERNEST.FNG`
* Create Kerberos principals for `kang`, `kodos`, and `cloudera-scm`
    * Give `cloudera-scm` the privileges necessary to create principals and generate keytabs
* Use Cloudera Manager to integrate Kerberos with the cluster
* Run the `terasort` program as `kang` using `/user/kang/tgen64`
    * Store the command and job output in `challenges/labs/5_terasort.md`
* Run the Hadoop `pi` program as the user `kodos`
    * Add the command and output to `challenges/labs/5_pi.md`
* Also submit:
    * All the `kinit` and `klist` commands and output you used in `challenges/labs/5_kinit.md`
    * The configuration files in `/var/kerberos/krb5kdc/', renamed as follows:
        * Prepend a `5_` and add `.md` to each file name
        * Example: `5_kdc.conf.md`
* Push this work to your GitHub repo and label the Issue `finished`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Configure Sentry

* Create the Issue `Configure Sentry`
* Install and configure Sentry
* Make `kodos` a Sentry administrator
* Login to `beeline`
    * Create an `overlord` role that has rights to the `default` database
        * Map the `enslave` group to this role
    * Create an `invader` role that has `SELECT` privileges on all tables in `default`
        * Map the `destroy` group to this role
* Login to `beeline` as the principal for `kang`
    * List the result of `SHOW TABLES;` in `challenges/labs/6_results.md`
* Login to `beeline` as the principal for `kodos`
    * List the result of `SHOW TABLES;` in the same file
* Push all work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Once you finish, or when time is called:

* Commit any remaining changes in your repo and push them to GitHub
* Complete [this quick survey](https://docs.google.com/forms/d/e/1FAIpQLSfBUSFtEcVFzv_9bHwh9dG8ZHzmQk6wWNLFZAVUtdMd1sgZ6g/viewform)
* Write course feedback in `challenges/labs/7_feedback_final.md`.
Your challenges are not evaluated unless these questions are answered:
    * Describe the boot camp: was it useful, difficult, simple?
    * Which topic was least familiar to you? Which topic was most familiar?
    * Which topic did you feel was most helpful? Which topic was not useful, if any?
    * How long before you are ready to to install a production cluster by yourself? What do you need to work on?
* It has been a pleasure working with you this week! We hope your travel home is safe and comfortable.

---
<div style="page-break-after: always;"></div>

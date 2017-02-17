<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - February 17, 2017 - Singapore, Singapore

* Overview
    * Build a CM-managed CDH cluster and secure it
* Place your work in the `challenges/labs` folder
    * All text files require  Markdown (`.md`) extension and formatting
    * All screenshots must be in PNG format
    * You will create your own files for the challenges
* You can consult with each other and research online
    * Submit only your own work!
* Update your GitHub repo often -- don't wait until the end!
* If you break your cluster, or your cluster breaks you:
    * Tell an instructor
    * Review the work you have pushed to GitHub
    * Create a new Issue to describe what you think happened

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup

* Create the Issue `Challenges Setup`
* Make you have both `mfernest` and `manojsundaram` as Collaborators
* Assign the Issue to yourself and label it `started`
* In the file `challenges/labs/0_setup.md`:
    * List the cloud provider you are using (AWS, GCE, Azure, other)
    * List the Linux release you have chosen 
    * Show that the disk space on each node is at least 30 GB
    * List the command and output for `yum repolist enabled` 
* Add the following Linux accounts to all nodes
    * User `raffles` with a UID of `2000`
    * User `fullerton` with a UID of `3000`
    * Create the group `hotels` and add `fullerton` to it
    * Create the group `shops` and add `raffles` to it
* List the `/etc/passwd` entries for `raffles` and `fullerton` in your setup file
* List the `/etc/group` entries for `hotels` and `shops` in your setup file
* Push to your GitHub repo
* Label your Issue `submitted` 
* Assign the Issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install MySQL`
* Assign the Issue to yourself and label it `started`
* Install a MySQL 5.5.x server on the node you listed first
    * Use the YUM repository available at `dev.mysql.com`
    * Copy `/etc/yum.repos.d/mysql-community.repo` to `challenges/labs/1_mysql-community.repo.md`
* On all cluster nodes
    * Install the MySQL client package and JDBC connector jar
* Start the `mysqld` service
* Create the following databases
    * `scm`
    * `rman`
    * `hive`
    * `oozie`
    * `hue`
    * `sentry`
* Put the following in the file `challenges/labs/1_mysql.md`
    * The hostname of your MySQL node 
    * The command and output for `mysql --version`
    * The command and output for listing MySQL databases 
* Push this work to your GitHub repo
* Label the Issue 'submitted` and assign it to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager

* Create the Issue `Install CM`
* Assign yourself to the Issue and label it `started`
* Install Cloudera Manager on a different node from MySQL
* Configure the CM repo to install the latest release
  * List the command and output of `ls /etc/yum.repos.d` in `challenges/labs/2_cm.md`
  * Copy the `cloudera-manager.repo` file to `challenges/labs/2_cloudera-manager.repo.md`
* Configure Cloudera Manager
  * Use the `scm_prepare_database.sh` script to write your `db.properties` file 
    * List the full command line in `2_cm.md`
* Start the Cloudera Manager server. Then in `challenges/labs/2_db.properties.md`:
  * Add the first line from your server log
  * Add the log line that contains the phrase "Started Jetty server"
  * Copy your `db.properties` file to `challenges/labs/2_db.properties.md`
* Push to your GitHub repo and label the Issue 'submitted`
* Assign the issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Create the Issue `Install CDH`
* Assign the issue to yourself and label it `started`
* Install the latest CDH release; deploy Coreset services only
  * Rename your cluster after your GitHub handle
* Create user directories in HDFS for `raffles` and `fullerton`
* Add the following to `3_cm.md`:
    * Command and output for `hdfs dfs -ls /user`
    * The output from the CM API call `../api/v14/hosts` 
* Login to Hue and install the Hive sample data
    * Capture the Hue home page to `challenges/labs/3_hue_installed.png`
* Push this work to your GitHub repo and label the Issue `submitted`
* Assign the issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `Test HDFS`
* Assign the issue to yourself and label it `started`
* As user `raffles`, use `teragen` to generate a 51,200,000-record dataset into six files
    * Set the block size to 32 MB
    * Name the target directory `tgen512m`
    * Use the `time` command to capture job duration
* Put the following in the file `challenges/labs/4_teragen.md`
    * The full `teragen` command 
    * The output of the `time` command
    * The command and output of `hdfs dfs -ls /user/raffles/tgen512m`
    * Show how many blocks are associated with this directory
* Push this work to your GitHub repo and label the Issue `submitted`
* Assign the issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
* Assign the issue to yourself and label it `started`
* Install an MIT KDC on the same node as the MySQL server
  * Name your realm after your GitHub handle
  * Use `SG` as a suffix
  * For example: `MFERNEST.SG`
* Create Kerberos principals for `raffles`, `fullerton`, and `cloudera-scm`
  * Give `cloudera-scm` the privileges needed to create principals and keytabs
* Enable Kerberos for the cluster
* Run the `terasort` program as `raffles` using `/user/raffles/tgen512m`
  * Copy the command and output to `challenges/labs/5_terasort.md`
* Run the Hadoop `pi` program as the user `fullerton`
  * Copy the command and output to `challenges/labs/5_pi.md`
*  Copy only text files in `/var/kerberos/krb5kdc/` to your repo as follows:
    * Add the prefix `5_` and the suffix `.md` 
    * Example: `5_kdc.conf.md`
* Push this work to your GitHub repo and label the Issue `submitted`
* Assign the issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Enable Sentry 

* Create the Issue `Configure Sentry`
* Install and configure Sentry
* Add `raffles` as a Sentry administrator
* Login to `beeline`
  * Create an `retail` role that has rights to the `default` database
    * Map the `shops` group to this role
  * Create a `hospitality` role that has `SELECT` privileges only to the sample tables in `default`
    * Map the `hotels` group to this role
* Login to `beeline` with the principal for `fullerton`
  * List the result of `SHOW TABLES;` in `challenges/labs/6_results.md`
* Login again to `beeline` as the principal for `raffles`
  * List the result of `SHOW TABLES;` in the same file
* Push this work to your GitHub repo and label the Issue `submitted`
* Assign the issue to both instructors
* Push all work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Once you finish, or when time is called:

* Commit any remaining changes in your repo and push them to GitHub
* Indicate in a follow-up email that you have stopped pushing to your repo
  * You may continue working, if you like, after confirmation of receiving this note
* Please fill out [this survey form](https://goo.gl/forms/pmHeHx03zRu3cnlc2)
* Take it easy! You've worked very hard all week. Safe travels!

---
<div style="page-break-after: always;"></div>

<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - December 9, 2016 - Singapore, Singapore

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
* Assign the Issue to yourself and label it `started`
* In the file `challenges/labs/0_setup.md`:
    * List the region, AMI ID, and OS you are using 
    * List the volume space you have available on each node
    * List the command and output for `yum repolist enabled` 
* Add the following Linux accounts to all nodes
    * User `raffles` with a UID of `2700`
    * User `orchard` with a UID of `2800`
    * Create the group `shops` and add `orchard` to it
    * Create the group `walks` and add `raffles` to it
* List the `/etc/passwd` entries for `raffles` and `orchard` in your setup file
* List the `/etc/group` entries for `shops` and `walks` in your setup file
* Push to your GitHub repo
* Label your Issue `submitted` 
* Assign the Issue to `mfernest` and `jamestyj`

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install MySQL`
* Assign the Issue to yourself and label it `started`
* Install MySQL 5.5.x server on any node you choose
    * Download and configure the YUM repository from `dev.mysql.com`
    * Copy `/etc/yum.repos.d/mysql-community.repo` to `challenges/labs/1_mysql-community.repo.md`
* On all cluster nodes
    * Install the MySQL client package and the MySQL JDBC connector jar.
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
  * Copy the first line from your server log
  * Copy the log line that contains the phrase "Started Jetty server"
  * Copy your `db.properties` file to `challenges/labs/2_db.properties.md`
* Push to your GitHub repo and label the Issue 'submitted`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Create the Issue `Install CDH`
* Assign the issue to yourself and label it `started`
* Install the latest CDH release; deploy Coreset services only
  * Rename your cluster using your GitHub handle
* Create user directories in HDFS for `raffles` and `orchard`
* Add the following to `3_cm.md`:
    * Command and output for `hdfs dfs -ls /user`
    * The output from the CM API call `../api/v14/hosts` 
* Login to Hue and install the Hive sample data
    * Capture the Hue home page to `challenges/labs/3_hue_installed.png`
* Push this work to your GitHub repo and label the Issue `submitted`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `Test HDFS`
* Assign the issue to yourself and label it `started`
* As user `raffles`, use `teragen` to generate a 51,200,000-record dataset into eight files
    * Set the block size to 64 MB
    * Name the target directory `tgen512m`
    * Use the `time` command to capture job duration
* Put the following in the file `challenges/labs/4_teragen.md`
    * The full `teragen` command 
    * The output of the `time` command
    * The command and output of `hdfs dfs -ls /user/raffles/tgen512m`
    * Show how many blocks are linked to this directory
* Push this work to your GitHub repo and label the Issue `submitted`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
* Assign the issue to yourself and label it `started`
* Install an MIT KDC on the same node as MySQL
  * Name your realm after your GitHub handle
  * Use SG as a suffix
  * For example: `MFERNEST.SG`
* Create principals for `raffles`, `orchard`, and `cloudera-scm`
  * Give `cloudera-scm` the privileges needed to create principals and keytabs
* Enable Kerberos for the cluster
* Run the `terasort` program as `raffles` using `/user/raffles/tgen512m`
  * Copy the command and output to `challenges/labs/5_terasort.md`
* Run the Hadoop `pi` program as the user `orchard`
  * Copy the command and output to `challenges/labs/5_pi.md`
*  Copy the text-based files in `/var/kerberos/krb5kdc/` as follows:
    * Attach the prefix `5_` and the extension `.md` 
    * Example: `5_kdc.conf.md`
* Push this work to your GitHub repo and label the Issue `submitted`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Enable Sentry 

* Create the Issue `Configure Sentry`
* Install and configure Sentry
* Add `raffles` as a Sentry administrator
* Login to `beeline`
  * Create an `overlord` role that has rights to the `default` database
    * Map the `walks` group to this role
  * Create an `worker` role that has `SELECT` privileges on all tables in `default`
    * Map the `shops` group to this role
* Login to `beeline` as the principal for `orchard`
  * List the result of `SHOW TABLES;` in `challenges/labs/6_results.md`
* Login to `beeline` as the principal for `raffles`
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

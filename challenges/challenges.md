<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - May 12, 2017 - Shanghai, China

* Overview
  * Build a CM-managed CDH cluster and secure it
* Place your work in the `challenges/labs` folder
  * All text files require  Markdown (`.md`) extension and formatting
  * All screenshots must be in PNG format
  * You will create the files needed for each submission
* You can consult with each other and research online
  * Submit only your own work!
* Update your GitHub repo often -- don't wait until the end!
* If you break your cluster, or your cluster breaks you:
  * Tell an instructor (`mfernest` or `godiswc`)
  * Review the work you have pushed to GitHub
  * Create a new Issue to describe what you think happened

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup

* Create the Issue `Challenges Setup`
* Make sure `mfernest` and `godiswc` are Collaborators
* Assign the Issue to yourself and label it `started`
* In the file `challenges/labs/0_setup.md`:
  * List the cloud provider you are using (AWS, GCE, Azure, other)
  * List your instances by their IP address and DNS name
  * List the Linux release you are using 
  * List the file system capacity for the first node 
  * List the command and output for `yum repolist enabled` 
* Add the following Linux accounts to all nodes
  * User `zhou` with a UID of `2800`
  * User `chen` with a UID of `2900`
  * Create the group `shanghai` and add `chen` to it
  * Create the group `beijing` and add `zhou` to it
* List the `/etc/passwd` entries for `zhou` and `chen` 
  * Not the entire file!
* List the `/etc/group` entries for `shanghai` and `beijing` 
  * Not the entire file!
* Push these updates to your GitHub repo
* Label your Issue `review` 
* Assign the Issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install MySQL` if you are using RHEL/Centos 6.x
  * Name the Issue `Install MariaDB` for 7.x
* Assign the Issue to yourself and label it `started`
* Install a MySQL 5.6 or MariaDB 5.5 server on the first node listed in `0_setup.md`
    * You must a YUM repository to install the package
    * Copy the repo you use to `challenges/labs/1_my-database-server.repo.md`
* On all cluster nodes
    * Install the appropriate client package and JDBC connector jar
* Start the database service
* Create the following databases
    * `scm`
    * `rman`
    * `hive`
    * `oozie`
    * `hue`
    * `sentry`
* Record the following data in `challenges/labs/1_db-server.md`
    * The hostname of your database server 
    * The command and output for showing the database server version
    * The command and output for listing the databases created above
* Push this work to your GitHub repo
* Label the Issue `review` and assign it to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager 5.11

* Create the Issue `Install CM`
* Assign yourself to the Issue and label it `started`
* Install Cloudera Manager on the second node listed in `0_setup.md`
* List the command and output for `ls /etc/yum.repos.d` in `challenges/labs/2_cm.md`
  * Copy the `cloudera-manager.repo` file to `challenges/labs/2_cloudera-manager.repo.md`
* Connect Cloudera Manager Server to its database
  * Use the `scm_prepare_database.sh` script to create the `db.properties` file 
    * List the full command and result in `2_cm.md`
* Start the Cloudera Manager server. In `challenges/labs/2_db.properties.md`:
  * Add the first line of the server's log
  * The log record that contains the phrase "Started Jetty server"
  * The contents of the `db.properties` file 
* Push these changes to your GitHub repo and label the Issue 'review`
* Assign the issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH 5.9

* Create the Issue `Install CDH`
* Assign the issue to yourself and label it `started`
* Deploy Coreset services + Impala
  * Rename your cluster using your GitHub handle
* Create user directories in HDFS for `zhou` and `chen`
* Add the following to `3_cm.md`:
    * The command and output for `hdfs dfs -ls /user`
    * The command and output from the CM API call `../api/v14/hosts` 
    * The command and output from the CM API call `../api/v6/clusters/<githubName>/services`
* Login to Hue to install the Hive sample data
    * Capture a Hue screen that displays the Hive tables in `challenges/labs/3_hue_hive.png`
* Push this work to your GitHub repo and label the Issue `review`
* Assign the issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `Test HDFS`
* Assign the issue to yourself and label it `started`
* As user `zhou`, use `teragen` to generate a 65,536,000-record dataset into six files
    * Set the block size for this file to 64 MB
    * Set the mapper container size to 1 GiB
    * Name the target directory `tgen`
    * Use the `time` command to capture job duration
* Put the following in the file `challenges/labs/4_teragen.md`
    * The full `teragen` command and job output 
    * The result of the `time` command
    * The command and output of `hdfs dfs -ls /user/zhou/tgen`
* Push this work to your GitHub repo and label the Issue `review`
* Assign the issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
* Assign the issue to yourself and label it `started`
* Install an MIT KDC on the same node as the CM server
  * Name your realm after your GitHub handle
  * Use `CN` as a suffix
  * For example: `GODISWC.CN`
* Create Kerberos principals for `zhou`, `chen`, and `cloudera-scm`
  * Grant `cloudera-scm` the privileges needed to create principals and generate keytabs
* Enable Kerberos for the cluster
* Run the `terasort` program as `zhou` using the output target `/user/zhou/tsort`
  * Copy the command and full output to `challenges/labs/5_terasort.md`
* Run the Hadoop `pi` program as the user `chen`
  * Copy the command and full output to `challenges/labs/5_pi.md`
*  Copy the configuration files in `/var/kerberos/krb5kdc/` to your repo:
    * Add the prefix `5_` and the suffix `.md` to the original file name
    * Example: `5_kdc.conf.md`
* Push this work to your GitHub repo and label the Issue `review`
* Assign the issue to both instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Integrate Linux accounts with Hue

* Create the Issue `Integrate Linux & Hue`
  * Label it `started`
* Configure Hue to allow `chen` or `zhou` to login with Linux passwords
* Capture a screenshot that lists all registered Hue users.
  * Put it in `labs/6_hue_linux_login.png`
* Label the issue 'review
* Assign the issue to both instructors
* Push all work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> If you finish early, or once time is called:

* Commit any outstanding changes from your repo to GitHub
* Email `mfe@cloudera.com` that you have stopped pushing to your repo
  * You can continue working, if you wish, after sending this note
* Please fill out [this survey form](https://goo.gl/forms/pmHeHx03zRu3cnlc2)
* Anything else you'd like to express about the class?
  * Please add your comments to `labs/7_feedback_final.md` -- don't forget to commit them!
* Now take it easy. You've worked very hard all week. Safe travels!

---
<div style="page-break-after: always;"></div>

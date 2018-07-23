<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - May 18, 2018 - FCE New Hire

* Overview
  * Build a CM-managed CDH cluster and secure it
* Place your work in the `challenges/labs` folder
  * All text files require  Markdown (`.md`) extension and formatting
  * All screenshots must be in PNG format
  * You will create each required file yourself
* You may consult with each other and research online
  * Submit only your own work
* Push to GitHub often -- don't wait until the end
* If you break your cluster, or your cluster breaks you:
  * Push the work you have into GitHub
  * Create an Issue to describe what you think went wrong
  * Notify the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup

* Create the Issue `Challenges Setup`
* Make sure `mfernest`  and `mohit` are Collaborators
* Make sure your GitHub labels have been configured
* Assign the Issue to yourself and label it `started`
* In the file `challenges/labs/0_setup.md`:
  * List the cloud provider you are using (AWS, GCE, Azure, CloudCat, other)
  * List your instances by IP address and DNS name (don't use `/etc/hosts` for this)
  * List the Linux release you are using 
  * List the file system capacity for the first node 
  * List the command and output for `yum repolist enabled` 
* Add the following Linux accounts to all nodes
  * User `oakland` with a UID of `2800`
  * User `sanfran` with a UID of `2900`
  * Create the group `national` and add `sanfran` to it
  * Create the group `american` and add `oakland` to it
* List the `/etc/passwd` entries for `oakland` and `sanfran` 
  * Do not list the entire file
* List the `/etc/group` entries for `national` and `american` 
  * Do not list the entire file
* Push these updates to GitHub 
* Label your Issue `review` 
* Assign the Issue to an instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install MySQL` if you are using RHEL/Centos 6.x
  * Name the Issue `Install MariaDB` if you are using RHEL/CentOS 7.x
* Assign the Issue to yourself and label it `started`
* Install MySQL 5.5 or MariaDB 5.5 server on the first node listed in `0_setup.md`
  * Use a YUM repository to install the package
  * Copy the repo configuration you used to `challenges/labs/1_my-database-server.repo.md`
* On all cluster nodes
  * Install the database client package and JDBC connector jar on all nodes
* Start the database service and create these databases
  * `scm`
  * `rman`
  * `hive`
  * `oozie`
  * `hue`
* Record the following in `challenges/labs/1_db-server.md`
  * A command and output that shows the hostname of your database server 
  * A command and output that reports the database server version
  * A command and output that lists all the databases in the server
* Push this work to GitHub
* Label the Issue `review` and assign it to an instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager 

* Create the Issue `Install CM`
* Assign yourself and label it `started`
* Install Cloudera Manager on the second node listed in `0_setup.md`
* List the command and output for `ls /etc/yum.repos.d` in `challenges/labs/2_cm.md`
  * Copy `cloudera-manager.repo` to `challenges/labs/2_cloudera-manager.repo.md`
* Connect Cloudera Manager Server to its database
  * Use the `scm_prepare_database.sh` script to create the `db.properties` file 
    * List the full command and its output in `2_cm.md`
* Start the Cloudera Manager server
* In `challenges/labs/2_db.properties.md` add:
  * The first line of the server log
  * The line(s) that contain the phrase "Started Jetty server"
  * The content of the `db.properties` file 
* Push these changes to GitHub and label the Issue `review`
* Assign the issue to an instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install the lastest CDH 5.8 version

* Create the Issue `Install CDH`
* Assign yourself and label it `started`
* Deploy Coreset services + Spark
  * Rename your cluster after your GitHub handle
* Create user directories in HDFS for `oakland` and `sanfran`
* Add the following to `3_cm.md`:
    * The command and output for `hdfs dfs -ls /user`
    * The command and output from the CM API call `../api/v14/hosts` 
    * The command and output from the CM API call `../api/v8/clusters/<githubName>/services`
* Login to Hue and install the Hive sample data 
    * Use `beeline` to display the `default` database tables
    * Copy the output to `challenges/labs/3_beeline.png`

* Push this work to GitHub and label the Issue `review`
* Assign the issue to an instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `Test HDFS`
* Assign yourself and label it `started`
* As user `oakland`, use `teragen` to generate a 65,536,000-record dataset
  * Write the output to 12 files 
  * Set the block size to 32 MB
  * Set the mapper container size to 1000 MiB
  * Name the target directory `tgen`
  * Use the `time` command to capture job duration
* Put the following in `challenges/labs/4_teragen.md`
  * The full `teragen` command and output 
  * The result of the `time` command
  * The command and output of `hdfs dfs -ls /user/oakland/tgen`
  * The command and output of `hadoop fsck -blocks /user/oakland`
* Push this work to GitHub and label the Issue `review`
* Assign the issue to an instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
* Assign the issue to yourself and label it `started`
* Install an MIT KDC on the last node in your cluster
  * Name your realm after your GitHub handle
  * Use `NH` as a suffix
  * For example: `MFERNEST.NH`
* Create Kerberos user principals for `oakland`, `sanfran`, and `cloudera-scm`
  * Assign `cloudera-scm` the privileges needed to create service principals and keytab files
* Kerberize the cluster
* Run the `terasort` program as user `oakland` with the output target `/user/oakland/tsort`
  * Copy the command and full output to `challenges/labs/5_terasort.md`
* Run the Hadoop `pi` program as user `sanfran`
  * Use the task parameters to `50` and `100` 
  * Copy the command and full output to `challenges/labs/5_pi.md`
*  Copy the configuration files in `/var/kerberos/krb5kdc/` to your repo:
    * Add the prefix `5_` and the suffix `.md` to the original file name
    * Example: `5_kdc.conf.md`
* Push this work to GitHub and label the Issue `review`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Install & Configure the Sentry Service

* Create the Issue `Install Sentry`
  * Label it `started`
* Use Cloudera Manager to install and enable Sentry
* Configure both Hive & Impala to use Sentry
* Create a role for `HttpViewer` that can read the `web_logs` database
  * Assign the `american` group to this role
* Create a role for `ServiceViewer` that can read the `customers` databases
  * Assign the `national` group to this role
* Use `beeline` to select ten records from `web_logs`
* Use `beeswax` to select ten records from `customers`
* Capture each outcome as a screenshot, `6_beeline.png` and `6_beeswax.png`
* Label the issue `review`
* Assign the issue to the instructor
* Push all work to GitHub

---
<div style="page-break-after: always;"></div>

## <center> When time runs out:

* Commit any outstanding changes from your repo to GitHub
* Notify `mfe@cloudera.com` once you have stopped pushing to your repo
* In-class candidates only:
  * Please fill out [this survey form](https://goo.gl/forms/pmHeHx03zRu3cnlc2)
  * Add your comments to `labs/7_feedback_final.md` -- remember to commit them!

---
<div style="page-break-after: always;"></div>

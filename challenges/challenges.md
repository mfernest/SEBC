<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - November 3, 2017 - Palo Alto, CA 

* Overview
  * Build a CM-managed CDH cluster and secure it
* Place your work in the `challenges/labs` folder
  * All text files require  Markdown (`.md`) extension and formatting
  * All screenshots must be in PNG format
  * You will create each required file yourself
* You may consult with each other and research online
  * Submit only your own work
* Update GitHub often -- don't wait until the end
* If you break your cluster, or your cluster breaks you:
  * Tell the instructor 
  * Push the work you have into GitHub
  * Create an Issue to describe what you think went wrong

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup

* Create the Issue `Challenges Setup`
* Make sure `mfernest` is a Collaborator
* Assign the Issue to yourself and label it `started`
* In the file `challenges/labs/0_setup.md`:
  * List the cloud provider you are using 
  * List your instances by IP address and DNS name (don't use your `/etc/hosts` table for this)
  * List the Linux release you are using 
  * List the file system capacity for the first node 
  * List the command and output for `yum repolist enabled` 
* Add the following Linux accounts to all nodes
  * User `reilly` with a UID of `2800`
  * User `frankola` with a UID of `2900`
  * Create the group `paloalto` and add `frankola` to it
  * Create the group `sanfrancisco` and add `reilly` to it
* List the `/etc/passwd` entries for `reilly` and `frankola` 
  * Do not list the entire file
* List the `/etc/group` entries for `paloalto` and `sanfrancisco` 
  * Do not list the entire file
* Push these updates to GitHub 
* Label your Issue `review` 
* Assign the Issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install Database` 
* Assign the Issue to yourself and label it `started`
* Install MySQL 5.5 on the first node listed in `0_setup.md`
  * Use a YUM repository to install the package
  * Copy the repo file to `challenges/labs/1_my-database-server.repo.md`
* On all cluster nodes
  * Install the database client package and JDBC connector jar on all nodes
* Start the server and create these databases:
  * `scm`
  * `rman`
  * `hive`
  * `oozie`
  * `hue`
  * `sentry`
* Record the following in `challenges/labs/1_db-server.md`
  * The command `hostname -f` and its output 
  * The command `mysql -u <user> -p<password> -e "status;"` and its output 
  * The command `mysql -u <user>  -p<password> -e "show databases;"` and its output 
* Push this work to GitHub
* Label the Issue `review` and assign it to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager 

* Create the Issue `Install CM`
* Assign yourself and label it `started`
* Install Cloudera Manager on the second node listed in `0_setup.md`
* List the command and output for `ls /etc/yum.repos.d` on the second node in `challenges/labs/1_cm.md`
  * Copy `cloudera-manager.repo` to `challenges/labs/2_cloudera-manager.repo.md`
* Connect Cloudera Manager Server to its database
  * Use the `scm_prepare_database.sh` script to create the `db.properties` file 
  * Copy the invocation and its output to `2_properties.md`
  * Copy your `db.properties` content to the same file
* Start the Cloudera Manager server
* Put the following in `challenges/labs/2_cm_startup.md`:
  * The first line of your CM server log
  * All lines containing the string "Started Jetty server"
* Copy the command and output to get your CM deployment to `challenges/labs/2_cm-deployment.md`
* Push these changes to GitHub and label the Issue `review`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH 5.8

* Create the Issue `Install CDH`
* Assign yourself and label it `started`
* Deploy Coreset services + Spark
  * Name your cluster using your GitHub handle
* Set up user directories in HDFS for `reilly` and `frankola`
* Add the following to `3_cm.md`:
    * The command and output for `hdfs dfs -ls /user`
    * The command and output from the CM API call `../api/v5/hosts` 
    * The command and output from the CM API call `../api/v11/clusters/<githubName>/services`
    * The command and output for your CM deployment (yes, again)
* Install the Hive sample data via Hue
* Push this work to GitHub and label the Issue `review`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `Test HDFS`
* Assign yourself and label it `started`
* As user `reilly`, use `teragen` to generate a 65,536,000-record dataset
  * Write the output to 12 files 
  * Set the block size to 32 MB
  * Set the mapper container size to 1 GiB
  * Name the target directory `tgen`
  * Use the `time` command to capture the job's duration
* Put the following in `challenges/labs/4_teragen.md`
  * The full `teragen` command and output 
  * The `time` command output
  * The command and output of `hdfs dfs -ls /user/reilly/tgen`
  * The command and output of `hadoop fsck -blocks /user/reilly/tgen`
* Push this work to GitHub and label the Issue `review`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
* Assign the issue to yourself and label it `started`
* Install an MIT KDC on the third node of your cluster
  * Name your realm using your GitHub handle
  * Use `FNG` as a suffix
  * For example: `MFERNEST.FNG`
* Create Kerberos user principals for `reilly`, `frankola`, and `cloudera-scm`
  * Assign `cloudera-scm` the privileges needed to create service principals and keytab files
* Kerberize the cluster
* Run the `terasort` program as user `reilly` with the output target `/user/reilly/tsort`
  * Use the `tgen` directory as input
  * Copy the command and full output to `challenges/labs/5_terasort.md`
* Run the Hadoop `pi` program as user `frankola`
  * Use the task parameters `50` and `100` 
  * Copy the command and full output to `challenges/labs/5_pi.md`
*  Copy the configuration files in `/var/kerberos/krb5kdc/` to your repo
    * Add the prefix `5_` and the suffix `.md` to the original file name
* Push this work to GitHub and label the Issue `review`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Install & Configure the Sentry Service

* Create the Issue `Install Sentry`
  * Label it `started`
* Use Cloudera Manager to install and enable Sentry
* Configure Hive to use Sentry
* Create a role `Logger` that can read the `web_logs` database
  * Assign the `sanfrancisco` group to this role
* Create a role for `Customer` that can read the `customers` databases
  * Assign the `paloalto` group to this role
* Use `beeline` to select ten records from `web_logs`
* Use `beeswax` to select ten records from `customers`
* Capture the beeline text and save to `6_beeline.md` 
* Screen-capture the results for beeswax and save to `6_beeswax.png`
* Label the issue `review`
* Assign the issue to the instructor
* Push all work to GitHub

---
<div style="page-break-after: always;"></div>

## <center> When time runs out:

* Commit any outstanding changes from your repo to GitHub
* Email `mfe@cloudera.com`that you have stopped pushing to your repo
* In-class candidates only:
  * Please fill out [this survey form](https://goo.gl/forms/pmHeHx03zRu3cnlc2)
  * Add your comments to `labs/7_feedback_final.md` -- remember to commit them!

---
<div style="page-break-after: always;"></div>

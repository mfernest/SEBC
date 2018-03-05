<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - January 26, 2018 - Palo Alto, CA 

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
  * Tell an instructor 
  * Push the work you have into GitHub
  * Create an Issue to describe what you think went wrong

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup

* Create the Issue `Challenges Setup`
* Make sure `mfernest` and `alexciobanu` are Collaborators
* Assign the Issue to yourself and label it `started`
* In the file `challenges/labs/0_setup.md`:
  * List the cloud provider you are using 
  * List your instances by IP address and DNS name (don't use `cat /etc/hosts` table for this)
  * List the Linux release you are using 
  * List the file system capacity for the first node 
  * List the command and output for `yum repolist enabled` 
* Add the following Linux accounts to all nodes
  * User `driscoll` with a UID of `2650`
  * User `bartfeld` with a UID of `3100`
  * Create the group `intl` and add `bartfeld` to it
  * Create the group `americas` and add `driscoll` to it
* List the `/etc/passwd` entries for `driscoll` and `bartfeld` 
  * Do not list the entire file
* List the `/etc/group` entries for `intl` and `americas` 
  * Do not list the entire file
* Push these updates to GitHub 
* Label your Issue `review` 
* Assign the Issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL or MariaDB server

* Create the Issue `Install Database` 
* Assign the Issue to yourself and label it `started`
* Install the server on the first node you listed in `0_setup.md`
  * Use a YUM repository to install the package
  * Copy the YUM install command and output to `challenges/labs/1_database-server-install.md`
* On all cluster nodes
  * Install the database client package and JDBC connector jar on all nodes
* Start the server and create these databases:
  * `scm`
  * `rman`
  * `hive`
  * `oozie`
  * `hue`
* Record the following in `challenges/labs/1_db-server.md`
  * The command and output for `hostname -f` on the database server host 
  * The command and output for `mysql -u <user> -p<password> -e "status;"` 
  * The command and output for `mysql -u <user> -p<password> -e "show databases;"` 
* Push this work to GitHub
* Label the Issue `review` and assign it to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager 5.11.x (latest update)

* Create the Issue `Install CM`
* Assign yourself and label it `started`
* Install Cloudera Manager on the second node you listed in `0_setup.md`
* Copy the YUM command and output for installing Cloudera Manager in `challenges/labs/2_cm-install.md`
* Connect Cloudera Manager Server to its database
  * Use the `scm_prepare_database.sh` script 
  * Copy the full command invocation and its output to `2_properties.md`
  * Copy your `db.properties` content into the same file
* Start the Cloudera Manager server
* Put the following in `challenges/labs/2_cm_startup.md`:
  * The first line of your CM server log
  * Any line in the log containing the string "Started Jetty server"
* Copy the API command and output to list your CM deployment into `challenges/labs/2_cm-deployment.md`
* Push these changes to GitHub and label the Issue `review`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH 5.8.x (latest update)

* Create the Issue `Install CDH`
* Assign yourself and label it `started`
* Deploy Coreset services + HBase
  * Rename your cluster using your GitHub ID
* Set up `/user` directories in HDFS for `driscoll` and `bartfeld`
  * Set the user and group permissions accordingly
* Add the following to `3_cm.md`:
    * The command and output for `hdfs dfs -ls /user`
    * The command and output for the API call `../api/v8/hosts` 
    * The command and output for the API call `../api/v11/clusters/<githubName>/services`
    * The command and output for your CM deployment (yes, again)
* Install the Hive sample data via Hue
* Push this work to GitHub and label the Issue `review`
* Assign the issue to the instructor

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `Test HDFS`
* Assign yourself and label it `started`
* As user `driscoll`, use `teragen` to generate a 65,536,000-record dataset
  * Write the output to 8 files 
  * Set the block size to 128 MiB
  * Set the mapper container size to 1 GiB
  * Name the target directory `tgen`
  * Use the `time` command to capture the job's duration
* Put the following in `challenges/labs/4_teragen.md`
  * The full `teragen` command and output 
  * The `time` command output
  * The command and output of `hdfs dfs -ls /user/driscoll/tgen`
  * The command and output of `hadoop fsck -blocks /user/driscoll/tgen/part*`
* Push this work to GitHub and label the Issue `review`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
* Assign the issue to yourself and label it `started`
* Install an MIT KDC on the third node of your cluster
  * Name your realm using your GitHub handle
  * Use `NEW` as a suffix
  * For example: `MFERNEST.NEW`
* Create Kerberos user principals for `driscoll`, `bartfeld`, and `cloudera-scm`
  * Allow `cloudera-scm` to create service principals and generate keytabs 
* Kerberize the cluster
* Run `terasort` as user `driscoll`; use the output target `/user/driscoll/tsort`
  * Use the `tgen` directory as input
  * Copy the command and full output to `challenges/labs/5_terasort.md`
* Run the Hadoop `pi` program as user `bartfeld`
  * Use the task parameters `50` and `100` 
  * Copy the command and full output to `challenges/labs/5_pi.md`
*  Copy the text configuration files from `/var/kerberos/krb5kdc/` to your repo
    * Add the prefix `5_` and the suffix `.md` to the original file names
* Push this work to GitHub and label the Issue `review`
* Assign the issue to the instructors

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Upgrade CM and CDH

* Create the Issue `Upgrade Cluster`
  * Label it `started`
* Upgrade CM to the latest available release
  * Capture the Support -> About panel in `6_cm-about.md`
* Upgrade CDH to the latest available release
  * Capture your CDH cluster dashboard in `6_cdh_about.md`
* Label the issue `review`
* Assign the issue to the instructors
* Push all work to GitHub

---
<div style="page-break-after: always;"></div>

## <center> When time runs out:

* Commit any outstanding changes from your repo to GitHub
* Email to `mfe@cloudera.com` to show you stopped pushing to your repo
* In-class candidates only:
  * Please fill out [this survey form](https://goo.gl/forms/pmHeHx03zRu3cnlc2)
  * Add your comments to `labs/7_feedback_final.md` -- remember to commit them!

---
<div style="page-break-after: always;"></div>

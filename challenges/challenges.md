<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - May 20, 2016 - Shanghai, China

* Overview
    * Build a CM-managed CDH cluster and secure it
* Place all lab work in your `challenges` folder
    * Put all text output to Markdown or other Markdown-like format
    * Submit screenshots in PNG format
    * Indicate which one has your results if it is not the master branch
* If you kill your cluster or get stuck:
    * Notify the instructor
    * Create an Issue and document the problem thoroughly: include screenshots
* You may discuss the challenges with each other and research online, but submit only your own work.
* Push changes to your GitHub repo after each challenge -- don't wait until the end!

---
<div style="page-break-after: always;"></div>

## <center> Challenge Setup

* Create the Issue `Challenges Setup`
    * Add it to your `Challenges` milestone
* Use the file `challenges/labs/0_setup.md` to store all the information requested below:
    * Your OS type and version 
    * Your AMI (or other image identifier)
    * The output of `uptime` on one node
* Indicate the node that will host MySQL
    * Run `ls /etc/yum.repos.d` on this node
* Add the following Linux accounts to all nodes
    * User `yaoming` with a UID of `2200`
    * User `jetli` with a UID of `2300`
    * Create the group `shangai` and add `yaoming` 
    * Create the group `beijing` and add `jetli` 
* List the `/etc/passwd` entries for `yaoming` and `jetli`
* List the `/etc/group` entries for `shangai` and `beijing`
* Push this work to your GitHub repo 

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1: Install a MySQL server

* Create the Issue `Install MySQL`
    * Add it to the `Challenges` milestone
* Use the file `challenges/labs/1_mysql.md` for all output required below
* Install a MySQL 5.6.x server using a YUM repository
    * Use the node chose in the previous challenge
    * Capture the output of `yum repolist enabled`
* Install the MySQL client package and JDBC connector on all nodes
* Create the following databases
    * For Cloudera Manager: `scm` 
    * For the Reports Manager: `rman`
    * For Hive Metastore: `hivey`
    * For Oozie: `oozie``
    * For Hue: `huey`
* Add the following information to your work file:
    * The command and output for `mysql --version`
    * The statement and output of `SHOW DATABASES;`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2: Install Cloudera Manager

* Create the Issue `Install CM`
    * Add it to the `Challenges` milestone
* Use the file `challenges/labs/2_cm.md` for the output required below
* Indicate which node will host Cloudera Manager
    * It _cannot_ be the same node as MySQL
* Install a package repository for Cloudera Manager 5.6.0
    * Copy the repo file contents to your work file
* Configure and start Cloudera Manager 
    * Copy the content of the `db.properties` file to your work file
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Create the Issue `Install CDH`
    * Add it to the `Challenges` milestone
* Install CDH 5.6.x
* Install the Coreset only
* Rename your cluster using your GitHub handle
* Create user directories in HDFS for `yaoming` and `jetli`
* Submit the following:
    * The output for `hdfs dfs -ls /user` in `challenges/labs/3_user_directories.md`
    * The output for `hadoop classpath` in `challenges/labs/3_hadoop_classpath.md`
    * The output for the CM API call that lists the full deployment of your cluster in `challenges/labs/3_deployment.json.md`
* Login to the HUE console and install the Hive sample data
    * Save a screenshot of your Hue home page to `challenges/labs/3_hue_installed.md`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - HDFS Testing

* Create the Issue `HDFS Tested`
    * Add it to the `Challenges` milestone
* As user `jetli`, use `teragen` to generate 51,200,000 records.
    * Set the block size to 32 MB
    * Use the `time` command to capture job duration
    * Use the target directory `tgen32`
* Submit the following in `4_teragen_command.md`
    * The full `teragen` command line you used 
    * The command and output of `hdfs dfs -ls /user/jetli/tgen32`
    * Indicate how many blocks were created to store this file
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Create the Issue `Kerberize cluster`
    * Add it to the `Challenges` milestone
* Configure a Kerberos server on the same machoine as MySQL
    * Name the realm using your GitHub handle in capital letters.
    * Example: `MFERNEST.SHG`
* Create Kerberos principals for `yaoming` and `jetli`
* Integrate Cloudera Manager with the Kerberos server
* Run the `terasort` program as `jetli` using `/user/jetli/tgen32`
    * Store the command and job output in `5_terasort.md`
* Run the Hadoop `pi` program as the user `yaoming`
    * Add the command and output to `5_pi.md`
* Submit:
    * The configuration files in `/var/kerberos/krb5kdc/' 
    * Add a `.md` to the full file name
    * Example: `5_kdc.conf.md`
* Push this work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Configure Sentry

* Create the Issue `Configure Sentry`
    * Add it to the `Challenges` milestone
* Install and configure Sentry
* Make `yaoming` a Sentry administrator
* Login to `beeline` and authenticate as `yaoming`
    * Create a `sentrylord` role to have all rights to the `default` database
        * Map the `shangai` group to this role
    * Create an `overlord` role to have `SELECT` privileges all the Hive sample tables
        * Map the `beijing` group to this role
* In the file `6_prediction.md`, list the Hive tables that `jetli` should be able to see
* Login to `beeline` as `jetli`
    * Put the results for `SHOW TABLES;` in the file `6_results.md`
    * Commit this file to your repo with the comment "My outcome"
* Push all work to your GitHub repo

---
<div style="page-break-after: always;"></div>

## <center> Once your are finished or time is called

* Push any last changes you have made
* Complete [this quick survey](https://docs.google.com/forms/d/1cFfvTHKz8TEYZgkkZSQFAYtULxsuc-S1qE2kiDFSrBo/viewform)
* Also provide course feedback in a file called `7_feedback_final.md`. We do not provide an 
evaluation without this file! Please include the following:
    * Was this boot camp useful, difficult, challenging? How so?
    * Which topic was least familiar to you? Which topic was most familiar?
    * What topic did you enjoy the most? Which topic was least helpful to you?
    * How long do you need to prepare for a solo installation engagement?
* It has been a pleasure working with you this week! Safe travels home.

---
<div style="page-break-after: always;"></div>

<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Friday AM
# <center> Challenges

* Overview: Build a cluster and secure it
* You will document your progress by email the same way you have all week
    * mfernest@cloudera.com
    * scottgriz@cloudera.com
* Submit a challenge result as soon as it is completed.
* If you break your cluster and cannot recover it, notify us by email first, then tell us.

---
<div style="page-break-after: always;"></div>

## <center> Do not start the challenges yet!

* Write an email with the subject line: <code>[Your Name] - Boot Camp Challenges</code>
    * List your EC2 instances by **public DNS name** 
* Specify which instance you will use for Cloudera Manager
    * List the output from the command <code>hadoop fs -ls /</code> on this instance
* Create a Linux user account <code>milosz</code> on all nodes with a UID of 1999.

* Once you have submitted this email, you may start the challenges

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1 - Install a MySQL server for CM

* Install a MySQL 5.5 server
    * Use any node **except** the one that will host Cloudera Manager
* Install the MySQL client and JDBC connector on all nodes
* Create the following databases **only**
    * All CM Management Services 
    * Hive Metastore
* Once the mysql server is running, email the following information:
    * The output of the command <code>mysql --version</code>
    * The output of the following MySQL statement:
          <code>SELECT * FROM information_schema.user_privileges WHERE privilege_type = 'usage';</code> 
    * The output of the statement <code>SHOW DATABASES;</code>

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2 - Install Cloudera Manager

* Install the package repository for Cloudera Manager **5.4.8**
* Install Cloudera Manager
* Create a CM account with the following attributes:
    * Account name: <code>Overlord</code>
    * Password <code>singapore</code>
    * Role: Full Administrator role
* Submit the following information before starting Challenge 3
    * The output of the command <code>java -version</code>
    * The URL to your CM login page
    * The output of CM API endpoint <code>api/v10/cm/deployment</code>

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Install CDH **5.4.8**
* Enable these services **only**
    * ZooKeeper
    * HDFS
    * YARN
    * Hive 
* Name your cluster after you
* Create an HDFS directory <code>/user/milosz</code>
    * Make <code>milosz</code> the owner of this directory 
* Submit the following information before starting Challenge 4:
    * The output of CM API endpoint <code>api/v10/cm/deployment</code>
    * The output of the command <code>hdfs dfs -ls /user</code>
    * A list of tables in the <code>scm</code> database

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - Testing

* Switch the user account <code>milosz</code>
* Run <code>teragen</code> to create 51,200,000 records 
    * Use the <code>time(1)</code> command to get the job duration
    * Use two mappers for every worker node in your cluster
    * Write the output to the <code>/user/milosz</code> directory
* Run <code>terasort</code> on the output
    * Use <code>time</code> again to record the duration of this job
* Submit the following:
    * The complete <code>teragen</code> and <code>terasort</code> commands you used
    * The result of the <code>time</code> command for each job
    * The output for the command <code>hdfs dfs -ls /user/milosz</code>

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Install/configure a KDC with the realm <code>SEBC.SIN</code>
* Create a user principal for the <code>milosz</code> account
* Kerberize your CDH services
* Run the Hadoop <code>pi</code> test program as <code>milosz</code>
* Submit the following:
    * The <code>kinit</code> command you used to authenticate <code>milosz</code>
    * The <code>klist</code> output showing <code>milosz</code> has a valid renewable ticket
    * The full text of your <code>kdc.conf</code> file
    * The list of principals in your KDC

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Enable Impala

* Add the Impala service to your cluster
* Deploy an Impalad role on every instance that hosts a DataNode role
* Add Kerberos configuration for this service
* Submit the following:
    * A list of the Impala service principals in your KDC
    * A screen capture of the Instances tab for Impala in CM

---
<div style="page-break-after: always;"></div>

## <center> Completing Course Feedback

* Emails sent after 11:55am (local time) are not included in the challenge evaluation. 
* After you submit your last challenge, complete [this survey](http://tinyurl.com/fce-bc-survey)
* Start a new email with the subject line: **[Your Name]: SEBC
Feedback**. Include the following:
    * Describe your boot camp experience. Was it useful, difficult, challenging?
    * If you had three more hours today, could you finish all six challenges? If not, what else do you need to prepare?
    * Which topic taught you the most? Which one taught you the least?
    * What aspect of this course did you like the most? The least?
    * What other resources do you need to prepare for a production install? 

---
<div style="page-break-after: always;"></div>

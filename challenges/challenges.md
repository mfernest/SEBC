<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Challenges - January 15, 2016 - Palo Alto, CA

* Overview: You will build a CM-managed CDH cluster and secure it
* You will document progress in your repo folder <code>challenges</code>
and push to GitHub
* For all command-line captures requested, make sure you show which machine
did the work -- a shell prompt containing the hostname, or <code>uname</code> output, will suffice.
* Notify both instructors by email each time you finish a challenge
    * mfernest@cloudera.com
    * pwhitney@cloudera.com
* It's ok to add work to a challenge if you forget something.
* If you break your cluster or your brain, let us know -- don't tough it out!
* Remember to push changes to your GitHub repo.

---
<div style="page-break-after: always;"></div>

## <center> Before you begin

* You should already have five nodes running a Cloudera-supported OS.
    * Record both the Linux OS version and AMI you chose.
    * Get the output from the <code>uptime</code> command on all nodes -- the uptime should be < 60 minutes.
* Use the first node for hosting utility and edge roles only.
* Show the output of the command <code>hadoop fs -ls /</code> on the last node in your group.
* Create two Linux user accounts: <code>rickman</code> and <code>bowie</code>
    * Show the <code>/etc/passwd</code> entries for both accounts from all five nodes
* Put the results of all these tests in one file called <code>prechallenge.txt</code>
    * Please do not submit Word documents or other formats requiring a specific editor/viewer.

---
<div style="page-break-after: always;"></div>

## <center> Challenge 1 - Install a MySQL server for CM

* Install a MySQL 5.x server on the utility node
* Install the MySQL client and JDBC connector software on all nodes
* Create databases for
    * Management Services 
    * Hive Metastore
* Once the <code>mysqld</code> process is operational, capture the following:
    * The output of <code>mysql --version</code>
    * The output of
          <code>SELECT * FROM information_schema.user_privileges WHERE privilege_type = 'usage';</code> 
    * The output of the statement <code>SHOW DATABASES;</code>
* Submit these results in a file called <code>challenge01.txt</code>

---
<div style="page-break-after: always;"></div>

## <center> Challenge 2 - Install Cloudera Manager

* Install a package repository suitable for the latest Cloudera Manager release
* Install Cloudera Manager; put all five nodes under its control
* Create a CM account with the following attributes:
    * Account name: <code>Severus</code>
    * Password <code>DarkArts</code>
    * Role: Full Administrator 
* Change the role of the <code>admin</code> account to Operator
* Submit the following:
    * The configuration file for your Cloudera Manager repo
    * The output from <code>java -version</code> on your utility node, in a file called <code>java_version_2.txt</code>
    * A screenshot that shows the CM users and their role assignments
    * The result of the CM API call <code>api/v10/cm/deployment</code>, in a file called <code>deployment_2.txt</code>
* Be sure to push your work to your GitHub repo.

---
<div style="page-break-after: always;"></div>

## <center> Challenge 3 - Install CDH

* Install CDH **5.4.8**
* Enable these services **only**
    * ZooKeeper
    * HDFS
    * YARN
    * Hive 
    * Hue
* Name your cluster after your Cloudera GitHub handle
* Create an HDFS directory <code>/user/bowie</code>
    * Make <code>bowie</code> the owner of this directory 
* Submit the following information:
    * The output of CM API endpoint <code>api/v10/cm/deployment</code> in a file called <code>deployment_3.txt</code>
    * The output from <code>hdfs dfs -ls /user</code> in a file called <code>hdfs_3.txt</code>
    * A list of tables for the <code>scm</code> database in a file called <code>tables_3.txt</code>

---
<div style="page-break-after: always;"></div>

## <center> Challenge 4 - Testing

* Set up the account <code>rickman</code> with an HDFS directory
* Use <code>teragen</code> to create 51,200,000 records 
    * Use the <code>time(1)</code> command to track the job duration
    * Use eight mappers only
    * Write the output to <code>/user/rickman</code> 
* Run <code>terasort</code> on the teragenerated file
    * Use <code>time</code> to record the duration of this job
* Submit the following:
    * The full commands you used for <code>teragen</code> and
    <code>terasort</code> in a file called <code>commands_4.txt</code>
    * The console output of each job, minus the map and reduce
    percent progress lines, in a file called <code>outputs_4.txt</code>
    * The output for the command <code>hdfs dfs -ls /user/rickman</code>

---
<div style="page-break-after: always;"></div>

## <center> Challenge 5 - Kerberize the cluster

* Set up an MIT KDC with the realm <code>FCEBC.YOURFIRSTNAME</code>
* Create a user principal for both <code>rickman</code> and <code>bowie</code> 
* Kerberize your cluster
* Run the Hadoop <code>pi</code> test program as <code>bowie</code>
* Run the Hadoop <code>pi</code> test program again, but as <code>rickman</code>
* Submit the following:
    * The <code>kinit</code> command you used to authenticate both users in a file called <code>kinit_5.txt</code>
    * The <code>klist</code> output showing <code>rickman</code> has a renewable ticket
    * Your <code>kdc.conf</code> file
    * The list of user principals in your KDC in a file called <code>principals_5.txt</code>

---
<div style="page-break-after: always;"></div>

## <center> Challenge 6 - Add a Hue instance

* Add a second Hue service to your cluster
* Take a screenshot that shows both Hue services are green.

---
<div style="page-break-after: always;"></div>

## <center> Once time is called...

* Make one last push to your GitHub repo. Any work included after 11:25am (local time) is not evaluated, but we will look at it. 
* Complete [this quick survey](http://tinyurl.com/fce-bc-survey)

* Provide feedback on the course in a file called
<code>feedback_final.txt</code>. You will not receive feedback
from us if we don't get feedback from you! Answer the following:
    * Describe your overall boot camp experience. Was it useful, difficult, challenging? 
    * Could you finish all six challenges, with your current skills,
    today? If so, how many more hours would you need? If not, what
    further training or practice would you need before you could
    do all the work in one day?
    * Which topic taught you the most? Which topic taught you the least?
    * What topic did you enjoy the most? The least?
    * How long before you think you're ready to install a production cluster on your own?

---
<div style="page-break-after: always;"></div>

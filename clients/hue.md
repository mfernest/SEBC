<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Thursday AM
# <center> <a name="hue_services_admin_section"/>HUE Services & Administration

* <a href="#hue_design_goals">HUE Design and Goals</a>
* <a href="#hue_services">Services</a>
* <a href="#hue_deployment_tools">Deployment Tools</a>
* <a href="#hue_admin_features">Admin features</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_design_goals">HUE Design & Goals</a>

* Customizable service portal
* [RainStor Embraces HUE](http://rainstor.com/rainstor-embraces-hue/)
* Client authentication proxy
* Graphical browsing and reporting
* Application UIs
* LDAP/Kerberos support
* Index for support, tutorials, demos

---
<div style="page-break-after: always;"></div>

## <center> Current Version & Resources

* HUE 3.7 released in October, 2014
* Your self-help resource site: [gethue.com](http://gethue.com)
* Several walk-throughs [available on Vimeo](http://vimeo.com/search?q=gethue)
* These are short/compressed 
* Provides the front end for [Cloudera Live](http://www.cloudera.com/content/cloudera/en/products-and-services/cloudera-live.html)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_services">HUE's Services</a>

* <a href="hue_query_editors">Query editors</a>
* <a href="hue_data_browsers">Data browsers</a>
* <a href="#hue_workflow_tools">Workflow tools</a>
* <a href="#hue_search_console">Cloudera Search console</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_query_editors">Query Editors</a>

* [Hive](http://hive.apache.org)
* [Beeswax editor](http://demo.gethue.com/beeswax/#query)
* Can also use HiveServer2
* [Impala](http://impala.io/)
* [Graphical SQL data browser and query interface](http://demo.gethue.com/impala/#query)
* [DB Query](http://demo.gethue.com/rdbms/)
* Library support for MySQL, PostgreSQL, Oracle, and SQLite
* [Pig](http://demo.gethue.com/pig/)
* [Job Designer](http://demo.gethue.com/jobsub/#list-designs)
* Form-based editor for Oozie actions, job submission
* [Spark Igniter](http://demo.gethue.com/spark/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_data_browsers">Data Browsers</a>

* [Hive Metastore](http://demo.gethue.com/metastore/tables/)
* [HBase](http://demo.gethue.com/hbase/#Cluster)
* [Sqoop Transfer](http://demo.gethue.com/sqoop/#jobs)
* [ZooKeeper](http://demo.gethue.com/zookeeper/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_workflow_editors">Workflow Tools</a>

* [Oozie Dashboard](http://demo.gethue.com/oozie/)
* [Workflow Manager](http://demo.gethue.com/oozie/list_workflows/)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_search_console">Cloudera Search Console</a>

* [Twitter Demo](http://demo.gethue.com/search/?collection=10000001)
* [Yelp Demo](http://demo.gethue.com/search/?collection=10000002)
* [Logfiles Demo](http://demo.gethue.com/search/?collection=10000003)

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_deployment_tools">Deployment Tools</a>

* [Manual installation](http://cloudera.github.io/hue/docs-3.5.0/manual.html)
* Depends on [system libraries to use](http://cloudera.github.io/hue/docs-3.5.0/manual.html#_install_hue), more [for development](for development)
* Does require CDH, does not require CM
* Useful as a client proxy tool
* Parcels installation (Cloudera Manager)
* See /opt/cloudera/parcels/CDH/lib/hue on host
* Can run multiple service instances
* [HA service configuration](http://gethue.com/hadoop-tutorial-high-availability-of-hue/) 

---
<div style="page-break-after: always;"></div>

## <center> <a name="hue_admin_features">HUE Administrative Features</a>

* Hue's database stores user accounts, Hive queries, job submissions
* Embedded database is <code>(SQLite)</code>
* Also supported: [MySQL, PostgreSQL, Oracle](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Requirements-and-Supported-Versions/cdhrsv_db.html)
* Inspectable: <code>sqlite3 /var/lib/hue/desktop.db</code>  

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Self-guided walk-throughs

* [Demo a query (Impala)](http://blog.cloudera.com/blog/2013/10/explore-the-impala-app-in-hue/)
* [Demo a job submission](http://gethue.com/hadoop-tutorial-submit-any-oozie-jobs-directly-from/)
* [Single sign-on (SSO) Support](http://blog.cloudera.com/blog/2013/10/enabling-sso-authentication-in-hue/)
* [LDAP integration](http://blog.cloudera.com/blog/2014/02/how-to-make-hadoop-accessible-via-ldap/)

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Standalone Installation </center>

* Use [this documentation](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_hue_installation.html)
* Install a standalone instance of HUE on one of your worker nodes
* Have a lab partner access your instance and explore
* Let them add/delete a file, etc.
* Add the user/password: instructor/cloudera
* Email a capture of this HUE instance along with the URL **in** **text** 

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Connect to Sentry Service

* If you set up Sentry with a file-based provider, go back and install it as a service
* Use [this tutorial](http://gethue.com/apache-sentry-made-easy-with-the-new-hue-security-app) to connect to the service
* Email your hue.ini file when it is complete and working

---
<div style="page-break-after: always;"></div>

## <center> HUE Lab: Authenticate using Linux users/groups

* Do this work on your standalone HUE instance
* Add a Linux user account 'bootcamper' with the password 'cloudera' to that host. 
* [Use this guide](http://gethue.com/hadoop-tutorial-how-to-integrate-unix-users-and-groups/) to log into HUE with the bootcamper account.
* You can show this working to either instructor -- no other report is required.

---
<div style="page-break-after: always;"></div>

## <center> HUE Bonus Lab: Speeding up HUE Service 

* Your HUE standalone installation should be version 3.8
* If so, [follow this guide](http://gethue.com/using-nginx-to-speed-up-hue-3-8-0/) to accelerate HUE responsiveness 
* Capture the screen for nginx and email it.


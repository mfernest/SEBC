
<strong>What is ubertask optimization?</strong>  
Uberization reduces the amount of overhead for small MapReduce jobs by  
having them run in the Application Master's jvm.  
  
<strong>Where in CM is the Kerberos Security Realm value displayed?</strong>  
Administration > Settings  
Status: non-default  
Scope: settings  
Category: Kerberos  
  
<strong>Which CDH service(s) host a property for enabling Kerberos authentication?</strong>  
HDFS, SOLR, HBase, Zookeeper, Yarn  
  
<strong>How do you upgrade the CM agents?</strong>  
Re-run the Upgrade Wizard on CM and select "Yes, I would like  
to upgrade the Cloudera Manager Agent packages now"  

<strong>Give the tsquery statement used to chart Hue CPU utilization?</strong>  
select cpu_system_rate + cpu_user_rate where category=ROLE and serviceName=$SERVICENAME  

<strong>List all the roles that make up the Hive service.</strong>  
Hive Gateway  
Hive Metastore Server  
HiveServer2  
Hive WebHCat server

<strong>List the prerequisite steps necessary to integrating Cloudera   
Manager with a Kerberos MIT KDC.</strong>   
Set up a working KC  
The KDC should be configued to have non-zero ticket lifetime and renewal lifetime   
OpenLDAP Libraries must be installed to use AD and skerberos client libraries must be on all hosts  
CM need an account that has permissions to create other accounts in the KDC  

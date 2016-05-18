1、What is ubertask optimization?
 Whether to enable ubertask optimization, which runs "sufficiently small" jobs sequentially within a single JVM. "Small" is defined by the mapreduce.job.ubertask.maxmaps, mapreduce.job.ubertask.maxreduces, and mapreduce.job.ubertask.maxbytes settings.

2、Where in CM is the Kerberos Security Realm value displayed?
	Settings-->Kerberos-->security_realm
3、Which CDH service(s) host a property for enabling Kerberos authentication?
	zookeeper YARN HDFS 
4、How do you upgrade the CM agents?
	host--> upgrade the CM agent
 
5、Give the tsquery statement used to chart Hue's CPU utilization?
	select cpu_system_rate + cpu_user_rate where category=ROLE and serviceName="hue"
6、List all the roles that make up the Hive service.
	Hive Metastore Server  \WHCS  WebHCat Server \ HS2  HiveServer2 \Gateway   
7、List the prerequisite steps necessary to integrating Cloudera Manager with a Kerberos MIT KDC.
 Launch the Kerberos wizard and complete the checklist.

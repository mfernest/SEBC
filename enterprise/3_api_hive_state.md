[root@ip-172-31-51-35 ec2-user]# curl -X POST -u "admin:admin" -i   http://52.201.218.178:7180/api/v11/clusters/LouisErnst/services/hive/commands/stop  
HTTP/1.1 200 OK  
Expires: Thu, 01-Jan-1970 00:00:00 GMT  
Set-Cookie: CLOUDERA_MANAGER_SESSIONID=1cs5ibl7fw4roqus8vjmkmpyt;Path=/;HttpOnly  
Content-Type: application/json  
Date: Thu, 24 Mar 2016 20:16:10 GMT  
Transfer-Encoding: chunked  
Server: Jetty(6.1.26.cloudera.4)  
  
{  
  "id" : 1026,  
  "name" : "Stop",  
  "startTime" : "2016-03-24T20:16:10.022Z",  
  "active" : true,  
  "serviceRef" : {  
    "clusterName" : "cluster2",  
    "serviceName" : "hive"  
  }  
________________________________________  
  
[root@ip-172-31-51-35 ec2-user]# curl -X POST -u "admin:admin" -i   http://52.201.218.178:780/api/v11/clusters/LouisErnst/services/hive/commands/start  
HTTP/1.1 200 OK  
Expires: Thu, 01-Jan-1970 00:00:00 GMT  
Set-Cookie: CLOUDERA_MANAGER_SESSIONID=1xs352xgmhr2717xi7rs9j6b06;Path=/;HttpOnly  
Content-Type: application/json  
Date: Thu, 24 Mar 2016 20:18:54 GMT  
Transfer-Encoding: chunked  
Server: Jetty(6.1.26.cloudera.4)  
  
{  
  "id" : 1033,  
  "name" : "Start",  
  "startTime" : "2016-03-24T20:18:54.536Z",  
  "active" : true,  
  "serviceRef" : {  
    "clusterName" : "cluster2",  
    "serviceName" : "hive"  
  }  
________________________________________  
  
  [root@ip-172-31-51-35 ec2-user]# curl -X GET -u "admin:admin" -i   http://52.201.218.178:710/api/v11/clusters/LouisErnst/services/hive/ |grep -i serviceState  
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current  
                                 Dload  Upload   Total   Spent    Left  Speed  
106   854    0   854    0     0   2929      0 --:--:-- --:--:-- --:--:--  2944  
  "serviceState" : "STARTED",  

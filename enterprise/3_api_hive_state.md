
  
  [root@ip-172-31-51-35 ec2-user]# curl -X GET -u "admin:admin" -i   http://52.201.218.178:710/api/v11/clusters/LouisErnst/services/hive/ |grep -i serviceState  
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current  
                                 Dload  Upload   Total   Spent    Left  Speed  
106   854    0   854    0     0   2929      0 --:--:-- --:--:-- --:--:--  2944  
  "serviceState" : "STOPPING",  

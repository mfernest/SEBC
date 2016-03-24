HTTP/1.1 200 OK  
Expires: Thu, 01-Jan-1970 00:00:00 GMT  
Set-Cookie: CLOUDERA_MANAGER_SESSIONID=1fym4s3cxlcie1jllknjmo4hkq;Path=/;HttpOnly  
Content-Type: application/json  
Date: Thu, 24 Mar 2016 19:54:14 GMT  
Transfer-Encoding: chunked  
Server: Jetty(6.1.26.cloudera.4)  
  
{  
  "timestamp" : "2016-03-24T19:54:14.070Z",  
  "clusters" : [ {  
    "name" : "LouisErnst",  
    "version" : "CDH5",  
    "services" : [ {  
      "name" : "hive",  
      "type" : "HIVE",  
      "config" : {  
        "roleTypeConfigs" : [ {  
          "roleType" : "HIVEMETASTORE",  
          "items" : [ {  
            "name" : "hive_metastore_java_heapsize",  
            "value" : "2669674496"  
          } ]  
        }, {  
          "roleType" : "HIVESERVER2",  
          "items" : [ {  
            "name" : "hiveserver2_enable_impersonation",  
            "value" : "false"  
          }, {  
            "name" : "hiveserver2_java_heapsize",  
            "value" : "1352663040"  
          } ]  
        }, {  
          "roleType" : "WEBHCAT",  
          "items" : [ {  
            "name" : "hive_webhcat_java_heapsize",  
            "value" : "118489088"  
          } ]  
        } ],  
        "items" : [ {  
          "name" : "hive_metastore_database_host",  
          "value" : "ip-172-31-51-35.ec2.internal"  
        }, {  
          "name" : "hive_metastore_database_password",  
          "value" : "hive_password"  
        }, {  
          "name" : "mapreduce_yarn_service",  
          "value" : "yarn"  
        }, {  
          "name" : "sentry_service",  
          "value" : "sentry"  
        }, {  
          "name" : "zookeeper_service",  
          "value" : "zookeeper"  
        } ]  
      },  
      "roles" : [ {  
        "name" : "hive-GATEWAY-66a47d1a217e0dde8090f6a6be78a6e5",  
        "type" : "GATEWAY",  
        "hostRef" : {  
          "hostId" : "i-ae1e432d"  
        },  
        "config" : {  
          "items" : [ ]  
        }  
      }, {  
        "name" : "hive-HIVEMETASTORE-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "HIVEMETASTORE",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "ckjrbalf0pofl2b9nwgs9vzjk"  
          } ]  
        }  
      }, {  
        "name" : "hive-HIVESERVER2-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "HIVESERVER2",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "9odw814lujsd8azzbelme06kg"  
          } ]  
        }  
      }, {  
        "name" : "hive-WEBHCAT-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "WEBHCAT",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "hive_webhcat_secret_key",  
            "value" : "2h5CS7taJayHk5LY7NVoriIyIhmCWi"  
          }, {  
            "name" : "role_jceks_password",  
            "value" : "9yu8a9x3022jf0hey7ljhwpe5"  
          } ]  
        }  
      } ],  
      "displayName" : "Hive"  
    }, {  
      "name" : "zookeeper",  
      "type" : "ZOOKEEPER",  
      "config" : {  
        "roleTypeConfigs" : [ {  
          "roleType" : "SERVER",  
          "items" : [ {  
            "name" : "zookeeper_server_java_heapsize",  
            "value" : "779091968"  
          } ]  
        } ],  
        "items" : [ ]  
      },  
      "roles" : [ {  
        "name" : "zookeeper-SERVER-1c8f09336d47dbcca42fae8f7173b5eb",  
        "type" : "SERVER",  
        "hostRef" : {  
          "hostId" : "i-aa1e4329"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "6e186rgzwdvrtp7h17g39eqbf"  
          }, {  
            "name" : "serverId",  
            "value" : "1"  
          } ]  
        }  
      }, {  
        "name" : "zookeeper-SERVER-bb7a1b4bb15d45b995fe82ba13cedcbb",  
        "type" : "SERVER",  
        "hostRef" : {  
          "hostId" : "i-a81e432b"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "10cfayfsafml6bs2vtxwqirgf"  
          }, {  
            "name" : "serverId",  
            "value" : "3"  
          } ]  
        }  
      }, {  
        "name" : "zookeeper-SERVER-e9d8e7546dcdc17274b67cbfb1abfc8b",  
        "type" : "SERVER",  
        "hostRef" : {  
          "hostId" : "i-af1e432c"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "2fygfqw4hy5ksv39nse7v6qpr"  
          }, {  
            "name" : "serverId",  
            "value" : "2"  
          } ]  
        }  
      } ],  
      "displayName" : "ZooKeeper"  
    }, {  
      "name" : "hue",  
      "type" : "HUE",  
      "config" : {  
        "roleTypeConfigs" : [ ],  
        "items" : [ {  
          "name" : "hive_service",  
          "value" : "hive"  
        }, {  
          "name" : "hue_webhdfs",  
          "value" : "hdfs-NAMENODE-0ec789ec7ff769bec1152603e0c9dbc2"  
        }, {  
          "name" : "oozie_service",  
          "value" : "oozie"  
        }, {  
          "name" : "sentry_service",  
          "value" : "sentry"  
        }, {  
          "name" : "zookeeper_service",  
          "value" : "zookeeper"  
        } ]  
      },  
      "roles" : [ {  
        "name" : "hue-HUE_SERVER-66a47d1a217e0dde8090f6a6be78a6e5",  
        "type" : "HUE_SERVER",  
        "hostRef" : {  
          "hostId" : "i-ae1e432d"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "6e62msrwbbct7wl56w2n9vh5n"  
          }, {  
            "name" : "secret_key",  
            "value" : "SuPj4gNXtZUjxb6CAA4tHX8q2ZjTgU"  
          } ]  
        }  
      }, {  
        "name" : "hue-KT_RENEWER-66a47d1a217e0dde8090f6a6be78a6e5",  
        "type" : "KT_RENEWER",  
        "hostRef" : {  
          "hostId" : "i-ae1e432d"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "788i93sj7tpsd73cn5ssg2tv3"  
          } ]  
        }  
      } ],  
      "displayName" : "Hue"  
    }, {  
      "name" : "oozie",  
      "type" : "OOZIE",  
      "config" : {  
        "roleTypeConfigs" : [ {  
          "roleType" : "OOZIE_SERVER",  
          "items" : [ {  
            "name" : "oozie_database_host",  
            "value" : "ip-172-31-51-35.ec2.internal"  
          }, {  
            "name" : "oozie_database_password",  
            "value" : "oozie_password"  
          }, {  
            "name" : "oozie_database_type",  
            "value" : "mysql"  
          }, {  
            "name" : "oozie_database_user",  
            "value" : "oozie"  
          }, {  
            "name" : "oozie_java_heapsize",  
            "value" : "364904448"  
          } ]  
        } ],  
        "items" : [ {  
          "name" : "hive_service",  
          "value" : "hive"  
        }, {  
          "name" : "mapreduce_yarn_service",  
          "value" : "yarn"  
        }, {  
          "name" : "zookeeper_service",  
          "value" : "zookeeper"  
        } ]  
      },  
      "roles" : [ {  
        "name" : "oozie-OOZIE_SERVER-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "OOZIE_SERVER",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "9ddyw30p11cuolwajgywu3n82"  
          } ]  
        }  
      } ],  
      "displayName" : "Oozie"  
    }, {  
      "name" : "yarn",  
      "type" : "YARN",  
      "config" : {  
        "roleTypeConfigs" : [ {  
          "roleType" : "GATEWAY",  
          "items" : [ {  
            "name" : "mapred_reduce_tasks",  
            "value" : "6"  
          }, {  
            "name" : "mapred_submit_replication",  
            "value" : "1"  
          } ]  
        }, {  
          "roleType" : "JOBHISTORY",  
          "items" : [ {  
            "name" : "mr2_jobhistory_java_heapsize",  
            "value" : "364904448"  
          } ]  
        }, {  
          "roleType" : "NODEMANAGER",  
          "items" : [ {  
            "name" : "container_executor_banned_users",  
            "value" : "yarn,hdfs,mapred,bin"  
          }, {  
            "name" : "container_executor_min_user_id",  
            "value" : "450"  
          }, {  
            "name" : "node_manager_java_heapsize",  
            "value" : "779091968"  
          }, {  
            "name" : "rm_cpu_shares",  
            "value" : "1500"  
          }, {  
            "name" : "rm_io_weight",  
            "value" : "750"  
          }, {  
            "name" : "yarn_nodemanager_heartbeat_interval_ms",  
            "value" : "100"  
          }, {  
            "name" : "yarn_nodemanager_local_dirs",  
            "value" : "/yarn/nm"  
          }, {  
            "name" : "yarn_nodemanager_resource_cpu_vcores",  
            "value" : "3"  
          }, {  
            "name" : "yarn_nodemanager_resource_memory_mb",  
            "value" : "2048"  
          } ]  
        }, {  
          "roleType" : "RESOURCEMANAGER",  
          "items" : [ {  
            "name" : "resource_manager_java_heapsize",  
            "value" : "364904448"  
          }, {  
            "name" : "yarn_scheduler_maximum_allocation_mb",  
            "value" : "4096"  
          }, {  
            "name" : "yarn_scheduler_maximum_allocation_vcores",  
            "value" : "3"  
          } ]  
        } ],  
        "items" : [ {  
          "name" : "hdfs_service",  
          "value" : "hdfs"  
        }, {  
          "name" : "rm_dirty",  
          "value" : "false"  
        }, {  
          "name" : "rm_last_allocation_percentage",  
          "value" : "75"  
        }, {  
          "name" : "yarn_service_cgroups",  
          "value" : "true"  
        }, {  
          "name" : "yarn_service_lce_always",  
          "value" : "true"  
        }, {  
          "name" : "zk_authorization_secret_key",  
          "value" : "sncVe3bUy00Uu5JJSIO93HlwlDCJI0"  
        }, {  
          "name" : "zookeeper_service",  
          "value" : "zookeeper"  
        } ]  
      },  
      "roles" : [ {  
        "name" : "yarn-JOBHISTORY-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "JOBHISTORY",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "8wfo32g9mvtrgy9jcxl7bkee1"  
          } ]  
        }  
      }, {  
        "name" : "yarn-NODEMANAGER-1c8f09336d47dbcca42fae8f7173b5eb",  
        "type" : "NODEMANAGER",  
        "hostRef" : {  
          "hostId" : "i-aa1e4329"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "1dlbipy65ajgz9enryp79r5o6"  
          } ]  
        }  
      }, {  
        "name" : "yarn-NODEMANAGER-bb7a1b4bb15d45b995fe82ba13cedcbb",  
        "type" : "NODEMANAGER",  
        "hostRef" : {  
          "hostId" : "i-a81e432b"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "887v8nlcds03b7ih1n1sm8erb"  
          } ]  
        }  
      }, {  
        "name" : "yarn-NODEMANAGER-e9d8e7546dcdc17274b67cbfb1abfc8b",  
        "type" : "NODEMANAGER",  
        "hostRef" : {  
          "hostId" : "i-af1e432c"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "a4814ishfdwhx0e8wys3r59x0"  
          } ]  
        }  
      }, {  
        "name" : "yarn-RESOURCEMANAGER-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "RESOURCEMANAGER",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "rm_id",  
            "value" : "67"  
          }, {  
            "name" : "role_jceks_password",  
            "value" : "exe1odyhxzyjavjq276751rdj"  
          } ]  
        }  
      } ],  
      "displayName" : "YARN (MR2 Included)"  
    }, {  
      "name" : "hdfs",  
      "type" : "HDFS",  
      "config" : {  
        "roleTypeConfigs" : [ {  
          "roleType" : "BALANCER",  
          "items" : [ {  
            "name" : "balancer_java_heapsize",  
            "value" : "364904448"  
          } ]  
        }, {  
          "roleType" : "DATANODE",  
          "items" : [ {  
            "name" : "datanode_java_heapsize",  
            "value" : "688914432"  
          }, {  
            "name" : "dfs_data_dir_list",  
            "value" : "/dfs/dn"  
          }, {  
            "name" : "dfs_datanode_data_dir_perm",  
            "value" : "700"  
          }, {  
            "name" : "dfs_datanode_du_reserved",  
            "value" : "10568819916"  
          }, {  
            "name" : "dfs_datanode_http_port",  
            "value" : "1006"  
          }, {  
            "name" : "dfs_datanode_max_locked_memory",  
            "value" : "3134193664"  
          }, {  
            "name" : "dfs_datanode_port",  
            "value" : "1004"  
          }, {  
            "name" : "rm_cpu_shares",  
            "value" : "500"  
          }, {  
            "name" : "rm_io_weight",  
            "value" : "250"  
          } ]  
        }, {  
          "roleType" : "GATEWAY",  
          "items" : [ {  
            "name" : "dfs_client_use_trash",  
            "value" : "true"  
          } ]  
        }, {  
          "roleType" : "NAMENODE",  
          "items" : [ {  
            "name" : "dfs_name_dir_list",  
            "value" : "/dfs/nn"  
          }, {  
            "name" : "dfs_namenode_servicerpc_address",  
            "value" : "8022"  
          }, {  
            "name" : "namenode_java_heapsize",  
            "value" : "364904448"  
          } ]  
        }, {  
          "roleType" : "SECONDARYNAMENODE",  
          "items" : [ {  
            "name" : "fs_checkpoint_dir_list",  
            "value" : "/dfs/snn"  
          }, {  
            "name" : "secondary_namenode_java_heapsize",  
            "value" : "364904448"  
          } ]  
        } ],  
        "items" : [ {  
          "name" : "core_site_safety_valve",  
          "value" : "<property>\n<name>hadoop.security.authentication</name>\n<value>kerberos</value>\n</property>"  
        }, {  
          "name" : "dfs_encrypt_data_transfer_algorithm",  
          "value" : "AES/CTR/NoPadding"  
        }, {  
          "name" : "dfs_ha_fencing_cloudera_manager_secret_key",  
          "value" : "xflb5F7ADQ5t0u9jXprXkDdIDLEbL2"  
        }, {  
          "name" : "fc_authorization_secret_key",  
          "value" : "c1wT9FQRRHKuRqrEJ8MqtZA3TyNG9r"  
        }, {  
          "name" : "hadoop_security_authentication",  
          "value" : "kerberos"  
        }, {  
          "name" : "hadoop_security_authorization",  
          "value" : "true"  
        }, {  
          "name" : "http_auth_signature_secret",  
          "value" : "0LWKjtw9GbMzBLu6gFKUwLRLWz8YTf"  
        }, {  
          "name" : "rm_dirty",  
          "value" : "false"  
        }, {  
          "name" : "rm_last_allocation_percentage",  
          "value" : "25"  
        }, {  
          "name" : "trusted_realms",  
          "value" : "EC2.INTERNAL"  
        }, {  
          "name" : "zookeeper_service",  
          "value" : "zookeeper"  
        } ]  
      },  
      "roles" : [ {  
        "name" : "hdfs-BALANCER-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "BALANCER",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ ]  
        }  
      }, {  
        "name" : "hdfs-DATANODE-1c8f09336d47dbcca42fae8f7173b5eb",  
        "type" : "DATANODE",  
        "hostRef" : {  
          "hostId" : "i-aa1e4329"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "1cjrakjjvuq3y2a8csa7civ7o"  
          } ]  
        }  
      }, {  
        "name" : "hdfs-DATANODE-bb7a1b4bb15d45b995fe82ba13cedcbb",  
        "type" : "DATANODE",  
        "hostRef" : {  
          "hostId" : "i-a81e432b"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "9zn7mbw7pvrcv7bnov8s6ueca"  
          } ]  
        }  
      }, {  
        "name" : "hdfs-DATANODE-e9d8e7546dcdc17274b67cbfb1abfc8b",  
        "type" : "DATANODE",  
        "hostRef" : {  
          "hostId" : "i-af1e432c"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "o9p9xsui5anj4qo9d1zgal9h"  
          } ]  
        }  
      }, {  
        "name" : "hdfs-NAMENODE-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "NAMENODE",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "namenode_id",  
            "value" : "69"  
          }, {  
            "name" : "role_jceks_password",  
            "value" : "c1j41jhp8h21jr05uc9fwo7xe"  
          } ]  
        }  
      }, {  
        "name" : "hdfs-SECONDARYNAMENODE-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "SECONDARYNAMENODE",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "9xjqg4exj1z9y4r2vy7caguv7"  
          } ]  
        }  
      } ],  
      "displayName" : "HDFS"  
    }, {  
      "name" : "sentry",  
      "type" : "SENTRY",  
      "config" : {  
        "roleTypeConfigs" : [ {  
          "roleType" : "SENTRY_SERVER",  
          "items" : [ {  
            "name" : "sentry_server_java_heapsize",  
            "value" : "268435456"  
          } ]  
        } ],  
        "items" : [ {  
          "name" : "hdfs_service",  
          "value" : "hdfs"  
        }, {  
          "name" : "sentry_server_database_host",  
          "value" : "ip-172-31-51-35.ec2.internal"  
        }, {  
          "name" : "sentry_server_database_password",  
          "value" : "sentry_password"  
        }, {  
          "name" : "sentry_service_admin_group",  
          "value" : "hive,impala,hue,LouisErnst/admin"  
        }, {  
          "name" : "zookeeper_service",  
          "value" : "zookeeper"  
        } ]  
      },  
      "roles" : [ {  
        "name" : "sentry-SENTRY_SERVER-0ec789ec7ff769bec1152603e0c9dbc2",  
        "type" : "SENTRY_SERVER",  
        "hostRef" : {  
          "hostId" : "i-a91e432a"  
        },  
        "config" : {  
          "items" : [ {  
            "name" : "role_jceks_password",  
            "value" : "arv87ou0763djumubog3mvwie"  
          } ]  
        }  
      } ],  
      "displayName" : "Sentry"  
    } ]  
  } ],  
  "hosts" : [ {  
    "hostId" : "i-aa1e4329",  
    "ipAddress" : "172.31.51.34",  
    "hostname" : "ip-172-31-51-34.ec2.internal",  
    "rackId" : "/default",  
    "config" : {  
      "items" : [ ]  
    }  
  }, {  
    "hostId" : "i-a91e432a",  
    "ipAddress" : "172.31.51.35",  
    "hostname" : "ip-172-31-51-35.ec2.internal",  
    "rackId" : "/default",  
    "config" : {  
      "items" : [ ]  
    }  
  }, {  
    "hostId" : "i-a81e432b",  
    "ipAddress" : "172.31.51.36",  
    "hostname" : "ip-172-31-51-36.ec2.internal",  
    "rackId" : "/default",  
    "config" : {  
      "items" : [ ]  
    }  
  }, {  
    "hostId" : "i-af1e432c",  
    "ipAddress" : "172.31.51.37",  
    "hostname" : "ip-172-31-51-37.ec2.internal",  
    "rackId" : "/default",  
    "config" : {  
      "items" : [ ]  
    }  
  }, {  
    "hostId" : "i-ae1e432d",  
    "ipAddress" : "172.31.51.38",  
    "hostname" : "ip-172-31-51-38.ec2.internal",  
    "rackId" : "/default",  
    "config" : {  
      "items" : [ ]  
    }  
  } ],  
  "users" : [ {  
    "name" : "__cloudera_internal_user__2ce3bad4-9c46-4029-9639-9782ac656fdf",  
    "roles" : [ "ROLE_USER" ],  
    "pwHash" : "acab5d31f930b991ae21fc1d65639b8616d59241ef1359135a9c9ebf5016e909",  
    "pwSalt" : 487134678069322501,  
    "pwLogin" : true  
  }, {  
    "name" : "__cloudera_internal_user__mgmt-EVENTSERVER-0ec789ec7ff769bec1152603e0c9dbc2",  
    "roles" : [ "ROLE_USER" ],  
    "pwHash" : "1900ed2a7a2c628e335fac1191289ae2547a0d62af735c276d4649f02a88b3b2",  
    "pwSalt" : -4370443277596870031,  
    "pwLogin" : true  
  }, {  
    "name" : "__cloudera_internal_user__mgmt-HOSTMONITOR-0ec789ec7ff769bec1152603e0c9dbc2",  
    "roles" : [ "ROLE_USER" ],  
    "pwHash" : "3bb29dfb957ee9f4a68fd5a442e925397238ac09cd63a404ecc8966e3dddeb29",  
    "pwSalt" : 2867105201876853639,  
    "pwLogin" : true  
  }, {  
    "name" : "__cloudera_internal_user__mgmt-REPORTSMANAGER-0ec789ec7ff769bec1152603e0c9dbc2",  
    "roles" : [ "ROLE_USER" ],  
    "pwHash" : "197cb72a9a76cafc4877fb52af5b54cd0357519555a35eb7f9940462d50b8725",  
    "pwSalt" : 1786448477529814592,  
    "pwLogin" : true  
  }, {  
    "name" : "__cloudera_internal_user__mgmt-SERVICEMONITOR-0ec789ec7ff769bec1152603e0c9dbc2",  
    "roles" : [ "ROLE_USER" ],  
    "pwHash" : "06f22ff234aa3921edab2736895c2652fc43b431567b97e01a52c43976835166",  
    "pwSalt" : -829162977839554538,  
    "pwLogin" : true  
  }, {  
    "name" : "admin",  
    "roles" : [ "ROLE_ADMIN" ],  
    "pwHash" : "3acb71e94326161993cb601f6d797f2771f98d3f737a05e68c18628a29e903d1",  
    "pwSalt" : 5055721371285247261,  
    "pwLogin" : true  
  }, {  
    "name" : "minotaur",  
    "roles" : [ "ROLE_CONFIGURATOR" ],  
    "pwHash" : "5ac82fa4948e9a90ef97ff98d0350be557bc12d8202bcf7aa8d37b8fd7bbb887",  
    "pwSalt" : 2474477855376558537,  
    "pwLogin" : true  
  } ],  
  "versionInfo" : {  
    "version" : "5.6.0",  
    "buildUser" : "jenkins",  
    "buildTimestamp" : "20160211-1910",  
    "gitHash" : "1c2be84380aa23bd5d6993ec300e144c78b37bf2",  
    "snapshot" : false  
  },  
  "managementService" : {  
    "name" : "mgmt",  
    "type" : "MGMT",  
    "config" : {  
      "roleTypeConfigs" : [ {  
        "roleType" : "ALERTPUBLISHER",  
        "items" : [ {  
          "name" : "alert_mailserver_password",  
          "value" : "admin"  
        }, {  
          "name" : "alert_mailserver_username",  
          "value" : "admin"  
        } ]  
      }, {  
        "roleType" : "EVENTSERVER",  
        "items" : [ {  
          "name" : "event_server_heapsize",  
          "value" : "364904448"  
        } ]  
      }, {  
        "roleType" : "HOSTMONITOR",  
        "items" : [ {  
          "name" : "firehose_heapsize",  
          "value" : "268435456"  
        }, {  
          "name" : "firehose_non_java_memory_bytes",  
          "value" : "1051721728"  
        } ]  
      }, {  
        "roleType" : "REPORTSMANAGER",  
        "items" : [ {  
          "name" : "headlamp_database_host",  
          "value" : "ip-172-31-51-35.ec2.internal"  
        }, {  
          "name" : "headlamp_database_name",  
          "value" : "rman"  
        }, {  
          "name" : "headlamp_database_password",  
          "value" : "rman_password"  
        }, {  
          "name" : "headlamp_database_user",  
          "value" : "rman"  
        }, {  
          "name" : "headlamp_heapsize",  
          "value" : "514850816"  
        } ]  
      }, {  
        "roleType" : "SERVICEMONITOR",  
        "items" : [ {  
          "name" : "firehose_heapsize",  
          "value" : "268435456"  
        }, {  
          "name" : "firehose_non_java_memory_bytes",  
          "value" : "1051721728"  
        } ]  
      } ],  
      "items" : [ ]  
    },  
    "roles" : [ {  
      "name" : "mgmt-ALERTPUBLISHER-0ec789ec7ff769bec1152603e0c9dbc2",  
      "type" : "ALERTPUBLISHER",  
      "hostRef" : {  
        "hostId" : "i-a91e432a"  
      },  
      "config" : {  
        "items" : [ {  
          "name" : "role_jceks_password",  
          "value" : "7mdvxmux6mnjgavgca2vlk9s9"  
        } ]  
      }  
    }, {  
      "name" : "mgmt-EVENTSERVER-0ec789ec7ff769bec1152603e0c9dbc2",  
      "type" : "EVENTSERVER",  
      "hostRef" : {  
        "hostId" : "i-a91e432a"  
      },  
      "config" : {  
        "items" : [ {  
          "name" : "role_jceks_password",  
          "value" : "2jnn93erxfqqh1mbpitr7i9wl"  
        } ]  
      }  
    }, {  
      "name" : "mgmt-HOSTMONITOR-0ec789ec7ff769bec1152603e0c9dbc2",  
      "type" : "HOSTMONITOR",  
      "hostRef" : {  
        "hostId" : "i-a91e432a"  
      },  
      "config" : {  
        "items" : [ {  
          "name" : "role_jceks_password",  
          "value" : "2u1ici2tfn4z2jq3wsvbtk4iw"  
        } ]  
      }  
    }, {  
      "name" : "mgmt-REPORTSMANAGER-0ec789ec7ff769bec1152603e0c9dbc2",  
      "type" : "REPORTSMANAGER",  
      "hostRef" : {  
        "hostId" : "i-a91e432a"  
      },  
      "config" : {  
        "items" : [ {  
          "name" : "role_jceks_password",  
          "value" : "d2n8vieqhximj8yw67bfbs8ax"  
        } ]  
      }  
    }, {  
      "name" : "mgmt-SERVICEMONITOR-0ec789ec7ff769bec1152603e0c9dbc2",  
      "type" : "SERVICEMONITOR",  
      "hostRef" : {  
        "hostId" : "i-a91e432a"  
      },  
      "config" : {  
        "items" : [ {  
          "name" : "role_jceks_password",  
          "value" : "4939on88ybolc19ktlfb1fpgp"  
        } ]  
      }  
    } ],  
    "displayName" : "Cloudera Management Service"  
  },  
  "managerSettings" : {  
    "items" : [ {  
      "name" : "AD_USE_SIMPLE_AUTH",  
      "value" : "false"  
    }, {  
      "name" : "CLUSTER_STATS_START",  
      "value" : "10/21/2012 20:40"  
    }, {  
      "name" : "KDC_ADMIN_PASSWORD",  
      "value" : "BQIAAABCAAIADEVDMi5JTlRFUk5BTAAMY2xvdWRlcmEtc2NtAAVhZG1pbgAAAAFW8t23AQAXABBl\r\nst9jalNOBEHJo/rWR0pEAAAAUgACAAxFQzIuSU5URVJOQUwADGNsb3VkZXJhLXNjbQAFYWRtaW4A\r\nAAABVvLdtwEAEgAgMM4eAc2mAs17zHp3jTxtEgG5AquuhucI2bFnfNP9fXY=\r\n"  
    }, {  
      "name" : "KDC_ADMIN_USER",  
      "value" : "cloudera-scm/admin@EC2.INTERNAL"  
    }, {  
      "name" : "KDC_HOST",  
      "value" : "ip-172-31-51-35.ec2.internal"  
    }, {  
      "name" : "KEYSTORE_PASSWORD",  
      "value" : "admin"  
    }, {  
      "name" : "KEYSTORE_PATH",  
      "value" : ""  
    }, {  
      "name" : "KRB_ENC_TYPES",  
      "value" : "rc4-hmac aes256-cts"  
    }, {  
      "name" : "KRB_LIBDEFAULTS_SAFETY_VALVE",  
      "value" : " default_realm = EC2.INTERNAL\n dns_lookup_realm = false\n dns_lookup_kdc = false\n ticket_lifetime = 24h\n renew_lifetime = 7d\n forwardable = true\n"  
    }, {  
      "name" : "KRB_MANAGE_KRB5_CONF",  
      "value" : "true"  
    }, {  
      "name" : "KRB_OTHER_SAFETY_VALVE",  
      "value" : "[domain_realm]\n .ec2.internal = EC2.INTERNAL\n ec2.internal = EC2.INTERNAL\n"  
    }, {  
      "name" : "KRB_REALMS_SAFETY_VALVE",  
      "value" : "\n EC2.INTERNAL = {\n  kdc = ip-172-31-51-35.ec2.internal:88\n  admin_server = ip-172-31-51-35.ec2.internal:749\n  default_domain = ec2.internal\n }\n"  
    }, {  
      "name" : "LDAP_BIND_DN",  
      "value" : "admin"  
    }, {  
      "name" : "LDAP_BIND_PW",  
      "value" : "admin"  
    }, {  
      "name" : "MAX_RENEW_LIFE",  
      "value" : "604800"  
    }, {  
      "name" : "PUBLIC_CLOUD_STATUS",  
      "value" : "ON_PUBLIC_CLOUD"  
    }, {  
      "name" : "REMOTE_PARCEL_REPO_URLS",  
      "value" : "https://archive.cloudera.com/cdh5/parcels/{latest_supported}/,https://archive.cloudera.com/cdh4/parcels/latest/,https://archive.cloudera.com/impala/parcels/latest/,https://archive.cloudera.com/search/parcels/latest/,https://archive.cloudera.com/accumulo/parcels/1.4/,https://archive.cloudera.com/accumulo-c5/parcels/latest/,https://archive.cloudera.com/kafka/parcels/latest/,https://archive.cloudera.com/navigator-keytrustee5/parcels/latest/,https://archive.cloudera.com/spark/parcels/latest/,https://archive.cloudera.com/sqoop-connectors/parcels/latest/,http://52.91.20.166:80/cdh5.6.0/"  
    }, {  
      "name" : "SECURITY_REALM",  
      "value" : "EC2.INTERNAL"  
    }, {  
      "name" : "SINGLE_USER_GROUP",  
      "value" : "cloudera-scm/admin"  
    }, {  
      "name" : "SINGLE_USER_NAME",  
      "value" : "cloudera-scm/admin"  
    } ]  
  }  

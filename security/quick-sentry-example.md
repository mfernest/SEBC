## <center>

* Create/use a Linux account that is not a Hadoop service.
    * Create a Kerberos credential for this account as well.
* Add this account to the `sentry.service.admin.group` property
* Restart the Sentry, HUE, Hive, and Impala services.
* `kinit` the account and verify through beeline the account has no privileged access
    * `!connect jdbc:hive2://localhost:10000/default;principal=hive/hs2.node.com@REALM.COM`
    * (Enter name and password **for the Linux account**, not Hive)
* At the beeline prompt, enter `SHOW TABLES;`
    * You should see an empty set result, implying the account has no permissions
* Create a Sentry authorization that maps to a group including the Linux account.
    * `CREATE ROLE admin_role;`
    * `GRANT ALL ON SERVER server1 TO ROLE admin_role;`
    * `GRANT ROLE admin_role TO GROUP Linux_user_group;`
    * `SHOW TABLES;`
* This last statement should now return all tables defined under `server1`
* To test permission granularity, create additional users/groups on all cluster hosts
    * `$ sudo groupadd group1`
    * `$ sudo groupadd group2`
    * `$ sudo useradd -u 1100 -g group1 user1`
    * `$ sudo useradd -u 1200 -g group2 user2`
    * `$ kadmin.local: add_principal user1`
    * `$ kadmin.local: add_principal user2`
* Using the first account you created, use beeline to create new roles and assign groups to them
    * `0: jdbc:hive2://localhost:10000/default> CREATE ROLE role1;`
    * `0: jdbc:hive2://localhost:10000/default> CREATE ROLE role2;`
* Grant privileges on all tables to a new role:
    * `0: jdbc:hive2://localhost:10000/default> GRANT SELECT ON DATABASE default TO ROLE role1;`
* Constrain privileges on role2, allowing only read (SELECT) on default.sample07:
    * `0: jdbc:hive2://localhost:10000/default> REVOKE ALL ON DATABASE default FROM ROLE role2;`
    * `0: jdbc:hive2://localhost:10000/default> GRANT SELECT ON default.sample_07 TO ROLE role2;`
* Authenticate user1 via Kerberos, access beeline, and list tables
    * `$ kinit user1`
    * `$ beeline`
    * `!connect jdbc:hive2://localhost:10000/default;principal=hive/hs2.node.com@REALM.COM`
    * `0: jdbc:hive2://localhost:10000/default> SHOW TABLES;`
    * `user1` should be able to see all tables
* Authenticate with user2 the same way to list tables
    * `user2` should see only `sample_07`

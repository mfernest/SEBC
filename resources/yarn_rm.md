<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> Tuesday PM
# <center> <a name="yarn_rm_section"/>YARN & RM

* <a href="#mrv1_review">MRv1 Design</a>
* <a href="#mrv2_review">YARN/MRv2 Design</a>
* <a href="#YARN_overview">What YARN Does</a>
* <a href="#migrating_mrv1_mrv2">Migrating from MRv1 to YARN</a>
* <a href="#RM_overview">Resource Management Overview</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="mrv1_review"/> MRv1 Design

### <center> Graphic overview

<center><img src="http://www.ibm.com/developerworks/library/bd-yarn-intro/fig01.png"/></center>

---
<div style="page-break-after:always;"></div>

## <center> MRv1: Roles & Pain Points

* JobTracker manages scheduling, TaskTrackers, job status, and recent history
* TaskTrackers set a number of <i>slots</i> that are map- or reduce-specific
    * Slot count factors include cores, spindles, and workload -- art and science
    * Under-utilization is hard to avoid
    * Over-utilization can lead you down a difficult path
* At ~4k TaskTrackers, JobTracker allegedly becomes a bottleneck
* You can overrun JT cache with too many fast-failing jobs

---
<div style="page-break-after: always;"></div>

## <center> <a name="mrv2_review"/> YARN/MRv2: Design

### <center> Graphic overview

<center><img src="http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/yarn_architecture.gif"></center>

---
<div style="page-break-after: always;"></div>

## <center> MRv2: Roles

* Resource Manager (RM)
    * Supervises NodeManagers, schedules jobs
    * Default port 8088
* NodeManager
    * Launches/manages containers
    * Updates the Resource Manager 
* Containers provide execution resources
* Application Master (AM)
    * Manages one job from a container
    * Application-specific (e.g., MRAppMaster)
* JobHistory Server
    * Logs job status info from NodeManagers
    * Default port: 19888

[Operator overview of MR migration](http://blog.cloudera.com/blog/2013/11/migrating-to-mapreduce-2-on-yarn-for-operators/)</br>
[MRv1->MRv2 Migration Guide](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_mapreduce_to_yarn_migrate.html)

---
<div style="page-break-after: always;"></div>

## <center> YARN Job Control (MR)

1. Client submits a job to YARN
2. RM launches the right AM
3. AM requests data block locations from the NN
4. AM requests containers from the RM
5. RM finds open containers, returns a list to the AM
6. AM invokes containers via their Node Manager -- mappers start
7. RM invokes an auxiliary shuffle service 
8. AM requests containers for reducing tasks
9. The AM releases containers, updates RM as tasks complete
10. RM updates the Job History server

---
<div style="page-break-after: always;"></div>

## <center> <a name="YARN_overview"/>What YARN Changes

* MRv2 service recasts MRv1
    * No JobTracker
    * The Application Master (AM) schedules, executes, supervises, and gets resources for its jobs
* YARN = <strong>Y</strong>et <strong>A</strong>nother <strong>R</strong>esource <strong>N</strong>egotiator
    * Separates resource management from application type    * A [general application framework](http://wiki.apache.org/hadoop/PoweredByYarn), starting with MRv2
    * See the term [NextGenMapReduce](http://wiki.apache.org/hadoop/NextGenMapReduce) for more on the motivation behind YARN

---
<div style="page-break-after: always;"></div>

## <center> Benefits of YARN</center>

* Better resource utilization
* Better RM scalability
    * For very large clusters
* Better performance for some cases
    * Large clusters running many small jobs
    * Balancing MapReduce (batch) and Impala (NRT queries)
        * [Performance under multi-tenancy](http://blog.cloudera.com/blog/2013/06/configuring-impala-and-mapreduce-for-multi-tenant-performance/) is a key selling point
* The Big Idea: one RM control for all cluster
    * Support for user/group and tag-based classifiers
    * Custom, pluggable classifiers: on the roadmap 
    * RM HA is available

---
<div style="page-break-after: always;"></div>

## <center> <a name="migrating_mrv1_mrv2"/> Migrating from MRv1 to MRv2

* Common mistake: assuming YARN roles map 1:1 to MRv1 roles
* Common mistake: assuming CM manages the complexity
* Read <a href="http://blog.cloudera.com/blog/2014/04/apache-hadoop-yarn-avoiding-6-time-consuming-gotchas/">Jeff Bean's blog post on common gotchas</a>, including:
    * The change from slot count to container sizing is just one part.
    * Comparing apples-to-apples for performance is hard
    * JVM heap calculations are different
    * YARN logs all framework messages, not just MRv2
        * Messages are more generic; naming conventions are different
    * [Too many AMs can ball YARN up](https://issues.apache.org/jira/browse/YARN-1913)
* Ensure [a proper comparison](http://blog.cloudera.com/blog/2014/02/getting-mapreduce-2-up-to-speed/)

---
<div style="page-break-after: always;"></div>


## <center> <a name="RM_overview"/>Resource Management

<p><i>YARN's Resource Management strategy is divided into three layers</i></p>

1. <a href="#rm_service_isolation">Service-level isolation</a>
    * Sets minimum resources for all cluster services, including YARN
    * E.g., HDFS, HBase, Impala, Search, MRv1
2. <a href="#admission_control">Scheduling/Impala's Admission Control</a>
    * Resource priority based on request, service type
3. <a href="#dynamic_prioritization">Dynamic prioritization</a>
    * Allocating resources by rule

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_service_isolation"/>Service-level Isolation (cgroups)

* Sets minimum resource guarantee for each service, under contention
* CM uses [Linux Control Groups](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_cgroups.html)
    * Will support CPU, memory, disk I/O, and network limits (subject to OS support)
    * *Cluster > ClusterName > Static Service Pools*
    * [A hands-on intro to cgroups](http://riccomini.name/posts/hadoop/2013-06-14-yarn-with-cgroups/)
* Coarse-grained, policy-driven resource management

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_admission_control"/> Impala Admission Control

* [Throttle and queue control for Impala queries only](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/Impala/Installing-and-Using-Impala/ciiu_admission.html)
* Enabled in CDH5 if Impala 1.3 or later is present
* Various arrangements with YARN in CDH5:
    1. YARN manages all Impala resources
    2. YARN only sets Impala's memory limit; Impala uses AC
    3. YARN uses pools; Impala operates on pools with queries
* See [Dynamic Resource Pools](http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM5/latest/Cloudera-Manager-Managing-Clusters/cm5mc_resource_pools.html) in CM
    * <i>Configuration sets</i> define client groups (e.g., prod, mktg)
    * <i>Scheduling rules</i> apply to configuration sets
    * Pools can be constrained by authorization, query count, queue size, memory requirements
* CM UI, Cluster > ClusterName > Dynamic Resource Pools

---
<div style="page-break-after: always;"></div>

## <center> More on Admission Control </center>

* Uses the same pool definitions as YARN
* Three actions: execute, queue, or reject a query
* Decision based on:
    * Currently running queries
    * Resources available (only memory is checked at present)
    * Current queue length
* The local impalad decides, using cached global data
    * Given possible delays, admission control is soft
* Favors keeping tasks alive over maintaining headroom
    * Work to improve this area is ongoing

---
<div style="page-break-after: always;"></div>

## <center> <a name="rm_dynamic_prioritization"/> Dynamic Prioritization

* Ongoing, mediated balance of resources to workload
    * Use multiple scheduler queues
    * Apply opportunistic processing to improve utilization
    * The trick is balancing low-latency and batch processing tasks
* Effort is ongoing to improve resource estimation
* One project: a <strong>L</strong>ow-<strong>L</strong>atency <strong>A</strong>pplication <strong>MA</strong>ster ([LLAMA](http://cloudera.github.io/llama/)) for Impala
    * Released on CDH5 as a beta component
    * Goal: to run all Impala queries using one ApplicationMaster
        * Cache resources, minimize interaction with RM
    * Like YARN for CDH4, not production-ready

---
<div style="page-break-after: always;"></div>

## <center> Current Practices for YARN & Impala

* Prefer Admission Control over straight RM
* LLAMA is experimental
    * Feedback is great -- if the customer is up for it
* Current best practices
    * Use Static Resource Pools for coarse-grained service isolation
    * Impala with AC to set resource limits by user/group
    * Try [LLAMA](http://cloudera.github.io/llama/) on Pilot/Dev/Staging

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Doing the Math

* [Use this guide](http://www.cloudera.com/content/cloudera/en/documentation/core/v5-3-x/topics/cdh_ig_yarn_tuning.html), if needed, to answer the following questions. 
    * How much RAM does an Impalad process need, at minimum?
    * What percentage of RAM should be earmarked for the OS and system services?
    * Under what condition(s) would you allot two cores per spindle in your calculations?
    * Assume 20 vcores, 128 GB RAM, and ten spindles on eight worker nodes. Using the Container Formulas listed in Table 8, what is the derived value for <code>mapreduce.jobs.maps</code>? Show your work carefully.
    
Email these questions with your answers to the instructor.     

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Tuning for YARN

* Review the file <code>yarn/YARNtest.sh</code> in the course repository
    * It may be broken but may still run
* Copy it to a cluster node and get it working
    * You can limit the loops to one value each in this phase
* Run the tests 
    * Raise the parameters to max out your cluster, if necessary
* Email the instructor with
    * The final version of your script (hint: useful comments are good)
    * The results of your least and most efficient runs

---
<div style="page-break-after: always;"></div>

## <center> YARN/RM Lab: Static Service Pools

* In CM, navigate by menu: Clusters->YARN Applications or by service: YARN(MR2 Included) -> Applications
    * Click the Charts tab and capture the page.
* Navigate to Clusters -> Static Service Pools
    * Allocate 25% to HDFS and 75% to YARN and click Continue
    * On the Step 2 of 4 page, review the sections and proposed values
    * Complete the wizard: redeploy client configurations and restart the cluster
    * Capture the Step 1 of 4 page after the restart
* Email the captures to your instructor


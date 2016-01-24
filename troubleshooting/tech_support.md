<!-- CSS work goes here for the time being -->
<!-- set a:link text-decoration to none -->
<!-- set a:hover text-decoration to underline -->
<!-- http://forums.markdownpad.com/discussion/143/include-pdf-pagebreak-instructions-in-markdown/p1 -->

---
<div style="page-break-after: always;"></div>

# <center> <a name="troubleshooting_practices_section"/>Troubleshooting

* <a href="#troubleshooting_philosophy">Cloudera's Partner Philosophy</a>
* <a href="#troubleshooting_enabling_partners">Enabling field partners</a>
* <a href="#troubleshooting_docs_assistance">Using documentation, getting assistance</a>
* <a href="#troubleshooting_problems_bugs_issues">Defining problems, bugs, and customer issues</a>
* <a href="#troubleshooting_methodology">Troubleshooting methodology</a> 
* <a href="#troubleshooting_challenges">Preparing for Friday challenges</a>

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_philosophy"/> Cloudera's Partner Training Philosophy </center>

* The mantra: we need partners to win
* The program, on the other hand: slowly forming
* Cloudera University training is user, not field-partner oriented 
* This is the third delivery for field training.
* We're learning how best to share our field knowledge and resources
* Feedback helps: how can we support you in the field?
* Which resources can contribute most to your success?

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_enabling_partners"> General Resources to Have</a>

* [ASF account for reporting/reviewing bugs](https://issues.apache.org/jira/secure/Dashboard.jspa)
* [Cloudera Connect - partner portal](http://www.cloudera.com/content/cloudera/en/partners.html)
* [Github account](https://github.com/)

<!-- Other partner resources I'm not aware of --> 

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_docs_assistance"> Documentation & Support </a>

* We must review all materials customers can access
* Follow and participate in [Cloudera's forums](http://community.cloudera.com)
* Always ask which CM/CDH versions are in use?
* [Documentation starts here](http://www.cloudera.com/content/support/en/documentation.html) 
* Review all Technical Service Bulletins
* Learn to use the [Diagnostic Bundle Collector](http://www.cloudera.com/content/support/en/support-info/cluster-statistics.html)

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_problems_bugs_issues"/> Defining Problems, Bugs, Customer Issues

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_methodology"/> Troubleshooting Wisdom

*Potential measures by how much you lost* -- my college track coach

* Fixing a recurring or well-known problem quickly is a common pitfall 
* You need a method you can recite when you encounter new/unfamiliar territory
* To remind yourself what you know
* To recall tools that can tell you what you don't know
* To remember tools don't solve problems, they help reveal them
* To write down what you've learned so you can share it

---
<div style="page-break-after: always;"></div>

## <center> Methodology: Guidance<p>

We have many technologies to consider. A good general-purpose book for articulating your practice is *Debugging*, by David J. Agans. These nine points are the focus:

1. Understand the System
2. Check the Plug
3. Divide and Conquer
4. Make It Fail
5. Quit Thinking and Look
6. Change One Thing at a Time
7. Keep an Audit Trail
8. Get a Fresh View
9. If You Didn't Fix It, It Ain't Fixed

Note: Apply #7 to **documenting your fix**, and adding it to the community's knowledge

---
<div style="page-break-after: always;"></div>

## <center> Pro Tip: Find Patches by Release

* Review the [change log](http://archive-primary.cloudera.com/cdh5/cdh/5/)
* Search by [CDH project](http://jira.cloudera.com) -- put JIRA identifier in double quotes
* Grep the code! For example, to find FLUME-2245 in CDH 5.1.x:
    * <code>$ **git clone https://github.com/cloudera/flume-ng** </code>
    * <code>$ **cd flume-ng** </code>
    * <code>$ **git branch -a** </code>
    * <code>$ **git log origin/cdh5-1.4.0_5.0.2 | grep 'FLUME-2245'** </code>
    * <code>$ **git log origin/cdh5-1.4.0_5.0.3 | grep 'FLUME-2245'** </code><br><code>FLUME-2245. Pre-close flush failure can cause HDFS Sinks to not process events</code>
* Getting patch updates: <code>$ **git fetch origin** </code>

---
<div style="page-break-after: always;"></div>

## <center> Pro Action: Finding Patches with Better Tools

* Fork/review Jarcec Cecho's [gb-grep tool](https://github.com/jarcec/cmd-tools/blob/master/gb-grep)
    * Doesn't require branch-specific search
 <!-- Use Miklos Christine's [instructions on using Jarcec's script](
https://wiki.cloudera.com/display/~mwc/Git+Find+Branch+given+a+Jira)) -->
* Usage:
    * <code>$ **git clone http://github.mtv.cloudera.com/CDH/hadoop</code>**
    * <code>$ **cd hadoop/</code>**
    * <code>$ **gb-grep "HDFS-7575"</code>**
* Sample output line:
<code><br>
Searching for HDFS-7575
hadoop-hdfs-project: f1a2fce5b3c21e3335f99fe210edbb1f9c7bb29f
HDFS-7575. Upgrade should generate a unique storage ID for each
volume. (Contributed by Arpit Agarwal)</code>

---
<div style="page-break-after: always;"></div>

## <center> <a name="troubleshooting_challenges"/> Friday Challenges

* Read through the challenges in this document
    * These challenges were part of the last delivery 
* Notice the following
    * The focus of each challenge
    * The details in the instructions
    * The submission requirements
    * The deadlines

---
<div style="page-break-after: always;"></div>

## <center> Lab: Review time

* You should:
    * Review the challenges. 
    * Review your class notes
    * Repeat or continue lab work
    * Prepare new instances for tomorrow's challenges 
* You should not:
    * Write scripts to automate tomorrow's work -- waste of time
    * Install software to your new instances


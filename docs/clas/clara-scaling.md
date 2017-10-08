---
layout: doc_clas
title: Clara scaling
---
## CLARA scaling

### Introduction

CLARA framework is multi-dimensional elastic system,
and is capable of auto-scaling vertically as well as horizontally.
For example CLARA will multi-thread services within an application
to utilize all available cores of a node (vertical scaling),
and the same time will also expand to available nodes in the network
(accessible LAN or WAN)
to consume cores on network distributed nodes (horizontal scaling).
However, it is understood that this multi-dimensional scaling
cannot go linearly forever,
due to the data/event provisioning system latency.
So, to guarantee linear scalability we must process in parallel
data/events from different data sources or data provisioning systems.

### Controlled horizontal scaling

The CLARA CLI is designed to auto configure horizontal scaling,
ensuring linear scalability of entire data processing.
As usually *files.list* contains multiple data files to be processed.
If the CLI parameter: *farm.scaling* is set to 0,
then the entire data set will be processed in a single CLARA DPE (single node),
multi-threaded (vertically scaled) over all available cores of that single node.
However, this processing will not be horizontally scaled,
meaning that the data files in the *files.list* will be processed sequentially.
Yet, in case user sets *farm.scaling = n*, that will tell CLARA
to process group of n files from the *files.list* data-set in parallel,
on different farm nodes.
This will speed up processing of the entire data-set n times.

### Example

For example a user prepares a data processing with the following CLARA
CLI settings

```
gurjyan@clara1602:~$ $CLARA_HOME/bin/clara-shell

   ██████╗██╗      █████╗ ██████╗  █████╗
  ██╔════╝██║     ██╔══██╗██╔══██╗██╔══██╗ 4.3.0
  ██║     ██║     ███████║██████╔╝███████║
  ██║     ██║     ██╔══██║██╔══██╗██╔══██║
  ╚██████╗███████╗██║  ██║██║  ██║██║  ██║
   ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝


 Run 'help' to show available commands.

clara> show config
servicesFile:        "/group/da/vhg/testbed/clara/myClara/plugins/clas12/config/services.yaml"
fileList:            "/group/da/vhg/testbed/clara/myClara/plugins/clas12/config/files.list"
inputDir:            "/group/da/vhg/testbed/clara/myClara/data/input"
outputDir:           "/group/da/vhg/testbed/clara/myClara/data/output"
threads:             32
reportEvents:        NO VALUE
skipEvents:          NO VALUE
maxEvents:           NO VALUE
logDir:              "/group/da/vhg/testbed/clara/myClara/log"
feHost:              NO VALUE
fePort:              NO VALUE
session:             "gurjyan"
description:         "clara"
useFE:               true
javaMemory:          NO VALUE
javaOptions:         NO VALUE
farm.cpu:            32
farm.memory:         30
farm.disk:           3
farm.time:           1440
farm.os:             "centos7"
farm.stage:          NO VALUE
farm.track:          "debug"
farm.system:         "jlab"
farm.scaling:        0
```

The files.list contains 11 files.
```
clara> show files
sidisSkim100k.hipo
sidisSkim110k.hipo
sidisSkim120k.hipo
sidisSkim130k.hipo
sidisSkim140k.hipo
sidisSkim150k.hipo
sidisSkim160k.hipo
sidisSkim170k.hipo
sidisSkim180k.hipo
sidisSkim190k.hipo
sidisSkim100k.hipo
```

Now let us require processing groups of 2 files in parallel in different
farm nodes.
```
clara> set farm.scaling 2

clara> show config
servicesFile:        "/group/da/vhg/testbed/clara/myClara/plugins/clas12/config/services.yaml"
fileList:            "/group/da/vhg/testbed/clara/myClara/plugins/clas12/config/files.list"
inputDir:            "/group/da/vhg/testbed/clara/myClara/data/input"
outputDir:           "/group/da/vhg/testbed/clara/myClara/data/output"
threads:             32
reportEvents:        NO VALUE
skipEvents:          NO VALUE
maxEvents:           NO VALUE
logDir:              "/group/da/vhg/testbed/clara/myClara/log"
feHost:              NO VALUE
fePort:              NO VALUE
session:             "gurjyan"
description:         "clara"
useFE:               true
javaMemory:          NO VALUE
javaOptions:         NO VALUE
farm.cpu:            32
farm.memory:         30
farm.disk:           3
farm.time:           1440
farm.os:             "centos7"
farm.stage:          NO VALUE
farm.track:          "debug"
farm.system:         "jlab"
farm.scaling:        "2"
```

This will tell CLARA to split the *files.list* data-set in 6 separate data
sets, where first 5 will have 2 files and the last 6th will have
only a single data file, i.e. sidisSkim100k.hipo. Metadata for this data sets
will be stored in the temporary directory in the $CLARA_HOME/plugins/clas12/config
under the name .<session> (in the presented example it would be
$CLARA_HOME/plugins/clas12/config/.clara)

```
gurjyan@clara1602:~$ cd $CLARA_HOME/plugins/clas12/config/.clara/
gurjyan@clara1602:config/.clara$ ls
clara_0  clara_1  clara_2  clara_3  clara_4  clara_5
```

Now if we start farm processing in the CLI, CLARA will submit 5 farm jobs.

```
clara> run farm
Parsing script ... (it may take while)
<jsub><request><index>21888672</index><jobIndex>42398564</jobIndex></request></jsub>
Parsing script ... (it may take while)
<jsub><request><index>21888675</index><jobIndex>42398567</jobIndex></request></jsub>
Parsing script ... (it may take while)
<jsub><request><index>21888678</index><jobIndex>42398570</jobIndex></request></jsub>
Parsing script ... (it may take while)
<jsub><request><index>21888681</index><jobIndex>42398573</jobIndex></request></jsub>
Parsing script ... (it may take while)
<jsub><request><index>21888685</index><jobIndex>42398577</jobIndex></request></jsub>
Parsing script ... (it may take while)
<jsub><request><index>21888687</index><jobIndex>42398579</jobIndex></request></jsub>

clara> show farmStatus
JOB_ID    USER      STAT    QUEUE      EXEC_HOST   JOB_NAME         SUBMIT_TIME   CPU_TIME  WALLTIME  ACCOUNT
42398564  gurjyan     A    priority    --         ...urjyan-clara   Aug 22 16:21  --         --         clas12
42398567  gurjyan     A    priority    --         ...urjyan-clara   Aug 22 16:21  --         --         clas12
42398570  gurjyan     A    priority    --         ...urjyan-clara   Aug 22 16:21  --         --         clas12
42398573  gurjyan     A    priority    --         ...urjyan-clara   Aug 22 16:21  --         --         clas12
42398577  gurjyan     A    priority    --         ...urjyan-clara   Aug 22 16:21  --         --         clas12
42398579  gurjyan     A    priority    --         ...urjyan-clara   Aug 22 16:21  --         --         clas12
```



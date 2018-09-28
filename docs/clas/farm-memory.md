---
title: Farm deployment
---

CLARA CLI default values were set to values that will work properly
for majority of JLAB farm deployments.

{: .note .warning }
Do not change default settings for *farm.memory*,
*farm.disk*, *farm.os*, and *farm.track*, unless
you are absolutely sure of the new values.

## Basic steps

First define your data set.

```
clara> show files
clara> edit files
```

Make sure application description, data-set metadata, and an actual
repository of data files are visible to the farm nodes.

```
servicesFile:  "/group/da/vhg/testbed/clara/myClara/plugins/clas12/config/services.yaml"
fileList:      "/group/da/vhg/testbed/clara/myClara/plugins/clas12/config/files.list"
inputDir:      "/group/da/vhg/testbed/clara/myClara/data/input"
outputDir:     "/group/da/vhg/testbed/clara/myClara/data/output"
```

Set data processing session and description.

```
clara> set session gurjyan1
clara> set description test1
```

{: .note .info }
Note that *session* and *description* MUST be unique for every farm deployment.

Set desired vertical and horizontal scaling parameters.
For *farm.cpu* of 4 or more, we recommend setting *farm.memory* to 37.
We also suggest setting an horizontal scaling (*farm.scaling*) of 2 or more,
due to the JIT compiler requiring time to setup environment for data-processing.

```
clara> set farm.cpu 8
clara> set farm.scaling 2
clara> set farm.stage /scartch/clara
```

Start farm deployment:

```
clara> run farm
clara> sho farmStatus
```

## Clara CLI JLAB farm setting example

Memory requests are for virtual memory. The requests will be factor 2-3 less in case
farm control software will react on actual physical memory usage.

```
set session gurjyan
set description test
set useFE true
set javaMemory 2
set farm.cpu    4  (8,   16,  32, 64)
set farm.memory 16 (16,  20,  30, 40)
set farm.disk 5
set farm.time 1440
set farm.os centos7
set farm.track debug
set farm.system jlab
set farm.stage /scratch/clara
```

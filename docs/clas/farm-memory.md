---
layout: doc_clas
title: Farm deployment
---
## Farm deployment

CLARA CLI default values were set to values that will work properly
for majority of JLAB farm deployments.

<div class="note info">
    <code>Do not change default settings for *farm.memory,
    farm.disk, farm.os, farm.track, farm.system*, etc. unless
    you are absolutely positive.</code>
    </div>


### Basic steps

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

<div class="note info">
    <code> Note that session and description MUST be unique for every farm deployment.</code>
    </div>

```
clara> set session gurjyan1
clara> set description test1
```

Set  desired vertical and horizontal scaling parameters. For *farm.cpu* request
<=4 we recommend setting *farm.memory 37*. We also suggest
setting horizontal scaling (*farm.scaling*) >=2, due to the JIT compiler, requiring
time to setup environment for data-processing.

```
clara> set farm.cpu 8
clara> set farm.scaling 2
```

Start farm deployment
```
clara> run farm
clara> sho farmStatus
```

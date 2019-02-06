---
title: Farm deployment
---

Clara CLI default values were set to values that will work properly
for majority of JLAB farm deployments.


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

<div class="admonition note" markdown="1">
Note that *session* and *description* MUST be unique
for every farm deployment.
</div>

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

Memory requests are for virtual memory.
The requests will be factor 2-3 less
in case farm control software will react on actual physical memory usage.

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

## JLAB farm running tips

### Chef: Production data processing jobs

We recommend using Clara’s JLAB data-processing auto-configuration option to insure
optimized performance and efficient utilization of the farm resources. In this case the
only requirement is to set the *farm.exclusive*, *fileList* and *description* options
(note: *fileList* and *description* must be unique for every farm job submission). E.g.

```
clara> set fileList
clara> set description
clara> set farm.exclusive farm18 (farm16, farm14, farm13, etc)
clara> set outFilePrefix xyz_ (optional)
clara> set farm.scaling N (optional)
```
These settings will guarantee an exclusive access to a specified node-flavor
and will run hardware optimized (NUMA socket affinity, cores and memory) Clara processes.

### User: Private data processing jobs

#### farm13, farm14 and farm16

We suggest for an efficient utilization of the farm
to use default core and memory settings: *farm.cpu=16*, *farm.memory=40G*.
These are the suggested settings:

```
clara> set fileList
clara> set description
clara> set farm.node farm16
clara> set farm.stage /scratch/clara/xyz
clara> set outFilePrefix xyz_
clara> set farm.disk 25
clara> set farm.scaling N
```

*N* is the number defined based on the size of the data set.

#### farm18

The current suggestion (before implementing Slurm workload manager) is to use
*farm18* nodes in the `exclusive` mode, hence use the following settings:

```
clara> set fileList
clara> set description
clara> set farm.node farm18
clara> set farm.stage /scratch/clara/xyz
clara> set outFilePrefix xyz_
clara> set farm.disk 25
clara> set farm.cpu 80
```

No need to set the memory since in the exclusive mode the memory request is ignored.

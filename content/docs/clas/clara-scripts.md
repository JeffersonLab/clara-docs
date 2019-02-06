# Scripting

<div class="admonition note" markdown="1">
To start a data processing with a specified script, run:

`$ $CLARA_HOME/bin/clara-shell xyz.cls`
</div>


## Local processing (`local.cls`)

```
# Clara script example
# gurjyan 01.30.19
#
# Note:
# Data processing will fail in case composition and data-set description
# files are not available.
# In the case log and IO directories are not available Clara will
# use default: $CLARA_HOME/log and $CLARA_HOME/data/{input,output}
# directories.

set servicesFile /Users/gurjyan/Testbed/clara/services.yaml
set fileList /Users/gurjyan/Testbed/clara/files.list
set inputDir /Users/gurjyan/Testbed/clara/data/input
set outputDir /Users/gurjyan/Testbed/clara/data/out
set outputFilePrefix gurjyan_
set logDir /Users/gurjyan/Testbed/clara/log
set session gurjyanSession
set description gurjyanDescription
set threads 4
set maxEvents 1000
run local
```


## Farm shared processing (`farm-shared.cls`)

Here we are not requesting a specific JLAB farm node flavor.
If you need to run on a specific node add the following line to the script:

```
# supported farm node flavors: farm18, farm16, farm14, farm13, qcd12
set farm.node farm18
```

```
# Clara script example
# gurjyan 01.30.19
#
# Note:
# Data processing will fail in case composition and data-set description
# files are not available.
# In the case log and IO directories are not available Clara will
# use default: $CLARA_HOME/log and $CLARA_HOME/data/{input,output}
# directories.

set servicesFile /Users/gurjyan/Testbed/clara/services.yaml
set fileList /Users/gurjyan/Testbed/clara/files.list
set inputDir /Users/gurjyan/Testbed/clara/data/input
set outputDir /Users/gurjyan/Testbed/clara/data/out
set outputFilePrefix gurjyan_
set logDir /Users/gurjyan/Testbed/clara/log
set session gurjyanSession
set description gurjyanDescription
set farm.stage /scratch/clara/gurjyan
set farm.cpu 8
set farm.memory 30
set farm.disk 10
set farm.scaling 2
run farm
show farmStatus
```

<div class="admonition note" markdown="1">
Clara settings are the same for PBS and SLURM deployments.
Clara makes deployment transparent across different batch control systems.
Yet, it is recommended to decrease memory request (*farm.memory*) by
factor of 2 when running on SLURM.
</div>


## Exclusive processing on SLURM (`farm18-exclusive.cls`)

```
# Clara script example
# gurjyan 01.30.19
#
# Note:
# Data processing will fail in case composition and data-set description
# files are not available.
# In the case log and IO directories are not available Clara will
# use default: $CLARA_HOME/log and $CLARA_HOME/data/{input,output}
# directories.

set servicesFile /Users/gurjyan/Testbed/clara/services.yaml
set fileList /Users/gurjyan/Testbed/clara/files.list
set inputDir /Users/gurjyan/Testbed/clara/data/input
set outputDir /Users/gurjyan/Testbed/clara/data/out
set outputFilePrefix gurjyan_
set logDir /Users/gurjyan/Testbed/clara/log
set session gurjyanSession
set description gurjyanDescription
set farm.stage /scratch/clara/gurjyan
# supported farm node flavors: farm18, farm16, farm14, farm13, qcd12
set farm.exclusive farm18
set farm.scaling 2
run farm
show farmStatus

```

<div class="admonition note" markdown="1">
You do not need to set memory or vertical scaling level
when running is an exclusive mode on SLURM.
</div>


## Exclusive processing on farm18 PBS (`farm18-pbs-exclusive.cls`)

```
# Clara script example
# gurjyan 01.30.19
#
# Note:
# Data processing will fail in case composition and data-set description
# files are not available.
# In the case log and IO directories are not available Clara will
# use default: $CLARA_HOME/log and $CLARA_HOME/data/{input,output}
# directories.

set servicesFile /Users/gurjyan/Testbed/clara/services.yaml
set fileList /Users/gurjyan/Testbed/clara/files.list
set inputDir /Users/gurjyan/Testbed/clara/data/input
set outputDir /Users/gurjyan/Testbed/clara/data/out
set outputFilePrefix gurjyan_
set logDir /Users/gurjyan/Testbed/clara/log
set session gurjyanSession
set description gurjyanDescription
set farm.stage /scratch/clara/gurjyan
set farm.node farm18
set farm.cpu 80
set farm.memory 00
set farm.disk 25
set farm.scaling 2
run farm
show farmStatus

```


## Exclusive processing on farm16 PBS (`farm18-pbs-exclusive.cls`)

```
# Clara script example
# gurjyan 01.30.19
#
# Note:
# Data processing will fail in case composition and data-set description
# files are not available.
# In the case log and IO directories are not available Clara will
# use default: $CLARA_HOME/log and $CLARA_HOME/data/{input,output}
# directories.

set servicesFile /Users/gurjyan/Testbed/clara/services.yaml
set fileList /Users/gurjyan/Testbed/clara/files.list
set inputDir /Users/gurjyan/Testbed/clara/data/input
set outputDir /Users/gurjyan/Testbed/clara/data/out
set outputFilePrefix gurjyan_
set logDir /Users/gurjyan/Testbed/clara/log
set session gurjyanSession
set description gurjyanDescription
set farm.stage /scratch/clara/gurjyan
set farm.node farm16
set farm.cpu 72
set farm.memory 60
set farm.disk 25
set farm.scaling 2
run farm
show farmStatus
```

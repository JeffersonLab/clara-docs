---
title: Clara Scripting
---
<div class="note info">
<code>$CLARA_HOME/bin/clara-shell xyz.cls</code>
<div></div>
to start a data processing with a specified script.
</div>


## Local processing (local.cls)

```
# Clara script example
# gurjyan 01.30.19
#
# Note:
# Data processing will fail in case composition and data-set description
# files are not available.
# In the case log and IO directories are not available Clara will
# use default: $CLARA_HOME/log and $CLARA_HOME/data/input(output)
# directories.

set servicesFile /Users/gurjyan/Testbed/clara/services.yml
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

# Refer to https://claraweb.jlab.org/clara/docs/clas/data-processing.html
# for more details

```

## Farm shared processing (farm-shared.cls)

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
# use default: $CLARA_HOME/log and $CLARA_HOME/data/input(output)
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

# Refer to https://claraweb.jlab.org/clara/docs/clas/data-processing.html
# for more details
```

## Exclusive processing (farm18-exclusive.cls)

```
# Clara script example
# gurjyan 01.30.19
#
# Note:
# Data processing will fail in case composition and data-set description
# files are not available.
# In the case log and IO directories are not available Clara will
# use default: $CLARA_HOME/log and $CLARA_HOME/data/input(output)
# directories.

set servicesFile /Users/gurjyan/Testbed/clara/services.yml
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

# Refer to https://claraweb.jlab.org/clara/docs/clas/data-processing.html
# for more details
```

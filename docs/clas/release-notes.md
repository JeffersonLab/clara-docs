---
title: Release notes
---
### Clara v5.0.3

- Compiled using JDK-17 LTS
- Updated Gradle build system to support JDK17
- AbstractOrchestrator upgrade. 
- Failed file detection and re-processing

### Clara v5.0.2

- Minor bug fixes. 
- Timeout implementation defined for a specific services in the application composition.
- 
### Clara v5.0.1

- Compiled using JDK-11
- Fixed the synchronization between a thread that waits for the event synchronization at the 
  end of a file, and a thread that assigns a new file to the worker node. 
- Implemented user plugin dir support. Users have an option to specify their own dependency tree.<br>
  Note: This release does not include the clasrec-io package, assuming the package is part of the 
  CLAS12 coat-java plugin.

### Clara v4.3.13

- Fixed service name collision in the declaration and configuration sections of the YAML
- Presented JDK8 and JDK11 compiled versions, selectable through Clara CLAS12 installation script.<br>
  Note: use option -f to select 4.3.13.jdk8 or 4.3.13.jdk11 compilation.

### Clara v4.3.12

- Implements service engine state = SevereError, and exit code 13.


### Clara v4.3.11. <br>Default for the CLAS12 installation

- Group log files based on the slurm job ID (farm deployment)

- Implements proper exit codes (framework level)

- Handles multiple output files

- Limits default vertical scaling factor to 4 for local data-processing

- introduced the WatchDog service

- implements staging into the job specific local directory

- increased some of the Orchestrator timeouts for handling slow network conditions.

- exclusive mode will log everything in /farm_out online.

- Includes HIPO-4 CLAS12 IO services


### Clara v4.3.10

- Includes latest HIPO-4 bug fixes.


### Clara v4.3.9

- Includes HIPO-4 IO services (CLAS12 plugin specific)


### Clara v4.3.8

- Includes HIPO-3 IO services (CLAS12 plugin specific)

- Tested *common installation*.

- Minor bug fixes.


### Clara v4.3.7

- Updated HIPO-4 IO services (CLAS12 plugin specific)

- Introduced `CLARA_USER_DATA` environment variable
  to separate Clara installation form the user specific data.
  Note that this feature helps multiple users to use a common installation.

- User specific data, such as input/output data files, application service
  composition and data-set description files, as well as log files and farm
  deployment scripts will be accessed through a user defined directories.

- CLAS installation script update. The script will remove the previous
  installation (after user confirmation) only in case installation has a
  proper directory structure.

- User documentation update. Introduction of the new "Hands on" session.


### Clara v4.3.6

- IO services use HIPO-4 data format (CLAS12 plugin specific)


### Clara v4.3.5

- IO services use HIPO-3 data format (CLAS12 plugin specific).

- Thread affinity implementation:
  Introduce a delay before starting the next NUMA attached Clara process
  in a data-processing node.

- Clara process: coordinate startup procedures
  for DPE and associated Orchestrator.
  Start an Orchestrator when DPE is fully operational.

- Farm default parameters: *farm.scale=disabled*, *farm.memory=0*,
  *farm.cpu=0*, *farm.disk=5GB*, *farm.time=24hours*.

- Farm horizontal scaling: verified and tested.

- CLAS12 plugin installation:
  request user confirmation before removing the old installation.

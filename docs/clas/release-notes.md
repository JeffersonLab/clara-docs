---
title: Release notes
---

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

---
layout: doc_clas
title: CLARA farm memory request
---
## Farm memory request


   Here are data batch processing configuration option settings for
   different vertical scaling values ( i.e. number of requested cores).
    These CLI settings can be stored in a file and be sourced in CLARA
    CLI shell.



## Multi-threading over 4 cores

```
set farm.cpu 4
set farm.memory 16
set farm.disk 5
set farm.time 1440
set farm.os centos7
set farm.track debug
set farm.system jlab
```

## Multi-threading over 8 cores

```
set farm.cpu 8
set farm.memory 16
set farm.disk 5
set farm.time 1440
set farm.os centos7
set farm.track debug
set farm.system jlab
```

## Multi-threading over 16 cores

```
set farm.cpu 16
set farm.memory 18
set farm.disk 5
set farm.time 1440
set farm.os centos7
set farm.track debug
set farm.system jlab
```
## Multi-threading over 32 cores

```
set farm.cpu 32
set farm.memory 30
set farm.disk 5
set farm.time 1440
set farm.os centos7
set farm.track debug
set farm.system jlab
```


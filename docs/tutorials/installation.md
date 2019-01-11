---
title: Installation
---
## CLARA Run-time Environment (CRE)

<div class="note info">
<code>
Installation instructions here are presented for the CLARA Java binding.
 </code>
</div>

For C++ and Python binding installation instructions can be found at:

[Clara C++](https://github.com/JeffersonLab/clara-cpp)

[Clara Python](https://github.com/JeffersonLab/clara-python)

First set the `CLARA_HOME` environmental variable that will point
to the directory where the CLARA distribution will be installed
( E.g. `/UserHome/myClara`)

<div class="note info">
<code>setenv CLARA_HOME <em>/UserHome</em>/myClara</code>
</div>

Download  the following script:

{% download file: install-claracre.sh, name: install-claracre %}

Change permission of this file to make it executable, and run:

```
./install-claracre-clas.sh  -f <CLARA distribution version>
```

CLARA framework distributions are accessed at:

<https://userweb.jlab.org/~gurjyan/clara-cre/>

<div class="note info">
<coda>
Default version is v4.3.5. <br>
Omit -f option to install the default version.<br><br>
</coda>
</div>

## CLARA Development Kit (CDK)

If you are a prospective developer and would like to access entire code-base, you need to install the CDK.
This will provide CLARA entire source base, including xMsg and JinFlux packages.

### Installation Prerequisites

For the CDK successful installation,
the following software components are required:

1.  Git
2.  Gradle

As you can see prerequisite is not extensive
and most likely they are already installed on majority of systems.

### CDK installation

Download the following script:

{% download file: install-claradk, name: install-cdk %}

So, for CDK installation copy downloaded scripts into your `<work_dir>` and type:

```
./install-claradk.sh
```

## Software update

After receiving CLARA update notification
the only thing you do is simply type:

```
$CLARA_HOME/bin/install-claracre.sh
```
For CDK:
```
$CLARA_HOME/bin/update-claradk.sh
```

## Under the hood

After the successful installation steps you will get a directory structured
shown below.

```
myClara/
|-- bin
|   |-- clara-monitor
|   |-- clara-orchestrator
|   |-- clara-shell
|   |-- install-claracre-clas.sh
|   |-- install-claracre.sh
|   |-- install-claradk-clas.sh
|   |-- install-claradk.sh
|   |-- j_dpe
|   |-- j_idr
|   |-- j_proxy
|   `-- kill-dpes
|-- data
|   |-- input
|   `-- output
|-- jre
|-- lib
|   |-- clara
|   |   |-- cmd-logger
|   |   |-- cmd-wrapper
|   |   |-- run-clara
|   |   |-- run-java
|   |   `-- templates
|   |       |-- farm-jlab.ftl
|   |       |-- farm-pbs.ftl
|   |       `-- farm-script.ftl
|   |-- commons-exec-1.3.jar
|   |-- freemarker-2.3.26-incubating.jar
|   |-- gson-2.3.1.jar
|   |-- guava-18.0.jar
|   |-- influxdb-java-2.2.jar
|   |-- jclara-4.3-SNAPSHOT.jar
|   |-- jeromq-0.3.6.jar
|   |-- jinflux-1.0-SNAPSHOT.jar
|   |-- jline-3.1.3.jar
|   |-- jopt-simple-4.9.jar
|   |-- json-20160810.jar
|   |-- jsr305-3.0.1.jar
|   |-- okhttp-2.4.0.jar
|   |-- okio-1.4.0.jar
|   |-- protobuf-java-2.6.1.jar
|   |-- retrofit-1.9.0.jar
|   |-- snakeyaml-1.18.jar
|   `-- xmsg-2.3.jar
|-- log
`-- plugins
```
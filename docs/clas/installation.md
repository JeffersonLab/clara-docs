---
layout: doc_clas
title: Installation
---

ONE STEP INSTALLATION Y'ALL!!! Who's EXCITED?
Who's PUMPED to run data processing of your lifetime
without writing a single line of code?

Nobody, of course.
These days folks are excited either programming
and performing code compilations
or watching vicious political campaigns.
You know what's exciting to people who've suffered through those things?
The joy of focusing on less important problems
like processing experimental data and extracting science from it.
Right now, with a simple click or two,
you can solve one of life's most boring petty problems:
data analysis to understand how things are designed
or (if you are an atheist) evolved.

## CLARA Run-time Environment (CRE)

Installation and data processing instructions are presented
for the Clara Java binding.

First set the CLARA\_HOME environmental variable that points
to the CLARA CLAS12 distribution (/UserHome/myClara or /UserHome/clas12-v4)

<div class="note info">
<code>setenv CLARA_HOME <em>/UserHome</em>/myClara</code>
</div>

### CRE installation

Download the following script:


{% download file: install-claracre-clas.sh, name: install-claracre-clas %}

Change permission of this file to make it executable and

```
> ./install-claracre-clas.sh
```
This will install default version of the clas12 software (4a.5.5). In case you want to install specific version xx.x.x
```
> ./install-claracre-clas.sh -v xx.x.x
```
 
## CLARA Development Kit (CDK)

If you are a prospective developer and would like to contribute in service
development effort, you need to install the CDK.
This will provide CLARA entire source base.
However for CDK installation your system must be prepared.

### Installation Prerequisites

For the CDK successful installation,
the following software components are required on the installation computer.

1.  Git
2.  Gradle

As you can see prerequisite is not extensive
and most likely they are already installed on majority of systems.

### CDK installation

Download the following script:

{% download file: install-claradk, name: install-cdk %}

In case you want to install CDK with CLAS12 software bundle,
download the following:

{% download file: install-claradk-clas.sh, name: install-claradk-clas %}

So, for CDK installation copy downloaded scripts into the *work-dir* and type:

```
> cd work-dir
> install-claradk.sh
```

or

```
> install-claradk-clas.sh
```

## Software update

After receiving CLARA or CLAS12 software update notification
the only thing you do is simply type:

If you only installed CLARA CRE

```
> $CLARA_HOME/bin/install-claracre.sh 
```

or

```
> $CLARA_HOME/bin/install-claracre-clas.sh -v xx.x.x
```

For CDK

```
> $CLARA_HOME/bin/update-claradk.sh
```
or

```
> $CLARA_HOME/bin/update-claradk-clas.sh
```

## Under the hood

After the successful installation steps you will get a structured directory
pointed by the \$CLARA\_HOME env variable furnished with all necessary
jars, scripts, data structures and configuration files.

```
myClara/
├── bin
│   ├── clara-batch-dpe
│   ├── clara-batch-processing
│   ├── clara-dpe
│   ├── clara-orchestrator
│   ├── j_dpe
│   ├── remove-dpe
│   └── run-cloud
├── lib
│   ├── jclara-4.3-SNAPSHOT.jar
│   ├── jeromq-0.3.5.jar
│   ├── jopt-simple-4.9.jar
│   ├── json-20160212.jar
│   ├── jsr305-3.0.0.jar
│   ├── protobuf-java-2.6.1.jar
│   ├── snakeyaml-1.16.jar
│   └── xmsg-2.3-SNAPSHOT.jar
├── log
└── plugins
    └── clas12
        ├── config
        │   ├── clara_p.jsub
        │   ├── files.list
        │   ├── clara_d.jsub
        │   └── services.yaml
        ├── etc
        ├── lib
        │   ├── clasrec-orchestrators-0.8-SNAPSHOT.jar
        │   ├── jevio-4.4.6.jar
        │   └── jsap-2.1.jar
        ├── log
        └── services
```

The presented dir structure does not show CLAS12 services jar files
that are stored in `plugins/clas12/services` dir,
and also support data structures stored in `plugins/clas12/etc` dir.

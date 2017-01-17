---
layout: document
title: Installation
---

Installation
============

ONE STEP INSTALLATION Y'ALL!!! Who's EXCITED? Who's PUMPED to run data
processing of your lifetime without writing a single line of code?

Nobody, of course. These days folks are excited either programming and
performing code compilations or watching vicious political campaigns.
You know what's exciting to people who've suffered through those things?
The joy of focusing on less important problems like processing
experimental data and extracting science from it. Right now, with a
simple click or two, you can solve one of life's most boring petty
problems: data analysis to understand how things are designed or (if you
are an atheist) evolved.

CLARA Run-time Environment (CRE)
--------------------------------

Installation and data processing instructions are presented for the
Clara Java binding. First dedicate a directory where software will be
installed. Lets call it *work-dir*. This is a directory where CLARA
codebase will be installed. Next set the CLARA\_HOME environmental
variable that points to the CLARA run time environment (clara-cre)
directory under the *work-dir*. This is a directory that will be created
by the installation script.

> **note**
>
> setenv CLARA\_HOME *work-dir*/clara-cre

### CRE installation

Download the following script

install-cre &lt;img/install-claracre&gt;

In case you want to install CRE with CLAS12 software as a bundle,
download the following:

install-cre-clas &lt;img/install-claracre-clas&gt;

So, for CRE installation cp downloaded scripts into the work-dir and
type:

```
> cd *work-dir*
> ./install-claracre
```

or

```
> ./install-claracre-clas
```

> **note**
>
> Here are step by step instructions how to download and run the
> installer for CRE-CLAS on OSX

1.  Ctrl\_Click on the above presented link.
2.  cd *work-dir*
3.  cp \~/Downloads/install-claracre-clas.txt install-claracre-clas
4.  chmod a+x install-claracre-clas
5.  ./install-clara-cre

CLARA Development Kit (CDK)
---------------------------

If you are a prospective developer and would like to contribute in
service development effort, you need to install the CDK. This will
provide CLARA entire source base. However for CDK installation your
system must be prepared.

### Installation Prerequisites

For the CDK successful installation, the following software components
are required on the installation computer.

1.  Git
2.  Gradle

AS you can see prerequisite is not extensive and most likely they are
already installed on majority of systems.

### CDK installation

Download the following script:

install-cdk &lt;img/install-claradk&gt;

In case you want to install CDK with CLAS12 software bundle, download
the following:

install-cdk-clas &lt;img/install-claradk-clas&gt;

So, for CDK installation cp downloaded scripts into the work-dir and
type:

```
> cd work-dir
> install-claradk
```

or

```
> install-claradk-clas
```

### Software update

After receiving CLARA or CLAS12 software update notification the only
thing you do is simply type:

If you only installed CLARA CRE

```
> $CLARA_HOME/bin/install-claracre -u
```

or

```
> $CLARA_HOME/bin/install-claracre-clas -u
```

For CDK

```
> $CLARA_HOME/bin/update-claradk
```

or

```
> $CLARA_HOME/bin/update-claradk-clas
```

### Under the hood

After the successful installation steps you will get a structured
directory pointed by the \$CLARA\_HOME env variable furnished with all
necessary jars, scripts, data structures and configuration files.

```
clara-cre/
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

The presented dir structure does not show CLAS12 services jar files that
are stored in plugins/clas12/services dir, and also support data
structures stored in plugins/clas12/etc dir.

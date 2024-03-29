---
title: Installation
---

One step installation y'all!!! Who's excited?
Who's pumped to run data processing of your lifetime
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

## Compile and package a CLARA Run-Time Environment (CRE) 
First setup the environment for compiling CLARA.
```
$ unset CLASSPATH
$ unset JAVA_HOME
$ export JAVA_HOME=jdk-17.x.x
$ export PATH=${JAVA_HOME}/bin:${PATH}
$ export CLARA_HOME=[installation dir]/clara-cre
```
Initiate by cloning the clara-java repository from GitHub into a
specified source directory. Within this designated source directory,
execute the command ./gradlew deploy.

```
$ git clone https://github.com/JeffersonLab/clara-java.git
$ cd clara-java 
$ ./gradlew deploy
```
This will install compile and install it in the defined $CLARA_HOME directory
To encapsulate CRE, proceed with the execution of the prescribed command.
```
$ tar -czvf clara-cre-xxx.tar.gz $CLARA_HOME
```

## Preparing to run 

Installation and data processing instructions are presented
for the Clara Java binding.

First set the `CLARA_HOME` environmental variable that will point
to the directory where the Clara CLAS12 distribution will be installed
(`/UserHome/myClara` or `/UserHome/clas12-v4`).

<div class="admonition warning" markdown="1">
Remember, Clara will create the `$CLARA_HOME` directory with a specific file structure.
You need to provide only a location where it should be created.
</div>

Also you should specify a work directory where user specific data will be stored,
including data processing application composition and data-set description files,
farm deployment scripts, etc. For that assign `CLARA_USER_DATA` environmental variable to
a user specific work directory.

```
$ setenv CLARA_HOME /UserHome/myClara
$ setenv CLARA_USER_DATA /UserHome/work
```

<div class="admonition note" markdown="1">
Note that `CLARA_USER_DATA` is optional,
in case you are installing your own Clara environment.
In all cases, if you forget to set `CLARA_USER_DATA` variable
it will assume that it is pointing to `$CLARA_HOME`.
This means that if you are using the common Clara installation
you might face permission exceptions at the run-time.
</div>

### CRE installation

Download the following script:

{% download file: install-claracre-clas.sh, name: install-claracre-clas %}

Change permission of this file to make it executable, and run:

```
$ ./install-claracre-clas.sh --help
  usage: install-claracre-clas.sh [ OPTION ]... [ Value ]...

   -h, --help         print this help.
   -f, --framework    Clara framework version (default = 5.0.2).
   -v, --version      Clas12 plugin version   (default = 5a.2.0).
   -g, --grapes       Grapes plugin version   (default = 1.0).
   -j, --jre          JAVA Runtime version    (default = 11).
```

CLAS12 plugin distributions will be accessed at:

<https://clasweb.jlab.org/clas12offline/distribution/coatjava/>

Clara framework distributions are accessed at:

<https://userweb.jlab.org/~gurjyan/clara-cre/>

E.g. if you plat to install Clara `clara-cre-4.3.2` distribution and CLAS12
`coatjava-5c.6.3` plugin, you should run the installation script with the following options:

```
$ ./install-claracre-clas.sh -f 4.3.2 -v 5c.6.3 -g 2.0
```

Information about the framework and the plugin versions,
used during the data processing, will be shown and logged:

```
Distribution  :    clara-cre-4.3.2
CLAS12 plugin :    coatjava-5c.6.3

==========================================
               CLARA FE/DPE
==========================================
 Name             = 129.57.70.24%7520_java
 Session          = gurjyan_clara
 Start time       = 2018-09-05 10:53:46
 Version          = 4.3
 Lang             = Java
 Pool size        = 10

 Proxy Host       = 129.57.70.24
 Proxy Port       = 7520
==========================================

```

## Software update

After receiving Clara or CLAS12 software update notification
the only thing you do is simply type:

```
$ $CLARA_HOME/bin/install-claracre-clas.sh -v <version>
```


## Under the hood

After the successful installation steps you will get a structured directory
pointed by the `CLARA_HOME` environment variable
furnished with all necessary jars, scripts, data and configuration files.

```
$CLARA_HOME/
├── bin
│   ├── clara-orchestrator
│   ├── clara-shell
│   ├── j_dpe
│   └── kill-dpes
├── lib
│   ├── jclara-4.3-SNAPSHOT.jar
│   ├── jeromq-0.3.5.jar
│   ├── jopt-simple-4.9.jar
│   ├── json-20160212.jar
│   ├── jsr305-3.0.0.jar
│   ├── protobuf-java-2.6.1.jar
│   ├── snakeyaml-1.16.jar
│   └── xmsg-2.3.jar
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
        │   ├── jevio-4.4.6.jar
        │   └── jsap-2.1.jar
        ├── log
        └── services
```

The presented directory tree does not show CLAS12 services jar files
that are stored in `plugins/clas12/services` directory,
and also support data structures stored in `plugins/clas12/etc`.

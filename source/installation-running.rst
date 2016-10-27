
*************
Installation and data processing
*************
Installation and data processing instructions are presented for the Clara Java binding and for the JLAB CLAS12 services plugin.

Before starting installation set the following env variables:
.```
> setenv CLARA_HOME = existing-directory/non-existent-dir_name
```
Note that directory where the CLARA run-time will be installed is not required to exist.

CLARA installation
==================
.```
> cd to-some-work dir
> git clone https://github.com/JeffersonLab/clara-java.git
> cd clara-java
> gradle deploy
```

Plugin installation
===================
The presented CLARA plugin (i.e. Clas12 data processing services plugin) was developed as two separate project:
   a) CLAS12 detector specific orchestrator project
   b) CLAS12 reconstruction services project
Since the project a) was developed by the CLARA team member (S. Mancilla) installation of the that part of a
plugin is quit similar:
..```
> cd back to-some-work dir
> git clone https://github.com/JeffersonLab/clasrec-orchestrators.git
> cd clasrec-orchestrators
> gradle deploy
```
After these two installation steps ( i.e. CLARA installation and CLAS12 reconstruction orchestrator installation) you will
get a structured directory pointed by the $CLARA_HOME env variable furnished with all necessary jars, scripts and example
configuration files.

..```
clara-coat/
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
        │   ├── dpe-clara.jsub
        │   ├── files.list
        │   ├── process-clara.jsub
        │   └── services.yaml
        ├── etc
        ├── lib
        │   ├── clasrec-orchestrators-0.8-SNAPSHOT.jar
        │   ├── jevio-4.4.6.jar
        │   └── jsap-2.1.jar
        ├── log
        └── services
```
In this directory structure plugin specific data structures and libraries (including) data processing services must be
installed in three distinct subdirectories of the user specific plugin directory (plugins/clas12 as in this example),
 namely: lib - directory to store supporting libraries required for data processing services to function properly,
 services: directory to store data processing service libraries, abd etc - to store data processing specific data, such
 as data definitions, databases, etc. We recommend that user plugin build script populate suggested directory structure.
 But for now for the CLAS12 plugin installation we show a manual procedures as following:
 .```
Download from  https://userweb.jlab.org/~gavalian/software/coatjava/coatjava-3.0.tar.gz
> download in to-some-work dir
> tar -zxvf coatjava-3.0.tar.gz
> cd coatjava/lib/clas
> cp * $CLARA_HOME/plugins/clas12/lib/.
> cd ../plugins
> cp * $CLARA_HOME/plugins/clas12/services/.
> cd ../../etc
> cp -r bankdefs data $CLARA_HOME/plugins/clas12/etc/.
```
At this point installation of the CLARA and user plugin is completed. The only thing is required to put $CLARA_HOME/bin
 into your PATH. This is most convenient to do in a shell startup script. Below is an example of setting CLARA_HOME
 and upgrading PATH evn variable in .zshrc startup file:
.```
 # clara runtime
 export CLARA_HOME=/Users/gurjyan/group/da/vhg/Clas/clara-coat
 export PATH=$CLARA_HOME/bin:$PATH
```

Framework updates
=================
.```
> cd to-some-work/clara-java
> git pull
> gradle deploy

> cd to-some-work/clasrec-orchestrators
> git pull
> gradle deploy
```


Running
=======
Here we present two modes of running:
a) local - data processing on a local computing resource and
b) farm - processing on a batch farm system.
JLAB farm PBS and Auger job scheduling systems will be used as a CLARA farm data processing example.

Local mode
==========
.```
run-clara
```
Farm mode
==========
.```
run-clara -m farm -n number-of-nodes-to-scale
```





**********************************
CRE and CLAS12 plugin installation
**********************************

CLARA run-time environment (CRE) installation instructions are presented for the Clara Java binding
First dedicate a directory where software will be installed. Lets call it `work-dir`. In this directory CLARA and CLAS12
specific run-time will be installed.
Next set the CLARA_HOME environmental variable that points to the CLARA run-time environment (CRE) under the work-dir.
This is a directory that will be created by the installation script and be populated with CLARA and plugin run-time
jars and data. Note that you do not have to have Java installed on the system and JRE is provided within the CRE.

.. code-block:: console

    > setenv CLARA_HOME = work-dir/clara-cre


Installation
============

Download the following scripts:

:download:` install-cdk-clas <http://www.jlab.org/~gurjyan/scripts/install-cre-clas>`

:download:` update-cdk-clas <http://www.jlab.org/~gurjyan/scripts/update-cre-clas>`

        Script names are self explanatory.

    So, for CDK and CLAS12 plugin installation cp downloaded scripts into the work-dir and type:

.. code-block:: console

    > cd work-dir
    > install-cre-clas

Software update
===============

After receiving CLARA or CLAS12 software update notification the only thing you do is simply type:

.. code-block:: console

    > cd work-dir
    > update-cre-clas

Under the hood
==============
After the successful installation steps you will get a structured directory pointed by the $CLARA_HOME
env variable furnished with all necessary jars, scripts, data structures and configuration files.

.. code-block:: console

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

The presented dir structure does not show CLAS12 services jar files that are stored in plugins/clas12/services dir,
and also support data structures stored in plugins/clas12/etc dir.

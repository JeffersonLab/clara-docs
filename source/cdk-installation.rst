
****************************************
CLARA Development Kit (CDK) installation
****************************************

Installation and data processing instructions are presented for the Clara Java binding.
First dedicate a directory where software will be installed. Lets call it `work-dir`. This is a directory where CLARA
codebase will be installed.
Next set the CLARA_HOME environmental variable that points to the CLARA run time environment (clara-cre) directory
under the work-dir. This is a directory that will be created by the installation script.

.. code-block:: console

    > setenv CLARA_HOME = work-dir/run-time-dir_name


Installation Prerequisites
==========================
For the CLARA successful installation, the following software components are required on the installation computer.

#. Java 1.8

#. Git

#. Gradle

We think that these software packages are most likely installed on majority of systems.

Installation
============

Download the following scripts:


`install-cdk <http://www.jlab.org/~gurjyan/scripts/install-cdk>`_

`update-cdk <http://www.jlab.org/~gurjyan/scripts/update-cdk>`_

Script names are self explanatory.
So, for CDK installation cp downloaded scripts into the work-dir and type:

.. code-block:: console

    > cd work-dir
    > install-cdk

Software update
===============

After receiving CLARA or CLAS12 software update notification the only thing you do is simply type:

.. code-block:: console

    > cd work-dir
    > update-cdk

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

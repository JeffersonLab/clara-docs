************
Installation
************

CLARA Run-time Environment (CRE)
================================

Installation and data processing instructions are presented for the Clara Java binding.
First dedicate a directory where software will be installed. Lets call it `work-dir`. This is a directory where CLARA
codebase will be installed.
Next set the CLARA_HOME environmental variable that points to the CLARA run time environment (clara-cre) directory
under the work-dir. This is a directory that will be created by the installation script.

.. code-block:: console

    > setenv CLARA_HOME = work-dir/clara-cre

CRE installation
----------------

Download the following script:


`install-cre <http://www.jlab.org/~gurjyan/clara-cre/install-claracre>`_

In case you want to install CDK with CLAS12 software bundle, download the following:

`install-cre-clas <http://www.jlab.org/~gurjyan/clara-cre/install-claracre-clas>`_

So, for CDK installation cp downloaded scripts into the work-dir and type:

.. code-block:: console

    > cd work-dir
    > install-claracre

or

.. code-block:: console

    > install-claracre-clas


CLARA Development Kit (CDK)
===========================

If you are a prospective developer and would like to contribute in service development effort,
you need to install the CDK. This will provide CLARA entire source base. However for CDK installation
your system must be prepared.

Installation Prerequisites
--------------------------
For the CDK successful installation, the following software components are required on the installation computer.

#. Git

#. Gradle

AS you can see prerequisite is not extensive and most likely they are already installed on majority of systems.


CDK installation
----------------

Download the following script:


`install-cdk <http://www.jlab.org/~gurjyan/clara-cre/install-claradk>`_

In case you want to install CDK with CLAS12 software bundle, download the following:

`install-cdk-clas <http://www.jlab.org/~gurjyan/clara-cre/install-claradk-clas>`_

So, for CDK installation cp downloaded scripts into the work-dir and type:

.. code-block:: console

    > cd work-dir
    > install-claradk

or

.. code-block:: console

    > install-claradk-clas


Software update
---------------

After receiving CLARA or CLAS12 software update notification the only thing you do is simply type:

.. code-block:: console

    > cd work-dir
    > update-claradk

or

.. code-block:: console

    > update-claradk-clas


Under the hood
--------------

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


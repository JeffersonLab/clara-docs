
********************************
Installation and data processing
********************************

Installation and data processing instructions are presented for the Clara Java binding and for the JLAB CLAS12
services plugin.
First dedicate a directory where software will be installed. Lets call it `work-dir`.
Next set the CLARA_HOME environmental variable that points to a virtual directory under the work-dir. This is
a directory that will be created by the installation script and be populated with CLARA and plugin run-time environment.

.. code-block:: console

    > setenv CLARA_HOME = work-dir/run-time-dir_name


Installation Prerequisites
==========================
For CLARA successful installation, the following software components are required on the installation computer.

#. Java 1.8

#. Git

#. Gradle

We think that these software packages are most likely installed on majority of systems, yet the script is provided
to perform prerequisite packages installation for Linux (different flavors) and OSX. (in development).

CLARA and CLAS12 plugin installation
====================================

Download the following scripts from http://www.jlab.org/~gurjyan/scripts/:

#. install-clara

#. update-clara

The script names are self explanatory.

So, for CLARA and CLAS12 plugin installation cp downloaded scripts into the work-dir and type:

.. code-block:: console

    > cd work-dir
    > install-clara

Software update
===============

After receiving CLARA or CLAS12 software update notification the only thing you do is simply type:

.. code-block:: console

    > cd work-dir
    > update-clara

Under the hood
==============
After the successful installation steps you will get a structured directory pointed by the $CLARA_HOME
env variable furnished with all necessary jars, scripts, data structures and configuration files.

.. code-block:: console

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

Running
=======
Here we present two modes of running:
a) local - data processing on a local computing resource and
b) farm - processing on a batch farm system.
JLAB farm PBS and Auger job scheduling systems will be used as a CLARA farm data processing example, so scripts will
exit in case Jlab Auger commands are not accessible.
To run CLAS12 data processing you use `run-clara` script.
The following examples are for data processing with a default parameters.

Local mode
----------

.. code-block:: console

    run-clara

Farm mode
---------

The following submits a job to run on a single farm node exclusively.

.. code-block:: console

    run-clara -m farm

By specifying -n or --nodes parameter the data processing will scale horizontally among n farm nodes. As a result a
separate job will be scheduled for each requested node.

.. code-block:: console

    run-clara -m farm -n number-of-nodes


Customization
=============

Due to the nature of the micro-services environment CLARA data processing application is highly customizable , that does
not require compilation. For example to build CLAS12 data processing you need to edit `services.yaml` file located in
plugins/clas12/config dir.

.. code-block:: console
    services:
      - class: org.jlab.service.dc.DCHBEngine
        name: DCHB
      - class: org.jlab.service.ftof.FTOFEngine
        name: FTOF
      - class: org.jlab.rec.cvt.services.CVTReconstruction
        name: CVT
      - class: org.jlab.service.htcc.HTCCReconstructionService
        name: HTCC
      - class: org.jlab.service.eb.EBEngine
        name: EBHB
      - class: org.jlab.service.dc.DCTBEngine
        name: DCTB
      - class: org.jlab.service.eb.EBEngine
        name: EBTB

Simply add or remove service or group of services and run.
The names of files to be processed are stored in the `files.list` file located in plugins/clas12/config dir.

.. code-block:: console
    gemc_eklambda_A0043_gen.evio
    gemc_eklambda_A0044_gen.evio
    gemc_eklambda_A0045_gen.evio
    gemc_eklambda_A0046_gen.evio
    gemc_eklambda_A0047_gen.evio
    gemc_eklambda_A0048_gen.evio

The actual location of files are defined by the run-clara parameter, listed below

Data processing parameters
--------------------------
.. code-block:: console
    gurjyan% run-clara -h
    Usage: run-clara [option <operand>]

      [-h | --help]
            Usage instructions

      [-j | --java_home <java_home>]
            JDK/JRE installation directory. (default: %JAVA_HOME)

      [-c | --clara_home <clara_home>]
            CLARA installation directory. (default: %CLARA_HOME)

      [-p | --plugin <plugin>]
            Plugin installation directory. (default: %CLARA_HOME/plugins/clas12)

      [-s | --session <session>]
            The data processing session. (default: $USER)

      [-m | --mode <mode>]
            The data processing mode. (default: local. Accepts local2 and farm operands)

      [-i | --input_dir <inputDir>]
            The input directory where the files to be processed are located.
            (default: $CLARA_HOME/../data/in)

      [-o | --output_dir <outputDir>]
            The output directory where processed files will be saved.
            (default: $CLARA_HOME/../data/out)

      [-n | --nodes <maxNodes>]
            The maximum number of processing nodes to be used. Farm mode only. (default: 1)

      [-t | --threads <maxThreads>]
            The maximum number of processing threads to be used per node.
            (default: 36 for farm mode and local-node processor count otherwise))







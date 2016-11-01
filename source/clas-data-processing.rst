
**********************
CLAS12 Data processing
**********************

We assume that the CLARA_HOME env variable is pointing to the CLARA run-time environment directory.
.. code-block:: console

    > setenv CLARA_HOME = work-dir/clara-cre

Here we present two modes of running:

#. local - data processing on a local computing resource and

#. farm - processing on a batch farm system.

JLAB farm PBS and Auger job scheduling systems will be used as a CLARA farm data processing example, so data processing
will exit in case Jlab Auger commands are not accessible.

Type `run-clara` to start CLAS12 data processing.

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

      [-j | --java-home <java-home>]
            JDK/JRE installation directory. (default: $JAVA_HOME)

      [-c | --clara-home <clara-home>]
            CLARA installation directory. (default: $CLARA_HOME)

      [-p | --plugin <plugin>]
            Plugin installation directory. (default: $CLARA_HOME/plugins/clas12)

      [-s | --session <session>]
            The data processing session. (default: $USER)

      [-m | --mode <mode>]
            The data processing mode. (default: local. Accepts local2 and farm operands)

      [-i | --input-dir <inputDir>]
            The input directory where the files to be processed are located.
            (default: $CLARA_HOME/../data/in)

      [-o | --output-dir <outputDir>]
            The output directory where processed files will be saved.
            (default: $CLARA_HOME/../data/out)

      [-n | --nodes <maxNodes>]
            The maximum number of processing nodes to be used. Farm mode only. (default: 1)

      [-t | --threads <maxThreads>]
            The maximum number of processing threads to be used per node.
            (default: 36 for farm mode and local-node processor count otherwise))

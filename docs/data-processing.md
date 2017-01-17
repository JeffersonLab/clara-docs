---
layout: document
title: Data processing
---

Really, though,
do we need to get our hands dirty and start processing the raw data?
After all we did our fair share when we were post-docs.
Just sit back, relax and listen Erik Satie.
The DST will be ready soon...
But OK, I know, I know you’re one of the small minority of scientists that can't wait,
who need to process subset of data quickly,
define and customize data processing conditions (I am not suggesting post-doc mistrust here),
or you think you do, or (more accurately) feel like you do.
We’re happy to exploit that feeling. I want to be clear though:
we’re not here to tell you what you want.
Still, something in our science DNA compels us to be honest about this:
you should follow the following instructions to start data processing yourself.

In this chapter we present instructions
how to run CLARA based CLAS12 data processing application.

We assume that the CLARA\_HOME env variable is pointing to
the CLARA run-time environment directory.

<div class="note info">
<code>setenv CLARA_HOME <em>work-dir</em>/clara-cre</code>
</div>

Here we present two modes of running:

1.  local - data processing on a local computing resource and
2.  farm - processing on a batch farm system.

JLAB farm PBS and Auger job scheduling systems will be used
as a CLARA farm data processing example,
so data processing will exit in case Jlab Auger commands are not accessible.

Type *run-clara* to start CLAS12 data processing.

The following examples are for data processing with a default parameters.

### Local mode

```
$CLARA_HOME/bin/run-clara
```

### Farm mode

The following submits a job to run on a single farm node exclusively.

```
$CLARA_HOME/bin/run-clara -m farm
```

By specifying `-n` or `--nodes` parameter
the data processing will scale horizontally among *N* farm nodes.
As a result a separate job will be scheduled for each requested node.

```
$CLARA_HOME/bin/run-clara -m farm -n number-of-nodes
```

### Customization

Due to the nature of the micro-services environment
CLARA data processing application is highly customizable,
that does not require compilation.
For example to build CLAS12 data processing you need to edit `services.yaml`
file located in `plugins/clas12/config` dir.

```
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
```

Simply add or remove service or group of services and run.
The names of files to be processed are stored in the `files.list` file
located in `plugins/clas12/config` dir.

```
gemc_eklambda_A0043_gen.evio
gemc_eklambda_A0044_gen.evio
gemc_eklambda_A0045_gen.evio
gemc_eklambda_A0046_gen.evio
gemc_eklambda_A0047_gen.evio
gemc_eklambda_A0048_gen.evio
```

The actual location of files are defined by the run-clara parameter,
listed below.

### Data processing parameters

```
gurjyan% run-clara -h
Usage: run-clara [option <operand>]

  [-h | --help]
        Usage instructions

  [-j | --java_home <java_home>]
        JDK/JRE installation directory. (default: $JAVA_HOME)

  [-c | --clara_home <clara_home>]
        CLARA installation directory. (default: $CLARA_HOME)

  [-p | --plugin <plugin>]
        Plugin installation directory. (default: $CLARA_HOME/plugins/clas12)

  [-s | --session <session>]
        The data processing session. (default: $USER)

  [-m | --mode <mode>]
        The data processing mode. Accepts values = local, sqlite and farm (default: local)

  [-i | --input_dir <inputDir>]
        The input directory where the files to be processed are located.
        (default: $CLARA_HOME/data/in)

  [-o | --output_dir <outputDir>]
        The output directory where processed files will be saved.
        (default: $CLARA_HOME/data/out)

  [-n | --nodes <maxNodes>]
        The maximum number of processing nodes to be used. Farm mode only. (default: 1)

  [-t | --threads <maxThreads>]
        The maximum number of processing threads to be used per node. In case value = auto t=local-node processor count.
        (default: 36 for farm mode and 2 for the local mode))

  [-f | --file-list <fileList>]
        Full path to the file containing the names of data-files to be processed. Note: actual files are located in the inputDir.
        (default: $CLARA_HOME/plugins/clas12/config/files.list)

  [-y | --yaml <yamlComposition>]
        Full path to the file describing application service composition.
        (default: $CLARA_HOME/plugins/clas12/config/services.yaml)
```

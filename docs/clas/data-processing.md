---
layout: doc_clas
title: Data processing
---

Really, though,
do we need to get our hands dirty and start processing the raw data?
After all we did our fair share when we were post-docs.
Just sit back, relax and listen Erik Satie.
The DST will be ready soon...
But OK, I know, I know you're one of the small minority of scientists that can't wait,
who need to process subset of data quickly,
define and customize data processing conditions (I am not suggesting post-doc mistrust here),
or you think you do, or (more accurately) feel like you do.
We're happy to exploit that feeling. I want to be clear though:
we're not here to tell you what you want.
Still, something in our science DNA compels us to be honest about this:
you should follow the following instructions to start data processing yourself.

In this chapter we present instructions
how to run CLARA based CLAS12 data processing application.

We assume that the CLARA\_HOME env variable is pointing to
the CLARA run-time environment directory.

Now just simply type
```
$CLARA_HOME/bin/clara-shell
```

This will start Clara command line interactive interface (CLI).
Hierarchical help will navigate you through options to set, customize, run and monitor
Clas12 data processing applications.
```
vem:~ gurjyan$ clara-shell

   ██████╗██╗      █████╗ ██████╗  █████╗
  ██╔════╝██║     ██╔══██╗██╔══██╗██╔══██╗ 4.3.0
  ██║     ██║     ███████║██████╔╝███████║
  ██║     ██║     ██╔══██║██╔══██╗██╔══██║
  ╚██████╗███████╗██║  ██║██║  ██║██║  ██║
   ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝


 Run 'help' to show available commands.

clara> help
Commands:

   run           Start CLARA data processing
   edit          Edit data processing conditions
   set           Parameter settings
   show          Show values
   save          Export configuration to file
   source        Read and execute commands from file

Use help <command> for details about each command.

clara>
```

In some cases the wrong terminal settings will affect proper functionality
of the CLI. Comment the following line (or something similar) in your .login file:

<div class="note info">
 Stay erase "^?" kill "^U" intr "^C" eof "^D" susp "^Z" hupcl ixon ixoff tostop tabs
</div>

Also look comment in the .login files, such as:

<div class="note info">
      # Uncomment this if you are using an NCD Xterminal keyboard.
</div>

## CLI Options

Short description of the data processing options can be obtained by executing
CLI *help* command.
```
clara> help set
clara> help edit

  edit services
    Edit services composition.

  edit files
    Edit input file list.

clara> help run

  run local
    Run CLARA data processing on the local node.

  run farm
    Run CLARA data processing on the farm.

```

### Set Options

*Set* options are designed to configure data processing application that
is going to be executed on the local or cloud/farm environment.
```
clara> help set

  set servicesFile
    Path to the file describing application service composition.

  set files
    Set the input files to be processed (example: /mnt/data/files/*.evio).
    This will set both fileList and inputDir variables.

  set fileList
    Path to the file containing the names of data-files to be processed.

  set inputDir
    The input directory where the files to be processed are located.

  set outputDir
    The output directory where processed files will be saved.

  set threads
    The maximum number of processing threads to be used per node.

  set reportEvents
    The frequency to report finished events.

  set skipEvents
    The number of events to skip from the input file.

  set maxEvents
    The maximum number of events to be processed.

  set logDir
    The directory where log files will be saved.

  set feHost
    The IP address to be used by the front-end DPE.

  set fePort
    The port to be used by the front-end DPE.

  set session
    The data processing session.

  set description
    A single word (no spaces) describing the data processing.

  set useFE
    Use the front-end DPE for reconstruction.

  set javaMemory
    DPE JVM memory size (in GB)

  set javaOptions
    DPE JVM options (overrides javaMemory)

  set monHost
    The IP address where DPE monitor server is running.

  set farm.cpu
    Farm resource core number request.

  set farm.memory
    Farm job memory request (in GB).

  set farm.disk
    Farm job disk space request (in GB).

  set farm.time
    Farm job wall time request (in min).

  set farm.os
    Farm resource OS.

  set farm.stage
    Local directory to stage reconstruction files.

  set farm.track
    Farm job track.

  set farm.scaling
    Farm horizontal scaling factor. Split the list of input files into
    chunks of the given size to be processed in parallel within separate
    farm jobs.

  set farm.system
    Farm batch system. Accepts pbs and jlab.
```

#### servicesFile

This is known as Clara YAML file. this describes application micro-services and
their engine details, transient data format and service configuration details.
One can specify the *servicesFile* location in the CLI by:
```
clara> set servicesFile <path>
```

You can also edit/modify *servicesFile* while in the CLI environment:
```
clara> edit services
```

Editing is a useful tool, that demonstrates micro-services based application
flexibility. For e.g. you can comment-out specific services in the
*servicesFile* to debug specific set of services, and/or add new services,
expanding functionality of a data processing application.

To verify application service composition that will be used to deploy and run
a data processing application run:
```
clara> show services
io-services:
  reader:
    class: org.jlab.clas.std.services.convertors.HipoToHipoReader
    name: HipoToHipoReader
  writer:
    class: org.jlab.clas.std.services.convertors.HipoToHipoWriter
    name: HipoToHipoWriter
services:
  - class: org.jlab.rec.ft.cal.FTCALEngine
    name: FTCAL
  - class: org.jlab.rec.ft.hodo.FTHODOEngine
    name: FTHODO
  - class: org.jlab.rec.ft.FTEBEngine
    name: FTEB
  - class: org.jlab.service.dc.DCHBEngine
    name: DCHB
  - class: org.jlab.service.dc.DCTBEngine
    name: DCTB
  - class: org.jlab.service.ftof.FTOFEngine
    name: FTOF
  - class: org.jlab.rec.cvt.services.CVTReconstruction
#  - class: org.jlab.rec.cvt.services.CVTCosmicsReconstruction
    name: CVT
  - class: org.jlab.service.ctof.CTOFEngine
    name: CTOF
  - class: org.jlab.service.htcc.HTCCReconstructionService
    name: HTCC
  - class: org.jlab.service.ltcc.LTCCEngine
    name: LTCC
  - class: org.jlab.service.ec.ECEngine
    name: EC
  - class: org.jlab.service.eb.EBHBEngine
    name: EBHB
  - class: org.jlab.service.eb.EBTBEngine
    name: EBTB
configuration:
  io-services:
    writer:
      compression: 2
mime-types:
  - binary/data-hipo
```

#### files, fileList, inputDir and outputDir

These options are used to define a data set to be processed. The *inputDir*
is the path where data files are located. After *inputDir* option is set, one can
list the directory by:
```
clara> show inputDir
total 241400
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_35.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_36.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_37.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_38.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_39.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_40.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_41.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_42.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_43.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_44.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_45.hipo
-rwx------  1 gurjyan  JLAB\da    50M Sep 15 15:51 dvcs_46.hipo
-rwx------  1 gurjyan  JLAB\da    13M Sep 15 15:51 sidis_0100_0.hipo
-rwx------  1 gurjyan  JLAB\da    14M Sep 15 15:51 sidis_0100_10.hipo
-rwx------  1 gurjyan  JLAB\da    14M Sep 15 15:51 sidis_0100_11.hipo
-rwx------  1 gurjyan  JLAB\da    14M Sep 15 15:51 sidis_0100_12.hipo
-rwx------  1 gurjyan  JLAB\da    14M Sep 15 15:51 sidis_0100_13.hipo

```
The *fileList* is a path to a
file (files.list) containing metadata of the data set (at the moment file names only).
Here is an example of a file.list:
```
clara> show files
dvcs_35.hipo
dvcs_36.hipo
dvcs_37.hipo
dvcs_38.hipo
dvcs_39.hipo
dvcs_40.hipo
dvcs_41.hipo
dvcs_42.hipo
dvcs_43.hipo
dvcs_44.hipo
dvcs_45.hipo
dvcs_46.hipo
```
The *files* option allows to select a set of files for processing from
a specific data directory. This will set proper *fileLsit* and *inputDir* options automatically.
For e.g.

```
clara> set files /lustre/expphy/volatile/clas12/sidis*

clara> show files
# auto-generated by: set files /Users/gurjyan/Testbed/clara/myClara/data/input/sidis*
sidis_0100_0.hipo
sidis_0100_10.hipo
sidis_0100_11.hipo
sidis_0100_12.hipo
sidis_0100_13.hipo
```

The *outputDir* option is a path to a directory where processed files
will be stored.

#### threads and farm.cpu

These two options define vertical scaling factor, i.e. how many events
will be processed in parallel within a single Clara DPE. The option *threads*
defines vertical scaling for the local Clara deployment and processing, while
*farm.cpu* defines the same for farm node/DPE/PBS-job deployment. Note that *farm.xxx*
options are for farm deployment only and are independent from settings for the
local processing.

#### farm.scaling

This option is for batch horizontal scaling only. Horizontal scaling on the cloud
environment is done elastically by the application orchestrator.
the *farm.scaling* option in reality defines a data set splitting factor,
where each subst of the data-set will be processed on a single DPE/farm-node.
For e.g. for the data set defined by the files.list presented above, the choice of
```
clara> set farm.scaling 3
```
will tell Clara to request 4 PBS jobs with the following file processing assignments:
```
Job-1:
  dvcs_35.hipo
  dvcs_36.hipo
  dvcs_37.hipo

Job-2:
  dvcs_38.hipo
  dvcs_39.hipo
  dvcs_40.hipo

Job-3:
  dvcs_41.hipo
  dvcs_42.hipo
  dvcs_43.hipo

Job-4:
  dvcs_44.hipo
  dvcs_45.hipo
  dvcs_46.hipo
```

#### monHost

One can use this option to define a Clara data processing monitoring server host IP.
Periodically every Clara DPE reports runtime and registration information to a
monitoring server. Monitoring server must be running to accept these messages.
User can run it's own monitoring server by executing *$CLARA_HOME/bin/j_mproxy*.
```
gurjyan@clara1601:~/Devel/naiads-srb$ $CLARA_HOME/bin/j_mproxy --help
usage: jx_proxy [options]

  Options:
  -host <hostname>        use the given hostname
  -port <port>            use the given port
  -verbose                print debug information
```

Also, for data visualization the Clara data archiving and visualization service must
be running, by executing *$CLARA_HOME/bin/j_idr*
```
gurjyan@clara1601:~$ $CLARA_HOME/bin/j_idr --help
usage: idr [options]

  Options:
  --m-host <hostname>        use given host for the monitor xMsg-proxy
  --m-port <port>            use given port for the monitor xMsg-proxy
  --db-host <hostname>       the host where InfluxDB is running
```
<div class="note info">
<code>For the JLAB farm DPE reporting, as well as for user specific
online data quality monitoring, default Clara monitoring server and data
archiving and visualization service is running that visualizes data at the front end:

http://claraweb.jlab.org:3000/dashboard/db/pdp-b</code>
</div>

### Edit Options

```
clara> help edit

  edit services
    Edit services composition.

  edit files
    Edit input file list.

```

### Run Options

```
clara> help run

  run local
    Run CLARA data processing on the local node.

  run farm
    Run CLARA data processing on the farm.

```

### Show Options

```
clara> help show

  show config
    Show configuration variables.

  show services
    Show services YAML.

  show files
    Show input files list.

  show inputDir
    List input files directory.

  show outputDir
    List output files directory.

  show logDir
    List logs directory.

  show logDpe
    Show front-end DPE log.

  show logOrchestrator
    Show orchestrator log.

  show farmStatus
    Show status of farm submitted jobs.

  show farmSub
    Show farm job submission file.
 ```

### Save Option

```
 clara> help save

   save <file_path>
     Export configuration to file .
```

### Source Option

```
clara> help source

  source <file_path>
    Read and execute commands from file .
```

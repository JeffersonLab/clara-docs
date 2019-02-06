---
title: Shell interface
---

## Command line interface

In this chapter we present instructions
how to run CLARA based CLAS12 data processing application.

We assume that the `$CLARA_HOME` env variable is pointing to
the CLARA run-time environment directory.

Now just simply type:
```
$CLARA_HOME/bin/clara-shell
```

This will start CLARA command line interactive interface (CLI).
Hierarchical help will navigate you through commands to configure, run and monitor
CLAS12 data processing applications.

```

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

#### JLab terminal settings

<div class="note warning">
In some cases the wrong terminal settings
will affect proper functionality of the CLI.

<p>You may be affected by this problem when the <code>run</code> command
returns to the prompt without doing anything apparently.</p>

<div class="highlighter-rouge"><pre class="highlight">
<code>clara> run local
clara>
</code></pre></div>

<p>To fix this, make sure the following line (or something similar)
<b>is commented</b> in your <code>~/.login</code> file:</p>

<div class="highlighter-rouge"><pre class="highlight">
<code>stty erase "^?" kill "^U" intr "^C" eof "^D" susp "^Z" hupcl ixon ixoff tostop tabs
</code></pre></div>

<p>That line should be after a comment such as:</p>

<div class="highlighter-rouge"><pre class="highlight">
<code># Uncomment this if you are using an NCD Xterminal keyboard.
</code></pre></div>
</div>


<div class="note warning">
Before we describe a data processing configuration options it is worthwhile to emphasize
the importance of a data-set proper description. This includes path to the actual data-file input and output directories, full path to the data-set metadata file, and data-set description.
</div>

{: .note .info }
For every data processing these options must be set, and most importantly,
options for `data-set description` and `data-set metadata file` must be unique.

```
clara> set fileList
clara> set description
```


## CLI commands

Short description of the data processing commands can be obtained
with the *help* command.
```
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

### The set command

The *set* command is used to configure the data processing application.
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

set outputFilePrefix
    A single word (no spaces, preferably ending with _) as an
    output/processed file name prefix.

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
    A single word (no spaces) identifying the data processing.

set description
    A single word (no spaces) describing the data processing.

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

set farm.node
    Preferred farm node name (JLAB specific, e.g. farm18[16,14,13] etc.)

set farm.exclusive
    Exclusive farm node request (JLAB specific, e.g. farm18[16,14,13], etc.)

set farm.stage
    Local directory to stage reconstruction files.

set farm.track
    Farm job track.

set farm.scaling
    Farm horizontal scaling factor. Split the list of input files into
    chunks of the given size to be processed in parallel within separate farm jobs.

set farm.system
    Farm batch system. Accepts pbs and jlab.

```
{: .scrolling-pre }

#### The services YAML file

This is known as the CLARA YAML file.
It describes the application micro-services,
their transient data format and their configuration parameters.
The *servicesFile* location can by specified in the CLI by:
```
clara> set servicesFile ~/clas12/exp1/services.yml
```

You can also modify the *servicesFile* from inside the CLI environment:
```
clara> edit services
```

This editing command is a useful tool,
that demonstrates the flexibility of micro-services applications.
For example, you can comment most of the services
to debug just a few specific ones,
or add new services to expand the functionality of the application.

To verify the application services composition run:
```
clara> show services
io-services:
  reader:
    class: org.jlab.clas.std.services.convertors.HipoToHipoReader
    name: HipoToHipoReader
    # class: org.jlab.clas.std.services.convertors.EtRingToHipoReader
    # name: EtRingToHipoReader
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
  global:
    magnet:
      torus: -1
      solenoid: -1
    ccdb:
      run: 101
      variation: custom
    runtype: mc
    runmode: calibration
  io-services:
    reader:
      system: /tmp/clara-et-system
      host: localhost
      port: 11111
      torus: -1.0
      solenoid: -1.0
    writer:
      compression: 2
  services:
    EC:
      variation: cosmic
      timestamp: 333
mime-types:
  - binary/data-hipo

```
Note that if you need to remove a service from a composition you comment out the service description,
as shown in the presented composition:

```
    # class: org.jlab.clas.std.services.convertors.EtRingToHipoReader
    # name: EtRingToHipoReader
 ```


#### Data set options

The options *files*, *fileList*, *inputDir* and *outputDir* are used
to define the data-set to be processed.

The *inputDir* is the path where the data files are located.
After this option is set, one can list the input directory with:
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

The *fileList* options accepts a path to a text file
containing metadata of the data set (at the moment file names only),
one file per line.

Here is an example of the content of this file:
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

The *files* option allows to select a set of files for processing
from a specific data directory.
This will set both *fileList* and *inputDir* options automatically.

```
clara> set files /lustre/expphy/volatile/clas12/sidis*

clara> show files
# auto-generated by: set files /lustre/expphy/volatile/clas12/sidis*
sidis_0100_0.hipo
sidis_0100_10.hipo
sidis_0100_11.hipo
sidis_0100_12.hipo
sidis_0100_13.hipo
```

The *outputDir* option is the path to the directory
where processed files will be stored.

#### Vertical scaling

The options *threads* and *farm.cpu* define the **vertical scaling** factor, i.e.
how many events will be processed in parallel within a single CLARA DPE.

The option *threads* defines vertical scaling for the local CLARA DPE,
while *farm.cpu* defines the same for DPEs running on farm jobs.

#### Horizontal scaling

The option *farm.scaling* sets the batch **horizontal scaling** factor.
It defines a data set splitting factor into subsets of *N* files,
where each subset of the input files will be processed on a single DPE/farm-node.

For example, for the data set of twelve files defined above, the command
```
clara> set farm.scaling 3
```
will tell CLARA to request four jobs with the following file processing assignments:
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

#### The data processing monitoring server

The option *monHost* sets the IP address of the CLARA monitoring server
to which the processing DPEs will send periodic runtime and registration reports.

Users can run it's own monitoring server by executing *$CLARA_HOME/bin/j_mproxy*.
```
$ $CLARA_HOME/bin/j_mproxy --help
usage: jx_proxy [options]

  Options:
  -host <hostname>        use the given hostname
  -port <port>            use the given port
  -verbose                print debug information
```

Also, for data archiving and visualization,
the CLARA data reporting orchestrator must be running:
```
$ $CLARA_HOME/bin/j_idr --help
usage: j_idr [options]

  Options:
  --m-host <hostname>        use given host for the monitor xMsg-proxy
  --m-port <port>            use given port for the monitor xMsg-proxy
  --db-host <hostname>       the host where InfluxDB is running
```

{: .note .info }
For the JLAB farm DPE reporting, as well as for user specific
online data quality monitoring,
the default CLARA monitoring server and data visualization dashboard is running at
<http://claraweb.jlab.org:3000/dashboard/db/pdp-b>

### The edit command

```
clara> help edit

  edit services
    Edit services composition.

  edit files
    Edit input file list.

```

### The run command

```
clara> help run

  run local
    Run CLARA data processing on the local node.

  run farm
    Run CLARA data processing on the farm.

```

### The show command

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

### The save command

```
 clara> help save

   save <file_path>
     Export configuration to file .
```

### The source command

```
clara> help source

  source <file_path>
    Read and execute commands from file .
```


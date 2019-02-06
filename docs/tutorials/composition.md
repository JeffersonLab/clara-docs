---
title: Application Composition
---

<div class="admonition warning" markdown="1">
Instructions for using the Clara-UI graphical interface,
that presents a seamless experience between
designing, controlling and monitoring data processing applications
is under construction.
</div>

Data processing application design can be performed by simply creating
and/or editing composition yml text file. This file consists of 4 sections.

The ***io-services*** section is designed to describe IO services.
This section has 2 subsections: ***reader*** and ***writer***, describing
input and output services accordingly (see an example below).

``` yaml
io-services:
  reader:
    class: org.jlab.clas.std.services.convertors.HipoToHipoReader
    name: HipoToHipoReader
  writer:
    class: org.jlab.clas.std.services.convertors.HipoToHipoWriter
    name: HipoToHipoWriter
```

The ***services*** section describes data-quantum processing services.

``` yaml
services:
   - class: org.jlab.rec.ft.cal.FTCALEngine
     name: FTCAL
   - class: org.jlab.rec.ft.hodo.FTHODOEngine
     name: FTHODO
   ...
```

<div class="admonition note" markdown="1">
Note that if you need to remove a service from a composition you comment
out the service description, as shown below:
</div>

``` yaml
    # class: org.jlab.clas.std.services.convertors.EtRingToHipoReader
    # name: EtRingToHipoReader
```


The ***configuration*** section describes configuration options required by
services that will be passed to them at the Orchestrator's state-machine
*configure* state.
Subsection ***global*** lists configuration options that is required to
be applied to all services of an application composition. The ***io-services***
subsection describes configuration option used by io-services only.
The ***services*** subsection describes configuration options for each
individual data processing service (see an example below).

``` yaml
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
```

And finally, the ***mime-type*** section defines the data type for the streaming data-quanta.

``` yaml
mime-types:
  - binary/data-hipo
```

CLARA is designed for extension, You can build your own data processing
services, and add them to an application composition. This approach
enables rapid prototyping/development and effective testing.

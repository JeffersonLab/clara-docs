# CLARA Framework

## Welcome!

CLARA is a data-in-motion platform to build streaming
scientific-data analytics applications. It enables scientist to collect,
process, analyze and act on streaming data-quanta (user defined and framework agnostic)
across data centers and clouds.

CLARA framework presents three core components:
***Data Processing Station*** (we call it a service, which is a container for a user data
processing engine), ***Data-stream Pipe*** (a data bus based on [xMsg](https://claraweb.jlab.org/xmsg)
messaging system, that supports protocols, such as MPI, pub-sub, p2p, inproc, and shared memory), and
***Data-flow Orchestrator*** (process level workflow management systems).

![Figure 1. CLARA core components](assets/images/core-components.jpg){: .align-center }

The idea is that the stream of data-quanta are
flowing through data processing stations and getting changed/processed
along the line of a flow. Data processing stations are the place where
user data-quanta processing algorithms and programs are dropped in and
presented as data processing CLARA services.

![Figure 1. CLARA service](assets/images/service.jpg){: .align-center }

Services are reactive computing units. They react on a data-quantum at
the input and present processed data-quantum at the output. So, they are
free of dealing with data stream organization, networking,
data serialization/deserialization, data-quantum transport optimizations, etc.
This makes data processing algorithm development, testing, optimization
and debugging completely independent.
Another important feature of CLARA is that the data stream processing station,
will vertically auto-scale user data processing engine based on the load and/or
user request, freeing user algorithm developers to worry about
creating and managing thread pools, mutex locks and other scaling technical
details.
So, Having variety of services and pipes to connect them together,
CLARA presents a software LEGO system to design and deploy scientific
data processing applications without writing a single line of code.

![Figure 1. CLARA data processing application example](assets/images/application.jpg){: .align-center }


## Getting Started

Through this site service engine developers can find the necessary reference materials
to develop service engines in all supported languages.
For instructions to download the CLARA distribution,
visit the [installation page](docs/tutorials/installation.md).

The table below presents **quickstart guides**
for an introduction to writing services in your preferred language.
Application developers can learn how to use CLARA **orchestration layer**
to compose services into a streaming data-processing applications.

The [CLAS12 section](docs/clas/installation.md)
contains specific information to run **CLAS12 data processing** with CLARA.

A [complete working example](https://github.com/JeffersonLab/clara-demo)
to develop a **multi-lingual application** can be useful for advanced users.

Visit the [framework section](docs/guides/background.md) for more details about the
design of CLARA.

## Supported Languages

<div class="doc-lang-table" markdown="1">

| Java | C++ | Python |
|:-----|:----|:-------|
| [Quick Start][jq] | [Quick Start][cq] | [Quick Start][pq] |
| [Source Code][js] | [Source Code][cs] | [Source Code][ps] |
| [Reference][jr]   | [Reference][cr]   | [Reference][pr]   |

</div>

[jq]: docs/quickstart/java.md
[js]: https://github.com/JeffersonLab/clara-java
[jr]: /clara/api/java/current/

[cq]: docs/quickstart/cpp.md
[cs]: https://github.com/JeffersonLab/clara-cpp
[cr]: /clara/api/cpp/

[pq]: docs/quickstart/python.md
[ps]: https://github.com/JeffersonLab/clara-python
[pr]: /clara/api/python/

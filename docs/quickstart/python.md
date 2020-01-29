---
title: Python Quickstart
link: Python
---

## Before you begin

The clara framework needs xMsg v2.4.1 to run. xMsg is a lightweight,
yet full featured publish/subscribe messaging system, presenting
asynchronous publish/subscribe inter-process communication protocol:
an API layer in Java, Python and C++. Please refer to
[xMsg Python](https://github.com/JeffersonLab/xmsg-python) for
installation instructions.

To install clara-python in your system, run:

```
$ pip install -r requirements.txt
$ ./setup.py install
```

### Starting a DPE

Every data processing environment contains proxy, shared memory map,
as well as registration databases for both publishers and subscribers.
DPE subscribes control requests, such as “create a container”.
DPE can create multiple containers. Every container defines a map of
locally deployed service objects. Each service object creates and manages
object and thread pools for every service-engine object, ready to run
within a service. The number of service-engine objects and the size of
the thread pool is set by the user, that is recommended to be less or
equal to the number of the processor cores.

```
$ p_dpe # or python clara/sys/Dpe.py
```

### Writing your Clara Engine

This is a very simple example of a Clara engine in python. User should
create an engine class with a proper name, then add it to the `$CLARA_SERVICES`
folder for the DPE to find it.

``` python
from clara.base.ClaraUtils import ClaraUtils
from clara.engine.Engine import Engine
from clara.engine.EngineDataType import EngineDataType, Mimetype

class Engine(Engine):
    def __init__(self):
        super(Engine1, self).__init__()

    def configure(self, engine_data):
        # This method gets values to configure the service:
        # For example
        # self.some_configurable_val = engine_data.get_data()
        pass

    def execute(self, engine_data):
        # This service receives an integer and increase the value by one
        # The increased value is then returned.
        data = engine_data.get_data() + 1
        engine_data.set_data(Mimetype.SINT32, data)
        return engine_data

    def execute_group(self, data_array):
        pass

    def get_input_data_types(self):
        # Declares the accepted input datatypes for the engine
        return ClaraUtils.build_data_types(EngineDataType.SINT32())

    def get_output_data_types(self):
        # Declares the accepted output datatypes for the engine
        return ClaraUtils.build_data_types(EngineDataType.SINT32())

    def get_states(self):
        pass

    def get_description(self):
        # Some description of what the engine does.
        return "Some engine1 description"

    def get_version(self):
        # The version of the written engine
        return "v1.0"

    def get_author(self):
        # Information about the author
        return "royarzun"

    def reset(self):
        # Method to reset the engine to its default values
        pass

    def destroy(self):
        # Destructor method for engine
        pass
```

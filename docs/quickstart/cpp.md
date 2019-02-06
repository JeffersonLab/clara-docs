---
title: C++ Quickstart
link: C++
---

## Before you begin

To install the C++ implementation of CLARA,
follow the instructions to build from source
[here](https://github.com/JeffersonLab/clara-cpp#build-notes).
The preferred install directory is `$CLARA_HOME`.


## Creating a service engine

To create a service engine, the class `clara::Engine` must be extended.
As example, the header file `simple_engine.hpp` would look like this:

```cpp
#ifndef SIMPLE_SERVICE_HPP
#define SIMPLE_SERVICE_HPP

#include <clara/engine.hpp>

class SimpleEngine : public clara::Engine
{
public:
    clara::EngineData configure(clara::EngineData& input) override;

    clara::EngineData execute(clara::EngineData& input) override;

    clara::EngineData execute_group(const std::vector<clara::EngineData>& inputs) override;

public:
    std::vector<clara::EngineDataType> input_data_types() const override;

    std::vector<clara::EngineDataType> output_data_types() const override;

    std::set<std::string> states() const override;

public:
    std::string name() const override;

    std::string author() const override;

    std::string description() const override;

    std::string version() const override;
};

#endif
```

The service developer must ensure that the engine is thread-safe.
CLARA will use the same engine instance to process requests concurrently.

In order to load the service into the C++ DPE,
the library that contains the service must provide a specific factory function
that will return a new instance of the service.

This function should be called `create_engine`,
and it would normally be defined in the implementation file
`simple_engine.cpp`,
with the following signature:

```cpp
extern "C"
std::unique_ptr<clara::Engine> create_engine()
{
    return std::make_unique<SimpleEngine>();
}
```


## Compiling with CMake

Services should be compiled and installed as shared libraries in
`$CLARA_HOME`.
These libraries should be named as the service engine they provide.
For example: `libsimple_engine.so` or `libsimple_engine.dylib`.

<div class="admonition note" markdown="1">
Each service engine must be compiled into its own shared library.
</div>

[CMake](https://cmake.org/) is the recommended build system for services,
as the CLARA installation provides the necessary targets to be used as
dependencies.
A basic `CMakeLists.txt` file should use C++14,
find the CLARA library,
create a shared library per service
and install the libraries into `$CLARA_HOME`:

```cmake
project(SIMPLE C CXX)
cmake_minimum_required(VERSION 3.0)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

# Find CLARA (the CMAKE_INSTALL_PREFIX should be the same used when compiling CLARA)
find_package(clara CONFIG REQUIRED)

# List the services implementation files, without extension
set(SERVICES
  simple_service
)

# Create one shared library per service
foreach(service ${SERVICES})
  add_library(${service} SHARED ${service}.cpp)
  target_link_libraries(${service} Clara::clara)
endforeach()

# Install the services
install(TARGETS ${SERVICES} DESTINATION $ENV{CLARA_HOME}/plugins/simple/lib)
```

To compile and install the service run the following commands:

```
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$CLARA_HOME ..
make
make install
```


## Processing requests

Services communicate with other services by sending data as
`clara::EngineData` objects,
which contain the actual data and also metadata fields describing the data.

The data is stored internally as an object of type `clara::any`,
which is a custom implementation of the C++17
[`std::any` class](http://en.cppreference.com/w/cpp/utility/any).

To obtain the data,
the *mime-type* must match the expected input data-type of the engine
(see below),
and then cast the internal `clara::any` object to the proper type
(note that a reference should be used to avoid an unnecessary copy):

```cpp
// input is of type clara::EngineData
if (input.mime_type() == CUSTOM_DATA_TYPE.mime_type()) {
    const auto& value = clara::data_cast<CustomType>(input);
    // use value
}
```

To create the response data, the *mime-type* and the value must be set:
```cpp
auto output_value = OutputType{};
auto output = clara::EngineData{};
output.set_data(OUTPUT_DATA_TYPE.mime_type(), output_value);
```

When the service execution results in an error,
it should be set in the output data:
```cpp
output.set_status(clara::EngineStatus::ERROR);
output.set_description("could not process input data");
```

## Custom data types

In order to send data between services,
CLARA must know how to serialize and deserialize the data.
For this, services must list what data-types they accept and return:

```cpp
std::vector<clara::EngineDataType> SimpleEngine::input_data_types() const
{
    return {clara::type::JSON, CUSTOM_DATA_TYPE};
}

std::vector<clara::EngineDataType> SimpleEngine::output_data_types() const
{
    return {clara::type::JSON, OUTPUT_DATA_TYPE};
}
```

All types known to CLARA are objects of the `clara::EngineDataType` class.
Default data types are provided in the `clara::type` namespace.
For custom data types, a *mime-type* string
and a *serializer* must be defined.

The serializer implements the `clara::Serializer` interface, and serializes
the user data from a `clara::any` object to a vector of bytes:

```cpp
class CustomTypeSerializer : public clara::Serializer
{
public:
    std::vector<std::uint8_t> write(const clara::any& data) const override
    {
        const auto& value = clara::any_cast<const CustomType&>(data);
        auto buffer = std::vector<std::uint8_t>{};
        // ... serialize value into buffer
        return buffer;
    }

    clara::any read(const std::vector<std::uint8_t>& buffer) const override
    {
        auto value = CustomType{};
        // ... deserialize buffer to value
        return clara::any{std::move(value)};
    }
}
```

The custom CLARA data-type can be declared then as:
```cpp
const extern clara::EngineDataType CUSTOM_DATA_TYPE;
```

And defined using the proper *mime-type* string and creating a serializer:
```cpp
const clara::EngineDataType CUSTOM_DATA_TYPE{
        "binary/custom-type",
        std::make_unique<CustomTypeSerializer>()};
```


## What's next

* Read a more detailed tutorial in [C++ Tutorial][ct].
* Explore the C++ API in the [reference documentation][cr].

[ct]: {{ site.baseurl }}/docs/tutorials/cpp.html
[cr]: {{ site.baseurl }}/api/cpp/

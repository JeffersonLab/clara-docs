# Java Quickstart

## Before you begin

To install the Java implementation of CLARA,
follow the instructions to build from source
[here](https://github.com/JeffersonLab/clara-java#installation).
The binary distribution should be deployed to `$CLARA_HOME`.


## Creating a service engine

To create a service engine, the interface `Engine` must be implemented.
As example, the file `SimpleEngine.java` would look like this:

```java
import org.jlab.clara.engine.Engine;
import org.jlab.clara.engine.EngineData;
import org.jlab.clara.engine.EngineDataType;

import java.util.Set;

public class SimpleEngine implements Engine {

    @Override
    public EngineData configure(EngineData input) {
        // ... configure engine with input
    }

    @Override
    public EngineData execute(EngineData input) {
        // ... process input and return result
    }

    @Override
    public EngineData executeGroup(Set<EngineData> inputs) {
        // ... process input and return result
    }

    @Override
    public Set<String> getStates() {
        return null;
    }

    @Override
    public Set<EngineDataType> getInputDataTypes() {
        // ... list input types
    }

    @Override
    public Set<EngineDataType> getOutputDataTypes() {
        // ... list input types
    }

    @Override
    public String getDescription() {
        return "Simple service";
    }

    @Override
    public String getVersion() {
        return "0.5";
    }

    @Override
    public String getAuthor() {
        return "John Doe";
    }

    @Override
    public void reset() {
        // ... reset engine
    }

    @Override
    public void destroy() {
        // ... destroy engine
    }
}
```

The service developer must ensure that the engine is thread-safe.
CLARA will use the same engine instance to process requests concurrently.


## Compiling with Gradle

The CLARA services should be packaged into a JAR file and installed into
`$CLARA_HOME/plugins/<name>/services/`.
The JARs for all dependencies should go into
`$CLARA_HOME/plugins/<name>/lib/`.

The [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html)
is the recommended build system.
A basic `build.gradle` file should contain the CLAS Maven repository,
the CLARA artifact as dependency,
and a task to deploy the service into `$CLARA_HOME`.
Note that both Maven and Gradle expect a
[default layout](https://docs.gradle.org/current/userguide/java_plugin.html#sec:java_project_layout)
for the project.

```groovy
plugins {
    id 'java'
    id 'maven'
}

group = 'org.jlab.clara.examples'
archivesBaseName = 'simple-engine'
version = '0.1'

configurations {
    testCompile.extendsFrom compileOnly
}

repositories {
    maven {
        url 'http://clasweb.jlab.org/clas12maven/'
    }
    mavenCentral()
}

dependencies {
    compileOnly 'org.jlab.coda:jclara:4.3-SNAPSHOT'
    compile 'org.json:json:20160810'
    testCompile 'junit:junit:4.12'
    testCompile 'org.hamcrest:hamcrest-library:1.3'
}

def deploySpec = copySpec {
    into ('plugins/simple/lib') {
        from configurations.runtime
    }
    into ('plugins/simple/services') {
        from jar.archivePath
    }
}

task deploy(type: Copy, overwrite: true, dependsOn: jar) {
    into "$System.env.CLARA_HOME"
    with deploySpec
}
```

To compile and deploy the service run the following:

```
$ ./gradlew deploy
```


## Processing requests

Services communicate with other services by sending data as `EngineData` objects,
which contain the actual data and also metadata fields describing the data.
The data is always stored internally as a Java `Object`.

To obtain the data,
the *mime-type* must match the expected input data-type of the engine
(see below),
and then cast the internal object to the proper type.

```java
// input is of type EngineData
if (input.getMimeType().equals(CUSTOM_DATA_TYPE.mimeType())) {
    CustomType value = (CustomType) input.getData();
    // use value
}
```

To create the response data, the *mime-type* and the value must be set:

```java
OutputType outputValue = new OutputType();
EngineData output = new EngineData();
output.setData(OUTPUT_DATA_TYPE.mimeType(), outputValue);
```

When the service execution results in an error,
it should be set in the output data:

```java
output.setStatus(EngineStatus.ERROR);
output.setDescription("could not process input data");
```

## Custom data types

In order to send data between services,
CLARA must know how to serialize and deserialize the data.
For this, services must list what data-types they accept and return:

```java
@Override
public Set<EngineDataType> getInputDataTypes() {
    return ClaraUtil.buildDataTypes(EngineDataType.JSON, CUSTOM_DATA_TYPE);
}

@Override
public Set<EngineDataType> getOutputDataTypes() {
    return ClaraUtil.buildDataTypes(EngineDataType.JSON, OUTPUT_DATA_TYPE);
}
```

All types known to CLARA are objects of the `EngineDataType` class.
Default data types are provided as static fields in this class.
For custom data types, a *mime-type* string
and a *serializer* must be defined.

The serializer implements the `ClaraSerializer` interface, and serializes
the user data from a Java `Object` object to a `ByteBuffer`.

```java
public final class CustomTypeSerializer implements ClaraSerializer
{
    @Override
    public ByteBuffer write(Object data) throws ClaraException {
    {
        CustomType value = (CustomType) data;
        ByteBuffer buffer = ByteBuffer.allocate(1000);
        // ... serialize value into buffer
        return buffer;
    }

    @Override
    public Object read(ByteBuffer buffer) throws ClaraException {
    {
        CustomType value = new CustomType();
        // ... deserialize buffer to value
        return value;
    }
}
```

The custom CLARA data-type can be defined then
defined using the proper *mime-type* string and creating a serializer:

```java
public static final EngineDataType CUSTOM_DATA_TYPE =
    new EngineDataType("binary/custom-type", new CustomTypeSerializer());
```


## What's next

* Read a more detailed tutorial in [Java Tutorial][jt].
* Explore the Java API in the [reference documentation][jr].

[jt]: ../tutorials/java.md
[jr]: /clara/api/java/current/

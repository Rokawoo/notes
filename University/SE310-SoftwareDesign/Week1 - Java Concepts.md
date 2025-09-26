# Design Patterns
- Reusable solutions to common software design problems
- Framework to create complete solutions
- Shared vocabulary for developers

# Objects
- Traditionally data with methods
- They are entities responsible for themselves

## Definition
- **Conceptually**: A set of responsibilities
- **Specifically**: A set of methods (behaviors) that can be invoked by other objects or itself
- **Implementation**: Code and data with computational interactions between them

## Object Structure
```java
[modifier] class ClassName {
    // Attributes
    [modifier] dataType attributeName;
    
    // Methods
    [modifier] returnType methodName(parameters) {
        // implementation
    }
}
```

# Access Modifiers
- **public** - Accessible from all code
- **protected** - Accessible within package and subclasses
- **default** - Accessible only within same package
- **private** - Accessible only within the class

# Attributes

## Primitive Types
- **boolean** - true or false
- **char** - Single character (2 bytes)
- **byte** - Integer (1 byte, -128 to 127)
- **short** - Integer (2 bytes, -32,768 to 32,767)
- **int** - Integer (4 bytes)
- **long** - Integer (8 bytes)
- **float** - Floating-point (4 bytes)
- **double** - Floating-point (8 bytes)

## Non-Primitive Types
- Classes
- Interfaces
- Arrays
- Strings
- Collections (List, Set, Map)

# Method Classification

## Constructors
- Initialize objects/instances of class
- Can be overloaded with different parameters

### Constructor Overloading (Polymorphic Constructors)
```java
public class Person {
        private String name;
        private int age;
        
        // Default constructor
        public Person() {
            this.name = "Unknown";
            this.age = 0;
        }
        
        // Constructor with name only
        public Person(String name) {
            this.name = name;
            this.age = 0;
        }
        
        // Constructor with both parameters
        public Person(String name, int age) {
            this.name = name;
            this.age = age;
        }
        
        // Copy constructor
        public Person(Person other) {
            this.name = other.name;
            this.age = other.age;
        }
    }
```

## Getters (Accessors)
- Return value of attribute

## Setters (Mutators)
- Set value of attribute

## General Purpose
- Perform tasks or computations

# Scope
- Determines accessibility of classes, methods, and variables
- Controls where elements can be accessed from in code 
- (public, protected, private) use case depends on context 
   - public is external facing
   - private is internal facing 


# Static

## Static Methods
- Can be called without creating instance of class
- Called directly on class: `ClassName.methodName()`
- Always used for `main` method (JVM entry point)
```java
    public static void main(String[] args) {
        // JVM entry point
    }
```

## Static Variables (Class Variables)
- Single shared instance across all objects of the class
- All instances access same memory location
- Belongs to class, not individual objects
```java
class Counter {
        static int count = 0;  // Shared by all Counter objects
    }
```

# Interface
- Contract that defines required methods and constants for implementing classes
- Cannot be instantiated directly

## Interface Properties
- Methods are abstract by default
- Variables are `public static final` by default
- Defines protocol of behavior for implementing classes
- Class can implement multiple interfaces

## Implementation Syntax
```java
    [modifier] class ClassName implements InterfaceName1, InterfaceName2 {
        // Must implement ALL abstract methods from interfaces
    }
```

# Serialization

## Definition
- Convert object state into byte stream for storage/transmission
- Allows objects to persist beyond program execution

## Implementation Requirements
```java
import java.io.*;
    
    class MyClass implements Serializable {
        private static final long serialVersionUID = 1L;
        // Class members
    }
```

## Key Points
- **serialVersionUID**: Unique identifier for version control
    - Type: `static final long`
    - Ensures compatibility between saved and loaded objects
    - Update when class structure changes
- Use relative paths with `File.separator` for platform independence
- Objects can be serialized on one platform, deserialized on another

## Stream Classes
- **FileOutputStream**: Creates output stream for writing data to file
- **ObjectOutputStream**: Writes primitive types and object graphs to OutputStream

## Deserialization
- Convert byte stream back into object
- Reconstructs object state from stored data

## Transient Keyword
- Marks fields that should NOT be serialized
- Use for:
    - I/O objects (streams, connections, buffers)
    - Temporary or derived data
    - Sensitive information
```java
transient private FileWriter writer;  // Won't be serialized
```

## Important Notes
- When a class contains references to other objects, ALL referenced objects must also implement Serializable interface, otherwise a `NotSerializableException` is thrown.

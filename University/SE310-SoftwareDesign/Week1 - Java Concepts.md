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

- Objects use static methods from their declared type, not their runtime type
- Static method calls are resolved at compile-time based on reference type
```java
Animal myPet = new Dog();
myPet.makeSound();  // Calls Animal.makeSound() if static, not Dog.makeSound()
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

# Collections
    
## Collection Types
- **LinkedList**: Dynamic list with node-based storage
- **ArrayList**: Dynamic array-based list (generally preferred)
- **Map**: Key-value pair interface
- **HashMap**: Hash table implementation of Map

> **Note**: ArrayList typically preferred over LinkedList and fixed arrays due to better performance for most use cases

## Java Fixed Array
- Fixed size, contiguous memory block
- Stores same-type elements
- Cannot resize after creation
- Elements can be set to null/zero but not removed
- Zero-indexed
- Access length with `.length` property (proves arrays are objects, not primitives)

### Array Iteration
```java
// Traditional for loop
for (int i = 0; i < array.length; i++) {
    System.out.println(array[i]);
}

// Enhanced for-each loop
for (Type element : array) {
    System.out.println(element);
    }
```

## Lists
- **List** is an interface that ArrayList and LinkedList implement
- Defines required methods all List implementations must provide
- Access size with `.size()` method (not `.length` like arrays)

### ArrayList vs LinkedList

#### ArrayList
- Dynamic array implementation
- Fast random access: O(1)
- Slow insertion/deletion at beginning: O(n)
- Better cache locality

#### LinkedList  
- Node-based implementation
- Fast insertion/deletion at beginning: O(1)
- Slow random access: O(n)
- More memory overhead per element

### Interoperability
- Both implement List interface → interchangeable as List type
- Can transfer data between them using `.addAll()`
- Can be passed/returned as generic List type
```java
List<String> list1 = new ArrayList<>();
    List<String> list2 = new LinkedList<>();
    list2.addAll(list1);  // Transfer all elements
```

# Pass by Value vs Pass by Reference

## Pass by Value
- Copy of value passed to method
- Original unchanged after method exits

## Pass by Reference  
- Memory address passed to method
- Changes persist after method exits

## Java: Always Pass by Value

### Primitives
- Actual value copied
- Original stays same
```java
    int x = 10;
    changeValue(x);  // x still 10
```

### Objects
- Reference (memory address) copied
- Can modify object through copied reference
- Cannot reassign original reference

### Example
```java
MyObject obj = new MyObject();  // value = 10
    modifyObject(obj);               // Pass copy of reference
    // Inside method: obj.setValue(999)
    // After method: original obj.value = 999
```
**Key**: Java passes reference **by value** for objects
- Modify object contents: ✓ Changes persist
- Reassign reference: ✗ Original unchanged

# Inheritance

## Core Concepts
- Create new classes from existing (base/super) classes
- Subclasses inherit properties/methods from parent
- Can only extend one class (single inheritance)
- Use `extends BaseClassName`

## Access Modifiers in Inheritance
- **protected**: Accessible in current and derived classes
- **private**: Only accessible in current class
- **default**: Package-level access

## Method Overriding
- Redefine parent method in child class
- Use `@Override` annotation
- Child class method replaces parent implementation
- Non-overridden methods use parent implementation
```java
class Animal {
    void makeSound() { }
}

class Dog extends Animal {
    @Override
    void makeSound() { }  // Replaces parent method
}
```

# Method Binding

## Static Binding (Compile-Time)
- Applies to: `static`, `private`, `final` methods
- Cannot be overridden
- Resolved at compile-time using **reference type**
- No ambiguity for compiler

## Dynamic Binding (Runtime)
- Used for overridable methods
- Actual object type determines method called
- Resolved at runtime based on **object type**, not reference
```java
Animal pet = new Dog();
    pet.makeSound();  // Calls Dog's method (dynamic)
    pet.staticMethod();  // Calls Animal's method (static)
```

# Abstract Classes

## Properties
- Cannot be instantiated
- Can be inherited
- Declared with `abstract` keyword
- Shown in *italics* in UML

## Abstract Methods
- Method with no implementation
- Must be overridden in non-abstract subclasses
- Subclass implementing all abstract methods are called a **concrete class**

```java
abstract class Shape {
        abstract void draw();  // No implementation
    }
    
    class Circle extends Shape {
        @Override
        void draw() { }  // Must implement
    }
```

## Access Rules
- Abstract classes: `public`
- Abstract methods: `public`/`protected`

# Constructors with Inheritance

## Constructor Chain
1. Child constructor called
2. Parent default constructor runs automatically
3. Child constructor continues

## With Parameters
Use `super(args)` first in child constructor:
```java
    class Parent {
        Parent(String name) { }
    }
    
    class Child extends Parent {
        Child(String name) {
            super(name);  // Must be first line
        }
    }
```

# Packages
- Named collection of related classes

## Types
- **Built-in**: Java standard library
- **User-defined**: Custom packages

    ## Usage
```java
    package com.company;     // First line of file
    
    import java.util.*;      // Import all
    import java.util.List;   // Import specific
```

## Default Package
- No package statement = current directory
- Small projects only

## Directory Structure
- **Package must match directory path**
- `com.company.project` → `com/company/project/MyClass.java`
- Class file location must mirror package name

## Naming
- Reverse domain: `com.company.project`
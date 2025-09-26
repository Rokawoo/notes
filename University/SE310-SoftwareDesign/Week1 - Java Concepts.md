# Design Patterns
- Reusable solutions to common software design problems
- Framework to create complete solutions
- Shared vocabulary for developers

# Objects

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
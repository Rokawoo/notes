# OOP Paradigm

## Core Terminology
- **Class**: Blueprint defining object behavior and data
- **Object**: Instance of a class (traditionally data with methods)
- **Attribute**: Data element in object
- **Method**: Function defined in class
- **Constructor**: Initialize/set up object
- **Destructor**: Finalize/clean up object when no longer needed
- **Instance/Instantiation**: Single occurrence of class
- **Member**: Attribute or method of class

## Class Types
- **Abstract Class**: General type, placeholders for other classes, defines methods subclasses must implement
- **Concrete Class**: Represents specific type of behavior, can instantiate
- **Superclass**: Parent class
- **Derived Class**: Inherits from superclass

## Key Principles

### Encapsulation
- Not just about data, any kind of hiding
- Hide implementation from control program

### Inheritance
- "is-a" relationship
- Derive new classes from existing ones

### Polymorphism
- Handle derived classes same way but get behavior appropriate to derived class
- Same interface, different implementations

## Access Levels
- **public**: Anything can see it
- **protected**: Only objects of this class and derived classes can see it
- **private**: Only objects from this class can see it

## Object Views
- **Conceptual**: Set of responsibilities (entities responsible for themselves)
- **Specification**: Set of methods that can be invoked by other objects or itself
- **Implementation**: Code, data, and computational interactions between them

## Object's Public Interface
- Collection of methods that can be called by other objects

# Software Design Problems

## Functional Decomposition
- Breaking down steps
- Easier to deal with smaller problems

## Why Programs Fail
- One main program controlling sub-programs? History shows it's not good
- Poor requirements gathering (incomplete, wrong, misleading users)
- Perfect requirements cannot be developed
- Requirements always change, code must accommodate changes

## Delegation
- Have sub-functions control themselves

## Maintainability
Two factors:
- **Cohesion**: How closely operations in routine are related
- **Coupling**: Strength of connection between routines

## Debugging Reality
- Fixing a bug is quick
- Finding a bug takes time
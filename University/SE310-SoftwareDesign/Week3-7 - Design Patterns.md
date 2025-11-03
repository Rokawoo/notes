# Facade Pattern

## Definition

- Provide unified interface to set of interfaces in subsystem
- Facade defines higher-level interface that makes subsystem easier to use
- States we need simpler way to access complex system
- Hides complexity of one or more classes behind simple interface

## Key Features

### Intent

- Want to simplify how to use existing system
- Need to define your own interface

### Problem

- Need to use only subset of complex system

### Solution

- Create new interface for client to use

### Participants & Collaborators

- Simplified interface for client

### Consequences

- Simplifies use of required subsystem
- Reduces options

### Implementation

- Define new class (or classes) with required interface
- Uses existing system internally

## Example Benefits

- One person learns complex system
- Develops interface everyone else can access
- Insulates clients from subsystem
- Works with subset of overall subsystem
- Changes to client or database only require reworking facade, not all classes

![](Assets/FacadePatternExample.png)

# Adapter Pattern

## Gang of Four Definition

Convert interface of class into another interface client expects. Adapter lets classes work together that couldn't otherwise due to incompatible interfaces.

## Key Features

### Intent

- Match existing object beyond your control to particular interface

### Problem

- System has right data and behavior but wrong interface
- Typically used when making something derivative of abstract class

### Solution

- Provide wrapper with desired interface
- Encapsulate object with wrapper-like class
- ADAPT existing class to your interface with another class

### Participants & Collaborators

- Adapter's Target (class it derives from)
- Allows Client to use Adaptee as if it were type of Target

### Consequences

- Allows preexisting objects to fit into new class structures

### Implementation

- Contain existing class in another class
- Containing class matches required interface
- Calls methods of contained class

## UML Diagram

```
Client -----> Target
                ^
                |
                Adapter -----> Adaptee
            +request()     +specificRequest()

Adapter->SpecificRequest
```

![](Assets/AdapterPatternExample.png)

# Adapter vs Facade Comparison

| Question                                    | Facade | Adapter  |
| :------------------------------------------ | :----- | :------- |
| Are there preexisting classes?              | Yes    | Yes      |
| Is there an interface we MUST design to?    | No     | Yes      |
| Does object need to behave polymorphically? | No     | Probably |
| Is simpler interface needed?                | Yes    | No       |

**Adapter**: When you need to use existing class and its interface is not the one you need  
**Facade**: When you need to simplify and unify large interface or complex set of interfaces

# Strategy Pattern

## Definition

Defines family of algorithms, encapsulates each one, makes them interchangeable. Strategy lets algorithm vary independently from clients that use it.

## Intent

- Enable use of different business rules or algorithms depending on context
- Design for change wisely

## Problem

- Algorithm selection depends on client making request or data being acted on
- How to handle different implementations of conceptually same task?

## Solution

- Separate algorithm selection from algorithm implementation
- Find what varies and encapsulate it in its own class
- Use aggregation to give object ability to handle functionality

## Implementation

- Context class contains abstract Strategy class
- Strategy has abstract method specifying how to call algorithm
- Each derived class implements needed algorithm

## Based on Principles

- Objects have responsibilities
- Different implementations manifested through polymorphism
- Need to manage several implementations of same basic algorithm

# Bridge Pattern

Decouple an abstraction from its implementation so that the two can vary independently.

## Key Features

### Intent

- Separate class's interface from its implementation
- Allow both to vary independently without affecting each other

### Problem

- When abstraction and implementation should vary independently
- Proliferation of classes from trying to extend in multiple dimensions
- Need to avoid permanent binding between abstraction and implementation

### Solution

- Separate abstraction and implementation into different class hierarchies
- Use aggregation to connect abstraction to implementation
- Bridge uses encapsulation, aggregation, can use inheritance

### Participants & Collaborators

- **Abstraction**: Defines abstract interface, maintains reference to Implementor
- **RefinedAbstraction**: Extends interface defined by Abstraction
- **Implementor**: Defines interface for implementation classes
- **ConcreteImplementor**: Implements Implementor interface

### Consequences

- Decouples interface and implementation
- Improves extensibility - can extend abstraction and implementation hierarchies independently
- Hides implementation details from clients
- Reduces number of subclasses

### Implementation

- Create two separate hierarchies: one for abstractions, one for implementations
- Abstraction contains reference to implementation object
- Abstraction delegates work to implementation object
- Can switch implementations at runtime

## UML Diagram

```Haskell
Client -----> Abstraction -----> Implementor
                  ^                    ^
                  |                    |
         RefinedAbstraction    ConcreteImplementorA
                              ConcreteImplementorB
```

## Example Structure

```Haskell
Abstraction
- implementor: Implementor
+ operation()

RefinedAbstraction extends Abstraction
+ refinedOperation()

Implementor
+ operationImpl()

ConcreteImplementorA implements Implementor
+ operationImpl()

ConcreteImplementorB implements Implementor
+ operationImpl()
```

# Factory

## Solve Two Main issues with reusability

- combinatoral explosion of classes when different aspects of an object vary independantly
  -the ability to swap many classes for equivlent ones with minimal effort

- better to favor aggregation
- instead lets have two abstract classes each with their own inheritance
- controller class can use the two classes and does not need to perform switches to determine which driver to use

## Gang of Four Definition

- defines an interface for creating an object but let subclasses decide which class to instantiate. Factory method lets a class defer instantiation to subclasses

- creator defines an abstract factory method which is implemented in the concrete creator classes, the implementation of the factory method creates the concrete product

- factory method encapsulates code that creates objects

# Factory Method Pattern

Classification:
Creational purpose; Class scope.
Context:
Dynamic creation of different types of objects depending on context, transparent to the client.
Problem:
A client class needs to instantiate one of many derivations of another class, but does not know which one.
Solution:
Define an interface for creation, and delegate to a derived class of that interface the decision of what class to instantiate and how to instantiated it.
Participants:
Creator and Product classes
Consequences:
Need for parallel Product/Creator hierarchies.
The logic for creating a particular types of product is encapsulated in each Creator.

# Advantages

The Creator provides a factory method that substitute the constructor of Concrete Products
• The business logic of product creation, initialization etc. can be wholly encapsulated in those methods
• The client of Creator can ask for the production of different Products in a uniform way and use them uniformly (all derive from main Product super-class) without needing to know the nitty-gritty details

# Key Features

Intent:
Provide an interface for creating families of related or depending objects without specifying their concrete classes.
Classification:
Creational purpose; Class scope.
Context:
There are multiple libraries or sets of classes that are to be chosen depending on context.
Problem:
Families of related objects need to be instantiated together.
Solution:
Coordinates the creation of objects of the same family. Client remains agnostic on the procedure and the rules about which object is in which family.
Participants and Collaborators:
The AbstractFactory defines the interface for how to create each member of the family of objects required.
Typically each family is created by having its own unique ConcreteFactory.
Consequences:
The logic of creating a particular object family is kept hidden from client. Enforces family rules.
Supporting new products requires changing the AbstractFactory interface.
Implementation:
Define and abstract class that specifies which objects are to be made. Then implement one concrete class for each family.

## When to Use Factory Problem

When a system should be independent of how its products are created, composed, and represented
When a class can't anticipate the class of objects it must create
When a system must use just one of a multiple families of product objects
When a family of related product objects is designed to be used together, and you need to enforce this constraint

## Abstract Factory vs Factory Method

Abstract Factory is slightly more elegant than Factory Method in our example, where is the difference?
In fact, Abstract Factory Pattern is very similar to the Factory Method pattern
In Abstract Factory, a class delegates the responsibility of object instantiation to another one via composition The Factory Method pattern uses inheritance to handle the desired object instantiation.
The Abstract Factory Pattern provides an interface for creating families of related or dependent objects without specifying their concrete classes.
The Factory Method Pattern defines an interface for creating an object, but let subclasses decide which class to instantiate. Factory method lets a class defer instantiation to the subclasses

## Factory Method Review

All factories encapsulate object creation
Factory Method relies on inheritance: object creation is delegated to subclasses which implement the factory method to create objects
Abstract Factory relies on composition: delegates the responsibility of object instantiation to another
All factory patterns promote loose coupling by reducing the dependency of your application on concrete classes The intent of Factory Method is to allow a class to defer instantiation to its subclasses
The intent of Abstract Factory is to create families of related objects without having to depend on their concrete classes.

# Creational Patterns - Motivation

Abstract object instantiation
Add one more level of abstraction on top of 00 languages
What's the use of the extra abstraction layer?
Evolution and extendibility of the system
• Do not hardcode object creation
• The extra layer of abstraction enables configuration of the system dynamically

## Common Problematic Approaches

### Copy/Paste

- Traditional method - maintenance headaches
- Copy working code, paste elsewhere, modify

### Switches/Ifs

- Coupling and testing issues
- Multiple variations create messy code
- "Switch creep" - must find every place case is involved
- Variations "dirty" the implementation
- Hard to read flow

### Function Pointers/Delegates

- Used in C++/C#
- Hides code in compact function
- Can't retain state per-object → limited use

### Inheritance Alone

- Allows reuse
- Problem: When things vary independently → too many classes!

## Strategy Pattern Advantage

- Pushes problem down the chain
- From: One large hierarchy with all variations
- To: Few smaller, independent hierarchies
- Other system pieces can use smaller hierarchies

## Two Common Change Approaches to Avoid

- **Over-analyze**: Analysis paralysis
- **Jump in**: Write code without long-term consideration

# Additional Design Principles

## Software Development Problems

### Poor Requirements

- Incomplete, wrong, misleading users
- Perfect requirements cannot be developed
- Requirements always change
- Code must accommodate changes

### Debugging Reality

- Fixing bug is quick
- Finding bug takes time

## Maintainability Factors

- **Cohesion**: How closely operations in routine are related (high = good)
- **Coupling**: Strength of connection between routines (low = good)

## Delegation

- Have sub-functions control themselves
- Reduces coupling between components
- Better than one main program controlling sub-programs

## Functional Decomposition

- Break complex problems into smaller parts
- Each part handles specific task
- Easier to deal with smaller problems

## Object-Oriented Best Practices

- Design to interfaces, not implementations
- Favor aggregation over inheritance
- Find what varies and encapsulate it
- Objects should be responsible for themselves

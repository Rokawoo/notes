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

| Question | Facade | Adapter |
|:---------|:-------|:--------|
| Are there preexisting classes? | Yes | Yes |
| Is there an interface we MUST design to? | No | Yes |
| Does object need to behave polymorphically? | No | Probably |
| Is simpler interface needed? | Yes | No |

**Adapter**: When you need to use existing class and its interface is not the one you need  
**Facade**: When you need to simplify and unify large interface or complex set of interfaces
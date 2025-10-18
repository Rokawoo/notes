# Facade
- Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher level interface that makes a subsystem easier to use.

A facade:
sates we need a simpler way to access a complex system

The facade patterns hides all the comlexity of one or more classes behind a simple interface

facade is a class that provides a reasonable interface to a system (pf other classes)

## Example
- one person learns the complex system
- develops the interface that everyone else can access
- insulates the clients from the subsystem
- works with a subset of the overall subsystem

![](Assets/FacadePatternExample.png)

- any changes to lcient or database would involve a reworking of all classes, only exasterbated with more clients, compared to all linking to a single interface

## key Features

### intent
you want to simplify how to use an existing system
you need to define your own

### problem
you need to use only a subset of a complex system

### solution
create a new interface for the client to use

### participants and collaborators
simplified interface for client

### consequnces
Simplifies the use of a required subsystem but reduces options

### implmentation
Define a new class (or classes) that has the required interface and uses the exisiting system


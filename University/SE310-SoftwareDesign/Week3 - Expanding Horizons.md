# Objects - Better View
- Entities with responsibilities that define behavior
- Focus on what objects do, not what they contain
- Hide implementation details
- Focus on public interface
- Delegate responsibility

# Encapsulation

## Definition
- Encapsulation is ANY kind of hiding
- Traditional view (data hiding) is very limited

## What Can Be Hidden
- Implementations
- Derived classes
- Design details
- Instantiation rules
- Methods
- Other objects
- Type
- Data

## How to Achieve
- Abstract class with derivations
- Interface with implementations
- Use polymorphism
- Reuse by deriving new classes

## Benefits
- Find what varies and encapsulate it
- Isolates changes in one side without affecting other
- When class references abstract class/interface with multiple derivations, derivations are hidden from using class

# Problems with Inheritance Abuse

## Issues with Specialized Classes
- **Weak Cohesion**: Multiple border classes divide related code
- **Reduces Reuse**: Can't reuse special border for other shapes
- **Doesn't Scale**: Combinatorial explosion when things vary

## Better Approach
- Use inheritance to classify classes as things that behave the same way
- Consider what should be variable in design and encapsulate it
- Many patterns use encapsulation to create layers between objects
- Enables changes on different sides of layer without affecting other side
- Promotes loose coupling

# Cardinality in UML

| Cardinality | Representation |
|:------------|:---------------|
| 0..1 | Zero to one |
| 1..1 | One to one |
| 1..n | One to many |
| n..n | Many to many |

# Good Design Rules

## No Redundancy
- Have only one place where rule is implemented

## Readability
- If code is understandable, quality improves as cohesion does

## Testability
- Code should be testable

# Agile and Design Patterns

## Design Patterns Approach
- Start with big concepts in problem domain
- Work inward, accounting for more details as you go
- Results in flexible, changeable code

## Agile Methods
- Focus on small steps, validate as you move forward
- Big picture evolves from small items
- Requires changeable code (patterns provide this)

## Key Difference
- Agile: Start programming without complete requirements
- Patterns: About flexible design structure
- Both complement each other - patterns enable agile's need for change
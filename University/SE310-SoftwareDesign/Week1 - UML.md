# UML (Unified Modeling Language)

## Method Notation
[scope]methodName(paramType paramName): returnType

### Scope Identifiers
    - **+** Public
    - **-** Private
    - **#** Protected
    - **~** Package/Default
    
### Example
+ getName(): String
- calculateSalary(hours: int, rate: double): double
# validateInput(data: String): boolean

## Class Relationships
    
### Inheritance (is-a)
- Arrow with hollow triangle pointing to parent class
- Child **is-a** type of Parent
Student ──▷ Person

### Composition (has-a) 
- **Solid diamond** on the containing class
- Strong ownership - parts cannot exist without whole
- Example: Book has Pages
Book ◆──── Page
- If Book is destroyed, Pages are destroyed
    
### Aggregation (has-a)
- **Hollow diamond** on the containing class  
- Weak ownership - parts can exist independently
- Example: Library has Books
Library ◇──── Book
- If Library is destroyed, Books still exist
    
### Dependency (uses-a)
- Dashed arrow pointing to the class being used
- Temporary usage relationship
Class A - - -> Class B

## Aggregation vs Composition
    
### Aggregation
- Directional association between objects
- "Has-a" relationship where contained object can exist independently
- Direction between them specifies which contains the other
- Also called "Has-a" relationship

### Composition  
- Special case of aggregation (restricted aggregation)
- Contained object cannot exist without container object
- If container is destroyed, contained object is destroyed
- Stronger "Has-a" relationship

### Examples
**Composition**: Book ◆──── Page
- Pages cannot exist without Book
- Destroying Book destroys all Pages

**Aggregation**: Library ◇──── Book  
- Books can exist without Library
- Destroying Library doesn't destroy Books

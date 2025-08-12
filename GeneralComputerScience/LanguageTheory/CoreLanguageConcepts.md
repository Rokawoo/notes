# Programming Languages and Fundamentals

## Table of Contents
- [Structure and Interpretation of Computer Programs](#structure-and-interpretation-of-computer-programs)
- [Core Concepts](#core-concepts)
- [Scheme Programming](#scheme-programming)
- [Expression Evaluation](#expression-evaluation)
- [Special Forms](#special-forms)
- [Programming Paradigms](#programming-paradigms)
- [Imperative Programming](#imperative-programming)
- [Functional Programming](#functional-programming)
- [Object-Oriented Programming](#object-oriented-programming)
- [Other Paradigms](#other-paradigms)
- [Language Characteristics](#language-characteristics)
- [Historical Context](#historical-context)

## Structure and Interpretation of Computer Programs

### Core Concepts

#### Types and Type Systems
Types define the kind of data a variable can hold (integers, strings, booleans, etc.), determining:
- Valid operations on the data
- Memory allocation requirements
- Interpretation of binary data
- Compile-time and runtime checks

#### Invariants
An invariant is a condition or property that remains true during program execution, ensuring consistency and correctness.

**Examples**:
- A binary search tree always maintains its ordering property
- A function always receives a list of positive integers
- A data structure's size is never negative

#### Pure Functions
A pure function:
- Always produces the same output for the same inputs
- Has no side effects (doesn't modify external state)
- Doesn't depend on external state

### Scheme Programming

#### Primitive Expressions
The simplest units of code that evaluate to a value:
- **Numbers**: `42`, `3.14`
- **Booleans**: `#t`, `#f`
- **Symbols**: `'a`, `'foo`
- **Strings**: `"hello"`
- **Variables**: `x`, `counter`

#### Compound Expressions
Expressions formed by combining primitive expressions:
```scheme
(+ 2 3)         ; Addition
(* 4 5)         ; Multiplication
(cons 1 '(2 3)) ; List construction
(car '(1 2 3))  ; First element of list
(cdr '(1 2 3))  ; Rest of list
```

### Expression Evaluation

#### Evaluation Rules
1. **Self-evaluating expressions**: Constants evaluate to themselves
   ```scheme
   42    ; => 42
   "foo" ; => "foo"
   ```

2. **Variables**: Evaluate to their bound value
   ```scheme
   x ; => value bound to x
   ```

3. **Procedure application**:
   - Evaluate all subexpressions (in any order)
   - Apply the procedure (value of first subexpression) to the arguments (values of other subexpressions)
   ```scheme
   (+ 2 3)      ; => 5
   (+ (* 2 3) 4) ; => 10
   ```

#### Evaluation Model
Scheme uses applicative-order evaluation:
- Arguments are evaluated before being passed to procedures
- This differs from normal-order evaluation where arguments are passed unevaluated

### Special Forms

Special forms have their own evaluation rules:

#### Conditional Expressions
```scheme
;; If expression
(if predicate consequent alternative)

;; Example
(if (> x 0) x (- x))

;; Cond expression (multi-way branch)
(cond
[predicate1 expression1]
[predicate2 expression2]
...
[else default-expression])
```

#### Lambda Expressions
```scheme
;; Anonymous function definition
(lambda (param1 param2 ...) body)

;; Example
(lambda (x) (* x x))
```

#### Define Expressions
```scheme
;; Variable definition
(define variable value)

;; Function definition
(define (function-name param1 param2 ...)
body)

;; Example
(define pi 3.14159)
(define (square x) (* x x))
```

#### Logical Operators
```scheme
;; And (short-circuits when false is encountered)
(and expr1 expr2 ...)

;; Or (short-circuits when true is encountered)
(or expr1 expr2 ...)

;; Not
(not expr)
```

#### Quote
```scheme
;; Returns expression without evaluating it
(quote expr)
'expr  ; Shorthand notation
```

## Programming Paradigms

### Imperative Programming

#### Key Characteristics
- Focuses on **how** to compute a result
- Uses statements that change program state
- Based on sequential execution and variable mutation
- Models computation as a sequence of commands

#### Procedural Programming
A subset of imperative programming:
- Organizes code into procedures/functions
- Promotes code reuse and modularity
- Example: C, Pascal, Fortran

#### Example (C)
```c
int sum(int n) {
   int result = 0;
   for (int i = 1; i <= n; i++) {
      result += i;
   }
   return result;
}
```

### Functional Programming

#### Key Characteristics
- Focuses on **what** to compute
- Treats computation as evaluation of mathematical functions
- Avoids state changes and mutable data
- Emphasizes immutability and pure functions

#### Core Concepts
- **First-class functions**: Functions can be passed as arguments, returned, and assigned to variables
- **Higher-order functions**: Functions that take other functions as arguments or return functions
- **Recursion**: Used instead of loops for repetition
- **Referential transparency**: Expressions can be replaced with their values without changing program behavior

#### Example (Haskell)
```haskell
-- Sum of integers from 1 to n
sum' :: Integer -> Integer
sum' 0 = 0
sum' n = n + sum' (n-1)
```

### Object-Oriented Programming

#### Key Characteristics
- Based on objects that encapsulate data and behavior
- Focuses on defining classes and their interactions
- Uses inheritance, polymorphism, and encapsulation

#### Core Concepts
- **Classes**: Blueprints for objects
- **Objects**: Instances of classes with state and behavior
- **Inheritance**: Creating new classes from existing ones
- **Polymorphism**: Objects of different classes responding to the same message
- **Encapsulation**: Hiding implementation details

#### Example (Java)
```java
class Rectangle {
   private double width;
   private double height;
   
   public Rectangle(double width, double height) {
      this.width = width;
      this.height = height;
   }
   
   public double area() {
      return width * height;
   }
}
```

### Other Paradigms

#### Logic Programming
- Based on formal logic
- Program consists of facts and rules
- Computation is query evaluation
- Examples: Prolog, Datalog

#### Declarative Programming
- Focuses on what needs to be done, not how
- Examples: SQL, HTML, CSS

#### Event-Driven Programming
- Program flow determined by events
- Common in GUI and web applications
- Examples: JavaScript, C# with event handlers

#### Concurrent Programming
- Multiple computations execute simultaneously
- Handles parallelism and resource sharing
- Examples: Go (goroutines), Erlang, Java (threads)

## Language Characteristics

### Type Systems
- **Static typing**: Types checked at compile time (Java, C++)
- **Dynamic typing**: Types checked at runtime (Python, JavaScript)
- **Strong typing**: Strict type checking (Python, Rust)
- **Weak typing**: More implicit conversions (JavaScript, C)

### Memory Management
- **Manual**: Programmer manages memory (C with malloc/free)
- **Garbage collection**: Runtime reclaims unused memory (Java, Python)
- **Reference counting**: Tracks object references (Swift)
- **Region-based**: Memory managed in regions (Rust)

## Historical Context

### Evolution of Programming Languages
- **1950s-1960s**: Procedural languages (FORTRAN, COBOL)
- **1970s**: Structured programming (Pascal, C)
- **1980s**: Object-oriented programming (Smalltalk, C++)
- **1990s-2000s**: Web languages, scripting (JavaScript, Python)
- **2010s-present**: Functional features in mainstream languages

### Lisp and AI
- Lisp was historically significant in AI development
- Supported symbolic computation and meta-programming
- Enabled programs to modify themselves based on decisions
- Foundation for early expert systems and AI research
# Constraint Satisfaction Problems

## What Are CSPs?

CSPs are a specialized subset of search problems designed for identification tasks where the goal itself matters, not the path to reach it.

### CSP Components

- **Variables**: Xi with values from domain Di
- **Domains**: Di (may depend on variable i)
- **Constraints**: Specify allowable value combinations for variable subsets

### Types of Constraints

- **Unary**: Single variable (equivalent to domain reduction)
- **Binary**: Pairs of variables
- **N-ary**: Three or more variables
- **Implicit**: Computed via code
- **Explicit**: Enumerated as legal tuples

### Constraint Types by Flexibility

- **Hard constraints**: Must be satisfied
- **Soft constraints (preferences)**: E.g., "red better than green"
  - Representable as costs for variable assignments
  - Creates constrained optimization problems

## CSP Examples

### Map Coloring

- **Variables**: Regions (WA, NT, SA, Q, NSW, V, T)
- **Domains**: {red, green, blue}
- **Constraints**: Adjacent regions must differ in color
- **Solution**: Any assignment satisfying all constraints

### N-Queens (n=4)

**Formulation 1**:

- **Variables**: Xi = position of queen in row i
- **Domains**: {1, 2, 3, 4}
- **Constraints**: No two queens attack each other

**Formulation 2**:

- **Variables**: Xij = queen presence at position (i,j)
- **Domains**: {0, 1}
- **Constraints**:
  - Implicit: Attack conditions
  - Explicit: Legal configuration tuples

### Cryptarithmetic

Variables represent letters, domains are digits, constraints enforce arithmetic rules and uniqueness.

### Sudoku

- **Variables**: Each open square
- **Domains**: {1, 2, ..., 9}
- **Constraints**: 9-way alldiff for each row, column, and region

## CSP Varieties

### Discrete Variables

**Finite domains**:

- Size d creates O(d^n) complete assignments
- Boolean CSPs include Boolean satisfiability (NP-complete)

**Infinite domains**:

- Integers, strings (e.g., job scheduling with start/end times)
- Linear constraints solvable
- Nonlinear constraints undecidable

### Continuous Variables

- E.g., Hubble Telescope observation scheduling
- Linear constraints solvable in polynomial time via LP methods

### Real-World Applications

- Assignment problems (who teaches what)
- Timetabling (class scheduling)
- Hardware configuration
- Transportation scheduling
- Factory scheduling
- Circuit layout
- Fault diagnosis

## Constraint Graphs

**Binary CSP**: Each constraint relates at most two variables.

**Binary constraint graph**: Nodes are variables, arcs represent constraints. Graph structure enables algorithmic speedups (e.g., Tasmania as independent subproblem).

## Solving CSPs: Standard Search

### Standard Search Formulation

- **States**: Partial assignments (values assigned so far)
- **Initial state**: Empty assignment {}
- **Successor function**: Assign value to unassigned variable
- **Goal test**: Complete assignment satisfying all constraints

### Search Characteristics

- Every solution appears at depth n for n variables → use DFS
- Path is irrelevant
- Branching factor: b = (n-l)d at depth l
- Total leaves: n!d^n

### Backtracking Search

Backtracking improves DFS with two key ideas:

1. **One variable at a time**: Variable assignments commute, so fix ordering (WA=red then NT=green ≡ NT=green then WA=red)
2. **Check constraints incrementally**: Only consider values not conflicting with previous assignments

**Performance**: Solves n-queens for n ≤ 25.

**Choice points**: Which variable to assign next, which value to try.

## Improving Backtracking

### Filtering Techniques

#### Forward Checking

Eliminates values from unassigned variables' domains that violate constraints with current assignments. When assigning a variable, cross off conflicting values in neighboring variables.

**Limitation**: Only propagates from assigned to unassigned variables. Fails to detect conflicts between unassigned variables.

#### Arc Consistency

An arc X → Y is consistent when every value in X's domain has at least one compatible value in Y's domain.

**Enforcement algorithm**:

- Remove values from tail until consistent
- If X loses a value, recheck all X's neighbors
- Runtime: O(n²d³), optimizable to O(n²d²)

**Outcomes**:

- One solution remaining
- Multiple solutions remaining
- No solutions (without knowing it)

Arc consistency detects failures earlier than forward checking but still requires backtracking. Detecting all future problems is NP-hard.

#### K-Consistency

| Level | Name             | Definition                                                    |
| :---- | :--------------- | :------------------------------------------------------------ |
| k=1   | Node Consistency | Domain values satisfy unary constraints                       |
| k=2   | Arc Consistency  | Any consistent assignment to one variable extends to neighbor |
| k≥3   | K-Consistency    | Any consistent assignment to k-1 variables extends to kth     |

**Strong k-consistency**: Satisfies all consistency levels 1 through k.

**Critical property**: Strong n-consistency enables backtrack-free solving. Choose any variable, then use 2-consistency for second variable, 3-consistency for third, etc.

**Tradeoff**: Higher k more expensive to compute. Path consistency (k=3) provides middle ground.

### Ordering Heuristics

#### Variable Ordering: Minimum Remaining Values (MRV)

Select variable with fewest legal values remaining. Also called "most constrained variable" or "fail-fast" ordering.

**Rationale**: Min (not max) because detecting failures early prunes search tree sooner.

#### Tiebreaker: Degree Heuristic

Among MRV ties, choose variable with most constraints on remaining unassigned variables.

#### Value Ordering: Least Constraining Value

Choose value ruling out fewest options in remaining variables' domains. May require rerunning filtering.

**Rationale**: Least (not most) preserves maximum flexibility for future assignments.

**Impact**: Combined heuristics make 1000-queens feasible.

## Exploiting Problem Structure

### Independent Subproblems

Constraint graphs with disconnected components solve separately as connected components.

For n variables divided into subproblems of size c:

- Worst-case: O((n/c)(d^c)), linear in n
- Example with n=80, d=2, c=20:
  - Without decomposition: 2^80 = 4 billion years at 10M nodes/sec
  - With decomposition: 4(2^20) = 0.4 seconds at 10M nodes/sec

### Tree-Structured CSPs

**Theorem**: Acyclic constraint graphs solve in O(nd²) time versus O(d^n) for general CSPs.

**Algorithm**:

1. **Order**: Choose root, order variables parent-before-children (runtime: O(nd²))
2. **Remove backward**: For i=n to 2, apply RemoveInconsistent(Parent(Xi), Xi)
3. **Assign forward**: For i=1 to n, assign Xi consistently with Parent(Xi)

**Correctness**:

- **Claim 1**: After backward pass, all root-to-leaf arcs are consistent because Y's domain cannot reduce after X→Y becomes consistent (Y's children processed first)
- **Claim 2**: If root-to-leaf arcs consistent, forward assignment never backtracks (proof by induction)

**Limitation**: Fails with cycles because backward propagation cannot guarantee consistency.

### Cutset Conditioning

For nearly tree-structured CSPs, instantiate a cutset (set of variables) such that removal leaves a tree structure.

**Process**:

1. Choose cutset
2. Instantiate cutset in all possible ways
3. Compute residual CSP for each instantiation
4. Solve residual tree-structured CSPs

**Performance**: Cutset size c gives runtime O(d^c · (n-c)d²), very fast for small c.

### Tree Decomposition

Creates tree-structured graph of mega-variables encoding parts of original CSP.

**Requirements**:

- Subproblems overlap on shared variables
- Shared variables must have consistent assignments between mega-variables
- Ensures global solution consistency

Example: M1={WA, SA, NT}, M2={NT, SA, Q} must agree on NT and SA values.

## Local Search for CSPs

### Min-Conflicts Algorithm

Operates on complete states (all variables assigned) rather than partial assignments.

**Algorithm**:

```haskell
While not solved:
  Variable selection: randomly select any conflicted variable
  Value selection: choose value violating fewest constraints
```

Uses hill climbing with h(n) = total violated constraints. No fringe maintained.

### Performance

**4-Queens example**:

- State space: 4^4 = 256 states
- Operators: Move queen within column
- Evaluation: c(n) = number of attacks

**Scalability**: Solves n-queens in nearly constant time for arbitrary n with high probability, including n=10,000,000. Effective for randomly-generated CSPs except in narrow ratio ranges.

## Summary

CSPs enable specialized algorithms more powerful than standard search:

- **Filtering**: Forward checking and arc consistency detect early failures
- **Ordering**: MRV, degree heuristic, and least constraining value guide efficient search
- **Structure**: Tree decomposition and cutset conditioning exploit graph topology
- **Local search**: Min-conflicts provides practical alternative to systematic search

Basic backtracking solves n ≤ 25 queens. Combined optimizations enable n=1000 queens. Local search scales to n=10,000,000 queens.

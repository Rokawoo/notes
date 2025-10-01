# Search Problems and Methods - Week 2 Notes

## Core Concepts

### Problem Solving in AI
- **Goal**: Develop general algorithms for classes of problems (not problem-specific solutions)
- **Problem Types**: Decision, Search, Counting, Optimization
- **Key Challenge**: State spaces can be enormous (Chess: ~10^50 states)

## Agent Architecture

### Reflex vs Planning Agents
| Reflex Agents | Planning Agents |
|:--------------|:----------------|
| React to current state | Consider future consequences |
| No lookahead | Model world evolution |
| Fast but limited | Slower but more capable |
| "How world IS" | "How world WOULD BE" |

### Planning Strategies
- **Complete**: Find any valid solution (faster)
- **Optimal**: Find best solution (slower, explores more)
- **Replanning**: Adapt plan during execution when failures occur

## Search Problem Components

1. **States**: Problem configurations (abstracted from world)
2. **Initial State**: Starting configuration
3. **Actions**: Available state transitions
4. **Transition Model**: State × Action → State
5. **Goal Test**: State → Boolean
6. **Cost Function**: Path → Number (optional)

**Solution**: Action sequence from initial → goal state

## Critical Distinctions

### World State vs Search State
- **World State**: Complete environment details (intractable)
- **Search State**: Minimal info for planning (abstraction is key)

### State Space Graph vs Search Tree
| State Space Graph | Search Tree |
|:-----------------|:------------|
| Each state appears once | States can repeat |
| Represents problem structure | Represents exploration |
| Usually can't build fully | Build incrementally |
| Nodes = states | Nodes = paths to states |

## Uninformed Search Algorithms

### Key Components
- **Fringe/OPEN**: Nodes to explore (priority queue)
- **CLOSED**: Already explored nodes (prevents cycles)
- **Expansion**: Generate children of current node
- **Strategy**: Order of node exploration

### Depth-First Search (DFS)
- **Strategy**: Expand deepest node first
- **Implementation**: LIFO stack
- **Time**: O(b^m) where b=branching, m=max depth
- **Space**: O(bm) - only siblings on path
- **Complete**: Only if prevent cycles
- **Optimal**: No (finds leftmost solution)

### Breadth-First Search (BFS)
- **Strategy**: Expand shallowest node first
- **Implementation**: FIFO queue
- **Time**: O(b^s) where s=solution depth
- **Space**: O(b^s) - stores entire tier
- **Complete**: Yes (if solution exists)
- **Optimal**: Only if all costs = 1

### Uniform-Cost Search (UCS)
- **Strategy**: Expand cheapest cumulative cost first
- **Implementation**: Priority queue (by path cost)
- **Time**: O(b^(C*/ε)) where C*=optimal cost, ε=min arc cost
- **Space**: O(b^(C*/ε))
- **Complete**: Yes (if costs positive)
- **Optimal**: Yes
- **Key**: Explores cost contours, not depth levels

### Iterative Deepening
- **Strategy**: DFS with increasing depth limits (1, 2, 3...)
- **Benefit**: DFS space advantage + BFS completeness
- **Not wasteful**: Most work in deepest level

## Search Algorithm Comparison

| Algorithm | Complete | Optimal | Time | Space |
|:----------|:---------|:--------|:-----|:------|
| DFS | No* | No | O(b^m) | O(bm) |
| BFS | Yes | No* | O(b^s) | O(b^s) |
| UCS | Yes | Yes | O(b^(C*/ε)) | O(b^(C*/ε)) |

*DFS complete with cycle checking; BFS optimal if unit costs

## Implementation Details

### General Tree Search Pseudocode
```
OPEN = [Start]
CLOSED = []
WHILE OPEN not empty:
    N = OPEN.remove()  // Based on strategy
    IF goal(N): RETURN path
    CLOSED.add(N)
    FOR children C of N not in CLOSED/OPEN:
        C.parent = N
        OPEN.add(C)
```

### The One Queue Principle
All uninformed searches use same algorithm with different fringe ordering:
- DFS: Stack (LIFO)
- BFS: Queue (FIFO)
- UCS: Priority Queue (by cost)

## Key Insights

1. **Repeated States**: Critical to track (CLOSED list) to avoid exponential blowup
2. **Search operates on models**: Quality limited by model accuracy
3. **Trade-offs**: 
   - DFS: Low memory, not optimal
   - BFS: Guaranteed shortest path, high memory
   - UCS: Optimal for weighted graphs, explores all directions

## When to Use Which

- **DFS**: Deep solutions, limited memory
- **BFS**: Shallow solutions, need shortest path
- **UCS**: Varying action costs, need optimal path
- **Iterative Deepening**: Unknown depth, limited memory
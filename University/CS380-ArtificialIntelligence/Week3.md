# Informed Search & A\* Algorithm

## Core Concepts

**Informed Search** uses domain knowledge (heuristics) to guide search toward goals more efficiently than uninformed methods.

**Heuristic Function h(s)**: Estimates distance from state s to nearest goal

- Must be computationally efficient
- Quality dramatically impacts search performance

## Search Strategies Comparison

### Greedy Search

- **Strategy**: Expand node closest to goal (minimize h(n))
- **Properties**:
  - Incomplete (can loop)
  - Time: O(b^m)
  - Space: O(b^m)
  - Non-optimal

### A\* Search

- **Strategy**: Minimize f(n) = g(n) + h(n)
  - g(n): backward cost (path cost from start)
  - h(n): forward cost (heuristic estimate to goal)
- **Termination**: Stop when dequeuing goal, not enqueuing

## Optimality Conditions

### Admissibility

**Definition**: h(n) ≤ actual cost to goal

- Required for tree search optimality
- Underestimates true cost

### Consistency (Stronger Property)

**Definition**: h(n) ≤ c(n,n') + h(n')

- Required for graph search optimality
- Implies admissibility
- f-values never decrease along path

## Heuristic Construction

### Relaxation Method

Create admissible heuristics by solving relaxed problems with additional actions available

### Dominance

If h₂(n) ≥ h₁(n) for all n (both admissible), then h₂ dominates h₁

- Combination: h(n) = max(hₐ(n), hᵦ(n)) is admissible and dominates both

## Common Heuristics Examples

### 8-Puzzle

1. **Misplaced tiles**: Count of tiles not in goal position
2. **Manhattan distance**: Sum of distances to target positions

### Pathfinding

- Euclidean distance (straight-line)
- Manhattan distance (grid-based)

## Implementation Details

### Graph Search Enhancement

- Maintain closed set of expanded states
- Never expand state twice
- Store as set for O(1) lookup

### A\* Algorithm Structure

```
1. Initialize: Start.g = 0, Start.h = heuristic(Start)
2. OPEN = [Start], CLOSED = []
3. While OPEN not empty:
   - Remove lowest f-value node N
   - If goal(N): return path
   - Add N to CLOSED
   - For unexplored children M:
     * Set parent, g, h values
     * Add to OPEN
```

## Key Insights

**A\* Optimality Proof**: Given optimal goal G₁ and suboptimal G₂:

- f(G₂) = g(G₂) > g(G₁) = f(G₁)
- G₁ exits fringe before G₂

**Search Bias**: A\* biases exploration toward goal while maintaining optimality guarantees

## Applications

- Video game pathfinding
- Route planning
- Resource allocation
- Robot motion planning
- Natural language processing
- Speech recognition

## Variants

- **SMA\***: Bounded memory usage
- **TBA\***: Real-time with bounded computation
- **D\***: Dynamic environments
- **LRTA\***: Simple real-time variant

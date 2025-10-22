# Adversarial Search II - Complete Notes

## Minimax Review

Minimax algorithm for deterministic, zero-sum games (chess, checkers, tic-tac-toe).

### Core Concepts

**Zero-sum game**: One player's gain is other's loss (total utility = 0)
**Players**: MAX (maximizes utility) and MIN (minimizes utility)
**Minimax value**: Best achievable utility against rational (optimal) adversary

### Algorithm Properties

| Property | Value |
|:---------|:------|
| Complete | Yes (finite trees) |
| Optimal | Yes (against optimal opponent) |
| Time Complexity | O(b^m) |
| Space Complexity | O(bm) |
| Implementation | Depth-first traversal |

**Variables**:
- b = branching factor (average number of moves per position)
- m = maximum depth of tree

### Chess Reality Check

- Branching factor: ~35
- Nodes at depth 10: ~2.76 × 10^15
- **Conclusion**: Full minimax search impossible for real games

## Alpha-Beta Pruning

### Core Idea

Prune branches that provably cannot affect final minimax decision, producing **identical result** to minimax with fewer node expansions.

### Tracking Variables

**Alpha (α)**: Best value MAX can guarantee so far along path to root
- Initialized: -∞
- Updated at MAX nodes: α = max(α, v)
- Represents MAX's "best option on path to root"

**Beta (β)**: Best value MIN can guarantee so far along path to root
- Initialized: +∞
- Updated at MIN nodes: β = min(β, v)
- Represents MIN's "best option on path to root"

### Pruning Rules

**At MIN nodes**: If v ≤ α, return v immediately (prune remaining children)
- Reasoning: MAX has better alternative elsewhere, will never choose this path
- Condition: Current value already too low for MAX to accept

**At MAX nodes**: If v ≥ β, return v immediately (prune remaining children)
- Reasoning: MIN has better alternative elsewhere, will never choose this path
- Condition: Current value already too high for MIN to accept

### Implementation

```haskell
max-value(state, α, β):
    v = -∞
    for each successor of state:
        v = max(v, min-value(successor, α, β))
        if v ≥ β: return v    // Prune
        α = max(α, v)
    return v

min-value(state, α, β):
    v = +∞
    for each successor of state:
        v = min(v, max-value(successor, α, β))
        if v ≤ α: return v    // Prune
        β = min(β, v)
    return v
```

### Properties

| Property | Value |
|:---------|:------|
| Complete | Yes (same as minimax) |
| Optimal | Yes (same as minimax) |
| Root value | Identical to minimax |
| Intermediate values | May be wrong (incomplete) |
| Time (worst case) | O(b^m) |
| Time (best case) | O(b^(m/2)) with perfect ordering |
| Space | O(bm) |

### Important Caveats

**Values of intermediate nodes might be wrong** because we don't fully explore pruned branches.

**Children of root may have wrong values**, so naïve alpha-beta implementations cannot use stored values for action selection—must track which action led to best value during search.

**Move ordering is critical**:
- Good ordering → more pruning
- Perfect ordering → O(b^(m/2)) time complexity
- Poor ordering → degrades toward O(b^m)

**Practical impact**: Perfect ordering doubles solvable depth (e.g., depth 8 → depth 16)

**Still insufficient**: Even with alpha-beta, full search of chess remains computationally infeasible

### Metareasoning

Alpha-beta is an example of **metareasoning**: computing about what to compute. Instead of blindly exploring all nodes, algorithm reasons about which nodes cannot possibly matter.

### Example Walkthrough

Tree with terminal values [6, 5, 8, 7, 2, 1, 4, 3]:

```haskell
Structure:
        MAX
       /    \
     MIN    MIN
     / \    / \
   MAX MAX MAX MAX
   / \ / \ / \ / \
  6 5 8 7 2 1 4 3
```

**Execution**:
1. Left-left MAX: Explores 6, 5 → returns 6
2. Left MIN: Gets 6, sets β=6
3. Left-right MAX: Explores 8, 7 → returns 8
4. Left MIN: min(6,8) = 6 → returns 6 to root
5. Root: Sets α=6 (best option so far)
6. Right-left MAX: Explores 2, 1 → returns 2
7. Right MIN: Gets 2, sets β=2
8. **Pruning check**: β(2) ≤ α(6)? YES
9. **Prune**: Skip nodes 4 and 3 entirely
10. Right MIN: Returns 2 to root
11. Root: max(6,2) = **6**

**Result**:
- Explored: 6 of 8 terminal nodes (25% reduction)
- Final value: 6 (identical to minimax)

## Resource Limits

### The Problem

Realistic games cannot search to terminal states:
- Chess endgames can be 50+ moves away
- Branching factor too large
- Time constraints (e.g., tournament time limits)

### Solution: Depth-Limited Search

**Approach**:
1. Search only to fixed depth d (cutoff depth)
2. Replace terminal utilities with **evaluation function** at depth d
3. Treat evaluation as if it were terminal utility

**Example calculation**:
- Available time: 100 seconds per move
- Search speed: 10,000 nodes/second
- Total budget: 1,000,000 nodes
- Achievable depth: ~8 plies (decent chess program)

### Tradeoffs

**Lost**: Guarantee of optimal play (no longer computing true minimax values)

**Gained**: Practical playability within time/memory constraints

**Critical insight**: More plies make BIG difference in play quality, even with imperfect evaluation

### Iterative Deepening

**Technique**: Search depth 1, then 2, then 3, etc., until time runs out.

**Benefits**:
- **Anytime algorithm**: Has valid move at any point when time expires
- Move ordering: Results from shallower search improve alpha-beta pruning at deeper levels
- Minimal overhead: Lower depths take negligible time compared to deepest level

## Evaluation Functions

### Purpose

Score non-terminal positions when depth-limited search reaches cutoff.

### Design Approaches

**Ideal (impossible)**: Returns actual minimax value of position

**Practical**: Weighted linear combination of features

```haskell
eval(s) = w₁ × f₁(s) + w₂ × f₂(s) + ... + wₙ × fₙ(s)
```

### Example Features (Chess)

**Material**: Piece count differences
```haskell
f₁(s) = (white queens) - (black queens)
f₂(s) = (white rooks) - (black rooks)
// Typically weighted: queen=9, rook=5, bishop=3, knight=3, pawn=1
```

**Positional**:
- King safety (pawns in front, not exposed)
- Piece mobility (number of legal moves)
- Center control (pieces controlling central squares)
- Pawn structure (doubled pawns, isolated pawns)

**Strategic**:
- Development (pieces off back rank)
- Castling status
- Rook on open file

### Quality vs Depth Tradeoff

**Fundamental tradeoff**: Feature complexity ↔ computational depth

**Key insight**: Deeper search reduces dependency on evaluation quality

| Depth | Evaluation Requirement |
|:------|:----------------------|
| Shallow (d=2) | Must be highly accurate, complex features needed |
| Medium (d=6) | Can tolerate moderate errors |
| Deep (d=10+) | Simple features sufficient (errors "buried" deeper) |

**Reason**: The deeper evaluation functions are in the tree, the less their quality matters—intermediate minimax values correct for evaluation errors.

**Practical advice**: Better to search deeper with simple evaluation than search shallow with complex evaluation.

## Pacman Example: Horizon Problem

### Scenario

Pacman uses depth-limited search (d=2) with replanning at each step. There is a food pellet adjacent to Pacman.

### Observed Behavior (Thrashing)

1. Turn 1: Moves east (toward pellet)
2. Turn 2: Moves west (away from pellet)
3. Turn 3: Moves east again
4. Repeats indefinitely
5. **Never eats the pellet**

### Root Cause

**Within horizon (depth 2)**:
- Strategy A (eat now): west, east → +10 points, then no visible reward
- Strategy B (eat later): east, west → +10 points, then no visible reward
- Both strategies appear equal within lookahead window

**Beyond horizon**: No scoring opportunities visible after eating pellet

**Decision**: Algorithm sees no reason to prefer immediate consumption, leads to indecision and oscillation.

### Solutions

**Immediate**: Add bias in evaluation function favoring immediate rewards

**Better**: Increase search depth so consequences of eating pellet become visible

**Lesson**: Demonstrates danger of naive replanning agents—need sufficient lookahead or temporal preference in evaluation.

## Synergies: Alpha-Beta + Evaluation Functions

**Exploitation approach**: Use evaluation function to prioritize 
exploring moves that appear promising (highest eval scores first).

**Exploration requirement**: Even with good evaluation, alpha-beta 
must still explore other moves to guarantee correctness (though 
pruning eliminates provably irrelevant branches).

### 1. Move Ordering Enhancement

**Concept**: Use evaluation function to guide which nodes to expand first.

**Process**:
1. Generate successor states
2. Evaluate each with evaluation function
3. Sort by evaluation score
4. Explore in sorted order (best first)

**Benefit**: Finding good moves early improves alpha-beta pruning efficiency

**Analogy**: Similar to how A* heuristic guides search toward goal

### 2. Bounds-Based Aggressive Pruning

**Standard alpha-beta**: Prunes based on computed minimax values from explored subtrees

**Enhanced alpha-beta**: Prunes based on bounds from evaluation function before full exploration

#### At MIN Nodes

**If evaluation provides upper bound U**:
- U = maximum possible value this node could achieve
- Compare: U vs α (MAX's best option on path to root)
- If U ≤ α: Prune immediately without exploring children
- Reasoning: Even best-case scenario for MIN won't change MAX's decision

#### At MAX Nodes

**If evaluation provides lower bound L**:
- L = minimum value this node is guaranteed to achieve
- Compare: L vs β (MIN's best option on path to root)
- If L ≥ β: Prune immediately without exploring children
- Reasoning: Even worst-case scenario for MAX won't change MIN's decision

**Result**: More aggressive pruning than value-based alpha-beta alone, leading to even deeper search within same time budget.

## Summary: Key Takeaways

### Algorithm Evolution

1. **Minimax**: Complete, optimal, but O(b^m) impractical for real games
2. **Alpha-Beta**: Same result, O(b^(m/2)) with good ordering, doubles depth
3. **Depth-Limited + Eval**: Loses optimality guarantee but enables practical play
4. **Iterative Deepening**: Anytime property for time management

### Critical Insights

- **Depth > Evaluation Quality**: Prefer deeper search with simple features
- **Move Ordering Matters**: Dramatically affects alpha-beta efficiency
- **Horizon Problem**: Limited depth can cause pathological behavior
- **Metareasoning**: Reason about what to compute, not just compute

### Practical Guidelines

1. Use alpha-beta pruning (never plain minimax)
2. Implement iterative deepening for time management
3. Order moves by evaluation function
4. Keep evaluation function simple, search deeper
5. Watch for horizon effects in agent behavior
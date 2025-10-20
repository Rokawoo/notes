# Adversarial Search II

## Alpha-Beta Pruning

Alpha-beta pruning produces the same minimax result but explores fewer nodes by eliminating branches that cannot affect the final decision.

### Core Mechanism

**Alpha (α)**: Best value MAX can guarantee so far along path to root (initialized to -∞)
**Beta (β)**: Best value MIN can guarantee so far along path to root (initialized to +∞)

**Pruning Rule**: Stop exploring when β ≤ α

- At MIN nodes: If value ≤ α, prune remaining children (MAX won't choose this path)
- At MAX nodes: If value ≥ β, prune remaining children (MIN won't choose this path)

### Algorithm Implementation

```haskell
max-value(state, α, β):
    v = -∞
    for each successor:
        v = max(v, min-value(successor, α, β))
        if v ≥ β: return v  // Prune
        α = max(α, v)
    return v

min-value(state, α, β):
    v = +∞
    for each successor:
        v = min(v, max-value(successor, α, β))
        if v ≤ α: return v  // Prune
        β = min(β, v)
    return v
```

### Performance Characteristics

- **Root minimax value**: Unchanged from standard minimax
- **Intermediate node values**: May be incorrect (partial evaluation)
- **Time complexity**: O(b^(m/2)) with perfect ordering (vs O(b^m) for minimax)
- **Practical impact**: Doubles solvable search depth
- **Node ordering matters**: Better ordering = more pruning

## Resource Limits

### Depth-Limited Search

Real games cannot search to terminal states due to computational constraints.

**Solution**: Search to fixed depth d, then use evaluation function instead of terminal utilities.

**Example calculation**:
- 100 seconds per move
- 10K nodes/second
- = 1M nodes total
- ≈ depth 8 in chess

**Tradeoff**: Lose optimality guarantee, but gain playability.

### Evaluation Functions

Replace terminal utilities with heuristic scoring at depth limit.

**Ideal**: Returns actual minimax value
**Reality**: Weighted linear combination of features

```haskell
eval(s) = w₁ × f₁(s) + w₂ × f₂(s) + ... + wₙ × fₙ(s)
```

**Example features (chess)**:
- Material balance (queen count, pawn count, etc.)
- Positional advantages
- King safety
- Piece mobility

### Depth vs Evaluation Quality

**Key insight**: Deeper search reduces dependency on evaluation function quality.

- Shallow search requires highly accurate evaluation
- Deep search can work with simpler evaluation (features are "buried" deeper)
- Fundamental tradeoff: feature complexity vs computational depth

## Common Pitfalls

### Horizon Problem (Pacman Example)

**Scenario**: Agent replans at each step with limited depth.

**Issue**: Within horizon, eating pellet now vs later scores identically, leading to indecision/oscillation (thrashing).

**Symptoms**:
- Agent moves east then west repeatedly
- Never commits to obvious beneficial action
- Appears to "starve" despite food availability

**Solution**: Increase search depth or add bias toward immediate rewards in evaluation function.

## Synergies: Alpha-Beta + Evaluation

### Move Ordering

Evaluation function guides which nodes to expand first, improving alpha-beta pruning efficiency (similar to A* heuristic role).

### Bounds for Pruning

If evaluation function provides **upper bound** at MIN node:
- Check if upper bound < current α
- If yes, prune immediately without full expansion
- More aggressive pruning than value-based pruning alone

**Symmetry**: Lower bounds at MAX nodes enable similar early pruning.
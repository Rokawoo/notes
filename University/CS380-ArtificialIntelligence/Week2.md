# Search Problems and Methods - Refined Notes

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

## Search Problem Components (PEAS++)

1. **States**: Problem configurations (abstracted from world)
2. **Initial State**: Starting configuration
3. **Actions**: Available state transitions
4. **Transition Model**: State × Action → State
5. **Goal Test**: State → Boolean
6. **Cost Function**: Path → Number (optional)

**Solution**: Action sequence from initial → goal state

## Key Examples

### Simple: Maze
- **State**: (x, y, direction)
- **Actions**: {advance, turn_left, turn_right}
- **State Space**: rows × columns × 4 directions

### Complex: 8-Puzzle  
- **State**: 9-position vector of tile locations
- **Actions**: Move blank {up, down, left, right}
- **State Space**: 9! = 362,880 states
- **Challenge**: Large branching factor

### Constrained: Fox-Goat-Cabbage
- **State**: (fox_loc, goat_loc, cabbage_loc, boat_loc)
- **Constraints**: Never leave predator-prey pairs alone
- **State Space**: ≤54 states (many invalid)
- **Challenge**: Constraint satisfaction

## Critical Distinctions

### World State vs Search State
- **World State**: Complete environment details (intractable)
- **Search State**: Minimal info for planning (abstraction is key)
- Example: Pacman world state includes every pixel; search state just (x,y) + dot locations

### State Space Graph vs Search Tree

| State Space Graph | Search Tree |
|:-----------------|:------------|
| Each state appears once | States can repeat |
| Represents problem structure | Represents exploration |
| Usually can't build fully | Build incrementally |
| Nodes = states | Nodes = paths to states |

**Key Insight**: Tree node represents entire path through graph

## Search Strategy Principles

1. **Incremental Construction**: Build only what's needed
2. **Systematic Exploration**: Avoid missing solutions
3. **Memory vs Time Trade-off**: Graph search (memory) vs tree search (time)
4. **Repeated States**: Major inefficiency source in tree search

## Problem Difficulty Factors

- **State Space Size**: Exponential growth common (how many states are possible in our environment)
- **Branching Factor**: Actions available per state
- **Solution Depth**: Steps needed to reach goal
- **Local Structure**: Dead ends, loops, symmetries

## Practical Implications

- Small puzzles (8-puzzle): Brute force feasible
- Route planning: Need heuristics
- Games (Chess): Require approximation
- Real-world: Must handle uncertainty, partial observability
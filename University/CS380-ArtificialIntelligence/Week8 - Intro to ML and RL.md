# Introduction to Machine Learning

## Core Definition

**Machine Learning**: Study of computer algorithms that improve automatically through experience.

**Formal Framework (T-P-E)**:

- **T (Task)**: The problem to be solved
- **P (Performance measure)**: Metric for evaluating success
- **E (Experience)**: Data used for learning

**Example: Learning Backgammon**

- T: Play backgammon
- P: Number of games won
- E: Data from previously played games

## Learning Agent Architecture

**Components**:

- **Performance element**: Executes actions based on current knowledge
- **Learning element**: Improves performance element using feedback
- **Critic**: Provides feedback on agent's performance
- **Problem generator**: Suggests exploratory actions to gather new experience

**Flow**: Agent interacts with environment → receives feedback → updates knowledge → improves future performance

## Types of Machine Learning

### Supervised Learning

Learning a function from labeled examples.

**Setup**:

- **Target function f**: Unknown function we want to learn
- **Training data**: Examples of form `<x, f(x)>`
- **Goal**: Find hypothesis h such that h ≈ f

**Inductive learning**: Construct h to agree with f on training set (h is **consistent** if it agrees on all examples)

#### Regression

**Task**: Predict real-valued outputs (continuous values)

**Example: Curve Fitting**

```haskell
Given data points: (x₁, y₁), (x₂, y₂), ..., (xₙ, yₙ)
Find function h(x) that approximates underlying f(x)
```

**Process**:

1. Start with training data points
2. Consider multiple hypothesis functions (curves)
3. Select hypothesis that fits data well

**Occam's Razor Principle**: "The simplest explanation tends to be the correct/best one"

- Among multiple hypotheses that fit data, prefer simpler one
- Reduces overfitting risk
- Better generalization to new data

_Historical note: William of Occam (1287-1347)_

#### Classification

**Task**: Predict discrete outputs (categorical labels)

**Workflow**:

1. **Input**: Raw data (images, text, sensor readings, etc.)
2. **Feature extraction**: Identify attributes that characterize each input
3. **ML algorithm**: Process features to learn decision boundaries
4. **Output**: Predicted label y

**Examples**:

- **Handwriting recognition**: Input = image of digit → Output = digit class (0-9)
- **Image classification**: Input = photograph → Output = object category (cat, dog, car, etc.)

**Goal**: Given features x, predict correct label y for new unseen inputs

### Unsupervised Learning

Learning patterns without labeled data.

#### Clustering

**Task**: Group observations into meaningful classes without predefined labels

**Characteristics**:

- No supervision signal (no correct answers provided)
- Algorithm discovers structure in data
- Useful for exploratory data analysis, pattern discovery

**Applications**:

- Customer segmentation
- Document organization
- Image compression
- Anomaly detection

### Reinforcement Learning

**Task**: Learn to perform actions through trial and error to maximize cumulative reward

**Example: Learning to walk**

- Agent (robot) tries different movements
- Receives reward for stable walking, penalty for falling
- Learns optimal walking policy over time

**Key difference from supervised learning**: No correct action provided, only reward signal

### Learning from Demonstration

**Task**: Learn to perform tasks by observing expert demonstrations (also called imitation learning)

**Process**:

- Observe humans or other agents performing task
- Extract patterns from demonstrations
- Reproduce behavior in similar situations

**Applications**:

- Robot manipulation
- Autonomous driving
- Game playing

## Key Concepts Summary

| Learning Type               | Data                       | Goal                       | Example                |
| :-------------------------- | :------------------------- | :------------------------- | :--------------------- |
| Supervised (Regression)     | (x, y) pairs, y continuous | Predict real values        | House price prediction |
| Supervised (Classification) | (x, y) pairs, y discrete   | Predict categories         | Digit recognition      |
| Unsupervised                | x only (no labels)         | Find structure             | Customer grouping      |
| Reinforcement               | States, actions, rewards   | Maximize cumulative reward | Robot control          |
| Demonstration               | Expert behavior sequences  | Imitate expert             | Surgical robots        |

---

# Introduction to Reinforcement Learning

## Core Concepts

### Reinforcement Learning Framework

**Agent-Environment Interaction Loop**:

```haskell
Agent observes: State s
Agent performs: Action a
Environment returns:
  - New state s'
  - Reward r

Agent goal: Maximize expected cumulative reward
```

**Key characteristics**:

- Learning based on observed samples of outcomes
- Environment may be unknown and stochastic
- Feedback comes through rewards (not direct supervision)
- Agent must balance exploration and exploitation

### Formal Components

**State (S)**: Configuration of environment as perceived by agent

**Actions (A)**: Set of possible actions agent can perform

- Assumed discrete for basic Q-learning (can be continuous in other RL algorithms)

**Reward (R)**: Scalar feedback signal received after each action

- Real-valued: positive or negative
- Defines agent's utility function

## Policy vs Plan

### Plan

- **Definition**: Sequence of actions to achieve goal from specific starting state
- **Limitation**: Brittle when environment changes or is stochastic
- **Use case**: Deterministic, static environments

### Policy

- **Definition**: Mapping from states to actions (function π: S → A)
- **Advantage**: Specifies action for every possible state
- **Necessity**: Required for stochastic environments where plans fail

**Representation example - Deterministic policy**:

| State | Action |
| :---- | :----- |
| s₀    | right  |
| s₁    | right  |
| s₂    | up     |
| ...   | ...    |
| sₙ    | left   |

**Stochastic policy**: Specifies probability distribution over actions for each state

- π(a|s) = probability of taking action a in state s

## Value Functions

### State Value Function V^π(s)

**Definition**: Expected cumulative reward starting from state s and following policy π

```haskell
V^π(s) = E[Σ(t=0 to ∞) r_t | S₀ = s, following π]
```

**Problem**: Infinite time horizon computationally intractable

### Discount Factor γ

**Solution**: Introduce discount factor γ ∈ (0, 1) to weight near-term rewards more heavily

```haskell
V^π(s) = E[Σ(t=0 to ∞) γ^t × r_t | S₀ = s, following π]
```

**Properties**:

- γ close to 0: Agent prioritizes immediate rewards (myopic)
- γ close to 1: Agent values long-term rewards (far-sighted)
- γ^t → 0 as t → ∞ (ensures finite sum)

### State-Action Value Function Q^π(s, a)

**Definition**: Expected cumulative reward from taking action a in state s, then following policy π

```haskell
Q^π(s, a) = E[Σ(t=0 to ∞) γ^t × r_t | S₀ = s, A₀ = a, then following π]
```

**Advantage over V**: Directly tells us value of each action, enabling action selection without knowing environment dynamics

## Q-Table Representation

**Structure**: Matrix with rows = states, columns = actions, entries = Q-values

**Example Q-table**:

| State | right | up  | left | down |
| :---- | :---- | :-- | :--- | :--- |
| s₀    | 0.4   | 0.1 | 0.9  | 0.05 |
| s₁    | 0.5   | ... | ...  | ...  |
| s₂    | 0.3   | 0.1 | 0.3  | ...  |
| ...   | ...   | ... | ...  | ...  |
| sₙ    | 0.1   | 0.8 | 0.1  | 0.1  |

**Extracting deterministic policy from Q-table**:

```haskell
π(s) = argmax_a Q(s, a)
```

For each state, choose action with maximum Q-value.

**Derived policy example**:

| State | Action                     |
| :---- | :------------------------- |
| s₀    | left (Q=0.9)               |
| s₁    | right                      |
| s₂    | left or right (tie at 0.3) |
| ...   | ...                        |
| sₙ    | up (Q=0.8)                 |

## Q-Learning Algorithm

**Type**: Value-based, model-free reinforcement learning

**Model-free**: Agent doesn't need access to environment model (transition function, reward function)

**Goal**: Learn optimal Q-table through experience

### Bellman Update Equation

After agent performs action A in state S, transitions to S', and observes reward R:

```haskell
Q_new(S, A) = (1 - α) × Q_old(S, A) + α × [R + γ × max_A' Q(S', A')]
              \_________________/        \_________________________/
              Keep old estimate          New information
```

**Components**:

- **α (learning rate)**: Controls update speed
  - High α (close to 1): Fast learning, less stable
  - Low α (close to 0): Slow learning, more stable
  - Typical range: 0.1 to 0.5
- **R**: Immediate reward from action A

- **γ (discount factor)**: Weight for future rewards

- **max_A' Q(S', A')**: Best possible value from next state S'

**Intuition**: New Q-value is weighted average of:

1. Old estimate (preserve existing knowledge)
2. New sample (immediate reward + discounted future value)

### Q-Learning Algorithm Steps

```haskell
1. Initialize Q(s, a) = 0 for all states s and actions a
2. S = initial_state
3. Loop:
     A = choose_action(S, Q)  // Using exploration strategy
     Execute action A:
       S' = resulting_state
       R = observed_reward
     Update: Q(S, A) = (1-α)Q(S,A) + α[R + γ×max_A' Q(S',A')]
     S = S'
     If S is terminal: S = new_initial_state
```

### Episode-Based Learning

**Episode**: Sequence from initial state to terminal/goal state

**Training procedure**:

1. Select random initial state
2. Run Q-learning until terminal state reached
3. Reset to new initial state
4. Repeat for many episodes

**Benefit**: Natural structure for tasks with clear endpoints (games, navigation tasks)

## Exploration vs Exploitation

**Core dilemma in RL**: How to choose actions during learning?

### The Problem

```haskell
Given Q-table and current state s:
Option 1 (Exploitation): Choose argmax_a Q(s, a)
  - Use current best knowledge
  - May miss better actions not yet discovered

Option 2 (Exploration): Choose random action
  - Discover potentially better actions
  - May waste time on suboptimal actions
```

### Epsilon-Greedy Policy (ε-greedy)

**Most common exploration strategy in Q-learning**

**Algorithm**:

```haskell
With probability ε: choose random action (explore)
With probability (1-ε): choose argmax_a Q(s,a) (exploit)
```

**Parameters**:

- **ε**: Small value, typically 0.1 (10% exploration)
- Can decay ε over time: high early (more exploration), low late (more exploitation)

**Variants**:

- **ε-decay**: Start ε = 1.0, gradually decrease to 0.1
- **Boltzmann exploration**: Use softmax over Q-values instead of random choice

**Connection to MCTS**: Similar concept to UCB (Upper Confidence Bounds) in Monte Carlo Tree Search—balancing exploration of uncertain nodes with exploitation of promising ones

### Exploration Strategy Comparison

| Strategy      | Exploration | Exploitation | Regret                                 |
| :------------ | :---------- | :----------- | :------------------------------------- |
| Always random | High        | None         | Very high                              |
| ε-greedy      | Moderate    | High         | Moderate                               |
| Always greedy | None        | Complete     | Initially high, may never find optimal |

## Regret

**Definition**: Total cost of mistakes made during learning

```haskell
Regret = (Optimal cumulative reward) - (Actual cumulative reward)
```

**Includes**: Suboptimal decisions made while learning (during exploration phase)

**Goal**: Minimize regret = optimally learn to be optimal

**Example comparison**:

- Random exploration: Eventually learns optimal policy but high regret (many bad actions)
- Smart exploration (ε-greedy): Eventually learns optimal policy with lower regret
- Both reach same final performance, but ε-greedy makes fewer mistakes getting there

**Tradeoff**: More exploration → better final policy but higher regret during learning

## Problems with Q-Learning

### Lack of Generalization

**Core issue**: Q-values learned independently for each state-action pair

**Problem**: Similar states don't benefit from each other's learning

**Example**:

```haskell
State s1: Pacman at position (5, 10), ghost at (3, 10)
State s2: Pacman at position (5, 11), ghost at (3, 11)

// These states are nearly identical, but Q-learning treats them completely separately
// Must learn Q(s1, a) and Q(s2, a) from scratch for each
```

**Consequence**:

- Exponential growth in state space with problem size
- Slow learning in large environments
- No transfer of knowledge between similar situations

### Solutions to Generalization Problem

**Function Approximation**: Represent Q-function as parameterized function rather than table

```haskell
Q(s, a) ≈ Q̂(s, a; θ)
where θ are learnable parameters
```

**Feature-Based Representation**: Represent states using meaningful features

```haskell
Instead of: s = (x, y, ghost_x, ghost_y)
Use: features(s) = [distance_to_ghost, distance_to_food, is_ghost_nearby, ...]
Q(s, a) ≈ Σ w_i × f_i(s, a)
```

**Deep Q-Learning (DQN)**: Use neural network to represent Q-function

- Input: State representation
- Output: Q-value for each action
- Implicit generalization through neural network's learned representations

## Example Application: Pacman Q-Learning

### Problem Setup

**Simple Pacman environment**:

- One Pacman agent
- One ghost
- One food pellet
- Grid world

**Reward structure**:

- +100: Pacman eats dot
- -100: Ghost catches Pacman
- -1: Living cost per move

### State Representation Considerations

**Option 1: Entire screen**

```haskell
State = full pixel representation
Problems:
  - Huge state space
  - No generalization between similar screens
  - Impractical for Q-table
```

**Option 2: Just Pacman location**

```haskell
State = (pacman_x, pacman_y)
Problems:
  - Can't distinguish dangerous vs safe positions
  - Ghost location unknown
  - Insufficient information for good policy
```

**Option 3: Both Pacman and ghost locations**

```haskell
State = (pacman_x, pacman_y, ghost_x, ghost_y)
Better: Contains necessary information
Problems:
  - State space grows as: grid_size² × grid_size²
  - Multiple ghosts: grid_size^(2×(1+num_ghosts))
  - Exponential growth in training time
  - Prone to overfitting on specific configurations
```

### Challenges with Scaling

**Large maps**: State space explosion makes Q-table approach intractable

**Multiple ghosts**: Each additional ghost multiplies state space significantly

**Solutions**:

- Feature-based representation: `[distance_to_ghost, distance_to_food, ghost_heading, ...]`
- Function approximation: Learn Q(features, action) instead of Q(state, action)
- Deep Q-Networks: Neural network learns compact representation automatically

## Practical RL Examples

### Walking/Locomotion

- **AIBO robot**: Learned walking gait through RL
- **Crawler bot**: Learned arm coordination for forward movement
- **Humanoid simulation**: Learned bipedal locomotion in rich environments

### Games

- **Atari games (DeepMind)**: DQN learned to play Atari from raw pixels
- **Soccer**: Multi-agent RL for team coordination

### Robotics

- **Helicopter flight**: Learned aerobatic maneuvers
- **Manipulation**: Learned object grasping and manipulation
- **In-hand manipulation (OpenAI Dactyl)**: Learned to manipulate cube with robotic hand using domain randomization
- **NASA SUPERball**: Learned tensegrity robot locomotion

## Key Takeaways

### When to Use RL

**Appropriate for**:

- Sequential decision problems
- Delayed rewards
- Unknown environment dynamics
- Trial-and-error learning feasible

**Not appropriate for**:

- Supervised data readily available
- Single-step decisions
- Trial-and-error too costly (medical, high-stakes scenarios)

### Algorithm Choices

| Scenario                            | Algorithm                   | Reason                   |
| :---------------------------------- | :-------------------------- | :----------------------- |
| Small discrete state/action space   | Q-learning with table       | Direct, interpretable    |
| Large state space, discrete actions | Function approximation, DQN | Generalization needed    |
| Continuous state/action spaces      | Policy gradient methods     | Q-learning doesn't scale |
| Model available                     | Model-based RL, planning    | More sample efficient    |

### Critical Hyperparameters

**Learning rate (α)**: Controls stability vs speed
**Discount factor (γ)**: Controls short-term vs long-term thinking
**Exploration rate (ε)**: Controls exploration vs exploitation balance

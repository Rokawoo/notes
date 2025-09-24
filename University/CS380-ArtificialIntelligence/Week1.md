# AI Introduction Notes

## Core Concepts

### What is Artificial Intelligence?

- **Original Definition**: Replicating human intelligence in a machine
- **Challenge**: "Intelligence" itself is hard to define - includes learning, language, knowledge, reasoning, understanding
- **Turing Test**: AI system passes if it can convince a human it's human through written messages only

### Brief AI History Timeline

- **1943**: McCulloch & Pitts create Boolean circuit model of brain
- **1950**: Turing's "Computing Machinery and Intelligence"
- **1956**: Dartmouth meeting - AI officially born
- **1970s**: First AI winter (computational complexity issues)
- **1980s**: Expert systems boom then bust (second AI winter)
- **2012+**: Big data, neural networks revolution

## Agents and Rationality

### Agent Definition

**Agent**: An autonomous entity that observes and acts upon an environment to achieve goals

- Perceives environment through **sensors**
- Acts upon environment through **actuators/effectors**
- Maps sequences of percepts to actions

### Rationality

**Rational Agent**: Chooses actions that maximize expected value of performance measure given current percept sequence

- Rationality ≠ omniscience or clairvoyance
- Rational ≠ always successful
- Based on expected outcomes, not actual outcomes

### PEAS Framework

Design framework for rational agents:

- **P**erformance measure (how success is measured)
- **E**nvironment (where agent operates)
- **A**ctuators (available actions)
- **S**ensors (percepts available)

## Environment Properties

### Six Key Characteristics

**Observable** - Agent can perceive complete environment state (chess: all pieces visible)

**Deterministic** - Next state completely determined by current state + action, no randomness

**Sequential** - Current decisions affect future states (requires long-term planning)

**Static** - Environment doesn't change while agent deliberates

**Discrete** - Finite number of distinct states and actions

**Single-Agent** - Only one agent operates without competition/cooperation

### Environment Examples

| Environment | Observable | Deterministic | Sequential | Static | Discrete | Single-Agent |
| :---------- | :--------- | :------------ | :--------- | :----- | :------- | :----------- |
| Solitaire   | No         | Yes           | Yes        | Yes    | Yes      | Yes          |
| Chess       | Yes        | Yes           | Yes        | Yes    | Yes      | No           |
| Backgammon  | Yes        | No            | Yes        | Yes    | Yes      | No           |
| Taxi        | No         | No            | Yes        | No     | No       | No           |
| Real Life   | No         | No            | Yes        | No     | No       | No           |

## Agent Types

### Four Basic Types

1. **Simple Reflex Agents**

   - Direct condition-action rules
   - No memory of past states
   - Example: `if [location=A, dirt=yes] then Suck`

2. **State-based Agents**

   - Maintain internal state representation
   - Track how world evolves
   - Remember unobserved aspects

3. **Goal-based Agents**

   - Have explicit goals to achieve
   - Can reason about future states
   - Plan sequences of actions

4. **Utility-based Agents**

   - Use utility function to evaluate states
   - Choose actions maximizing expected utility
   - Handle trade-offs between conflicting goals

5. **Learning Agents**
   - Can improve performance over time
   - Adapt to new situations
   - Modify behavior based on experience

### Additional Agents

1. **Planning Agents**
   - Create action sequences before executing
   - Use formal representations of actions/states
   - Complete Planning: Find any valid solution
   - Optimal Planning: Find best solution by cost metric
   - Planning: Create full plan before execution
   - Replanning: Modify plan during execution when failures/changes occur

## Key AI Subfields

- **Machine Learning**: Systems that improve through experience
- **Deep Learning**: Neural networks with multiple layers
- **Natural Language Processing**: Understanding/generating human language
- **Computer Vision**: Interpreting visual information
- **Robotics**: Physical agents in real world
- **Knowledge Representation**: Encoding information for reasoning

## Current AI Capabilities

### Can Do Well

- Play chess/Go at superhuman level
- Drive cars autonomously
- Play Jeopardy better than humans
- Generate images from text
- Basic translation and conversation

### Still Challenging

- General physical tasks (soccer, surgery)
- True language understanding
- Common sense reasoning
- Creative storytelling
- AGI (Artificial General Intelligence)

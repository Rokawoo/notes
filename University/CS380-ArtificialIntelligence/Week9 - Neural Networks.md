# Introduction to Neural Networks

## Historical Context and Motivation

### Origins

**Core belief**: Modeling brain architecture necessary for artificial intelligence

**Contrast with symbolic AI**: Neural networks vs rule-based expert systems

**Hebbian learning**: Learning occurs by altering synaptic connection strengths (biological basis for many ML algorithms)

## Biological Inspiration

### The Human Brain

**Scale**:
- 10^11 neurons (>20 types)
- 10^14 synapses
- 1-10 ms processing cycles
- Signals: Noisy "spike trains" of electrical potential

**Key insight**: Massive parallelism with simple processing units

### Human Neuron Components

**Dendrites**:
- Act as "input vector" (receive from >1000 neighbor neurons)
- Perform multiplication by weight values
- Function: `input × weight`

**Soma (cell body)**:
- Acts as summation function
- Aggregates excitatory (+) and inhibitory (-) signals
- Function: `Σ(weighted inputs)`

**Axon**:
- Samples electrical potential in soma
- If potential > threshold: sends pulse to neighbors
- If potential ≤ threshold: no signal

### Hebbian Learning Rule

**Principle**: "Neurons that fire together, wire together"

If neuron x_i repeatedly triggers neuron y, the synaptic connection strengthens.

**Mathematical formulation**:
```haskell
w_i = w_i + η × x_i × y

where:
  w_i = weight of ith input
  η = learning rate
  x_i = input from neuron i
  y = output of receiving neuron
```

**Significance**: Foundation for many modern ML learning algorithms

**Brain learning reality**: More associated with pruning connectivity than just strengthening

## Artificial Neural Networks

### Core Characteristics

- **Many simple processing elements**: Individual units perform basic computations
- **Many connections**: Dense interconnectivity
- **Simple messages**: Scalar values passed between units
- **Adaptive interaction**: Weights adjust during learning

**Goal**: Build computational system based on parallel architecture of brains

## Perceptron (Single Neuron)

### Architecture

**Components**:
1. **Inputs**: x₁, x₂, ..., xₙ (from environment or other neurons)
2. **Weights**: w₁, w₂, ..., wₙ (correspond to synaptic efficiency)
3. **Bias**: b with weight w_b (threshold adjustment)
4. **Summation**: Σ = w₁x₁ + w₂x₂ + ... + wₙxₙ + w_b × b
5. **Activation function**: f(Σ) determines output

### Linear Classifier (Simple Perceptron)

**Step activation function**:
```haskell
f(x) = { 0  if Σ < 0
       { 1  if Σ ≥ 0
```

**Geometric interpretation**: 
- Compares features to weight vector via dot product
- W · X > 0 → positive class
- W · X ≤ 0 → negative class
- Decision boundary: hyperplane perpendicular to weight vector

**Learning task**: Find weight vector W from training examples

### Weights Interpretation

**Binary classification**:
- Weight vector W defines decision boundary
- Dot product W · X determines classification
- Positive result → positive class
- Negative result → negative class

**Example computation**:
```haskell
Inputs: X = [x₁=2, x₂=0]
Weights: W = [w₁=4, w₂=-1, w_b=2.5]
Bias: b = 1

Σ = (4×2) + (-1×0) + (2.5×1) = 8 + 0 + 2.5 = 10.5
Output = f(10.5) = 1 (since 10.5 ≥ 0)
```

## Activation Functions

### Common Activation Functions

**Step function (threshold)**:
```haskell
f(x) = { 0  if x < 0
       { 1  if x ≥ 0
```
- Used in original perceptron
- Discontinuous, not differentiable

**Sigmoid (logistic)**:
```haskell
f(x) = 1 / (1 + e^(-x))
```
- Output range: (0, 1)
- Smooth, differentiable
- Similar to logistic regression
- Bias weight w_b shifts threshold location

**Tanh (hyperbolic tangent)**:
```haskell
f(x) = tanh(x) = (e^x - e^(-x)) / (e^x + e^(-x))
```
- Output range: (-1, 1)
- Rescaled sigmoid: `tanh(z) = 2×sigmoid(2z) - 1`
- Steeper than sigmoid (2× as steep)
- Zero-centered (advantage over sigmoid)

**ReLU (Rectified Linear Unit)** - Most common in modern networks:
```haskell
f(x) = max(0, x) = { 0  if x < 0
                   { x  if x ≥ 0
```
- Simplest nonlinear function
- Computationally efficient
- Avoids vanishing gradient problem
- Default choice for hidden layers

### Activation Function Example

```haskell
Inputs: [-0.06, 2.5, 1.4]
Weights: [2.7, 8.6, 0.002]
Activation: sigmoid

Σ = (-0.06 × 2.7) + (2.5 × 8.6) + (1.4 × 0.002)
  = -0.162 + 21.5 + 0.0028
  = 21.34

f(Σ) = 1 / (1 + e^(-21.34)) ≈ 0.9999999996
```

## Perceptron Learning Rule

**Weight update formula**:
```haskell
Δw_i = η × (D - Y) × I_i

where:
  η = learning rate
  D = desired output
  Y = actual output
  I_i = ith input value
```

**Process**:
1. Present input pattern
2. Compute output
3. Calculate error: E = D - Y
4. Update weights proportional to error
5. Repeat until convergence

**Intuition**: Change weights by amount proportional to difference between desired and actual output

## Limitations of Perceptrons

### Linear Separability Problem

**Minsky and Papert (1969)**: Proved perceptrons fail on linearly inseparable problems

**Linearly separable**: Pattern space can be divided by single hyperplane

**XOR Problem** (classic example):

| x₁ | x₂ | XOR output |
|:---|:---|:-----------|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

**Why perceptron fails**: No single line can separate (0,1) and (1,0) from (0,0) and (1,1)

**Historical impact**: Temporarily halted neural network research (AI winter)

**Solution**: Multilayer networks can solve XOR and other linearly inseparable problems

## Multilayer Perceptron (Neural Network)

### Architecture

**Structure**:
- **Input layer**: Receives input features
- **Hidden layer(s)**: Intermediate processing layers
- **Output layer**: Produces final prediction

**Key difference from single perceptron**: Multiple layers enable learning complex, nonlinear decision boundaries

### Feed-Forward Networks

**Characteristics**:
- **One-directional flow**: input → hidden layers → output
- **No loops or feedback**: Information flows forward only
- **No memory**: Each input processed independently
- **Training method**: Backpropagation algorithm

**Example structure**:
```haskell
Input layer (3 units)
    ↓
Hidden layer (4 units)
    ↓
Output layer (2 units)
```

Each connection has adjustable weight, bias terms at each layer.

## Backpropagation Algorithm

### Overview

**Purpose**: Train multilayer networks by efficiently computing gradients

**Approach**: Supervised learning using gradient descent

### Training Process

1. **Initialize**: Assign random weights to all connections
2. **Forward pass**: Present training example, compute output
3. **Calculate error**: Compute mean squared error (or other loss function)
4. **Backward pass**: Propagate error backward through network
5. **Update weights**: Use chain rule to calculate gradient efficiently
6. **Repeat**: Iterate until convergence

**Loss function (mean squared error)**:
```haskell
MSE = (1/n) × Σ(desired_i - actual_i)²
```

## Gradient Descent

### Core Concept

**Goal**: Minimize error function J(θ₀, θ₁, ..., θₙ)

**Gradient ∇J**: Vector indicating "uphill" direction in parameter space

**Strategy**: Move opposite to gradient (downhill) to reduce error

### Gradient Descent Algorithm

**Update rule**:
```haskell
Θ_(i+1) = Θ_i - α × ∇J(Θ_i)

where:
  Θ = parameter vector (all weights)
  α = learning rate
  ∇J(Θ_i) = gradient at current parameters
```

**Process**:
1. Start with initial parameters Θ₀
2. Compute gradient ∇J(Θ_i)
3. Update parameters in opposite direction
4. Repeat until convergence

**Goal**: Produce sequence Θ₀, Θ₁, Θ₂, ... such that J(Θ₁) > J(Θ₂) > J(Θ₃) > ...

### Stochastic Gradient Descent (SGD)

**Difference from batch gradient descent**: Update parameters after each training example (not after seeing all examples)

**Advantages**:
- Faster updates
- Can escape local minima
- Works with online learning

**Disadvantages**:
- Noisier updates
- May not converge exactly to minimum

**Practical approach**: Mini-batch gradient descent (update after small batches)

## Training Example Walkthrough

### Setup

**Dataset**:

| Fields | Class |
|:-------|:------|
| 1.4, 2.7, 1.9 | 0 |
| 3.8, 3.4, 3.2 | 0 |
| 6.4, 2.8, 1.7 | 1 |
| 4.1, 0.1, 0.2 | 0 |

### Step-by-Step Training

**1. Initialize with random weights**
- All connections get random initial values

**2. Present first training pattern: [1.4, 2.7, 1.9]**
- Feed through network

**3. Compute output: 0.8**
- Compare with target: 0
- Error: 0.8 - 0 = 0.8

**4. Adjust weights based on error**
- Use backpropagation to distribute error
- Update all weights slightly

**5. Present second training pattern: [6.4, 2.8, 1.7]**
- Feed through network (with updated weights)

**6. Compute output: 0.9**
- Compare with target: 1
- Error: 0.9 - 1 = -0.1

**7. Adjust weights based on error**
- Smaller error → smaller weight changes

**8. Repeat thousands/millions of times**
- Each iteration: random training instance
- Small weight adjustments reduce total error
- Convergence: error approaches acceptable level

### Decision Boundary Perspective

**Initial state**: Random decision boundary

**After each training iteration**: Boundary shifts slightly

**Final state**: Decision boundary correctly separates classes

**Visualization**: As training progresses, boundary evolves from poor separation to good separation of data points

## Theoretical Properties

### Universal Approximation Theorem

**Statement**: A neural network with:
- 1 hidden layer
- Sufficient hidden units
- Nonlinear activation function

Can approximate any continuous function to arbitrary precision.

**Practical caveat**: Finding the weights is the hard part

**Implication**: Multilayer networks theoretically powerful enough for any classification task

### Linear vs Nonlinear Activation

**Linear activation functions**:
- Network can only draw straight decision boundaries
- True even with many layers
- Equivalent to single-layer linear model
- Reason: Composition of linear functions is linear

**Nonlinear activation functions** (sigmoid, tanh, ReLU):
- Enable complex, curved decision boundaries
- Keep data representation unchanged
- Multiple layers create increasingly complex features

**Comparison with SVMs**:
- **Neural networks**: Nonlinear f(x) draws complex boundaries on unchanged data
- **SVMs**: Linear boundaries but transforms data first (kernel trick)

## Neural Network Vocabulary

### Standard Terminology

| Term | Equivalent/Meaning |
|:-----|:-------------------|
| Neuron | Logistic regression unit or similar |
| Input layer | Input training/test feature vector |
| Bias unit | Intercept term / always-on feature |
| Activation | Response/output of a unit |
| Activation function | Nonlinear function (sigmoid, ReLU, etc.) |
| Backpropagation | Stochastic gradient descent across multilayer network |
| Weight decay | Regularization / Bayesian prior |
| Epoch | One complete pass through training data |
| Forward pass | Computing outputs from inputs |
| Backward pass | Computing gradients from errors |

## Practical Implementation

### Building Neural Networks with PyTorch

**Common libraries**:
- **PyTorch**: Flexible, research-friendly
- **TensorFlow/Keras**: Production-oriented
- **Supporting**: NumPy, Pandas, scikit-learn

**Installation**:
```haskell
python -m pip install torch
python -m pip install numpy
python -m pip install matplotlib
```

### Example: IKEA Furniture Classifier

**Task**: Classify images as {bed, chair, sofa, table}

**Data properties**:
- Image size: 64×64 pixels
- Channels: 3 (RGB)
- Input dimensions: 3 × 64 × 64 = 12,288 pixels

**Network architecture**:
```haskell
Input: (batch_size=16, channels=3, height=64, width=64)
  ↓
Flatten: 16 × 12,288
  ↓
Linear: 12,288 → 128 units (1,572,992 parameters)
  ↓
Linear: 128 → 32 units (4,128 parameters)
  ↓
Linear: 32 → 4 units (132 parameters)
  ↓
Output: 4 class scores

Total parameters: 1,577,252
```

### Training Configuration

**Hyperparameters**:
- Batch size: 16
- Learning rate: 0.001
- Momentum: 0.9 (SGD optimizer)
- Loss function: Cross-entropy

**Training process**:
```haskell
For each epoch:
  For each batch in training data:
    1. Forward pass: compute outputs
    2. Calculate loss: CrossEntropyLoss(outputs, labels)
    3. Backward pass: loss.backward()
    4. Update weights: optimizer.step()
  Evaluate on training and test sets
```

### Training Results

**Progression** (100 epochs):

| Epoch | Loss | Train Acc | Test Acc |
|:------|:-----|:----------|:---------|
| 1 | 19.719 | 47.7% | 46.4% |
| 10 | 7.764 | 78.2% | 75.0% |
| 50 | 4.065 | 87.3% | 82.1% |
| 100 | 2.174 | 90.0% | 78.6% |

**Final accuracy**: 87.7% overall

**Confusion matrix**: Shows bed/table sometimes confused, chairs sometimes misclassified as beds

**Observations**:
- Training accuracy > test accuracy (slight overfitting)
- Loss decreases steadily
- Accuracy improves rapidly initially, plateaus later

### Code Structure

**data.py**: Dataset handling
- Load images
- Shuffle and split (train/test)
- Create batches
- Compute accuracy and confusion matrix

**model.py**: PyTorch model wrapper
- Create sequential model
- Load/save weights
- Print architecture info

**classifier.py**: Main training script
- Define network architecture
- Train with training data
- Evaluate on test data
- Display results

## Exercise Example

**Single perceptron**:
```haskell
Inputs: x₁, x₂, bias=1
Weights: w₁=1, w₂=1, w_bias=-1.5
Activation: step function

Compute output for different inputs:
(0,0): 1×0 + 1×0 + (-1.5)×1 = -1.5 → output = 0
(0,1): 1×0 + 1×1 + (-1.5)×1 = -0.5 → output = 0
(1,0): 1×1 + 1×0 + (-1.5)×1 = -0.5 → output = 0
(1,1): 1×1 + 1×1 + (-1.5)×1 = 0.5 → output = 1
```

**Result**: This perceptron computes AND function

## Summary

### Key Concepts

**Biological inspiration**:
- Neurons ≈ linear-threshold units (rough approximation)
- Massive parallelism enables intelligence

**Perceptron limitations**:
- Single-layer networks: insufficient expressive power
- Cannot solve linearly inseparable problems (XOR)

**Multilayer networks**:
- Sufficiently expressive (universal approximation)
- Trained via gradient descent (backpropagation)
- Nonlinear activations enable complex boundaries

**Practical applications**:
- Text analysis, autonomous driving, handwriting recognition
- Fraud detection, image classification, speech recognition
- Many more domains

### Divergent Subfields

Modern neural network research has branched into:
- **Engineering applications**: Focus on practical performance
- **Cognitive modeling**: Understanding human intelligence
- **Neural system modeling**: Understanding biological brains

These fields share foundations but have largely diverged in methods and goals.

## Critical Implementation Details

### Architecture Decisions

**Number of hidden layers**: 
- More layers → more expressive power
- But harder to train (vanishing gradients)
- Modern trend: Very deep networks (100+ layers)

**Hidden units per layer**:
- More units → more capacity
- Risk of overfitting
- Typically powers of 2 (32, 64, 128, 256, etc.)

**Activation functions**:
- Hidden layers: ReLU (default), sometimes tanh
- Output layer: Softmax (classification), linear (regression), sigmoid (binary)

### Training Considerations

**Learning rate α**:
- Too high: Unstable, overshooting
- Too low: Slow convergence
- Typical values: 0.001 - 0.1

**Batch size**:
- Small (1-32): Noisy updates, faster per-example
- Large (256+): Stable updates, better GPU utilization
- Trade-off between noise and computational efficiency

**Regularization**:
- Weight decay: Penalize large weights
- Dropout: Randomly deactivate units during training
- Early stopping: Stop when validation error increases

### Common Pitfalls

**Overfitting**: Network memorizes training data, poor generalization
**Underfitting**: Network too simple for task
**Vanishing gradients**: Gradients become too small in deep networks (solved by ReLU, skip connections)
**Exploding gradients**: Gradients become too large (solved by gradient clipping)
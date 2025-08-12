# RISC-V and Computer Architecture Notes

## Table of Contents
- [RISC-V Pseudo Instructions](#risc-v-pseudo-instructions)
- [Processor Performance](#processor-performance)
- [Memory Concepts](#memory-concepts)
- [Assembly Programming](#assembly-programming)
- [System Programming](#system-programming)
- [Computer Memory Architecture](#computer-memory-architecture)
- [CPU Performance Optimization](#cpu-performance-optimization)

## RISC-V Pseudo Instructions

### Common Pseudo Instructions and Their Expansions

| Pseudo Instruction   | Expansion                      | Function                       |
|----------------------|--------------------------------|--------------------------------|
| nop                  | addi x0, x0, 0                 | No operation                   |
| li rd, immediate     | Myriad sequences               | Load immediate                 |
| mv rd, rs            | addi rd, rs, 0                 | Copy register                  |
| not rd, rs           | xori rd, rs, -1                | One's complement               |
| neg rd, rs           | sub rd, x0, rs                 | Two's complement               |
| negw rd, rs          | subw rd, x0, rs                | Two's complement word          |
| sext.w rd, rs        | addiw rd, rs, 0                | Sign extend word               |
| seqz rd, rs          | sltiu rd, rs, 1                | Set if = zero                  |
| snez rd, rs          | sltu rd, x0, rs                | Set if ≠ zero                  |
| sltz rd, rs          | slt rd, rs, x0                 | Set if < zero                  |
| sgtz rd, rs          | slt rd, x0, rs                 | Set if > zero                  |
| beqz rs, offset      | beq rs, x0, offset             | Branch if = zero               |
| bnez rs, offset      | bne rs, x0, offset             | Branch if ≠ zero               |
| blez rs, offset      | bge x0, rs, offset             | Branch if ≤ zero               |
| bgez rs, offset      | bge rs, x0, offset             | Branch if ≥ zero               |
| bltz rs, offset      | blt rs, x0, offset             | Branch if < zero               |
| bgtz rs, offset      | blt x0, rs, offset             | Branch if > zero               |
| bgt rs, rt, offset   | blt rt, rs, offset             | Branch if >                    |
| ble rs, rt, offset   | bge rt, rs, offset             | Branch if ≤                    |
| bgtu rs, rt, offset  | bltu rt, rs, offset            | Branch if >, unsigned          |
| bleu rs, rt, offset  | bgeu rt, rs, offset            | Branch if ≤, unsigned          |
| j offset             | jal x0, offset                 | Jump                           |
| jal offset           | jal x1, offset                 | Jump and link                  |
| jr rs                | jalr x0, 0(rs)                 | Jump register                  |
| jalr rs              | jalr x1, 0(rs)                 | Jump and link register         |
| ret                  | jalr x0, 0(x1)                 | Return from subroutine         |
| call aa              | auipc x1, aa[31:12] + aa[11]   | Call far-away subroutine       |
|                      | jalr x1, aa[11:0](x1)          | (two instructions)             |
| tail aa              | auipc x6, aa[31:12] + aa[11]   | Tail call far-away subroutine  |
|                      | jalr x0, aa[11:0](x6)          | (also two instructions)        |

### RISC-V Logical Instructions

Bitwise logical instructions carry out the specified operation on each bit of the sources in turn. Common operations include `and`, `not`, and `xori`.

## Processor Performance

### Hertz & Cycles

- **Clock Speed**: Measured in gigahertz (GHz), representing cycles per second
- **1 GHz** = 1,000,000,000 Hz
- Each instruction typically takes one cycle to execute
- RISC-V uses 32-bit word lengths, making it highly likely to achieve one instruction per cycle
- In contrast, Intel architecture supports direct memory access and pointer manipulation, which doesn't guarantee a single cycle per instruction
- Some Intel instructions can take a variable number of cycles to execute

### Cores vs. GHz

To estimate total processing power (rough measure):
- **Total GHz = Number of Cores × Clock Speed**

**When More Cores Are Better:**
- Multi-threaded workloads (video editing, 3D rendering, scientific simulations, server operations)
- Parallelizable tasks that can run simultaneously

**When Higher GHz Is Better:**
- Single-threaded or lightly-threaded tasks (gaming, simple apps, office software)
- Tasks that can't parallelize well

**General Rule**: Use more cores for multi-threaded tasks and higher GHz for single-threaded tasks

### Multicore Performance Limitations

**Resource Contention:**
- Multiple cores share the same disk and memory resources
- Cores can compete for these resources, creating bottlenecks
- Cache coherence and memory bandwidth impact efficiency

**Concurrency Bottlenecks:**
- Task parallelization efficiency depends on dependencies
- Cores may need to wait for each other when accessing shared data
- Synchronization overhead can introduce delays

**Disk I/O Bottleneck:**
- Adding more cores does not speed up disk access
- All cores share the same disk bandwidth
- SSDs are faster than HDDs but still limited when accessed by multiple cores

## Memory Concepts

### Word Size Alignment

- RISC-V: 32 bits (4 bytes) per word
- x86-64: 64 bits (8 bytes) per word
- Word size depends on machine architecture and alignment

**Data Types in System Programming:**
- `uint8_t` = unsigned 8-bit integer
- `ube16_t` = unsigned big-endian 16-bit integer
- `i` prefix indicates signed integers

### Memory Types

#### ROM (Read-Only Memory)
- Non-volatile storage that retains data without power
- Used for instructions or data that shouldn't change
- A "1k x 32" ROM has 1024 addresses, each storing a 32-bit value

#### DRAM (Dynamic RAM)
**Characteristics:**
- Volatile: Data lost when power is off
- Requires constant refreshing (thousands of times per second)
- Stores bits in capacitors that lose charge over time
- Lower cost, higher density than SRAM
- Reading a bit discharges the capacitor, requiring rewrite
![image](https://github.com/user-attachments/assets/362cc62a-4029-4dfa-a3c9-bd8b4d6ffc20)
![image](https://github.com/user-attachments/assets/a59cf89f-a413-465a-8692-a3bb24b5cd3e)


#### SRAM (Static RAM)
**Characteristics:**
- Faster than DRAM (no refresh needed)
- Uses flip-flop circuits to maintain state
- More expensive, lower density than DRAM
- Ideal for cache memory due to speed and lower power usage

### Files in Memory vs. Disk

**Working with Files in Memory:**
- Files are loaded into RAM for processing
- Memory provides high-speed access for editing and manipulation
- While working with a file, it exists entirely in memory
- Disk access only occurs when saving or with very large datasets

**Saving Files Back to Disk:**
- Modified data in memory is written back to storage device
- Disk I/O is much slower than memory operations
- Disk serves as persistent storage, retaining data when powered off

### Caching to Minimize Disk Access

**What is Caching:**
- Storing frequently accessed data in faster memory
- Reduces need to repeatedly access slower disk storage

**How Caching Saves Time:**
- Cache hit: Retrieving data already in memory instead of disk
- Write-back caching: Changes made in memory, written to disk in batches
- Reduces disk I/O frequency and improves performance
- Helps extend storage device lifespan by reducing write operations

## Assembly Programming

### Structure Usage

- For functions with many arguments, create a structure and pass a pointer
- This allows access to all parameters without listing each one individually

### Function Types

**Leaf Functions:**
- Do not call other functions
- Return address (ra) remains unchanged

**Non-Leaf Functions:**
- Call other functions using `jal`
- May overwrite return address (ra)
- Need to save ra on the stack before calling another function

### Register Usage

**T Registers (Temporary):**
- `t0-t4`
- Not preserved across function calls
- Cannot be trusted to hold values between function calls

**A Registers (Arguments):**
- `a0-a3` for function parameters
- `a0` also holds return value
- For more than 4 parameters, use a structure and pointer

**S Registers (Saved):**
- Preserved across function calls
- Values stored on stack and restored when needed

### Memory Management

**Stack Memory:**
- Used for local variables
- Automatically freed when function goes out of scope
- Used to store values that shouldn't be lost (like ra)

**Heap Memory:**
- Allocated dynamically using `malloc`
- Requires explicit management
- Fragmentation can occur over time
- Memory management algorithms work in background

**Pointers:**
- Size: 1 word (32 bits in RISC-V, 64 bits in x86-64)

## System Programming

### Linux File Handling

- Linux treats everything as a file, including:
  - stdin (Standard Input) = 0
  - stdout (Standard Output) = 1
  - stderr (Standard Error) = 2

### System Call Convention

- Syscall number placed in register `a7`
- Function arguments in registers `a0` through `a6`

### Assembling & Linking in Linux

**Assembling:**
`as -o output_file.o input_file.s`

**Linking:**
`ld -o hello hello.o`

**Purpose of Linking:**
- Resolves dependencies by connecting libraries to object file
- Makes library calls valid by including necessary libraries

## Computer Memory Architecture

### Cache Hierarchy

- **Level 1 Cache**: Fastest, smallest cache; closest to CPU
- **Level 2 Cache**: 4 cycles access time
- **Level 3 Cache**: 10 cycles access time; connected to DRAM
- "Hotter" memory kept in lower cache levels
- Modern CPUs good at projecting data up or down cache levels
![image](https://github.com/user-attachments/assets/b4f3606c-26ef-4080-af14-0b635a0ffc9d)


### DRAM Structure

- Organized as a large matrix
- Rows and columns addressed to access specific memory locations

### Cache Coherence

- In multi-core systems, each core has its own cache
- All cores share the same main memory
- Cache coherence ensures data consistency between caches
- Prevents one core from using outdated values when another core updates data

### Cache Misses

When requested data isn't in cache:
- Must be fetched from higher-level cache or main memory
- Results in significant performance penalty

## CPU Performance Optimization

### Branch Prediction

- Predicts which path a conditional branch will take
- Allows CPU to speculatively execute instructions
- Correct prediction: continues execution without penalty
- Incorrect prediction: must flush pipeline and restart

### Out-of-Order Execution

- Allows CPU to execute instructions as operands become available
- Not strictly in program order
- Solves pipeline stalls where processor waits for data/resources
- Improves utilization of execution units

### Reorder Buffer (ROB)

- Manages out-of-order execution
- Holds instructions executed out of order
- Ensures results committed in correct program order
- Maintains logical sequence while allowing parallel execution
- Ensures program correctness while improving performance

### Clock Frequency Challenges

- Higher frequencies mean faster processing but face limitations:
  - Increased heat generation
  - Thermal throttling to prevent overheating
  - Higher power consumption
  - Reduced battery life in mobile devices

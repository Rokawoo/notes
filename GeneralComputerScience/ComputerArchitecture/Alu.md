# Arithmetic Logic Unit (ALU)

- **Core Component**: The ALU is the computational heart of the CPU
- **Primary Functions**:
- Arithmetic operations (addition, subtraction, multiplication, division)
- Logical operations (AND, OR, XOR, NOT)
- Shift and rotate operations
- Comparison operations (equals, greater than, less than)

## ALU in RISC-V Architecture
- Implements R-type instructions (register-to-register)
- Examples: `add`, `sub`, `and`, `or`, `xor`, `slt` (set less than)
- I-type instructions use the ALU with one immediate operand
- Examples: `addi`, `slti`, `andi`, `ori`, `xori`  
![image](https://github.com/user-attachments/assets/e8ce1804-4b88-48c6-b1c5-779b672203c2)


## ALU Operation Cycle
1. Receives operands from registers or immediate fields
2. Performs specified operation based on instruction opcode
3. Writes result to destination register
4. Sets condition flags (in some architectures)
   - Zero, Negative, Carry, Overflow

## ALU in Pipeline Design
- Dedicated stage in classic 5-stage pipeline
- Multiple ALUs in superscalar processors enable parallel execution
- Critical for instruction throughput

## ALU Performance Considerations
- Single-cycle operation for simple instructions
- Multi-cycle operation for complex instructions (multiplication, division)
- Specialized circuits for common operations improve execution speed

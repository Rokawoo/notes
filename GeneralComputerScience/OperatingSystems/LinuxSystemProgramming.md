# Linux System Programming and Operating System Concepts

## Table of Contents
- [Process Management](#process-management)
- [Process Hierarchy](#process-hierarchy)
- [Program Entry Points](#program-entry-points)
- [Fork and Exec](#fork-and-exec)
- [Threads vs Processes](#threads-vs-processes)
- [Low-Level Programming](#low-level-programming)
- [ELF Format](#elf-format)
- [System Calls](#system-calls)
- [C Runtime Library](#c-runtime-library)
- [Inter-Process Communication](#inter-process-communication)
- [Pipes and Redirection](#pipes-and-redirection)
- [Socket Programming](#socket-programming)
- [Synchronization and Concurrency](#synchronization-and-concurrency) 
- [Signals](#signals)
- [Reentrant Functions](#reentrant-functions)
- [Data Types](#data-types)
- [Size Relationships](#size-relationships)
- [Fixed-Width Types](#fixed-width-types)

## Process Management

### Process Hierarchy
- Processes form a hierarchical parent-child relationship
- Example: Shell > Program > Shell
- Parent processes can spawn children and wait for their completion
- Child processes inherit file descriptors and environment from parents
![image](https://github.com/user-attachments/assets/2979dc76-8584-46fe-bf61-01e738ba26a3)


### Program Entry Points
- Standard C programs start execution at `main()`
- Before `main()` is called, the C runtime environment sets up through `_start()`
- Execution flow: `_start()` → `LibCStartMain()` → `main()`
- When `main()` returns, the runtime performs cleanup and calls `_exit()`

#### Custom Entry Points
```c
// Custom entry point (requires -nostartfiles compiler flag)
int _start() {
_exit(25);  // Must explicitly call _exit() to terminate properly
}
```

### Fork and Exec
- `fork()`: Creates a new process by duplicating the calling process
- Child gets separate memory space but inherits parent's execution state
- Returns child PID to parent, 0 to child

- `exec()`: Replaces current process image with a new program
- Does not create a new process
- Transforms calling process into another program

- These functions are part of the POSIX standard API for Unix-like systems

### Threads vs Processes
- Threads share memory space within a process
- Shared: Memory, heap
- Thread-specific: Stack, registers

- Processes have their own separate resources:
- Memory space
- File descriptors
- Process ID

- Thread efficiency comes from shared memory, not inherently from being lightweight
- Thread coordination requires protection of shared resources (globals, heap)

## Low-Level Programming

### ELF Format
ELF (Executable and Linkable Format) is the standard binary format for executables on Linux.

#### Key ELF Header Information:
- Machine: Defines file's architecture (e.g., ARM64, x86_64)
- Entry Point Address: Memory location of first instruction (e.g., 0x600)
- Type: Executable type, including DYN (Position-Independent Executable)
- Position independence prevents memory tampering by randomizing address space

### System Calls
- Direct requests to the kernel for services
- In RISC-V, system call number is placed in register a7
- Return values typically placed in a0 register
- Examples: exit (60), read, write, fork, execve

### C Runtime Library
- Provides wrapper functions around system calls
- Implements buffering for efficiency (e.g., stdout)
- Functions with leading underscore (e.g., `_exit()`) are typically internal
- Usage example:
```c
extern void _exit(int);  // Declare external function to use directly
```

- Buffered I/O is flushed during `exit()` to ensure data is written to disk/console
- `exit()` performs cleanup before calling `_exit()` as its final operation

## Inter-Process Communication

### Pipes and Redirection
- File descriptor duplication:
- `dup(oldfd)`: Duplicates a file descriptor, returns lowest available number
- `dup2(oldfd, newfd)`: Makes newfd a copy of oldfd, closing newfd if needed

#### Process Piping Example
```c
// Create a pipe between two child processes
int fd[2];
pipe(fd);  // fd[0] is read end, fd[1] is write end

if (fork() == 0) {
   // Child 1 (writer)
   close(fd[0]);  // Close unused read end
   dup2(fd[1], STDOUT_FILENO);  // Redirect stdout to pipe
   execl("/bin/ls", "ls", NULL);  // Run ls command
}

if (fork() == 0) {
   // Child 2 (reader)
   close(fd[1]);  // Close unused write end
   dup2(fd[0], STDIN_FILENO);  // Redirect stdin from pipe
   execl("/bin/grep", "grep", "pattern", NULL);  // Run grep command
}

// Parent closes both pipe ends
close(fd[0]);
close(fd[1]);
```

#### Here Document
A way to provide multi-line input to a command:
```
command << EOF
line 1
line 2
EOF
```
- Also works with other markers like EOT
- Ends with CTRL+D in interactive shell (ASCII 0x04 - End of Transmission)

### Socket Programming

#### Connection Handling
```c
data_socket = accept(listen_socket, NULL, NULL);
```
- Accepts one client at a time
- Can handle connections in separate threads
- Error checking crucial: -1 indicates failure

#### Resource Management
- `close(data_socket)` is critical for long-running programs
- Linux won't automatically clean up file descriptors
- Failing to close sockets leads to resource exhaustion

#### Communication Functions
- `send(data_socket, send_buffer, buff_len, 0)`: Wrapper around `write()`
- `recv(data_socket, recv_buffer, sizeof(recv_buffer), 0)`: Wrapper around `read()`
- With flags=0, functionally similar to standard file I/O

#### Network Addressing
```c
addr.sin_addr.s_addr = inet_addr("127.0.0.1");  // Localhost
```
- Better to dynamically reference local network interface
- Avoids hardcoding potentially changing values

#### Data Termination
- Files over TCP end with EOF, not null byte
- In Linux, EOF is CTRL+D or ASCII 0x04
- C strings use null byte (0) for termination

#### Formatted Output
```c
printf("%.*s", (int)receive_size, buff);
```
- Controls output precision with received size
- Prevents reading beyond received data
- Alternative to null byte termination

## Synchronization and Concurrency

### Signals
- Only one signal can be pending when all signals are blocked
- Signals are not queued; repeated signals don't stack
- Once unblocked, signal is delivered once regardless of how many times it was sent

### Reentrant Functions
- **Non-reentrant** (e.g., `printf()`): Unsafe if interrupted due to shared resource use
- May cause output loss/corruption
- Problem during context switches

- **Reentrant**: Safe when interrupted
- No reliance on shared state
- Can be interrupted and called again safely

### Volatile Keyword
The `volatile` keyword ensures the CPU:
- Loads from memory
- Performs the operation
- Stores the result
- Prevents compiler optimizations that may cache values

### OS Timer & Single-Core Execution
- OS sets timer interrupt to switch between running OS and user code
- On single-core CPU, only one executes at a time
- Timer ensures OS gets control periodically for multitasking

## Data Types

### Size Relationships
```
char = 1 byte (exactly)
short >= char (at least 1 byte)
int >= short (at least 2 bytes)
long >= int (at least 4 bytes)
```

#### Typical sizes on modern systems:
- char: 1 byte
- short: 2 bytes
- int: 4 bytes
- long: 4 bytes (Windows), 8 bytes (Linux/macOS 64-bit)

### Fixed-Width Types

#### uint16_t
- Unsigned 16-bit integer (0 to 65,535)
- Exactly 2 bytes on all platforms
- Defined in `<stdint.h>`
- Used for port numbers in network programming
- Requires byte-order conversion:
- `htons()` - Host to Network byte order
- `ntohs()` - Network to Host byte order

#### Benefits of Fixed-Width Types
- Consistent size across platforms
- Predictable overflow behavior
- More specific than traditional C types
- Portable across different architectures

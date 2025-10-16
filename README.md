 ## Digital Lock System using Moore FSM

## Problem Statement

Design a **Finite State Machine (FSM)** that acts as a **Digital Lock**.  
The lock verifies whether a **3-bit PIN sequence `0 → 1 → 1`** has been entered correctly.  
The FSM should control an **output signal (`door`)**, which indicates whether the door is **locked (0)** or **unlocked (1)**.

---

## Requirements

### Initial State
- The FSM should start in the **initial (locked)** state on reset or power-up.  
- The **door output (`door = 0`)** indicates a locked door.

### Input Sequence
- The correct sequence to unlock the door is **`0 → 1 → 1`**.  
- Each input bit triggers a state transition.

### Incorrect Inputs
- For any incorrect input, the FSM must transition to the **appropriate state** based on the current input and previous history (not always back to start).

### Output
- The **output should be HIGH (1)** only when the **complete correct sequence** `0 → 1 → 1` is entered.  
- For all other inputs, the output remains **LOW (0)**.

### Input Mechanism
- Two push buttons are used to enter binary values:
  - **Button 1 → Binary `0`**
  - **Button 2 → Binary `1`**

---

## System Behavior

| Input Sequence | FSM State | Output (door) | Description |
|----------------|------------|----------------|--------------|
| `0` | S1 | 0 | First correct input detected |
| `0 → 1` | S2 | 0 | Second correct input detected |
| `0 → 1 → 1` | S3 | 1 | Correct sequence entered → Door unlocks |
| Any Wrong Input | Depends | 0 | FSM transitions to the correct fallback state |

---

## Design Approach

This is a **Moore FSM**, meaning:
- The **output depends only on the current state**, not on the immediate input.
- The FSM can be represented using:
  - A **State Diagram**
  - A **State Transition Table**
  - A **Verilog HDL implementation**

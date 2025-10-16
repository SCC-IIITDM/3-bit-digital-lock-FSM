Digital Lock System using Moore FSM

This project is a Digital Lock System built with a 3-bit Moore Finite State Machine (FSM). The FSM detects the input sequence 0 → 1 → 1 to unlock the door, and the output signal indicates whether the door is locked (0) or unlocked (1).

The design was developed and tested using Icarus Verilog, with simulation waveforms visualized in GTKWave.

Design Approach:-
To give the user the feel of entering an actual PIN to unlock a door, the system uses two button-like inputs: one for binary 0 and the other for binary 1.

At first, the design was intended to be a two-level FSM. The first level was a sequence detector FSM that would track the correct 3-bit PIN input (0 → 1 → 1). The second level would be a lock control FSM that determines whether the door is locked or unlocked based on the output of the sequence detector.

However, to simplify the design and reduce complexity, the two-level structure was replaced with a single FSM. In this version, the output directly indicates whether the door is locked (0) or unlocked (1). This approach preserves the correct behavior while keeping the design compact and easy to simulate.

System Behaviour:-
1)If correct sequence(0->1->1) is entered the output will be high and can be immediately noticed in the waveform
2)if any wrong input is given then door will remain locked

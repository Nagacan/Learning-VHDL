**Processes** (in VHDL) or **Always Block** (Verilog) are used to define a block of **combinational** logic, and **sequential** logic.

Combinational or combinatorial logic is logic that doesn't require a clock to operate. An and-gate is an example.

Sequential logic is logic that does require a clock to operate, and the most fundamental building block for sequiential logic is the D flipflop.

* = AND, + = OR, ‘ = NOT, ^ = XOR can be used for a truth table, where each represents a gate.
<p align="center">
<img width="467" height="284" alt="image" src="https://github.com/user-attachments/assets/e8b4d6b6-f5a6-4152-a0f5-214a88114a31" />
<img width="381" height="369" alt="image" src="https://github.com/user-attachments/assets/11691315-a2b9-4cdd-ae84-8728f4778bd1" />

This circuit has 3 total gates, with input A and B, which means there are four possible output possibilities. Each input increases number of possible outputs by a factor of 2 (2^(input number)). FGPA use lookup tables (LUT) which are programmed by a digitial designer to preform boolean algebra. 

There are a few different types of flip-flops (JK, T, D) but the one that is used most frequently is the D Flip-Flop.
<p align="center">
<img width="153" height="125" alt="image" src="https://github.com/user-attachments/assets/5a5b3a85-ad83-421d-93ce-d48a9de475be" />

S is the set pin, R is the reset pin, $\bar{Q}$ will be the oppopsite value of htet value on pin Q. "D" is usually data input, "q" is usually data output, and ">" is usually clock input. 

<p align="center">
<img width="471" height="109" alt="image" src="https://github.com/user-attachments/assets/54bd05b1-195b-4c22-bdb1-41f6fd4fc498" />

Clock in digital logic provides low to high to low transitions of a voltage that lets the FGPA work. 
The clock is what allows flip-flop tot be used as data storage. Any data storage elements are known as sequential or registered logic. 

**Sequential logic operates on transitions** of the clock, 99.9% of time will be the rising edge (when clock goes 0 to 1). When a flipflop sees a rising edge of the clock, it registers the data from Input D to output Q. 
**The rising edge is when the flip flop looks at the input data**

<p align="center">
<img width="488" height="279" alt="image" src="https://github.com/user-attachments/assets/11140c84-dad6-4419-99e5-0a1ef7b1209f" />

This waveform shows 3 clock cycle evevnts shown by the red arrow on the rising edge of the clock. In between the first and second rising edge of the clock, the D input goes from low to high. Output Q sees that D has gone from low to high at the rising edge of the 2nd clock cycle and becomes the same value as input D. On 3rd rising edge, Q checks value of D again and registers it, and because D has remained high and unchanged Q stays high. 

<p align="center">
<img width="397" height="270" alt="image" src="https://github.com/user-attachments/assets/2bc22056-2e2e-43a0-9cbb-33123963b3f4" />

This waveform has 2 inputs and 1 output for a D flipflop. The D flip-flop is sensitive to the rising edge of the clock so when the rising edge comes along input D is read and passsed to output Q. This only occurs on the edges. 

On the first clock cycle, Q sees that D has become 1, so it toggles from 0 to 1. On the second clock edge, Q again checks the value of D and sees that it is low again, so it becomes low.

Flip-flops are the main component in an FPGA that is used to keep the state inside of the chip.

If everything was just made of LUTs, there would be no way to keep state in the FPGA. This means the FPGA would have no idea what happened previously. All changes on the inputs would immediately be evaluated and sent to the output with a very long chain of and gates, or gates, etc. But in order to do the vast majority of tasks an FPGA needs to know something about the past. This way it can keep track of counters, state machines, and the status of things. Flip-flops make this possible.

Flip-flops, also known as registers, store the state of an FPGA by holding a binary value (0 or 1) and updating it based on clock signals and input data. They act as basic memory units, enabling the FPGA to remember past inputs and maintain state information for sequential logic circuits

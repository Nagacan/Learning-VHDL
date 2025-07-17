For Sequential Logic, a Process/Always Blocks can have at **most two signals** in its sensitivity list. If the Porcess/Always Blocks uses an asynchronous reeset, it will have two signals in the sensitivity list. If the FGPA designer uses a synchronous reset or no reset, it will only have 1 signal in the sensitivity list. 

No Reset Example:
```
--VHDL Example of Sequential Logic:
process (i_clock)
begin
  if rising edge(i_clock) then
    and_gate <= input_1 and input_2;
  end if;
end process;
```
```
// Verilog Example of Sequential Logic:
always @ (posedge i_clock)
  begin
    and_gate <= input_1 & input_2;
  end
```

This code does the same thing as combinational example but instead seqential logic is instantiated, not combinational. 

By using the `if rising_edge(i_clock)` in VHDL or `@ (posedge i_clock)` in Verilog, we are telling to tools to create a register (Flip-Flop). This is different from combinational because the value of the and_gate will only be updated on the clock edges. In this case we used the keyword rising_edge for the VHDL example, which means the clock goes from 0 to 1. 

Sequential logic is what majority FGPA design will be constructed with. Registers are the work horses of FGPAs since they are able to retain a signal's value for a clock cycle. Sequential logic is necessary to create state-machine logic, memory interfaces etc. Sequential logic lives in Processes or Always Blocks.

How many clock cycles to take for value 11 to pass/propagate from signal test1 to signal test4?
```
-- VHDL Example:
signal test1 : std_logic :='1';
signal test2 : std_logic :='0';
signal test3 : std_logic :='0';
signal test4 : std_logic :='0';

process (i_clock)
begin
  if rising_edge(i_clock) then
    test2 <= test1;
    test3 <= test2;
    test4 <= test3;
  end if;
end process;
```
<p align="center">
This is essentially trying to design a flip-flop chain. Such a chain would be drawn out like this:

<img width="521" height="217" alt="image" src="https://github.com/user-attachments/assets/78fb163a-8299-4a96-9009-4f032cd0ef5f" />
<img width="442" height="114" alt="images" src="https://github.com/user-attachments/assets/d987e8e7-0ff1-467d-bec5-3499a7012530" />

On the first clock cycle, **All** of the lines get executed at the same time, so we need to fill in the value of test1, test2, and test3, at the beginning of the clock cycle to find out what they will look like for the next clock cycle.

The first clock cycle lookos like this:
```
test2 <= '1'; --test1
test3 <= '0'; --test2
test4 <= '0'; etc
```

After the first clock cycle, teest2=1, test3=0, test4=0. The next clock cycle:
```
test2 <= '1'; -- test1
test3 <= '1'; -- test2
test4 <= '0'; -- test3
```

At the beginning of this clock cycle, test2 was equal to the value '1', and by the end of the clock cycle this value has propagated to test3. So after the 2nd clock cycle, test2=1, test3=1. test4=0. 

Let's look at one more clock cycle:
```
test2 <= '1'; -- test1
test3 <= '1'; -- test2
test4 <= '1'; -- test3
```

At the end of the 3rd clock cycle (beginning of the 4th cycle), test4 will be equal to 1. So it will take three full clock cycles for the value of 1, which was initialized in test 1 to propagate all teh way to test4. 

<p align="center">
Propagation Delay Simulation Results
  <img width="500" height="207" alt="image" src="https://github.com/user-attachments/assets/96e067ea-e1aa-40fc-aef7-d750d73df1c8" />

**Test4 transitions to 1 on clock cycle 3, but due to propagation delay it does not become 1 until somewhere between clock cycle 3 and clock cycle 4. Therefore, we must wait until clock cycle 4 to be sure that test4 is equal to 1. 
**

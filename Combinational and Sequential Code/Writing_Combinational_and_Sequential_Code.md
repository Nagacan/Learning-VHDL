**Processes** (in VHDL) or **Always Block** (Verilog) are used to define a block of **combinational** logic, and **sequential** logic.

Combinational or combinatorial logic is logic that doesn't require a clock to operate. An and-gate is an example.

Sequential logic is logic that does require a clock to operate, and the most fundamental building block for sequiential logic is the D flipflop.

## Combinational Process in VHDL:

```
process(input_1, input_2)
begin
  and_gate <= input_1 and input_2;
end process;
```

## Combinational Always Block in Verilog:
```
always @ (input_1 or input_2)
  begin
    and)gate = input_1 & input_2;
  end
```

In both VHDL and Verilog, input_1 and input_2 are in what is called a sensitivity list. This list is a list of all the signals that will cause the Process/Always Block to execute. In the example above, a change on either input_1 or input_2 will cause the Process/Always Block to execute. This process/always block takes 2 inputs, preform an "and" operation on htem and stores the result in the signal `and_gate`. 

This is the same functionality as these two codes:
```
--VHDL:
and_gate <= input_1 and input_2;
```
```
//Verilog:
assign and_gate = input1 & input_2;
```

Both examples assign the signal and_gate. One is a combinational process/always block, and the other is not.

**Since the same result can be achieved without the use of a combinational Porcess/Always block it is not recommneded to  use these statements this way**

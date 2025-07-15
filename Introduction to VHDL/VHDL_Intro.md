A simple And Gate has two inputs and one output. The output is equal to 1 only when both of the inputs are equal to 1. 

The fundamental unit of VHDL is called a signal. For now let’s assume that a signal can be either a 0 or a 1. Here is some basic VHDL logic:

```
signal and_gate : std_logic;
and_gate <= input_1 and input_2
```

First line defines a signal of type `std_logic` called `"and_gate"`. Code generates an "AND gate" with a single output (the `and_gate`) and 2 inputs (1/2). Keyword `and` is reserved in VHDL. Operator `<=` is the assignment operator. 

When code is verbally parsed you get: "The signal and_gate GETS input_1 and-ed with input_2"

Input1/2 are inputs in the file. They are usually defined in an **entity** which contains a port that defines all inputs and outputs to a file. Here is an example of an entity called "example_and":

```
entity example_and is
  port (
    input_1: in std_logic;
    input_2: in std_logic;
    and_result: out std_logic
  );
end example_and;
```

This entity is called "example_and". It has 3 signals (2 inputs, and 1 output all of type std_logic)

An architecture is used to describe the functionality of a particular entity, kind of like the content, where the entity is the table of contents. Here is an **architecture** called "rtl" of the **entity** called "example_and":

```
architecture rtl of example_and is
  signal and_gate: std_logic;
begin
  and_gate <= input1 and input_2;
  and result <= and_gate;
end rtl;
```

All signals that are used by the archtecture must be defined between the "is" and the "begin" keywords. The actual architecture logic comes between "begin" and "end". 
These are the libraries that we will use :
```
library ieee;
use ieee.std_logic_1164.all;
```



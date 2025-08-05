Types of Flip Flops: JK, D, T

What is a Flip Flop: circuits that have two stable states that can store state information – a bistable multivibrator. In digital electronics, a flip-flop (also known as a latch) is a bistable sequential logic circuit that can store one bit of information. It has two stable states, typically represented as 0 and 1, and can switch between these states based on input signals. 

Types of Latches: JK, SR

Difference between flip flop and latch, is flip flop uses a clock.

You can choose FGPA in your design for high memory bandwidth requirements, filters, high speed data, image processing. Lots of IO requirements, massive FGPAs with alot of IO pins.

How is `for loop` in VHDL/Verilog different than C. Synthesizable VHDL is used to replicate or duplicate instructions. Expands all logic on same clock cycle.

SRAM is static, DRAM is dynamic random access memory used for storing data off-chip (external). DRAM is much faster and larger, meant for large external, sequential data transfers. SRAM is for non-sequential, random transfers to external part of memory, not alot. DRAM is you want to store an entire image from a camera off-chip

PLL is phase lock loop used inside FGPA to generate other clocks. 

Inference a block, you describe to the synthesis tools that you want a block  RAM for example, reg, mem. Tools might infer a block RAM. Inference is portable.The definition of infer is, “to deduce from evidence and reasoning” and this is basically what’s happening when you infer some functionality in VHDL or Verilog. The tools are trying to deduce what you want based on your VHDL or Verilog code

Instantiation is probably the most complicated of the three ways to create blocks. It’s also 100% not portable. Meaning if you instantiate an Altera BRAM, it will not work to port that code to Xilinx. However, the main benefit to instatiation is that you know exactly what you’re getting. Also there are some situations in which you’re just unable to tell the synthesis tools to infer something for you. 

Metastability is unpredicatble/unknown state of a signal in FGPA. Crossing clock domains and bringing in an external signal. You can double flop to prevent metastability. 

FIFO, is memory storage element is first in first out, first data in is first out. Made of registers or block RAMs. Store data temp, or crossing clock RAMs.

Block RAm is storage element in FGPA. 16 kilobits, 32 kilobits, can be dynamically sized to have different width/depth. Can be turned into FIFOs and dual port memoreies. 

UART is universal asynchronous receiver transmitter, is a common and simple way to get data out of a FGPA, LOW pin count, low bandwidth. 

Synchronous logic is clocked, asynchronous is not clocked. Most logic in FGPA is synchrnous; lots of registers. SPI, i2c, all have clocks. 

Shift register is used for creating small delays. Wait some number of clock cycles. Converting serial to parallel or parallel to serial. 

VHDL is much more strongly typed than verilog. Assign integer to 3-bit register in verilog is okay, but not in VHDL. Verilog looks alot like C

Crossing clock domains in FGPA, slow to fast or fast to slow, you can create metastability. Don't want to lose data or corrupt data. Double flopping, changing clock domains, or using buffer storage element like a FIFO.

Setup time is amount of time signal needs to be stable going into FLIPFLOP before rising edge of a clock comes along to register it to the output. Hold time is amount of time signal needs to be unchanging after the clock edge. 

If these setup and hold times are violated, you can create a metastable state in FGPA and cant gaurantee your outputs.

Melee and Moore machines are both state machines used to control flow through FGPA design. Melee depend on current state and input to know where to go next. Moore just depends on current state to know where to go next. Moore are more simpler

Synthesis tools are provided by FGPA vendor, where it translates out VHDL code into discrete gates that FGPA has inside. LUT, multipliers, block  RAMs.

Place and route takes individual gates and LUts and actually assigns them to a specific place and routes them with wires on the actual FGPA. Time enclosure, given clock rate, make sure that all the start and end point for signals happen in 1 clock cycle.

SERDES, serializer, deserializer is high speed way of transfering data on low pin count interface, used for PCI express, gigabit internet, highspeed video.

DSP tile in FGPA does multiplies better. Fast multiplies accumalative operations. Large filter with alot of taps, and each tap is a multiplier. 

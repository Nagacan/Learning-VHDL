Simulation describes placing your design or Unit Under Test (UUT) into a Testbench (TB), which stimulates its inputs and monitors its outputs. The testbench exercisesthe design the same way it will be excercised on hardware.
If your design takes a clock input, the testbench will need to generate a simulated clock and provide it to the UUT.

<p align="center">
<img width="402" height="194" alt="image" src="https://github.com/user-attachments/assets/df878a93-aad9-4f0f-b724-c67baee1370d" />

Being able to testbenches are important, the best ones are **self-checking**, which means they can run and report a PASS or FAIL status, without us having to do anything else

Testbench code does not have to be synthesizable. 

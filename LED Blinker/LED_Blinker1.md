Project Requirements:

Design HDL code that will blink an LED at a specified frequency of 100 Hz, 50 Hz, 10 Hz, or 1 Hz. For each of the blink frequencies, the LED will be set to **50% duty cycle (it will be on half the time)**. The LED frequency will be chosen via two switches which are inputs to the FPGA. There is an additional switch called LED_EN that needs to be ‘1’ to turn on the LED. The FPGA will be driven by a 25 MHz oscillator.

This is the truth table for the frequency selector:

<p align="center">
<img width="416" height="233" alt="image" src="https://github.com/user-attachments/assets/eb951edd-6400-4acb-890b-5c04432c27d0" />

For this to work we need 4 inputs and 1 output. These are the signals: 

<p align="center">
<img width="540" height="232" alt="image" src="https://github.com/user-attachments/assets/db6367d8-38ce-4dec-b34c-d2740416d8bc" />

The design has four counter processes that run concurrently; all at the exact same time. Their job is to keep track of the number of clock pulses seen for each of the different frequencies. Even if switches aren't selecting a particular frequency, the counters are still running all the time.

The switches only serve to select which output to use. They create what is known as a mux. It is combinational and doesn't require a clock to operate. 

This is the block diagram of the design:
<p align="center">
<img width="557" height="386" alt="image" src="https://github.com/user-attachments/assets/5cb304d7-51db-4ddf-a884-9827a361e8ed" />

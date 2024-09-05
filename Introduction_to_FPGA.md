
# Introduction To FPGA-Field Programmable Gate Array

## Introduction

Field Programmable Gate Arrays (FPGAs) are digital ICs (Integrated Circuits) that enable the hardware design engineer to program a customized Digital Logic as per the requirements. The term “Field Programmable” implies that the Digital Logic of the IC is not fixed during its manufacturing (or fabrication) but rather it is programmed by the end-user (designer).

FPGA is a type of Programmable logic devices (PLD).

PLD is an IC containing a large number of Logic gates ( arrays of AND gates & OR gates) and Flip-flops that can be configured by the user to implement a wide variety of functions.

<div align="center">
  <img src="https://github.com/user-attachments/assets/03daf76b-b96f-454b-ae42-01e7f92dc260" width="300"/>
</div>


Basically, PLDs can be categorized into three types. 
   They are:
•	Simple Programmable Logic Devices (SPLD)
•	Complex Programmable Logic Devices (CPLD)
•	Field Programmable Gate Arrays (FPGA)

In which FPGA’s are the most complex PLD.






## Architecture

<div align="center">
  <img src="https://github.com/user-attachments/assets/89918a17-eb11-4c45-9f6b-f86d9cf58a68" width="300"/>
</div>




The fpga is made up of numerous Configurable Logic blocks (CLB) which are surrounded by a system of programmable interconnects known as a fabric, they directs signal between CLBs and I/O blocks.

                           

As we can see FPGA consists of three basic components. They are:

•	**Logic Blocks** – responsible for implementing the core logic functions.
•	**Programmable Interconnects** – responsible for connecting the Logic Blocks.
•	IO Blocks – which are connected to the Logic Blocks through the routing and help to make external connections. 

## Logic blocks

A configurable logic block (CLB) is the basic repeating logic resource on an FPGA. When linked together by Programmable Interconnects, the components in CLBs execute complex logic functions, implement memory functions, and synchronize code on the FPGA.
                           	

<div align="center">
  <img src="https://github.com/user-attachments/assets/a176b885-afd6-4a03-b35e-86ffc7fa79e1" width="300"/>
</div>


CLBs contain smaller components, including
•	flip-flops
•	look-up tables (LUTs)
•	 multiplexers.

## Flip Flop

Flip-flops are binary shift registers used to synchronize logic and save logical states between clock cycles within an FPGA circuit. On every clock edge, a flip-flop latches the 1 or 0 (TRUE or FALSE) value on its input and holds that value constant until the next clock edge. There are different types of flip flops, the one that is used most frequently is the D Flip-Flop.


<img src="https://github.com/user-attachments/assets/10e6c150-b5d4-47df-b266-18689cf120c5" width="100"/>
        
S    Set pin
R    Reset pin
D    Data Input to Flip-Flop
Q    Data Output of Flip-Flop (Registered)
>    Clock Input to Flip-Flop

  <img src="https://github.com/user-attachments/assets/588967d7-1e53-4bf8-b15e-3ce0de3e46b9" width="300"/>
  
The clock is what allows a Flip-Flop to be used as a data storage element. Any data storage elements are known as sequential logic or registered logic. Sequential logic operates on the transitions of a clock. 99.9% of the time this will be the rising edge (when the clock goes from 0 to 1). When a Flip-Flop sees a rising edge of the clock, it registers the data from the Input D to the Output Q. Flip-Flops are what make complex FPGAs possible! Let’s look at a waveform of a few events.
           

  <img src="https://github.com/user-attachments/assets/f55c1eb4-9336-41f0-9c1c-bca575f9600b" width="300"/>


## Look-up Tables

A collection of gates hardwired on the FPGA.The LUT is the basic building block of an FPGA and is capable of implementing any logic function of N Boolean variables. Essentially, this element is a truth table in which different combinations of the inputs implement different functions to yield output values. 

LUTs can come in different sizes depending on the FPGA that you are using, but they all behave the same way. 3-Input LUTs were the norm not too long ago, but today 4-Input and even 5-Input LUTs are common. If you need to make a more complicated expression, you can just use more Look-Up Tables. LUTs are one of the two most fundamental components in an FPGA. A single FPGA has thousands of these components. Now that you are more familiar with these 
                     
 <img src="https://github.com/user-attachments/assets/56a1e545-93c4-4ad7-8bf1-dccc5a6ae518" width="300"/>


## Multiplexer

A circuit that selects between two or more inputs and then returns the selected input.
Multiplexers are used all the time in FPGAs in various sizes and configurations. This image shows what a 2 to 1 mux looks like symbolically. The inputs to the mux are A, B, sel, the output is out. A and B are the Data inputs that get selected to the output. sel is your control signal. Muxes can come in all possible combinations, depending on your particular use case. Typically, some number of inputs are selected to a single output. However the reverse could be true and it would still be a mux.

 <img src="https://github.com/user-attachments/assets/7423fcd8-0682-4060-922b-39130db3dfbb" width="100"/>

                                                


## BRAM

Block RAM (BRAM) is a type of random access memory embedded throughout an FPGA for data storage. The two types of BRAM memories available in a device can hold either 18k or 36k bits, and the available amount of these memories is device specific.

 <img src="https://github.com/user-attachments/assets/ae26089f-559a-4d5e-8341-8f395425316c" width="800"/>

FIFO means First In First Out and they are used all over the place in FPGA design. Any time you need to buffer some data between two interfaces you’ll use a FIFO. Or if you want to cross clock domains, or if you want to buffer a row of image data and manipulate it, or if you want to send data off-chip to a DDR memory (a high-speed dynamic random-access memory), these all require the use of a Block RAM FIFO.

## DSP Slices 

A DSP slice, or sometimes referred to as a block or cell, is one of the specialized components in an FPGA. It carries out digital signal processing functions, like filtering or multiplying, more efficiently than using many CLBs. This multiplier circuitry saves on LUT and flip-flop usage in math and signal processing applications.



## Transceivers

Transceivers are made to transmit and receive serial data to and from the FPGA at high rates. This dedicated component allows for implementation of high-speed data transfer without consuming logic resources of the FPGA.
IO Blocks

IOB (Input Output Block) is a programmable input and output unit, which is the interface between fpga and external circuits. They are comparatively slower than transceivers. 
The IO in the FPGA is classified into groups, and each group can independently support different IO standards. Through the flexible configuration of the software, it can adapt to different electrical standards and IO physical characteristics, can adjust the size of the drive current, and can change the up and down resistance.
Languages used in FPGA programming

Hardware description language is used to assemble these FPGA building blocks into a circuit that will perform a specific task, making the programming different compared to typical high-level languages. The two most popular hardware description languages are VHDL and Verilog. VHDL’s syntax is similar to Pascal. Verilog, however, is similar to C.

## Microcontroller VS FPGA

 ![image](https://github.com/user-attachments/assets/dab2107f-b9ef-4768-91a5-3f6bd83af1ef)

## Applications

FPGA chips are used in both wired and wireless communications. In wired communications it is used in serial backplanes, and wireless communications, it is used for networking solutions and addressing standards of WiMAX and, 5G/6G and HSDPA. FPGA are used in the infrastructure side helping with crunching data in high speed.
 
In the field of medical applications, FPGA chips are used for diagnostic and monitoring purposes. They are used in medical equipment to process data.
 
In the field of aerospace and defense applications, FPGA  chips are used for image processing, partial reconfigurations for SDRs, as well as for waveform generation.
 
FPGA technology offers ASIC companies the opportunity of rapid prototyping, where ideas and concepts can be tested, without going through a long process. FPGA are used to improve the time to market of various technological products and lower the overall engineering costs incurred in a number of processes including industrial automation and surveillance.
 
As FPGA is used for reconfigurations and keeping up with modifications, it reduces the cost of any long term maintenance necessary for a system. Even Microsoft developers have access to FPGA chips, and they work with open source tools called Microsoft Cognitive Toolkit. Microsoft is using Intel FPGA, so that they can increase the use of Al within their operations.
 
In fact, FPGAs are being used prominently to develop deep neural networks or DNNs which will ultimately lead to the production and maintenance of artificially intelligent systems. High performance FPGAs can be of even greater help an application as when compared with GPUs, and are thus preferred for the purposes of developing machine learning technology.

## Reference

National Instruments- https://www.ni.com/
Nandland- https://nandland.com/
Digilant- https://digilent.com/
AMD- https://www.amd.com/
Geeks for Geeks- https://www.geeksforgeeks.org/

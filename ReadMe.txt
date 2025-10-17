Room Occupancy Counter (VHDL - FPGA Project)

This project implements a digital room occupancy counter in VHDL for the Xilinx Nexys A7 FPGA. It was created for the COEN313 Digital Design course (Summer 2025, Concordia University).

The system uses two photocell sensors to detect people entering and exiting a room. It tracks the number of occupants in real time and prevents overflow by asserting a “max_capacity” signal once the programmable limit is reached. The design is resettable, robust against invalid transitions, and verified through simulation.

System Overview:

- Finite State Machine (FSM) controls the system states.

- Counter module increments or decrements occupancy count.

- Comparator checks when count equals the programmable max.

- Registers store the current count and previous input states.

- Reset logic clears the system and restarts the count.

Main Signals:

- entry_sensor (Input): Detects when someone enters.

- exit_sensor (Input): Detects when someone exits.

- max_limit (Input, 8-bit): Defines the maximum capacity.

- count (Output, 8-bit): Displays the current number of people.

- max_capacity (Output): Indicates the room is full.

- reset (Input): Resets all registers and FSM.

Files:

- occupancy_counter.vhd: Main control and counter logic.

- fsm_controller.vhd: State machine logic.

- comparator.vhd: Detects full capacity.

- testbench.vhd: Simulates sensor signals and behavior.

- occupancy_counter.xdc: Nexys A7 FPGA pin constraints.

- vivado_log.txt: Simulation and synthesis logs.

Simulation and Verification:
Simulated using Xilinx Vivado. Test cases covered single entry/exit, rapid sensor activation, simultaneous entry/exit, overflow and underflow conditions, and mid-operation resets. All results verified through waveform analysis.

Synthesis Results:

- Device: Nexys A7 (XC7A100T)

- LUT usage: ~3%

- FF usage: ~2%

- Max frequency: ~100 MHz

Timing violations: None

How to Run:

- Open project in Xilinx Vivado.

- Add all .vhd source files and the .xdc constraints file.

- Set the top module to occupancy_counter.

- Run Behavioral Simulation to visualize signals.

- Optionally run Synthesis and Implementation for FPGA validation.

Results Summary:
The design provides accurate occupancy tracking with clean state transitions and minimal resource use. The FSM architecture ensures predictable control and reliable performance.

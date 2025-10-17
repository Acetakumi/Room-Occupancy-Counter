
1 – How to run occupancy_counter.vhd

 - Open a terminal in the correct directory where the file is saved.

 - Copy and paste the following line to set up the environment:
 source /CMC/tools/xilinx/Vivado_2018.2/Vivado/2018.2/settings64_CMC_central_license.csh

 - Then open Vivado using the command:
   vivado &

 - Follow the steps in Nexys_Quickstart.pdf, but do not generate the bitstream, since we didn’t use an .xdc file and no Nexys board was required for this project.

 - After running implementation, you can open both the RTL elaborated design and the implementation elaborated design to view your circuit.

 -  To view the timing report, open the TCL console in Vivado and type:
    "report_timing"


2 – How to run occupancy_counter_tb.vhd

  - Open a terminal in the correct directory that contains the work folder (you should be in the /Code directory).

  - Copy and paste the following line to set up the ModelSim environment:
    source /CMC/ENVIRONMENT/modelsim.env

  - Use the vcom command to compile both files:
    vcom occupancy_counter.vhd
    vcom occupancy_counter_tb.vhd

  - Then run the simulation using:
    vsim work.occupancy_counter_tb

  -  This will open ModelSim, where you can use the TCL console.

  - In the console, enter the command to add all signals to the waveform:
    add wave *

  - Finally, run the simulation for your desired duration (e.g., 500 ns):
    run 500 ns
#leer verilog del archivo .v
read_verilog fifo_mem.v
read_verilog -lib cmos_cells.v
hierarchy -check -top fifo_mem

#alto nivel
proc; opt; fsm; opt; memory; opt

#mapear celdas internas
techmap; opt

#sintetizacion
#mapear flipflops al archivo .lib
dfflibmap -liberty cmos_cells.lib

#mapear logica al archivo .lib
abc -liberty cmos_cells.lib

#limpiar
opt_clean

#status de la libreria
stat -liberty cmos_cells.lib


write_verilog Estructural_fifo_mem.v
#write_spice synth.sp
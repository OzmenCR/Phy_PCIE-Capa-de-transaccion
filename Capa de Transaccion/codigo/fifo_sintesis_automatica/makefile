ALL: BUILD RUN CLEAN

BUILD:
	sudo yosys -s yosys.s

	sed -i 's/fifo_mem/fifo_memS/g' Estructural_fifo_mem.v
	sed -i 's/memory_array/memory_arrayS/g' Estructural_fifo_mem.v
	sed -i 's/read_pointer/read_pointerS/g' Estructural_fifo_mem.v
	sed -i 's/status_signal/status_signalS/g' Estructural_fifo_mem.v
	sed -i 's/write_pointer/write_pointerS/g' Estructural_fifo_mem.v    
	sed -i 's/write_pointer/memory_array/g' yosys.s
	
    
	sudo iverilog -o banco_pruebas.o banco_pruebas.v
	sudo vvp banco_pruebas.o
	
RUN:
	sudo gtkwave test.vcd &

CLEAN:
	sudo rm banco_pruebas.o


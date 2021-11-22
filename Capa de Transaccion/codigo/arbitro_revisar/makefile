ALL: BUILD RUN CLEAN

BUILD:
	sudo yosys -s yosys.s

	sed -i 's/arbitro/estructural_arbitro/g' Estructural_arbitro.v
    
	sudo iverilog -o banco_pruebas_arbitro.o banco_pruebas_arbitro.v
	sudo vvp banco_pruebas_arbitro.o
	
RUN:
	sudo gtkwave test.vcd &

CLEAN:
	sudo rm banco_pruebas_arbitro.o


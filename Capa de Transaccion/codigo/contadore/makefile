ALL: BUILD RUN CLEAN

BUILD:
	sudo yosys sintesisPhy.ys
	sed -i 's/contadorr/Estructural/g' Estructural.v

	sudo iverilog -o tb.o banco_pruebas_contador.v
	sudo vvp tb.o
	sudo cp test.vcd o1.vcd

RUN:
	sudo gtkwave o1.vcd &

CLEAN:
	sudo rm output.vcd tb.o

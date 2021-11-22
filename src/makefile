ALL: BUILD RUN CLEAN

BUILD:
	sudo yosys sintesisPhy.ys
	sed -i 's/phy/phyS/g' phyS.v
	sed -i 's/phy_tx/phy_txS/g' phyS.v
	sed -i 's/byte_stripping/byte_strippingS/g' phyS.v
	sed -i 's/paralelo_serie/paralelo_serieS/g' phyS.v
	sed -i 's/c32b_8b0/c32b_8b0S/g' phyS.v
	sed -i 's/c32b_8b/c32b_8bS/g' phyS.v
	sed -i 's/phy_rx/phy_rxS/g' phyS.v
	sed -i 's/un_byte_striping/un_byte_stripingS/g' phyS.v
	sed -i 's/serial_paralelo1/serial_paraleloS1/g' phyS.v
	sed -i 's/serial_paralelo2/serial_paraleloS2/g' phyS.v
	sed -i 's/c8b_32b/c8b_32bS/g' phyS.v
	sed -i 's/c8b_32b2/c8b_32bS2/g' phyS.v
	sed -i 's/clock/clockS/g' phyS.v



	sudo iverilog -o tb.o Testbench.v
	sudo vvp tb.o
	sudo cp output.vcd o1.vcd

RUN:
	sudo gtkwave o1.vcd &

CLEAN:
	sudo rm output.vcd tb.o

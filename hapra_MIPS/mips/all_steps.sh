#!/bin/bash
tb_filename="mips_tb"

ghdl -s $@
if [ $? -eq 0 ]; then
    echo Syntax check ok
else
    exit 1
fi

ghdl -a $@
if [ $? -eq 0 ]; then
    echo Analysis ok
else
    exit 1
fi

ghdl -e ${tb_filename}
if [ $? -eq 0 ]; then
    echo Build ok
else
    exit 1
fi

ghdl -r ${tb_filename} --vcd=testbench.vcd
if [ $? -eq 0 ]; then
    echo VCD dump ok
else
    exit 1
fi

echo "---Success---"

sleep 1
gtkwave testbench.vcd

# ./all_steps.sh ../adder/adder.vhdl ../alu/alu.vhdl ../dmem/dmem.vhdl ../imem/imem.vhdl ../mux2/mux2.vhdl ../pc/pc.vhdl ../regfile/regfile.vhdl ../signext/signext.vhdl ../sl2/sl2.vhdl ../syncresff/syncresff.vhdl ../datapath/datapath.vhdl ../aludecoder/aludecoder.vhdl ../maindecoder/maindecoder.vhdl ../controller/controller.vhdl mips.vhdl mips_tb.vhdl

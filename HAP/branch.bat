echo on
cls
iverilog -o brn branch.v branch-tb.v
vvp brn
gtkwave branch.vpd
pause
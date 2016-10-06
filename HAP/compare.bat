echo on
cls
iverilog -o cmp compare.v compare-tb.v
vvp cmp
gtkwave compare.vpd
pause
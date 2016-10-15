echo on
cls
iverilog -o cmpBrnch cmpBrnch.v cmpBrnch-tb.v
vvp cmpBrnch
gtkwave cmpBrnch.vpd
pause
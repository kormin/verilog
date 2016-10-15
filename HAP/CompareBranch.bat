echo on
cls
iverilog -o cmpBrnch CompareBranch.v CompareBranch-tb.v
vvp cmpBrnch
gtkwave cmpBrnch.vpd
pause
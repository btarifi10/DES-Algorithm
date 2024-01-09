# DES Algorithm
Implementation of the DES standard in MATLAB.

This repo contains of the following functions:
- DES_OneRound.m
- DES.m
- DES_Complete.m
- subKeyGen.m
- findUniqueKeys.m

The file DES_testing.m tests these functions and outputs results.

Note: The functions written operate on character arrays (not string). In order to run the code, the use of the built in "hexToBinaryVector" function is used. This was introduced in MATLAB R2012 and should be available.

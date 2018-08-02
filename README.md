
# SC_DET_based_keyframe_extraction

This repository contains the code of the following paper.
- Yujie Li, Benying Tan, Shuxue Ding, Incheon Park, and Atsunori Kanemura, "Key frame extraction from video based on determinant-type of sparse measure and DC programming", _IEEE International Symposium on Embedded Multicore/Many-core Systems-on-Chip (MCSoC)_, pp. 174–180, September 2017.

This software is licensed under the Apache License 2.0.


## Information

This software has been tested on the following envirnment.

* Windows 10
* MATLAB R2017b

This software uses the following programs and data.

* KSVD-Box v9
    * http://www.cs.technion.ac.il/~ronrubin/software.html
* Sparse Modeling Representative Selection (SMRS) 
    * http://www.ccs.neu.edu/home/eelhami/codes.htm 
* Test Video Data from the SumMe dataset
    * https://gyglim.github.io/me/vsum/index.html


## How to run

1. Run `setup.ps1` with Windows PowerShell.
2. Open `main_keyframes.m` with MATLAB.
3. Run `main_keyframes`.

# WaVe
Folder---

22_02_

This is the most updated data folder
In the hydro file there are three .h5 files

Tech_Wave.h5 is the file created in BEMIO with the updated Solidworks data (mass MOI, COG).  Just change the input file for the body to /Tech_WaVe.h5 in the hull section to run the simulation with this data


Tech2.h5 is the file created in BEMIO with the updated Solidworks data, with the change in the COG to be at the x,y origin but keeping the z position as Solidworks provided.  Just change the input file for the body to /Tech2.h5 in the hull section to run the simulation with this data.



****When you switch between the two files you will need to adjust the position of the pendulum accordingly

For Tech_Wave.h5 COG for the pendulum is [0.16 -.002 0.35052]

For Tech2.h5 COG for the pendulum is [ 0  0  0.35052]

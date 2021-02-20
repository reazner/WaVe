clc; clear all; 
close all;
hydro = struct();

%hydro = Read_AQWA(hydro,'WaVe.AH1','WaVe.LIS');
% they have the exact same patterns, just the magnitude is twiceish COB=fullx2
hydro = Read_AQWA(hydro,'WaVe_Tech.AH1','WaVe_Tech.LIS');
hydro = Radiation_IRF(hydro,15,[],[],[],[]);
hydro = Radiation_IRF_SS(hydro,[],[]);
hydro = Excitation_IRF(hydro,15,[],[],[],[]);
Write_H5(hydro)
Plot_BEMIO(hydro)
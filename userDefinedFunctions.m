% userDefinedFunctions.m
% M
% A
% B
% C
% Type
% Text
% Size
% 20 KB (20,607 bytes)
% Storage used
% 20 KB (20,607 bytes)Owned by UW
% Location
% WEC-Sim Model
% Creator
% Brittany Lydon
% Modified
% Feb 18, 2021 by Brittany Lydon
% Opened
% 2:08 PM by me
% Created
% Feb 19, 2021
% Add a description
% Viewers can download
close all;

%% Plot waves
f1 = figure(1);
f1.Position = [90 320 1000 300];
f1.Name = 'waveElevation';
plot(output.wave.time,output.wave.elevation,'linewidth',1.5)
xlabel('time [s]')
ylabel('elevation [m]')
ylim([-2 2])
title('Wave Elevation')
saveas(f1,strcat(f1.Name,'.jpg'))

%% Plot response for body 1 = Hull
f2 = figure(2);
f2.Position = [50 150 1200 500];
f2.Name = 'hullFullResponse';

subplot(3,2,1)
plot(output.bodies(1).time, output.bodies(1).position(:,1))
title('Surge (x) - Hull')
% xlabel('time [s]')
ylabel('[m]')

subplot(3,2,3)
plot(output.bodies(1).time, output.bodies(1).position(:,2))
title('Sway (y) - Hull')
% xlabel('time [s]')
ylabel('[m]')

subplot(3,2,5)
plot(output.bodies(1).time, output.bodies(1).position(:,3))
title('Heave (z) - Hull')
xlabel('time [s]')
ylabel('[m]')

subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).position(:,4))
title('Roll (Mx) - Hull')
% xlabel('time [s]')
ylabel('[radians]')

subplot(3,2,4)
plot(output.bodies(1).time, output.bodies(1).position(:,5))
title('Pitch (My) - Hull')
% xlabel('time [s]')
ylabel('[radians]')

subplot(3,2,6)
plot(output.bodies(1).time, output.bodies(1).position(:,6))
title('Yaw (Mz) - Hull')
xlabel('time [s]')
ylabel('[radians]')

saveas(f2,strcat(f2.Name,'.jpg'))

%% Plot pitch response for body 1 = Hull
f3 = figure(3);
f3.Position = [50 150 1200 500];
f3.Name = 'hullPitchResponse';

subplot(3,1,1)
plot(output.bodies(1).time, output.bodies(1).position(:,5),'linewidth',1.5)
title('Angular Position of Hull - Pitch')
% xlabel('time [s]')
ylabel('[radians]')
ylim([-0.1 0.1])

subplot(3,1,2)
plot(output.bodies(1).time, output.bodies(1).velocity(:,5),'linewidth',1.5)
title('Angular Velocity of Hull - Pitch')
% xlabel('time [s]')
ylabel('[radians/s]')

subplot(3,1,3)
plot(output.bodies(1).time, output.bodies(1).acceleration(:,5),'linewidth',1.5)
title('Angular Acceleration of Hull - Pitch')
xlabel('time [s]')
ylabel('[radians/s^2]')
ylim([-0.05 0.05])

saveas(f3,strcat(f3.Name,'.jpg'))

%% Plot heave response for body 1 = Hull
f4 = figure(4);
f4.Position = [50 150 1200 500];
f4.Name = 'hullHeaveResponse';

subplot(3,1,1)
plot(output.bodies(1).time, output.bodies(1).position(:,3),'linewidth',1.5)
title('Position of Hull - Heave')
% xlabel('time [s]')
ylabel('[m]')

subplot(3,1,2)
plot(output.bodies(1).time, output.bodies(1).velocity(:,3),'linewidth',1.5)
title('Velocity of Hull - Heave')
% xlabel('time [s]')
ylabel('[m/s]')

subplot(3,1,3)
plot(output.bodies(1).time, output.bodies(1).acceleration(:,3),'linewidth',1.5)
title('Acceleration of Hull - Heave')
xlabel('time [s]')
ylabel('[m/s^2]')

saveas(f4,strcat(f4.Name,'.jpg'))

%% Plot heave and pitch response against waves
f5 = figure(5);
f5.Position = [50 150 1200 500];
f5.Name = 'hullHeavePitchResponse';

plot(output.wave.time,output.wave.elevation,'linewidth',1.5)
hold on
plot(output.bodies(1).time, output.bodies(1).position(:,3),'linewidth',1.5)
plot(output.bodies(1).time, output.bodies(1).position(:,5),'linewidth',1.5)
legend('Wave','Heave','Pitch')
% xlabel('time [s]')
ylabel('[m, Nm]')
ylim([-2 2])
title('Response vs. Wave Elevation')
grid minor

saveas(f5,strcat(f5.Name,'.jpg'))
%% Plot total forces for hull
f6 = figure(6);
f6.Position = [50 150 1200 500];
f6.Name = 'hullTotalForces';

subplot(3,2,1)
plot(output.bodies(1).time, output.bodies(1).forceTotal(:,1))
title('Total Force (x) - Hull')
% xlabel('time [s]')
ylabel('[N]')
% ylim(1000*[-1 1])

subplot(3,2,3)
plot(output.bodies(1).time, output.bodies(1).forceTotal(:,2))
title('Total Force (y) - Hull')
% xlabel('time [s]')
ylabel('[N]')
% ylim(1000*[-1 1])

subplot(3,2,5)
plot(output.bodies(1).time, output.bodies(1).forceTotal(:,3))
title('Total Force (z) - Hull')
xlabel('time [s]')
ylabel('[N]')
% ylim(1000*[-1 1])

subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).forceTotal(:,4))
title('Total Moment (Mx) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
% ylim(50*[-1 1])

subplot(3,2,4)
plot(output.bodies(1).time, output.bodies(1).forceTotal(:,5))
title('Total Moment (My) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
% ylim(50*[-1 1])

subplot(3,2,6)
plot(output.bodies(1).time, output.bodies(1).forceTotal(:,6))
title('Total Moment (Mz) - Hull')
xlabel('time [s]')
ylabel('[Nm]')
% ylim(50*[-1 1])

saveas(f6,strcat(f6.Name,'.jpg'))
%% Plot excitation forces for hull
f7 = figure(7);
f7.Position = [50 150 1200 500];
f7.Name = 'hullExcitationForces';

subplot(3,2,1)
plot(output.bodies(1).time, output.bodies(1).forceExcitation(:,1))
title('Excitation Force (x) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(95000*[-1 1])

subplot(3,2,3)
plot(output.bodies(1).time, output.bodies(1).forceExcitation(:,2))
title('Excitation Force (y) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(95000*[-1 1])

subplot(3,2,5)
plot(output.bodies(1).time, output.bodies(1).forceExcitation(:,3))
title('Excitation Force (z) - Hull')
xlabel('time [s]')
ylabel('[N]')
ylim(95000*[-1 1])

subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).forceExcitation(:,4))
title('Excitation Moment (Mx) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(2500*[-1 1])

subplot(3,2,4)
plot(output.bodies(1).time, output.bodies(1).forceExcitation(:,5))
title('Excitation Moment (My) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(2500*[-1 1])

subplot(3,2,6)
plot(output.bodies(1).time, output.bodies(1).forceExcitation(:,6))
title('Excitation Moment (Mz) - Hull')
xlabel('time [s]')
ylabel('[Nm]')
ylim(2500*[-1 1])

saveas(f7,strcat(f7.Name,'.jpg'))
%% Plot radiation damping forces for hull
f8 = figure(8);
f8.Position = [50 150 1200 500];
f8.Name = 'hullRadiationDampingForces';

subplot(3,2,1)
plot(output.bodies(1).time, output.bodies(1).forceRadiationDamping(:,1))
title('Radiaion Damping Force (x) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(600*[-1 1])

subplot(3,2,3)
plot(output.bodies(1).time, output.bodies(1).forceRadiationDamping(:,2))
title('Radiaion Damping Force (y) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(600*[-1 1])

subplot(3,2,5)
plot(output.bodies(1).time, output.bodies(1).forceRadiationDamping(:,3))
title('Radiaion Damping Force (z) - Hull')
xlabel('time [s]')
ylabel('[N]')
ylim(600*[-1 1])

subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).forceRadiationDamping(:,4))
title('Radiaion Damping Moment (Mx) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(0.1*[-1 1])

subplot(3,2,4)
plot(output.bodies(1).time, output.bodies(1).forceRadiationDamping(:,5))
title('Radiaion Damping Moment (My) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(0.1*[-1 1])

subplot(3,2,6)
plot(output.bodies(1).time, output.bodies(1).forceRadiationDamping(:,6))
title('Radiaion Damping Moment (Mz) - Hull')
xlabel('time [s]')
ylabel('[Nm]')
ylim(0.1*[-1 1])

saveas(f8,strcat(f8.Name,'.jpg'))
%% Plot added mass forces for hull
f9 = figure(9);
f9.Position = [50 150 1200 500];
f9.Name = 'hullAddedMassForces';

subplot(3,2,1)
plot(output.bodies(1).time, output.bodies(1).forceAddedMass(:,1))
title('Added Mass Force (x) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(5000*[-1 1])

subplot(3,2,3)
plot(output.bodies(1).time, output.bodies(1).forceAddedMass(:,2))
title('Added Mass Force (y) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(5000*[-1 1])

subplot(3,2,5)
plot(output.bodies(1).time, output.bodies(1).forceAddedMass(:,3))
title('Added Mass Force (z) - Hull')
xlabel('time [s]')
ylabel('[N]')
ylim(5000*[-1 1])

subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).forceAddedMass(:,4))
title('Added Mass Moment (Mx) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(200*[-1 1])

subplot(3,2,4)
plot(output.bodies(1).time, output.bodies(1).forceAddedMass(:,5))
title('Added Mass Moment (My) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(200*[-1 1])

subplot(3,2,6)
plot(output.bodies(1).time, output.bodies(1).forceAddedMass(:,6))
title('Added Mass Moment (Mz) - Hull')
xlabel('time [s]')
ylabel('[Nm]')
ylim(200*[-1 1])

saveas(f9,strcat(f9.Name,'.jpg'))
%% Plot restoring forces for hull
f10 = figure(10);
f10.Position = [50 150 1200 500];
f10.Name = 'hullRestoringForces';

subplot(3,2,1)
plot(output.bodies(1).time, output.bodies(1).forceRestoring(:,1))
title('Restoring Force (x) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(100000*[-1 1])

subplot(3,2,3)
plot(output.bodies(1).time, output.bodies(1).forceRestoring(:,2))
title('Restoring Force (y) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(100000*[-1 1])

subplot(3,2,5)
plot(output.bodies(1).time, output.bodies(1).forceRestoring(:,3))
title('Restoring Force (z) - Hull')
xlabel('time [s]')
ylabel('[N]')
ylim(100000*[-1 1])

subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).forceRestoring(:,4))
title('Restoring Moment (Mx) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(2500*[-1 1])

subplot(3,2,4)
plot(output.bodies(1).time, output.bodies(1).forceRestoring(:,5))
title('Restoring Moment (My) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(2500*[-1 1])

subplot(3,2,6)
plot(output.bodies(1).time, output.bodies(1).forceRestoring(:,6))
title('Restoring Moment (Mz) - Hull')
xlabel('time [s]')
ylabel('[Nm]')
ylim(2500*[-1 1])

saveas(f10,strcat(f10.Name,'.jpg'))

%% Plot Morison and viscous forces for hull
f11 = figure(11);
f11.Position = [50 150 1200 500];
f11.Name = 'hullMorisonViscousForces';

subplot(3,2,1)
plot(output.bodies(1).time, output.bodies(1).forceMorisonAndViscous(:,1))
title('Morison and Viscous Force (x) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(0.1*[-1 1])

subplot(3,2,3)
plot(output.bodies(1).time, output.bodies(1).forceMorisonAndViscous(:,2))
title('Morison and Viscous Force (y) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(0.1*[-1 1])

subplot(3,2,5)
plot(output.bodies(1).time, output.bodies(1).forceMorisonAndViscous(:,3))
title('Morison and Viscous Force (z) - Hull')
xlabel('time [s]')
ylabel('[N]')
ylim(0.1*[-1 1])

subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).forceMorisonAndViscous(:,4))
title('Morison and Viscous Moment (Mx) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(0.1*[-1 1])

subplot(3,2,4)
plot(output.bodies(1).time, output.bodies(1).forceMorisonAndViscous(:,5))
title('Morison and Viscous Moment (My) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(0.1*[-1 1])

subplot(3,2,6)
plot(output.bodies(1).time, output.bodies(1).forceMorisonAndViscous(:,6))
title('Morison and Viscous Moment (Mz) - Hull')
xlabel('time [s]')
ylabel('[Nm]')
ylim(0.1*[-1 1])

saveas(f11,strcat(f11.Name,'.jpg'))
%% Plot linear damping forces for hull
f12 = figure(12);
f12.Position = [50 150 1200 500];
f12.Name = 'hullLinearDampingForces';

subplot(3,2,1)
plot(output.bodies(1).time, output.bodies(1).forceLinearDamping(:,1))
title('Linear Damping Force (x) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(0.1*[-1 1])

subplot(3,2,3)
plot(output.bodies(1).time, output.bodies(1).forceLinearDamping(:,2))
title('Linear Damping Force (y) - Hull')
% xlabel('time [s]')
ylabel('[N]')
ylim(0.1*[-1 1])

subplot(3,2,5)
plot(output.bodies(1).time, output.bodies(1).forceLinearDamping(:,3))
title('Linear Damping Force (z) - Hull')
xlabel('time [s]')
ylabel('[N]')
ylim(0.1*[-1 1])

subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).forceLinearDamping(:,4))
title('Linear Damping Moment (Mx) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(0.1*[-1 1])

subplot(3,2,4)
plot(output.bodies(1).time, output.bodies(1).forceLinearDamping(:,5))
title('Linear Damping Moment (My) - Hull')
% xlabel('time [s]')
ylabel('[Nm]')
ylim(0.1*[-1 1])

subplot(3,2,6)
plot(output.bodies(1).time, output.bodies(1).forceLinearDamping(:,6))
title('Linear Damping Moment (Mz) - Hull')
xlabel('time [s]')
ylabel('[Nm]')
ylim(0.1*[-1 1])

saveas(f12,strcat(f12.Name,'.jpg'))

%% Plot total forces for heave and pitch
f13 = figure(13);
f13.Position = [50 150 1200 500];
f13.Name = 'hullTotalForcesHeavePitch';

plot(output.bodies(1).time,output.bodies(1).forceTotal(:,3),'linewidth',1.5)
hold on
plot(output.bodies(1).time,output.bodies(1).forceTotal(:,5),'linewidth',1.5)
legend('Heave','Pitch')
title('Total Force/Moment - Hull')
xlabel('time [s]')
ylabel('[m,Nm]')

saveas(f13,strcat(f13.Name,'.jpg'))

%%
f14 = figure(14);
f14.Position = [50 150 1200 500];
f14.Name = 'hullForcesWaveElevation2';

subplot(4,1,1)
plot(output.wave.time,output.wave.elevation,'linewidth',1.5)
% xlabel('time [s]')
ylabel('elevation [m]')
ylim([-2 2])
title('Wave Elevation')
grid minor

subplot(4,1,2)
plot(output.bodies(1).time, output.bodies(1).forceTotal(:,3),'linewidth',1.5)
title('Total Forces (z) - Hull')
% xlabel('time [s]')
ylabel('[N]')
grid minor

subplot(4,1,3)
plot(output.bodies(1).time, output.bodies(1).forceExcitation(:,3),'linewidth',1.5)
title('Excitation Forces (z) - Hull')
% xlabel('time [s]')
ylabel('[N]')
grid minor

subplot(4,1,4)
plot(output.bodies(1).time, output.bodies(1).forceRadiationDamping(:,3),'linewidth',1.5)
title('Radiation Damping Forces (z) - Hull')
xlabel('time [s]')
ylabel('[N]')
grid minor

saveas(f14,strcat(f14.Name,'.jpg'))

%% Plot response for body 2 = pendulum
f15 = figure(15);
f15.Position = [50 150 1200 500];
f15.Name = 'pendulumFullResponse';

subplot(3,2,1)
plot(output.bodies(2).time, output.bodies(2).position(:,1))
title('Surge (x) - Pendulum')
% xlabel('time [s]')
ylabel('[m]')

subplot(3,2,3)
plot(output.bodies(2).time, output.bodies(2).position(:,2))
title('Sway (y) - Pendulum')
% xlabel('time [s]')
ylabel('[m]')

subplot(3,2,5)
plot(output.bodies(2).time, output.bodies(2).position(:,3))
title('Heave (z) - Pendulum')
xlabel('time [s]')
ylabel('[m]')

subplot(3,2,2)
plot(output.bodies(2).time, output.bodies(2).position(:,4))
title('Roll (Mx) - Pendulum')
% xlabel('time [s]')
ylabel('[radians]')

subplot(3,2,4)
plot(output.bodies(2).time, output.bodies(2).position(:,5))
title('Pitch (My) - Pendulum')
% xlabel('time [s]')
ylabel('[radians]')
ylim([-0.1 0.1])

subplot(3,2,6)
plot(output.bodies(2).time, output.bodies(2).position(:,6))
title('Yaw (Mz) - Pendulum')
xlabel('time [s]')
ylabel('[radians]')

saveas(f15,strcat(f15.Name,'.jpg'))

%% Plot pitch response for body 2 = pendulum
f16 = figure(16);
f16.Position = [50 150 1200 500];
f16.Name = 'pendulumPitchResponse';

subplot(3,1,1)
plot(output.bodies(2).time, output.bodies(2).position(:,5),'linewidth',1.5)
title('Angular Position of Pendulum - Pitch')
% xlabel('time [s]')
ylabel('[radians]')
ylim([-0.1 0.1])

subplot(3,1,2)
plot(output.bodies(2).time, output.bodies(2).velocity(:,5),'linewidth',1.5)
title('Angular Velocity of Pendulum - Pitch')
% xlabel('time [s]')
ylabel('[radians/s]')
ylim([-0.05 0.05])

subplot(3,1,3)
plot(output.bodies(2).time, output.bodies(2).acceleration(:,5),'linewidth',1.5)
title('Angular Acceleration of Pendulum - Pitch')
xlabel('time [s]')
ylabel('[radians/s^2]')
ylim([-0.05 0.05])

saveas(f16,strcat(f16.Name,'.jpg'))

%% Plot heave response for body 2 = Pendulum
f17 = figure(17);
f17.Position = [50 150 1200 500];
f17.Name = 'pendulumHeaveResponse';

subplot(3,1,1)
plot(output.bodies(2).time, output.bodies(2).position(:,3),'linewidth',1.5)
title('Position of Pendulum - Heave')
% xlabel('time [s]')
ylabel('[m]')

subplot(3,1,2)
plot(output.bodies(2).time, output.bodies(2).velocity(:,3),'linewidth',1.5)
title('Velocity of Pendulum - Heave')
% xlabel('time [s]')
ylabel('[m/s]')
ylim([-1 1])

subplot(3,1,3)
plot(output.bodies(2).time, output.bodies(2).acceleration(:,3),'linewidth',1.5)
title('Acceleration of Pendulum - Heave')
xlabel('time [s]')
ylabel('[m/s^2]')

saveas(f17,strcat(f17.Name,'.jpg'))

%% Plot heave and pitch response against waves
f18 = figure(18);
f18.Position = [50 150 1200 500];
f18.Name = 'pendulumHeavePitchResponse';

subplot(3,1,1)
plot(output.wave.time,output.wave.elevation,'linewidth',1.5)
% xlabel('time [s]')
ylabel('elevation [m]')
ylim([-2 2])
title('Wave Elevation')
grid minor

subplot(3,1,2)
plot(output.bodies(2).time, output.bodies(2).position(:,3),'linewidth',1.5)
title('Position of Pendulum - Heave')
% xlabel('time [s]')
ylabel('[m]')
grid minor

subplot(3,1,3)
plot(output.bodies(2).time, output.bodies(2).position(:,5),'linewidth',1.5)
title('Angular Position of Pendulum - Pitch')
xlabel('time [s]')
ylabel('[radians]')
grid minor

saveas(f18,strcat(f18.Name,'.jpg'))
%% Plot total forces for hull
f19 = figure(19);
f19.Position = [50 150 1200 500];
f19.Name = 'pendulumTotalForces';

subplot(3,2,1)
plot(output.bodies(2).time, output.bodies(2).forceTotal(:,1))
title('Total Force (x) - Pendulum')
% xlabel('time [s]')
ylabel('[N]')
% ylim(1000*[-1 1])

subplot(3,2,3)
plot(output.bodies(2).time, output.bodies(2).forceTotal(:,2))
title('Total Force (y) - Pendulum')
% xlabel('time [s]')
ylabel('[N]')
% ylim(1000*[-1 1])

subplot(3,2,5)
plot(output.bodies(2).time, output.bodies(2).forceTotal(:,3))
title('Total Force (z) - Pendulum')
xlabel('time [s]')
ylabel('[N]')
% ylim(1000*[-1 1])

subplot(3,2,2)
plot(output.bodies(2).time, output.bodies(2).forceTotal(:,4))
title('Total Moment (Mx) - Pendulum')
% xlabel('time [s]')
ylabel('[Nm]')
% ylim(50*[-1 1])

subplot(3,2,4)
plot(output.bodies(2).time, output.bodies(2).forceTotal(:,5))
title('Total Moment (My) - Pendulum')
% xlabel('time [s]')
ylabel('[Nm]')
% ylim(50*[-1 1])

subplot(3,2,6)
plot(output.bodies(2).time, output.bodies(2).forceTotal(:,6))
title('Total Moment (Mz) - Pendulum')
xlabel('time [s]')
ylabel('[Nm]')
% ylim(50*[-1 1])

saveas(f19,strcat(f19.Name,'.jpg'))

%% Hull vs. Pendulum Heave
f20 = figure(20);
f20.Position = [50 150 1200 500];
f20.Name = 'hullPendulumHeaveResponse';

subplot(2,1,1)
plot(output.wave.time,output.wave.elevation,'linewidth',1.5)
xlabel('time [s]')
ylabel('elevation [m]')
ylim([-2 2])
title('Wave Elevation')
grid minor

subplot(2,1,2)
plot(output.bodies(1).time, output.bodies(1).position(:,3),'linewidth',1.5)
hold on
plot(output.bodies(2).time, output.bodies(2).position(:,3),'linewidth',1.5)
legend('Hull','Pendulum')
title('Heave Response')
xlabel('time [s]')
ylabel('[m]')
% ylim([-0.05 0.05])
grid minor

saveas(f20,strcat(f20.Name,'.jpg'))

%% Hull vs. Pendulum Pitch
f21 = figure(21);
f21.Position = [50 150 1200 500];
f21.Name = 'hullPendulumPitchResponse';

subplot(2,1,1)
plot(output.wave.time,output.wave.elevation,'linewidth',1.5)
xlabel('time [s]')
ylabel('elevation [m]')
ylim([-2 2])
title('Wave Elevation')
grid minor

subplot(2,1,2)
plot(output.bodies(1).time, output.bodies(1).position(:,5),'linewidth',1.5)
hold on
plot(output.bodies(2).time, output.bodies(2).position(:,5),'linewidth',1.5)
legend('Hull','Pendulum')
title('Pitch Response')
xlabel('time [s]')
ylabel('[m]')
ylim([-0.1 0.1])
grid minor

saveas(f21,strcat(f21.Name,'.jpg'))

%% Hull vs. Pendulum Pitch
f21 = figure(21);
f21.Position = [50 150 1200 500];
f21.Name = 'hullPendulumPitchResponse';

subplot(2,1,1)
plot(output.wave.time,output.wave.elevation,'linewidth',1.5)
xlabel('time [s]')
ylabel('elevation [m]')
ylim([-2 2])
title('Wave Elevation')
grid minor

subplot(2,1,2)
plot(output.bodies(1).time, output.bodies(1).position(:,5),'linewidth',1.5)
hold on
plot(output.bodies(2).time, output.bodies(2).position(:,5),'linewidth',1.5)
legend('Hull','Pendulum')
title('Pitch Response')
xlabel('time [s]')
ylabel('[m]')
ylim([-0.1 0.1])
grid minor

saveas(f21,strcat(f21.Name,'.jpg'))

%% Hull vs. Pendulum Yaw
f22 = figure(22);
f22.Position = [50 150 1200 500];
f22.Name = 'hullPendulumYawResponse';

subplot(2,1,1)
plot(output.wave.time,output.wave.elevation,'linewidth',1.5)
xlabel('time [s]')
ylabel('elevation [m]')
ylim([-2 2])
title('Wave Elevation')
grid minor

subplot(2,1,2)
yyaxis left
plot(output.bodies(1).time, output.bodies(1).position(:,6),'linewidth',1.5)
yyaxis right
plot(output.bodies(2).time, output.bodies(2).position(:,6),'linewidth',1.5)
legend('Hull','Pendulum')
title('Yaw Response')
xlabel('time [s]')
ylabel('[m]')
grid minor

saveas(f22,strcat(f22.Name,'.jpg'))

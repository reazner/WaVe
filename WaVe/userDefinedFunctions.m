% %Example of user input MATLAB file for post processing
% 
%Plot waves
% waves.plotEta(simu.rampTime);
% try 
%     waves.plotSpectrum();
% catch
% end

figure
plot(output.ptos.time,output.ptos.powerInternalMechanics(:,5));
title('Power Output of PTO')
xlabel('time [s]')
ylabel('Power [W]')

figure 
subplot(3,2,1)
plot(output.bodies(1).time, output.bodies(1).position(:,1))
title('Surge')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).position(:,2))
title('Sway')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,3)
plot(output.bodies(1).time, output.bodies(1).position(:,3))
title('Heave')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,4)
plot(output.bodies(1).time, output.bodies(1).position(:,4))
title('Roll')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,5)
plot(output.bodies(1).time, output.bodies(1).position(:,5))
title('Pitch')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,6)
plot(output.bodies(1).time, output.bodies(1).position(:,6))
title('Yaw')
xlabel('time [s]')
ylabel('Radians')


figure 
subplot(3,2,1)
plot(output.bodies(2).time, output.bodies(2).position(:,1))
title('Surge')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,2)
plot(output.bodies(1).time, output.bodies(1).position(:,2))
title('Sway')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,3)
plot(output.bodies(2).time, output.bodies(2).position(:,3))
title('Heave')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,4)
plot(output.bodies(2).time, output.bodies(2).position(:,4))
title('Roll')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,5)
plot(output.bodies(2).time, output.bodies(2).position(:,5))
title('Pitch')
xlabel('time [s]')
ylabel('Radians')
subplot(3,2,6)
plot(output.bodies(2).time, output.bodies(2).position(:,6))
title('Yaw')
xlabel('time [s]')
ylabel('Radians')




rms(output.ptos.powerInternalMechanics(:,5))




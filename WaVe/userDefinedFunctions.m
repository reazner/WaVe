% %Example of user input MATLAB file for post processing
% 
%Plot waves
waves.plotEta(simu.rampTime);
try 
    waves.plotSpectrum();
catch
end

%Plot pitch response for body 1 = Hull
figure 
subplot(3,1,1)
plot(output.bodies(1).time, output.bodies(1).position(:,5))
title('Angular Position of Hull')
xlabel('time [s]')
ylabel('Radians')
subplot(3,1,2)
plot(output.bodies(1).time, output.bodies(1).velocity(:,5))
title('Angular Velocity of Hull')
xlabel('time [s]')
ylabel('Radians/s')
subplot(3,1,3)
plot(output.bodies(1).time, output.bodies(1).acceleration(:,5))
title('Angular Acceleration of Hull')
xlabel('time [s]')
ylabel('Radians/s2')

%Plot pitch forces for body 1
output.plotForces(1,5);

figure
subplot(2,1,1)
plot(output.bodies(1).time, output.bodies(1).forceTotal(:,5))
title('Hull total force pitch')
subplot(2,1,2)
plot(output.bodies(1).time, output.bodies(1).forceExcitation(:,5))
title('Hull excitation force pitch')

% Plot responses for body 2 = Pendulum
figure
subplot(3,1,1)
plot(output.bodies(2).time, unwrap(output.bodies(2).position(:,6)))
title('Angular Position of Pendulum')
xlabel('time [s]')
ylabel('Radians')
subplot(3,1,2)
plot(output.bodies(2).time, output.bodies(2).velocity(:,6))
title('Angular Velocity of Pendulum')
xlabel('time [s]')
ylabel('Radians/s')
subplot(3,1,3)
plot(output.bodies(2).time, output.bodies(2).acceleration(:,6))
title('Angular Acceleration of Pendulum')
xlabel('time [s]')
ylabel('Radians/s2')

figure
plot(output.ptos.time,output.ptos.powerInternalMechanics(:,5));
title('Power Output of PTO')
xlabel('time [s]')
ylabel('Power [W]')

figure
plot(output.bodies(1).time, output.bodies(1).forceLinearDamping(:,6))
title('Hull Force Linear Damping')
xlabel('time [s]')
ylabel('N')

rms(output.ptos.powerInternalMechanics(:,5))




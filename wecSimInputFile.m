%% WaVe Team
% Horizontal Pendulum WEC 11thFeb2021


%% Simulation Data
simu = simulationClass();                       % Initialize simulationClass
simu.simMechanicsFile = 'Pend_test.slx';              % Simulink Model File
simu.startTime = 0;                             % Simulation Start Time [s]
simu.rampTime = 100;                         	% Wave Ramp Time [s]
simu.endTime=400;                              % Simulation End Time [s]
simu.dt = 0.01;
simu.CITime = 10;
simu.domainSize = 5;

% Simulation time-step [s]

%% Wave Information  
% Regular Waves 
%waves = waveClass('noWaveCIC');                   % Initialize waveClass
waves = waveClass('regular');

%AVG: NDBC station 46002 42.658 N 130.502 W closest meteorological data reporting to
% DART II payload 42.705 N 128.835 W Station 46407
% FALL - T 11.4s, H 3.22m
% WINTER - T 12.97s, H 3.76m
% SPRING - T 11.62s, H 2.8m
% SUMMER - T 10.28s, 1.7m
waves.H = 3;
waves.T = 10;
                                  % Wave Period [s]


%% Body Data
% Hull
% for hydro bodies COG already defined in h5 file

body(1) = bodyClass('Hydro/WaVe_Tech.h5');          % Initialize bodyClass for Hull
body(1).geometryFile = 'Geometry\Hull.stl';     % Geometry File
body(1).name = 'Hull';
%body(1).mass = 'equilibrium'; 
body(1).mass = 155.3281711828;
body(1).momOfInertia = [52.0268266554453  108.904778888941 72.4829441942289];


% Pendulum
% "non-hydro" : https://github.com/WEC-Sim/WEC-Sim/blob/d4ba2f8bc796584dc659063c1aaef41523bb20ae/docs/man/advanced_features.rst

body(2) = bodyClass('');          % Initialize bodyClass for Pend | leave string empty if non-hydro
body(2).nhBody = 1;                 % define as non-hydrodynamic body
body(2).name = 'Pendulum';
body(2).geometryFile = 'Geometry\PenArm.stl';     % Location of Geometry File
body(2).mass = 53.1882413061999
body(2).momOfInertia = [ 8.25243822670341e-03 0.159272057775376 0.158028339248302 ];  % Moment of Inertia [kg-m^2]
body(2).cb = aszwq
body(2).cg = [0.16 -.002 0.35052];
body(2).dispVol = 0;


%% Constraint Parameters
% NOTE: if change orientation z and y must be perpendicular to eachother

% 1 = Pitch
constraint(1)= constraintClass('Constraint1');  % Initialize constraintClass for Constraint1
constraint(1).loc = [0 0 0];                  % Constraint Location [m]
constraint(1).orientation.z =  [0 0 1];                      %Direction of the constraint's Z-coordinate. Default = [0 0 1]
            
constraint(1).orientation.y=[0 1 0];                 % Direction of the constraint's Y-coordinate. Default = [0 1 0]
           

%% PTO Parameters 

% Rotational PTO
pto(1) = ptoClass('PTO1');                      % Initialize ptoClass for PTO1


pto(1).k = 10;                                	% PTO Stiffness Coeff linear [N/m] rot torsion spring: [Nm/rad]
% this also affect power output, bigger isn't necessarily better
pto(1).c = 1;  % PTO Damping Coeff linear [Ns/m rot torsional damping[Nsm/rad]

pto(1).loc = [0 0 0.35052];                        % PTO Location [m]
% yaw
pto(1).orientation.y = [0,0,1];
pto(1).orientation.z = [0,1,0];


%% Mooring
% %Moordyn http://www.matt-hall.ca/files/MoorDyn%20Users%20Guide%202017-08-16.pdf
% mooring(1) = mooringClass('mooring');       % Initialize mooringClass
% mooring(1).moorDynLines = 1;                % Specify number of lines
% mooring(1).moorDynNodes(1) = 1;
% mooring(1).initDisp.initLinDisp = [0 0 0];      % Initial Displacement


clear
close all
clc

%% Slew 

t_start=datetime('now')
tic;
open('Aufiero_slew_pointing.slx')
out=sim('Aufiero_slew_pointing','StartTime','0','StopTime','500');
t_sim=toc;
t_end=datetime('now')
s = seconds(t_sim);
s.Format = 'hh:mm:ss'

%% disturbance torques

% Air drag torque
figure
plot(out.T_DRAG)
xlabel('time (s)')
ylabel('torque (Nm)')
legend('Tx','Ty','Tz')
title('Air drag torque')

% Gravity gradient torque
figure
plot(out.T_GG)
xlabel('time (s)')
ylabel('torque (Nm)')
legend('Tx','Ty','Tz')
title('Gravity gradient torque')

% Magnetic torque
figure
plot(out.T_MAG_FIELD)
xlabel('time (s)')
ylabel('torque (Nm)')
legend('Tx','Ty','Tz')
title('Magnetic torque')

% SRP
figure
plot(out.T_SRP)
xlabel('time (s)')
ylabel('torque (Nm)')
legend('Tx','Ty','Tz')
title('SRP')

% Overall disturbance torque
figure
plot(out.T_DISTURBANCE)
xlabel('time (s)')
ylabel('torque (Nm)')
legend('Tx','Ty','Tz')
title('Overall disturbance torque')

%% Reaction wheels control torques
figure
plot(out.T_RW) %plot(out.T_CMG)
xlabel('time (s)')
ylabel('torque (Nm)')
legend('Tx','Ty','Tz')
title('Reaction wheels control torques')

%% Slew angular velocity evolution
figure
plot(out.omega)
xlabel('time (s)')
ylabel('angular velocity (rad/s)')
legend('wx','wy','wz')
title('Angular velocities')

%% Quaternion error
figure
plot(out.quaternion_error)
xlabel('time (s)')
ylabel('quaternion error')
legend('qe1','qe2','qe3','qe4')
title('quaternion error')

%% Pointing error
figure
plot(out.tout,out.pointing_err)
xlabel('time (s)')
ylabel('pointing error')
title('Pointing error')

figure
plot(out.tout,out.pointing_err)
xlabel('time (s)')
ylabel('pointing error')
title('Pointing error zoomed')
ylim([0 2.5])




clear
close all
clc

%% De-tumbling

t_start=datetime('now')
tic;
open('Aufiero_detumbling.slx')
out=sim('Aufiero_detumbling','StartTime','0','StopTime','200');
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

%% Cold gas thrusters control torques
figure
plot(out.T_THRUSTERS)
xlabel('time (s)')
ylabel('torque (Nm)')
legend('Tx','Ty','Tz')
title('Cold gas thrusters control torques')

%% De-tumbling angular velocity evolution
figure
plot(out.w_filtered)
xlabel('time (s)')
ylabel('angular velocity (rad/s)')
legend('wx','wy','wz')
title('Angular velocities')



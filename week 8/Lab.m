%% 2
% mdl_planar2;
% t = 1; % Total time in seconds
% steps = 30; % No. of steps
% deltaT = t/steps; % Discrete time step
% deltaTheta = 4*pi/steps; % Small angle change
% qMatrix = zeros(steps,2); % Assign memory for joint angles
% x = zeros(2,steps); % Assign memory for trajectory
% m = zeros(1,steps); % For recording measure of manipulability
% errorValue = zeros(2,steps);% For recording velocity error
% 
% for i = 1:steps
%  x(:,i) = [1.5*cos(deltaTheta*i) + 0.45*cos(deltaTheta*i)
%  1.5*sin(deltaTheta*i) + 0.45*cos(deltaTheta*i)];
% end
% 
% T = [eye(3) [x(:,1);0];zeros(1,3) 1];
% qMatrix(1,:) = p2.ikine(T,[0 0],M);
% 
% for i = 1:steps-1
%  T = p2.fkine(p2.getpos)% End-effector transform at current joint state
%  xdot = ... % Velocity to reach next waypoint
%  J = p2.jacob0(p2.getpos) % Get Jacobian at current state (use jacob0)
%  J = J(1:2,:); % Take only first 2 rows
%  m(:,i) = sqrt(det(J*J')); % Measure of Manipulability
%  
%  
%  qdot = ... % Solve the RMRC equation
%  errorValue(:,i) = xdot - J*qdot; % Velocity error
%  qMatrix(i+1,:)= ... % Update the joint state
%      end
% 
% figure(1);
% p2.plot(qMatrix,'trail','r-'); % Animate the robot
% figure(2);
% plot(m,'k','LineWidth',1); % Plot the Manipulability
% title('Manipulability of 2-Link Planar')
% ylabel('Manipulability')
% xlabel('Step')
% figure(3)
% plot(errorValue','Linewidth',1); % Plot the velocity error
% ylabel('Error (m/s)')
% xlabel('Step')
% legend('x-velocity','y-velocity');

%%
mdl_puma560;

selectedVelcoity(
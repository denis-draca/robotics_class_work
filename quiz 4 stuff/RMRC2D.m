function [ ] = RMRC2D( robot, start, endPos, steps )

minManipMeasure = 0.1;

M = [1 1 0 zeros(1,3)];
% 3.6
x1 = zeros(robot.n,1);
x2 = zeros(robot.n,1);

x1(1:2,1) = start(1:2,4);
x2(1:2,1) = endPos(1:2,4);
deltaT = 0.05;                                        % Discrete time step

% 3.7
x = zeros(robot.n,steps);
s = lspb(0,1,steps);                                 % Create interpolation scalar
for i = 1:steps
    x(:,i) = x1*(1-s(i)) + s(i)*x2;                  % Create trajectory in x-y plane
end

% 3.8
qMatrix = nan(steps,robot.n);

% 3.9
qMatrix(1,:) = robot.ikine(start,zeros(1,robot.n),M);                % Solve for joint angles
% 3.10
for i = 1:steps-1
    xdot = (x(:,i+1) - x(:,i))/deltaT;                             % Calculate velocity at discrete time step
    J = robot.jacob0(qMatrix(i,:));           % Get the Jacobian at the current state
    J = J(1:robot.n,:);                           % Take only first 2 rows
    
    m = sqrt(det(J*J'));                                                % Measure of Manipulability
    if m < minManipMeasure
        qdot = inv(J'*J + 0.01*eye(robot.n))*J'*xdot;
    else
        qdot = inv(J) * xdot;                                               % Solve velocitities via RMRC
    end
   
    qMatrix(i+1,:) =  qMatrix(i,:) + deltaT*qdot';                   % Update next joint state
end

robot.plot(qMatrix,'trail','r-');

end


function [ ] = RMRC( robot, start, endPos, steps)
minManipMeasure = 0.1;


deltaT = 0.05;                                        % Discrete time step

x1 = zeros(6,1);
x2 = zeros(6,1);

x1(1:3,1) = start(1:3,4);
x2(1:3,1) = endPos(1:3,4);

x = zeros(length(x1),steps);
s = lspb(0,1,steps);                                 % Create interpolation scalar
for i = 1:steps
    x(:,i) = x1*(1-s(i)) + s(i)*x2;                  % Create trajectory in x-y plane
end


qMatrix = nan(steps, robot.n);


qMatrix(1,:) = robot.ikine(start);                 % Solve for joint angles


for i = 1:steps-1
    xdot = (x(:,i+1) - x(:,i))/deltaT;                             % Calculate velocity at discrete time step
    J = robot.jacob0(qMatrix(i,:));            % Get the Jacobian at the current state
    
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


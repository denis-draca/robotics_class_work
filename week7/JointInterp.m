mdl_planar2

T1 = transl(1.5,1,0);
T2 = transl(1.5,-1,0);

M = [1 1 zeros(1,4)]; % Masking Matrix
q1 = p2.ikine(T1,[0 0],M); % Solve for joint angles
q2 = p2.ikine(T2,[0 0],M); % Solve for joint angles

qMatrix = jtraj(q1, q2, 30);

p2.plot(qMatrix,'trail','r-');

%%

x1 = [1.5 1]';
x2 = [1.5 -1]';
deltaT = 10;

steps = 30;

x = zeros(2,steps); % Assign memory
s = lspb(0,1,steps); % Create interpolation scalar
for i = 1:steps
x(:,i) = x1*(1-s(i)) + s(i)*x2; % Interpolate waypoints
end

qMatrix = nan(steps,2);

T1 = transl(1.5,-1,0);

qMatrix(1,:) = p2.ikine(T1,[0 0],M);

for i = 1:steps-1
    xdot = ... % Velocity to reach next waypoint
    J = p2.jacob0(qMatrix(i,:)); % Get Jacobian at current state
     J = J(1:2,:); % Take only first 2 rows
    qdot = ... % Solve the RMRC equation
    qMatrix(i+1,:)= ... % Update the joint state
    
end

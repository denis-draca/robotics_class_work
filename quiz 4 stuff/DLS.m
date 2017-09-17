function [qDot] = DLS( robot, qMatrix, xdot, lambda)

qDot = zeros(robot.n, 1, length(qMatrix));

for i = 1:length(qMatrix)
    pose = qMatrix(i,:);
    J = robot.jacob0(pose);
    
    qDot(:,:,i) = inv(J'*J + lambda*eye(robot.n))*J'*xdot

end

end


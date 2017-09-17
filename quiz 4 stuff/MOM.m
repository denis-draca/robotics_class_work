function [ yoshi ] = MOM( robot, pose )

jacob = robot.jacob0(pose);
disp('*******');
jacob*jacob'
diag(jacob*jacob')
prod(diag(jacob*jacob'))

yoshi = sqrt(det(jacob*jacob'));


end


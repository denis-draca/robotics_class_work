function [ collision, point ] = checkCollisionLinear( robot, pose, environment)
%Environment is list of triangular points

points = zeros(1,3,length(environment));
normals = zeros(1,3,length(environment));

for i = 1:length(environment)
    [points(:,:,i), normals(:,:,i)] = equationOfPlane(environment{1}.point1,...
    environment{1}.point2, environment{1}.point3);
end

collision = 0;
point = [];

transforms = linkPoses(pose, robot);

for i = 1:length(transforms) - 1
   
    point1 = transforms(:,:,i);
    point2 = transforms(:,:,i+1);
    
    point1 = point1(1:3,4)';
    point2 = point2(1:3,4)';
    
    for x = 1:length(environment)
       
        [intersectionPoint,check] = LinePlaneIntersection(normals(:,:,x),...
        points(:,:,x),point1,point2);
    
        if(check == 1)
            point = intersectionPoint;
            collision = 1;

            return;

        end
    
    end
    
end


end


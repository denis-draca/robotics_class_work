centerPoint = [2,0,0];
radii = [3,2,1];
[X,Y,Z] = ellipsoid(centerPoint (1),centerPoint (2),centerPoint ...
(3),radii(1),radii(2),radii(3));

surf(X,Y,Z);

[Y,Z] = meshgrid(-0.75:0.05:0.75,-0.75:0.05:0.75);
X = repmat(0.75,size(Y,1),size(Y,2));

hold on;
surf(X,Y,Z);

insideCount = 0;
onCount = 0;
outsideCount = 0;

for i = 1:length(Y)

    result = (X(1,i) - centerPoint(1,1))/radii(1,1) + ...
        (Y(1,i) - centerPoint(1,2))/radii(1,2) + ...
        (Z(1,i) - centerPoint(1,3))/radii(1,3);
    
    
    if (abs(result) < 1)
        insideCount = insideCount + 1;
    end
    
    if (abs(result) == 1)
        onCount = onCount + 1;
    end
    
    
    if(abs(result) > 1)
        outsideCount = outsideCount + 1;
    end
    
    
end

insideCount 
onCount 
outsideCount 


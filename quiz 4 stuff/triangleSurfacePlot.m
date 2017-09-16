function [ plot ] = triangleSurfacePlot( point1, point2, point3 )

[point,normal] = equationOfPlane(point1,point2,point3);

[x,y] = meshgrid(-10:0.1:10);

z = ((-1*(normal(1,1).*(x - point(1,1))) - normal(1,2).*(y - point(1,2)))./normal(1,3))+point(1,3);


plot = surf(x,y,z);

end


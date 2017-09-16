function [ point, normal ] = equationOfPlane( point1, point2, point3 )

vec1 = point2 - point1;

vec2 = point3 - point1;

point = point1;

normal = cross(vec1,vec2);

end


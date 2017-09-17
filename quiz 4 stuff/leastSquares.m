function [B] = leastSquares(points )
%%%%%%%%%%%%%%%%%%
%FIRST COLOUMN IS X VALUES
%SECOND COLOUMN IS Y VALUES

% points = zeros(count,2);
% 
% for i = 1:count
%     points(i,:) = rand(1,2) + i;
% 
% end

plot(points(:,1),points(:,2));

Y = points(:,2);

X = zeros(length(points(:,1)),2);
X(:,1) = 1;
X(:,2) = points(:,1);

B = inv(X'*X)*X'*Y;

test =  B(2,1)*(0:0.1:length(points(:,1))) + B(1,1);
hold on;
plot(0:0.1:length(points(:,1)), test, 'color','r');

end


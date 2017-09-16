function [ plotRef ] = printPlots( transforms )

plotRef = zeros(1,length(transforms));

for i = 1:length(transforms)
    hold on;
    
    plotRef(1,i) = trplot(transforms(:,:,i));
    
end


end


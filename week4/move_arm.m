p560.plot([0 0 0 0 0 0]);
%j_mat = jtraj(p560.getpos, [1.3, 1.3, 0.2, 0.1, 1.0, 0.1], 50);
steps = 50;
q1 = p560.getpos;
q2 = [1.3, 1.3, 0.2, 0.1, 1.0, 0.1];

p560.fkine(q1)

for i = 1:length(q1)
    temp = q1(1, 1:i);
    
    p560.fkine(temp)
end

s = lspb(0,1,steps);
qMatrix = nan(steps,6);
for i = 1:steps
qMatrix(i,:) = (1-s(i))*q1 + s(i)*q2;
end


p560.plot(qMatrix,'trail','r-');

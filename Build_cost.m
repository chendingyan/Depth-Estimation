function [M D] = Build_cost(cost_mat)
[siz1 siz2] =  size(cost_mat);
D = zeros(size(cost_mat));
D(1,:) = cost_mat(1,:);
M = zeros(size(cost_mat));
for i=2:siz1
    for j=1:siz2
        if j~=1
        mat = [D(i-1,j)+1;D(i-1,j-1)+cost_mat(i,j);D(i,j-1)+1];
        [Intnsty1, indx] = min(mat);
        D(i,j) = Intnsty1+cost_mat(i,j);
        if (indx==1)
            M(i,j) = 2;
        elseif (indx==2)
            M(i,j) = 1;
        else
            M(i,j) = 3;
        end
        else
            D(i,j) = cost_mat(i,j)+D(i-1,j);
            
        end
    end
end
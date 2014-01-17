function [M_score] = match_cost(leftpixel,rw,clm,R1)
%[l m] =size(R1);
M_score = [];
%for j=1:15
%     for j=1:m
%         %loc = clm+j;
%         leftpixel=cast(leftpixel,'double');
%         Rightpixel = R1(rw,j);
%         Rightpixel = cast(Rightpixel,'double');
%         diff = (leftpixel - Rightpixel).^2;
%         diff = cast(diff,'double');
%         M_score(1,j) = diff;
%     end

    
    
    
    [m n] = size(R1);
patch_L1 = leftpixel;
%M_score = [];
in = 1;
for k=2:n-1
    patch_L1=cast(patch_L1,'double');
    
    
    patch_R1 = R1(rw-1:rw+1,k-1:k+1);
    patch_R1 = cast(patch_R1,'double');
    diff = (patch_L1 - patch_R1).^2;
    diff = cast(diff,'double');
    M_score(1,in) = sum(sum(diff)); %sum(sum(patch_L1-patch_R1).^2)
    in = in+1;
    
end
size(M_score);

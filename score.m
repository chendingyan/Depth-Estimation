function [c] = score(patch_L1,paddedRimage,i)
[m n] = size(paddedRimage);

%M_score = [];
in = 1;
for k=2:n-1
    patch_L1=cast(patch_L1,'double');
    
    
    patch_R1 = paddedRimage(i-1:i+1,k-1:k+1);
    patch_R1 = cast(patch_R1,'double');
    diff = (patch_L1 - patch_R1).^2;
    diff = cast(diff,'double');
    M_score(1,in) = sum(sum(diff)); %sum(sum(patch_L1-patch_R1).^2)
    in = in+1;
    
end

M_score;
[r,c]=find(M_score==min(min(M_score)));
size(M_score);

    
%end

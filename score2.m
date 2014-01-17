function [D_Image] = score2(leftpatch,R,rw,clm,D_Image);
%%let the maximum disparity be 8 pixels
[r c] = size(R);
c_mat = [];
k=1;

for i=-8:8
    loc = clm+i;
    rightpatch = R(rw-1:rw+1,loc-1:loc+1);
    %while k<8
        %M_score(k,1) = ((leftpatch-R(i,k+i)).^2)/(4);
        M_score(k,1) = sum(sum((leftpatch-rightpatch).^2));
        k=k+1;
    %end
end

[r,c]=find(M_score==min(min(M_score)));
if numel(r)==1
%     count=count+1;
%     end
        %c_mat = [c_mat c];
        
        xdash = clm-(9-r);
        
        intr = clm - xdash;
        %val = 1/((clm -xdash)+0.1);
        %val = 1/(abs(clm-c)+1);
        D_Image(rw,clm) = intr;
else
    D_Image(rw,clm) = 20;
end
% else
%     for i=1:numel(c)
%         if c(i) > 
%        disp('yes')
% %        avg = floor((sum(c))/(numel(c)));
% %        val = 1/((clm-1)-avg);
% %        Disparity_Img(rw-1,clm-1) = val;
%     end

    
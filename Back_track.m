function [list_y] = Back_track(M);
[p q] = size(M);
disparity = 0;
list_y = zeros(1,q);
%list_y(1,1)=0;
%list_y(1,p)=0;
while q~=1 && p~=1
%     arry = [M(p-1,q-1);M(p-1,q);M(p,q-1)];
%     [ints,indx] = min(arry);

val = M(p,q);
    if val==1
            %disp('yes1')
        p = p-1;
        q = q-1;
        list_y(1,q) = disparity;
        
    
    elseif val==2
            %disp('yes2')
            disparity=disparity-1;
            p=p-1;
            list_y(1,q)=disparity;
            
            
            
            
      
    elseif val==3
            %disp('yes3')
            disparity = disparity+1;
            q = q-1;
            list_y(1,q)=disparity;
            
            
            
            
        end
    
end
    
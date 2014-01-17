function [list_y] = optimal_path(C_M);
[m n] = size(C_M);
list_y = zeros(1,m);%%xdash location, that is minimal point 
disparity = 0;
p = m;
q = n;

while p~=1 && q~=1
    %switch C_M(p,q)
     p=f_x;
     q = f_y;
    arry = [C_M(p-1,q-1);C_M(p-1,q);C_M(p,q-1)];
    [imtnsty,indx] = min(arry);
    
    if indx==1
        list_y(1,p) = disparity;
        p=p-1;
        q=q-1;
    
    elseif indx==2
        disparity  = disparity +1;
        list_y(1,p) = disparity;
        p = p-1;
        
    elseif indx==3
        disparity = disparity+1;
        list_y(1,p) = disparity;
        q = q-1;
    end
    
    
end
































% % [B,IX] = sort(C_M(m,:));
% % i = 1;
% % 
% % f_x = m; %% fisrt point ----> last row
% % f_y = IX(1,i);
% % list_x = zeros(1,m);
% % list_y = zeros(1,m);
% % itrn = 1;
% % 
% % while f_x~=1 %%%Bottom to top approach for optimal seam finding
% %     
% %     if f_y==1
% %         arry = [C_M(f_x-1,f_y);0];
% %         [int,indx] = min(arry);
% %         if indx==1
% %             f_y = f_y;
% %             list_x(1,itrn)= f_x;
% %             list_y(1,itrn)= f_y;
% %         else
% %             f_y = f_y+1;
% %             list_x(1,itrn)= f_x;
% %             list_y(1,itrn)= f_y;
% %         end
% %     end
% %     
% %     if f_y~=1 
% %         arry = [C_M(f_x-1,f_y-1); C_M(f_x-1,f_y); C_M(f_x,f_y-1)];
% %         [int,indx] = min(arry);
% %         if indx==1
% %             f_y = f_y-1;
% %             list_x(1,itrn)= f_x;
% %             list_y(1,itrn)= f_y;
% %         elseif indx==2
% %             f_y = f_y;
% %             list_x(1,itrn)= f_x;
% %             list_y(1,itrn)= f_y;
% %         else
% %             f_y = f_y-1;
% %             list_x(1,itrn)= f_x;
% %             list_y(1,itrn)= f_y;
% %         end
% %         
% %     end
% %     
% %     itrn = itrn + 1;
%     f_x = f_x -1;
% end
% 
% % for i=1:m-1
% %     for j=1:n
% %       Img_in(list_x(1,i),list_y(1,i),1)= 0;
% %       Img_in(list_x(1,i),list_y(1,i),2)= 0;
% %       Img_in(list_x(1,i),list_y(1,i),3)= 0;
% %       end
% % end
% list_x(1,m) = 1;
% id_x = list_x(1,m-1);
% id_y = list_y(1,m-1);
% if id_y ==1
%     arry = [C_M(id_x-1,id_y);0];
%     [int,indx] = min(arry);
%     if indx==1
%         list_y(1,m) = id_y;
%     else
%         list_y(1,m) = id_y+1;
%     end
% elseif id_y==n
%     arry = [C_M(id_x-1,id_y);C_M(id_x-1,id_y-1);C_M(id_x,id_y-1)];
%     [int,indx] = min(arry);
%     if indx==1
%         list_y(1,m) = id_y;
%     elseif indx==2
%         list_y(1,m) = id_y-1;
%     else
%         list_y(1,m) = id_y-1;
%     end
% elseif id_y~=1&&id_y~=n
%     arry = [C_M(id_x-1,id_y-1);C_M(id_x-1,id_y);C_M(id_x,id_y-1)];
%     [int,indx] = min(arry);
%     if indx==1
%         list_y(1,m) = id_y-1;
%     elseif indx==2
%         list_y(1,m) = id_y;
%     else
%         list_y(1,m)=id_y-1;
%     end
% end
% %Img_in(list_x(1,m),list_y(1,m),1)=0;
% %Img_in(list_x(1,m),list_y(1,m),2)=0;
% %Img_in(list_x(1,m),list_y(1,m),3)=0;
% 
% 
%     
%     
% 
% 

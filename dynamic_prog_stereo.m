function [Disp_Img intmed] = dynamic_prog_stereo(L,R);
%L = imread('tsukuba_l.ppm');
%R = imread('tsukuba_r.ppm');

L = rgb2gray(L);%left image
R = rgb2gray(R);%right image
 [si1 si2]  = size(L);%size of left image
 
 %%find cost matrix
 sigma = 2;
 c_o = 1;
 D_Image = zeros(si1,si2);
 disp('dynamic programming part')
 %disp('building cost matrix first')
 L1 = padarray(L,[1 1],'both');
 R1 = padarray(R,[1 1],'both');
 Disp_Img = zeros(size(L));
 intmed = [];
 for i=2:size(L1,1)-1
     rw = i
     cost_mat = [];
     for j=2:size(L1,2)-1
         clm=j;
         leftpixel = L1(i-1:i+1,j-1:j+1);
         %leftpix = L(i,j);
         [match_score] = match_cost(leftpixel,rw,clm,R1);
         cost_mat = vertcat(cost_mat,match_score);
     end
     
     [M D] = Build_cost(cost_mat);
     %intmed = cat(3,intmed,M);
     [list_y] = Back_track(M);
     Disp_Img(i-1,:) = list_y;
     
     
 end
%  for i=1:size(Disp_Img,1)
%      for j=1:size(Disp_Img,2)
%          if Disp_Img(i,j)>15
%              Disp_Img(i,j)=15;
%          end
%      end
%  end
 figure,imshow(abs(Disp_Img),[])
 title('disparitymap with patch size 3x3 and SSD')
 %imwrite(Disp_Img,'dispMap.tif')
 for i=1:size(Disp_Img,1)
     for j=1:size(Disp_Img,2)
         depthMap(i,j) = 1/Disp_Img(i,j);
     end
 end
 figure,imshow(depthMap,[])
 title('depthmap')
 %imwrite(depthMap,'depthMap.tif')
%  size(cost_mat)
%  Cum_M = zeros(size(cost_mat));
%  Cum_M(1,:) = cost_mat(1,:);
%  M = zeros(size(cost_mat));
% %% cost matrix c(l-1,r) + beta , c(l-1,r-1)+cost_mat(l,r) , c(l,r-1)+beta
% 
% size(Cum_M)
% disp('cumulative cost matrix created')
% disp('applying dynamic programming')
% figure,imshow(cost_mat)
% figure,imshow(Cum_M,[])
% figure,imshow(M,[])
% [list_y] = optimal_path(M);
%figure,imshow(list_y,[])
% size(list_y)
%list_y
% for i=1:si1
%     for j=1:si2
%         dispImg(i,j) = list_y(i*j);
%     end
% end
% figure,imshow(dispImg,[])

%  figure,imagesc(D_Image)
%  title('disarity Image')
%  figure,imshow(D_Image,[min(min(D_Image)) max(max(D_Image))])
%  title('disarity Image2')
%  [siz1 siz2] = size(D_Image);
%  l = si1;
% m = si2;
% dispr = zeros(size(D_Image));
% for l=2:siz1
%     for m=2:siz2
%     
%     
%     A = [(dispr(l-1,m-1)+D_Image(l,m)) (dispr(l-1,m)+c_o) (dispr(l,m-1)+c_o)];
%     [rl cl] = min(A);
%     dispr(l,m)=rl;
%     end
% end
% size(dispr)
% imshow(dispr)
%     
    
 
 %size(D_Image)
% cost_mat = zeros(size(match_mat));
% cost_mat(1,1) = match_mat(1,1);
% for i=2:si1
%     for j=2:si2
%         cost_mat(i,j) = 
% 
% 

% disparityImage = zeros(si1,si2);
% disparityImage(1,1) = 
% while l~=0 && m~=0
%     
    

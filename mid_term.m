function [] = mid_term(L,R);

disp('Programming Assignment for midterm')
disp('Patch size chosen 3x3: less noise')
disp('Similarity metric chosen:SSD: Computationally efficient')
disp('executing Question 2.2')
%L1 = L;
%R1 = R;
L1 = rgb2gray(L);%left image
R1 = rgb2gray(R);%right image
 [si1 si2]  = size(L1);%size of left image
 patch_L = L(189:191,149:151);
 patch_L = cast(patch_L,'double');
% size(patch_L);
 pimg_R = padarray(R,[1 1],'both');
 [siz1 siz2] = size(pimg_R);
 pimg_L = padarray(L,[1 1],'both');
in = 1;
for l=190
    for k=2:si2-1
        
        patch_R = pimg_R(189:191,k-1:k+1);
        patch_R = cast(patch_R,'double');
        size(patch_R);
        diff = (patch_L - patch_R).^2;
        diff = cast(diff,'double');
        
        M_score(1,in) = sum(sum(diff)); 
        in = in+1;
    end
end
plot(M_score)
title('similarity metric(SSD) plot for pixel at 190,150')
[r,c]=find(M_score==min(min(M_score)));
if numel(r)==1 && numel(c)==1
    disp('unique extremum occurs at')
    row=190
    column = c
    disparity  = 150 - c
end

disp('executing question 2.3')
paddedLimage = pimg_L;
paddedRimage = pimg_R;

Disparity_Img = zeros(size(L1));
Disparity_spc_Img = [];
%patch_L1 = zeros(3,3); % create a patch of size 3x3
RightImage = R1;
cost_mat = [];

for i=2:size(paddedLimage,1)-1
    i
    for j=2:size(paddedRimage,2)-1
        patch_L = paddedLimage(i-1:i+1,j-1:j+1);
        [c] = score(patch_L,paddedRimage,i);
        if numel(c)==1
            xdash = c;
            intr = j-xdash;
            Disparity_Img(i-1,j-1) = intr;
        else
            Disparity_Img(i-1,j-1) = inf;
        end
    end
end
figure,imshow(Disparity_Img,[])
title('DisparityMap')
for i=1:size(Disparity_Img,1)
    for j=1:size(Disparity_Img,2)
        DepthImage(i,j) = 1/Disparity_Img(i,j);
    end
end
figure,imshow(DepthImage,[])
title('DepthMap')
pdisp_img = padarray(Disparity_Img,[1 1],'both');
for i=2:size(pdisp_img,1)-1
    for j=2:size(pdisp_img,2)-1
        if pdisp_img(i,j)==inf
            if pdisp_img(i,j-1)~=inf 
                pdisp_img(i,j) = pdisp_img(i,j-1);
            elseif pdisp_img(i-1,j)~=inf
                pdisp_img(i,j) = pdisp_img(i-1,j);
            elseif pdisp_img(i-1,j-1)~=inf
                pdisp_img(i,j) = pdisp_img(i-1,j-1);
            elseif pdisp_img(i-1,j+1)~=inf
                pdisp_img(i,j) = pdisp_img(i-1,j+1);
            end
        end
    end
end
figure,imshow(pdisp_img,[])
title('Disparity map :after nearest neighbour interpolation')
   
%         Disparity_Img(i,j) 
% [r,c]=find(M_score==min(min(M_score)));
%         size(c);
%         
%         if (numel(r)==1 && numel(c)==1)
%             
%             xdash = c;
%             intr = clm - xdash;
%             
%             Disparity_Img(rw,clm) = intr;
%         else
%             
%             Disparity_Img(rw,clm) = inf;
%         end
 %figure,imshow(Disparity_Img,[])
% title('Disparity before filling')
% DSI = (Disparity_spc_Img(:))';
% size(DSI)
% imwrite(DSI,'DSI.tif');
%figure,imshow(DSI,[])

% [p q] = size(Disparity_Img);
% for i=2:p-1
%     for j=2:q-1
%         if Disparity_Img(i,j)==0
%             if Disparity_Img(i-1,j-1)~=0 
%                 Disparity_Img(i,j) = Disparity_Img(i-1,j-1);
%             elseif Disparity_Img(i-1,j)~=0 
%                 Disparity_Img(i,j)=Disparity_Img(i-1,j)
%             elseif Disparity_Img(i-1,j+1)~=0
%                  Disparity_Img(i,j)=Disparity_Img(i-1,j+1);
%             end
%         end
%     end
% end
% figure,imshow(Disparity_Img,[])
% title('Disparity after occlusion filling')



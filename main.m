function [Disp_Img1 Disp_Img2] = main();
directory = 'Images';
 tifffiles = dir([directory '/*.bmp']);
 %for k = 1:2
 filename1 = [directory '/' tifffiles(1).name]
 filename2 = [directory '/' tifffiles(3).name]
 
 filename3 = [directory '/' tifffiles(2).name]
 filename4 = [directory '/' tifffiles(4).name]
 %end
 L1 = imread(filename1);
 R1 = imread(filename2);
 L2 = imread(filename3);
 R2 = imread(filename4);
[Disp_Img1 intmed1] = dynamic_prog_stereo(L1,R1);
[Disp_Img2 intmed2] = dynamic_prog_stereo(L2,R2);
function [Dimg] = create_dispImg(list_y);
intr = numel(list_y);
Dimg = [];
in=1;
while intr~=0
%for i=1:numel(list_y)
    Dimg(1,in) = list_y(in);
    in = in+1;
    intr = intr-1;
end
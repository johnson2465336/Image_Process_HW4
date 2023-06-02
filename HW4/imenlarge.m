function img_enlarge = imenlarge(img,n,filter)
for i=1:n
    %% zero interleaving
    [r,c] = size(img);% get img's size
    img2 = zeros(2*r,2*c);% create empty img2 which size is double to img
    img2(1:2:2*r,1:2:2*c) = img;% every two position store img's data 
    %% filter
    img = imfilter(img2,filter);
end
img_enlarge = uint8(img);% return img
folder='C:\Users\mna14\Desktop\acetowhitening margin\Peru Lugol\Lugol\abnormal_pink_yellow_brown';
img='L19.tif';
fullfilename=fullfile(folder, img);
I=(imread(fullfilename));
I=rgb2gray(I);
I_eq = adapthisteq(I);
imshow(I_eq)
%%
close all;
    im = green;
    im = green;

    ims = conv2(double(im), ones(7,7),'same');
    imbw = ims>6;
    figure;imshow(imbw);title('All pixels that there are at least 6 white pixels in their hood');

    props = regionprops(imbw,'Area','PixelIdxList','MajorAxisLength','MinorAxisLength');
    [~,indexOfMax] = max([props.Area]);
    approximateRadius =  props(indexOfMax).MajorAxisLength/2;

    largestBlobIndexes  = props(indexOfMax).PixelIdxList;
    bw = false(size(im));
    bw(largestBlobIndexes) = 1;
    bw = imfill(bw,'holes');
    figure;imshow(bw);title('Leaving only largest blob and filling holes');
    figure;imshow(edge(bw));title('Edge detection');

    radiuses = round ( (approximateRadius-5):0.5:(approximateRadius+5) );
    h = circle_hough(edge(bw), radiuses,'same');
    [~,maxIndex] = max(h(:));
    [i,j,k] = ind2sub(size(h), maxIndex);
    radius = radiuses(k);
    center.x = j;
    center.y = i;

    figure;imshow(edge(bw));imellipse(gca,[center.x-radius  center.y-radius 2*radius 2*radius]);
    title('Final solution (Shown on edge image)');

    figure;imshow(im);imellipse(gca,[center.x-radius  center.y-radius 2*radius 2*radius]);
    title('Final solution (Shown on initial image)');
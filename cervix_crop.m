%Code to perform cropping at scale. Use to crop cervix images to remove clinically irrelevant
%data such as the speculum and vaginal walls
%Written by Mercy N. Asiedu
%Last updated 04/13/2019
close all; clear all;
cd('X:\Mercy\Image processing\VIA image processing\Processing_without_ectopion\Honduras\Green Light');
dirlist = [dir('*.tif');dir('*.jpg');dir('*.png')];
%cd('X:\Mercy\Image processing\Segmentation');
folder='X:\Mercy\Image processing\VIA image processing\Processing_without_ectopion\Honduras\Green Light';
for n=1:612%length(dirlist)
    %read in data
    name=['HG',num2str(n),'.jpg'];
    fullfilename=fullfile(folder, name);
    image=imread(fullfilename);
    cervix_boxcrop=imcrop(image);
    filename=['X:\Mercy\Image processing\VIA image processing\Processing_without_ectopion\Honduras\Green Light\cervix_boxcrop\HG',num2str(n),'.jpg'];
    imwrite(cervix_boxcrop,filename);  
end
cd('X:\Mercy\Image processing\VIA image processing\Processing_without_ectopion\Honduras\Green Light');
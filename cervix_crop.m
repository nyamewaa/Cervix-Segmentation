%Code to perform cropping at scale. Use to crop cervix images to remove clinically irrelevant
%data such as the speculum and vaginal walls
%Written by Mercy N. Asiedu
%Last updated 04/11/2019
close all; clear all;
cd('X:\Mercy\Image processing\VIA image processing\Processing_without_ectopion\Mombasa_Ganjoni\AA White Light');
dirlist = [dir('*.tif');dir('*.jpg');dir('*.png')];
cd('X:\Mercy\Image processing\Segmentation');
folder='X:\Mercy\Image processing\VIA image processing\Processing_without_ectopion\Mombasa_Ganjoni\AA White Light';
for n=270:361%length(dirlist)
    %read in data
    name=['GW',num2str(n),'.tif'];
    fullfilename=fullfile(folder, name);
    image=imread(fullfilename);
    cervix_boxcrop=imcrop(image);
    filename=['X:\Mercy\Image processing\VIA image processing\Processing_without_ectopion\Mombasa_Ganjoni\AA White Light\cervix_boxcrop\GW',num2str(n),'.tif'];
    imwrite(cervix_boxcrop,filename);  
end
cd('X:\Mercy\Image processing\VIA image processing\Processing_without_ectopion\Mombasa_Ganjoni\AA White Light');
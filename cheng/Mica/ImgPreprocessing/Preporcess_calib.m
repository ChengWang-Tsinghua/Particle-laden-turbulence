close all
clear 
clc

% input
fpath0 = 'C:\Chronos_Footages\calib_1107_3kHz_anagain6dB';
Istart = 2; % better to ignore the 1st image


fpath = [fpath0 '\raw'];
% get the folder contents
addpath(genpath('C:\Users\Gsu\Desktop\SDT_EXP'))


preproc_dir = [fpath0 '\preproc'];
if ~exist((preproc_dir))
    mkdir(preproc_dir)
end

image_list = dir([fpath '\*.tiff']);
img_num = size(image_list,1)/3;

 
i = 1;
% get Backgrounds
% cam 1
bkg1 = getBkg(fpath,'cam1_frame_',Istart,img_num,1,[]);

fnameo = ['cam1_frame_preproc_' num2str(i,'%06d') '.tiff'];
imwrite(uint16(bkg1),[preproc_dir '\' fnameo]);

% cam2
bkg2 = getBkg(fpath,'cam2_frame_',Istart,img_num,1,[]);
fnameo = ['cam2_frame_preproc_' num2str(i,'%06d') '.tiff'];
imwrite(uint16(bkg2),[preproc_dir '\' fnameo]);

% cam3
bkg3 = getBkg(fpath,'cam3_frame_',Istart,img_num,1,[]);
fnameo = ['cam3_frame_preproc_' num2str(i,'%06d') '.tiff'];
imwrite(uint16(bkg3),[preproc_dir '\' fnameo]);

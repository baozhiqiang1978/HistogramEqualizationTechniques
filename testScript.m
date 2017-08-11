%% Contrast Enhancement using various techniques

%% To load the input inputImages
% The color image has been split into 3 components
% analysis will be done independently for each of the
% components and then result will be concatenend together
% to get the three channel image.
I1 = imread('../inputImages/barbara.png');
I2 = imread('../inputImages/TEM.png');
I3 = imread('../inputImages/canyon.png'); %the color image
RI = I3(:,:,1);
GI = I3(:,:,2);
BI = I3(:,:,3);

%% Histogram Equalisation (b)
HeI1 = udionHE(I1);
HeI2 = udionHE(I2);
HeRI = udionHE(RI);
HeGI = udionHE(GI);
HeBI = udionHE(BI);
%combining 3 channels fro I3
HeI3 = cat(3, HeRI, HeGI, HeBI);
%%
%result for barabara
figure;
imagesc(I1);
colormap('gray');
colorbar;
savefig('../outputImages/b/barbara');

figure;
imagesc(HeI1);
colormap('gray');
colorbar;
savefig('../outputImages/b/barbara_o');
%%
% result for TEM
figure;
imagesc(I2);
colormap('gray');
colorbar;
savefig('../outputImages/b/TEM');

figure;
imagesc(HeI2);
colormap('gray');
colorbar;
savefig('../outputImages/b/TEM_o');
%%
% result for canyon
figure;
imagesc(I3);
colorbar;
savefig('../outputImages/b/canyon');

figure;
imagesc(HeI3);
colorbar;
savefig('../outputImages/b/canyon_o');
%%
% Again applying the funcion on individual channel
% leads to lost in depth of color in the combined image
% individual components when viewed on gray scale show
% the effect of histogram equalisation but the comibined
% channel does not show the desired effect

%% Adaptive Histogram Equalisation (c)
% To see the effect of low contrast improvement at
% large kernel size and noise amplification at smaller
% kernel size

%% AHE when kernel = 200 * 200
AheI1 = udionAHE(I1,200);
AheI2 = udionAHE(I2,200);
AheRI = udionAHE(RI,200);
AheGI = udionAHE(GI,200);
AheBI = udionAHE(BI,200);
% combing 3 channels for I3
AheI3 = cat(3, AheRI, AheGI, AheBI);
%%
% result for barabara
figure;
imagesc(I1);
colormap('gray');
colorbar;
savefig('../outputImages/c/subpart_i/barbara');

figure;
imagesc(AheI1);
colormap('gray');
colorbar;
savefig('../outputImages/c/subpart_i/barbara_o');
%%
% result for TEM
figure;
imagesc(I2);
colormap('gray');
colorbar;
savefig('../outputImages/c/subpart_i/TEM');
figure;

imagesc(AheI2);
colormap('gray');
colorbar;
savefig('../outputImages/c/subpart_i/TEM_o');
%%
% result for canyon
figure;
imagesc(I3);
colorbar;
savefig('../outputImages/c/subpart_i/canyon');

figure;
imagesc(AheI3);
colorbar;
savefig('../outputImages/c/subpart_i/canyon_o');

%% AHE when kernel = 20 * 20 
AheI1 = udionAHE(I1,20);
AheI2 = udionAHE(I2,20);
AheRI = udionAHE(RI,20);
AheGI = udionAHE(GI,20);
AheBI = udionAHE(BI,20);
% combing 3 channels for I3
AheI3 = cat(3, AheRI, AheGI, AheBI);
%%
% result for barbara
figure;
imagesc(I1);
colormap('gray');
colorbar;
savefig('../outputImages/c/subpart_ii/barbara');

figure;
imagesc(AheI1);
colormap('gray');
colorbar;
savefig('../outputImages/c/subpart_ii/barbara_o');
%%
% results for TEM
figure;
imagesc(I2);
colormap('gray');
colorbar;
savefig('../outputImages/c/subpart_ii/TEM');

figure;
imagesc(AheI2);
colormap('gray');
colorbar;
savefig('../outputImages/c/subpart_ii/TEM_o');
%%
% As can be seen the output is quite grainy
% and lots of details are not clearly visible because
% the noise has been enhanced.
%%
% results for canyon
figure;
imagesc(I3);
colorbar;
savefig('../outputImages/c/subpart_ii/canyon');

figure;
imagesc(AheI3);
colorbar;
savefig('../outputImages/c/subpart_ii/canyon_o');
%%
% Since each of the channel (R/G/B) has seen the effect
% of transformation, the noise in each of the channels
% has been enhanced and hence the final combined image 
% has suffered alot of distortions and noise. At many places
% once can not even make out the boundaries and endges
% of the features in original image. 

%% Contrast limited Adaptive Histogram Equalisation (d)
% CLAHE adds one extra parameter to tune the clippin
% level, for the following images the tuning has been
% done and the quality is subjective. One can try to
% change the parameter. The same is true for window size.
%% CLAHE with clipping parameter sensibly tuned
ClaheI1 = udionCLAHE(I1, 200, 0.75);
ClaheI2 = udionCLAHE(I2, 180, 0.65);
ClaheRI = udionCLAHE(RI, 180, 0.748);
ClaheGI = udionCLAHE(GI, 180, 0.748);
ClaheBI = udionCLAHE(BI, 180, 0.1751);
% combining the three channel for I3
ClaheI3 = cat(3, ClaheRI, ClaheGI, ClaheBI);
%%
% result for barbara
figure;
imagesc(I1);
colormap('gray');
colorbar;
savefig('../outputImages/d/subpart_i/barbara');

figure;
imagesc(ClaheI1);
colormap('gray');
colorbar;
savefig('../outputImages/d/subpart_i/barbara_o');
%%
% one can clearly see the artifacts produced by
% AHE are more or less removed by CLAHE
%%
% result for TEM
figure;
imagesc(I2);
colormap('gray');
colorbar;
savefig('../outputImages/d/subpart_i/TEM');

figure;
imagesc(ClaheI2);
colormap('gray');
colorbar;
savefig('../outputImages/d/subpart_i/TEM_o');
%%
% result for canyon
figure;
imagesc(I3);
colorbar;
savefig('../outputImages/d/subpart_i/canyon');

figure;
imagesc(ClaheI3);
colorbar;
savefig('../outputImages/d/subpart_i/canyon_o');
%% CLAHE when clipping parameter is half of the previous value
ClaheI1 = udionCLAHE(I1, 200, 0.75/2);
ClaheI2 = udionCLAHE(I2, 180, 0.65/2);
ClaheRI = udionCLAHE(RI, 180, 0.748/2);
ClaheGI = udionCLAHE(GI, 180, 0.748/2);
ClaheBI = udionCLAHE(BI, 180, 0.1751/2);
% combining the three channel for I3
ClaheI3 = cat(3, ClaheRI, ClaheGI, ClaheBI);
%%
% result for barbara
figure;
imagesc(I1);
colormap('gray');
colorbar;
savefig('../outputImages/d/subpart_ii/barbara');

figure;
imagesc(ClaheI1);
colormap('gray');
colorbar;
savefig('../outputImages/d/subpart_ii/barbara_o');
%%
% result for TEM
figure;
imagesc(I2);
colormap('gray');
colorbar;
savefig('../outputImages/d/subpart_ii/TEM');

figure;
imagesc(ClaheI2);
colormap('gray');
colorbar;
savefig('../outputImages/d/subpart_ii/TEM_o');
%%
% result for canyon
figure;
imagesc(I3);
colorbar;
savefig('../outputImages/d/subpart_ii/canyon');

figure;
imagesc(ClaheI3);
colorbar;
savefig('../outputImages/d/subpart_ii/canyon_o');
%%
% Halfing the clipping parameter still manages to avoid the
% sharp peaks in the hidtogram of the images however
% those region suffer by not getting the apt transformation and hence
% the contrast is not so good now hence
% clipping parameter seems to play an important part
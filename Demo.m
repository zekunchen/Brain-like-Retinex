%% Code for our paper "Brain-like Retinex: A Biologically Plausible Retinex Algorithm For Low Light Image Enhancement"
% matlab 2020b 
clear all;
close all;
clc;

%%
gamma=2.2;    
K=20;            %maximum iterations
vareps=0.0001;   %stopping parameter
alpha = 0.0001;  %parameter
beta = 0.001; 

Im=im2double(imread('image/cloudy.jpg'));
tic
[L, R] = RLDeC( Im, alpha, beta, K, vareps);
toc

hsv = rgb2hsv(Im);
I_gamma = L.^(1/gamma);
S_gamma = R .* I_gamma;
hsv(:,:,3) = real(S_gamma);
eIm = hsv2rgb(hsv);

hsv(:,:,3) = R;
RR = hsv2rgb(hsv);

figure;imshow(L);
figure;imshow(RR);
figure;imshow(Im);
figure;imshow(eIm);

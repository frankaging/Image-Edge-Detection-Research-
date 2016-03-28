%% Evaluation demo

I = imread('101085.jpg');
I_bi = rgb2gray(I);
E = edge(I_bi, 'canny');
load('groundTruth_P1/8143.mat');

[f precision recall] = edgeEval(E, groundTruth)


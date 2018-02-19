clear
close all
clc

refImg = imread('object.JPG');
refImg = imrotate(refImg,180);
refImggray = rgb2gray(refImg);

refPts = detectSURFFeatures(refImggray);

refFeatures = extractFeatures(refImggray,refPts);


figure;
imshow(refImg), hold on;
plot(refPts.selectStrongest(100));

subImg = imread('desk.JPG');
subImggray = rgb2gray(subImg);


subPts = detectSURFFeatures(subImggray);

subFeatures = extractFeatures(subImggray,subPts);


figure;
imshow(subImg), hold on;
plot(subPts.selectStrongest(100));

idxpairs = matchFeatures(refFeatures,subFeatures);


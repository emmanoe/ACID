function [ dataset_out ] = RecenterDataset( dataset_in )
%RECENTERDATASET Summary of this function goes here
%   Detailed explanation goes here

% Fetch the descriptors of the two categories
descriptors = dataset_in.training_split.descriptors;

% Concatenante them
datas = [ descriptors{1}; descriptors{2} ];

% Compute the mean
mu = mean( datas );

% Recenter both the training and the testing split
dataset_out = dataset_in;
dataset_out.training_split = RecenterSplit( dataset_out.training_split, mu );
dataset_out.testing_split  = RecenterSplit( dataset_out.testing_split,  mu );
end


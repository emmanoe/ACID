function [ dataset_out ] = ProjectDataset( dataset_in, W )
%PROJECTDATASET
%
% Projects the descriptors of the given 'dataset_in'
% using the given projection matrix 'W'.
%
% Arguments:
%     dataset_in (struct): The dataset whoes descriptors to project
%     W          (matrix): The matrix used to project the descriptors
%
% Returns:
%     dataset_out (struct): The dataset with projected descriptors
%

% Copy Dataset fields
dataset_out = dataset_in;

% Project the Splits
dataset_out.training_split = ProjectSplit( dataset_out.training_split, W );
dataset_out.testing_split  = ProjectSplit( dataset_out.testing_split,  W );
end


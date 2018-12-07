function [ models ] = TrainMAPClassifier( split )
% TRAINMAPCLASSIFER
%
% Computes the mean, variance and prior probability of each category of
% descriptors and creates a model for each category.
%
% Arguements:
%     split (struct): The split on which to train the model.
%
% Returns:
%     models (cells): Two cells cainting the two model strucutures
%                     of each category
%

% Fetch data
descriptors_1  = split.descriptors{ 1 };
descriptors_2  = split.descriptors{ 2 };
count_1        = split.counts{ 1 };
count_2        = split.counts{ 2 };
total          = split.total;

error( 'Fonction a implémenter' );
    
% model for the first category
models{1}.mu    = 0;
models{1}.sigma = 0;
models{1}.prior = 0;

% model for the second category
models{2}.mu    = 0;
models{2}.sigma = 0;
models{2}.prior = 0;
end


function [ accuracies ] = ComputeAccuracy( split, predictions )
% COMPUTEACCURACY Summary of this function goes here

% Fetch labels, count and compute total number of examples
labels = split.labels;
counts = split.counts;
total = counts{1}+counts{2};

% Compute one-hot arrays where 1 denote correct predictions
corrects{1} = predictions{1} == labels{1};
corrects{2} = predictions{2} == labels{2};

% Compute the error for each category
accuracies(1) = sum( corrects{1} / counts{1} * 100 );
accuracies(2) = sum( corrects{2} / counts{2} * 100 );
accuracies(3) = (accuracies(1) * counts{1} + accuracies(2) * counts{2}) / total;
end


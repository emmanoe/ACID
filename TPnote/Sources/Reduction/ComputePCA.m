function [ W ] = ComputePCA ( split, dims )
%COMPUTEPCA

% Number of examples
count = split.total;

% Fetch the descriptors
descriptors = split.descriptors;
datas = [descriptors{1}; descriptors{2}];

error( 'Fonction a implémenter' );

% Compute the scatter matrix
% scatter_matrix =

% Compute its egein vectors and eigen values
% [egein_vectors, egein_values] = 

% Sort the eigen values
% [~, indexes] = 
% indexes = 

% Deduce the projection matrix
% W =
end


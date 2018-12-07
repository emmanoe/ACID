function [ predictions ] = ClassifyWithMAP( models, descriptors )
% CLASSIFYWITHMAP
%
% Computes the maximum a posteriory probability that the given 
% descriptors belong to eath of the two given bayesian models.
%
% Arguments:
%     models       (cells): Two cells containing the two bayesian models
%     desctiptors (matrix): Matrix of size NxD containing the D descriptors
%                           of N examples.
%
% Returns:
%     predictions (array): Array of labels where ones denote examples
%                          belonging to the first model, and twos examples
%                          belonging to the second model.
%         

% model for the first category
mu_1    = models{1}.mu;
sigma_1 = models{1}.sigma;
prior_1 = models{1}.prior;

% model for the second category
mu_2    = models{2}.mu;
sigma_2 = models{2}.sigma;
prior_2 = models{2}.prior;

error( 'Fonction a implémenter' );

% compute posterior probabilities
% proba_1 = 0;
% proba_2 = 0;

% Binary decision
% predictions = 

% Assign labels
end


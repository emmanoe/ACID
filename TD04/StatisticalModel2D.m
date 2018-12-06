function [ model ] = StatisticalModel2D( examples )
    % TRAINMODEL
    % 
    % Computes statistics on the given set of examples and packs them in a
    % model
    %
    % Arguments:
    %     examples (matrix):
    %         A matrix containing the examples where the first
    %         dimension is the list of examples.
    %
    % Returns:
    %     model (struct):
    %          - mini (array): minimum value for each feature
    %          - maxi (array): minimum value for each feature
    %          - mean (array): mean value value for each feature
    %          - var  (array): variance for each feature
    %          - cov  (matrix): covariance matrix
    
    model.mini =  min( examples );
    model.maxi =  max( examples );
    model.mean = mean( examples );
    model.var  = sqrt( var( examples ) );
    model.cov  = cov( examples );
end


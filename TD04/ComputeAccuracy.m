function [error] = ComputeAccuracy( predictions, labels )
    % COMPUTEACCURACY
    %
    % Computes the mean average precision based on the given 'predictions' and 'labels'
    %
    % Arguments:
    %     predictions (array): array of predicted value
    %     labels      (array): array of labels
    %
    % Returns:
    %     error (double): The mean average precision
    %
    
    % Compute the number of examples
    count = size( labels, 1 );
    
    % Check hich one are incorrect
    corrects   = predictions == labels;
    nb_correct = sum( corrects );
    
    % Compute the mean error
    error = nb_correct / count;
end

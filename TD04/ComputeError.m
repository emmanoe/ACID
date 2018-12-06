function [error] = ComputeError( predictions, labels )
    % COMPUTEERROR
    %
    % Computes the mean error based on the given 'predictions' and 'labels'
    %
    % Arguments:
    %     predictions (array): array of predicted value
    %     labels      (array): array of labels
    %
    % Returns:
    %     error (double): The mean error
    %
    
    % Compute the number of examples
    count = size( labels, 1 );
    
    % Check hich one are incorrect
    incorects   = predictions ~= labels;
    nb_incorect = sum( incorects );
    
    % Compute the mean error
    error = nb_incorect / count;
end

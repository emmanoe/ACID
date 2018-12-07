function [ predictions ] = ClassifyWithPerceptron( line, descriptors, labels )
    % CLASSIFYWITHPERCEPTRON
    %
    % Look on wich side of the given 'line' the given 'descriptors' found
    % themself and assigns the 'labels(1)' to the ones on the negative side
    % and 'labels(2)' to the one on the positive side.
    %
    % Arguments:
    %     line         (Array): Coeficient of the line equation defined as
    %                           y = -( line(1) + x*line(2) ) / line(3)
    %     descriptors (Matric): The descriptors to classify
    %     labels       (Array): The labels of the two categories
    %
    % Returns:
    %      predictions (Array): The array containing the predicted label
    %      for each descriptors
    %
    
    % Fetch descriptors
    count = size( descriptors, 1 );
    
    
    
    % Add homogenous coordinate
	% descriptors_norm = 
    
     % Project the descriptors using the line to find their distance to it
    % projected = 
    
    % Apply decision using a thresholding
    % predictions = 
    
    % Assign labels
    % predictions( predictions == 0 ) = 
    % predictions( predictions == 1 ) = 
end


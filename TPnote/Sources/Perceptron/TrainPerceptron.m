function [ line ] = TrainPerceptron( split, line )
    % TRAINPERCEPTRON
    % 
    % Optimizes the given 'line' so that it better separates between the
    % data of the given 'split'.
    %
    % Arguments:
    %     split (struct): The training split
    %     line   (Array): Coeficient of the line equation defined as
    %                     y = -( line(1) + x*line(2) ) / line(3)
    %
    % Returns:
    %     line (Array): The coeficients of the line equation once optimized
    %

    % Fetch descriptors / counts
    descriptors_1 = split.descriptors{1};
    descriptors_2 = split.descriptors{2};
    counts_1      = split.counts{1};
    counts_2      = split.counts{2};
    
    error( 'Fonction a implémenter' );

    % Add ones in front of the descrptors and concatenate the two categories verticaly.
	% We want categoty 1 on the positive side and category 2 on the négative side
% 	descriptors_1_norm = 
% 	descriptors_2_norm = 
% 	descriptors        = 
    
    % Parameters (DO NOT CHANGE THEM!)
    eta     = 0.1;
	k       = 1;
    epsilon = 0.2;
    
    % Look for incorrectly placed Ys
%	incorrects = 
  
	% Minimize Criteria (Sum of the distances of incorectly placed Y to the line spaned by W)
%	s         = 
%	line_next = 
    
    % Run optimization until the L2 norm of two consecutive
    % line coeficients become larger than epsilon
%    while ( % > epsilon )
        
%        line       = line_next;
%         incorrects = 
%         s          = 
        k          = k + 1;
%        line_next  = 
%     end
    
    % Dont forget to assign the last itertion
%    line = line_next
end


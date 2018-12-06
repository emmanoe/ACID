function [ training_split, testing_split ] = SplitTrainAndTest( examples, proportion_for_training )
    % SPLITTRAINANDTEST
    % 
    % Splits the given examples into two sets: one for training and one for testing.
    % 
    % Arguments:
    %     examples (mat):
    %         A matrix containing the examples where the first
    %         dimension is the list of examples.
    %     proportion_for_training (double):
    %         The proportion of examples including in the training between 0 and 1.
    %         The proportion for testing is thus 1 - proportion_for_training.
    %  
    % Returns:
    %     training_split (mat):
    %         Matrix with the same shape as examples, but containing only
    %         the examples selected for training.
    %     training_split (mat):
    %         Matrix with the same shape as examples, but containing only
    %         the examples selected for testing.
    


    % Compute the number of examples
    count = size( examples, 1 );
    
    % Compute the index where training and testing are split
    index = floor( count * proportion_for_training );
    
    % Shuffle the indexes so that the examples are not simply split
    indexes = randperm(count);
    
    % Split the shuffled indexes
    training_indexes = indexes( 1 : index );
    testing_indexes  = indexes( index+1 : count );
    
    % Extract the corresponding indexes
    training_split = examples( training_indexes, : );
    testing_split  = examples( testing_indexes, : );
end


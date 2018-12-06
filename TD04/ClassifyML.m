function restults  = ClassifyML( examples, model_1, model_2 )
    % CLASSIFYML
    %
    % Classifies the given examples with respect to the two given models
    % using the Maximum Likelyhood method.
    %
    % Arguments:
    %     examples (matrix):
    %         A matrix containing the examples where the first
    %         dimension is the list of examples.
    %     model_1 (struct):
    %         structure obtained using STATISTICALMODEL
    %     model_2 (struct):
    %         structure obtained using STATISTICALMODEL
    %
    % Returns:
    %     results (list):
    %          A list where examples belonging to class 1 are marked with a
    %          1 and examples belonging to class 2 are marked with a 0.
    
    % compute the probability that a given example belong to each model
    probability_1 = normpdf( examples, model_1.mean, model_1.var );
    probability_2 = normpdf( examples, model_2.mean, model_2.var );

    % decide over the computed probabilities by taking the maximum
    restults = probability_1 >= probability_2;

end


function restults  = ClassifyML2D( examples, model_1, model_2 )
    % CLASSIFYMLND
    %
    % Classifies the given examples with respect to the two given models
    % using the Maximum Likelyhood method.
    %
    % Arguments:
    %     examples (matrix):
    %         A matrix containing the examples where the first
    %         dimension is the list of examples.
    %     model_1 (struct):
    %         structure obtained using STATISTICALMODEL2D
    %     model_2 (struct):
    %         structure obtained using STATISTICALMODEL2D
    %
    % Returns:
    %     results (list):
    %          A list where examples belonging to class 1 are marked with a
    %          1 and examples belonging to class 2 are marked with a 0.
    
    % compute the probability that a given example belong to each model
    probability_1 = mvnpdf( examples, model_1.mean, model_1.cov );
    probability_2 = mvnpdf( examples, model_2.mean, model_2.cov );

    % decide over the computed probabilities by taking the maximum
    restults = probability_1 >= probability_2;

end


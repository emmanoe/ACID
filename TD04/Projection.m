%% EXERCICE 1 : Analyse en composantes principales - ACP
function proj = Projection (W, Echantillon)
    %PROJECTION
    %
    % Return the vector result of the projection.
    %
    % Arguments:
    %     W (matrix): projection matrix from dimension d to dimension k
    %     Echantillon (vector): Data sample in dimension d
    %
    % Returns:
    %     proj (vector): vector result of the projection in dimension k
    %
    
    proj =  Echantillon'*W;
end
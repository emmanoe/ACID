%% EXERCICE 1 : Analyse en composantes principales - ACP
function [ V ] = CalculACP(echantillon)
    %CALCULACP
    %
    % Return the matrix which contain the sorted eigenvectors according to their eigenvalue.
    %
    % Arguments:
    %     echantillon (matrix): square matrix array of datas sample
    %
    % Returns:
    %     V (matrix): matrix which contain the sorted eigenvectors
    %   
    
    %Fetch eigenvalues and eigenvectors
    [vecteurs_propres,valeurs_propres]=eig(echantillon)
    
    %Add each eigenvalue at the top of their corresponding eigenvector matrix  
    V = diag(valeurs_propres);
    V = V.';
    V = [V;vecteurs_propres];
    
    %Sort the result V in descending order
    V = sortrows(V',1,'descend')';
    
    %Remove first line eigenvalue in the result V matrix
    V(1,:)=[];
end
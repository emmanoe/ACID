function [ pointMalPlaces ] = malPlaces( Y, W )
    Ym = W'*Y;
    
    ind = find(Ym <0);
    
    pointMalPlaces = Y(:,ind);
end


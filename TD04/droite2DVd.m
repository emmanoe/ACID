function [y] = droite2DVd(x,vd,p)
% calcul des points d'une droite etant donnes son vecteur directeur
% vd et un point de la droite p
    
y = (vd(2)/vd(1)) * (x- p(1)) + p(2);
end



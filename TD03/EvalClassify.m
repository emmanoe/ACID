function EvalClassify = eval()
%EvalClassify Create and test an classify from data (ground truth)  
%of VTSaumon and VTBar
    
    load('VTSaumonBar.mat')
    
    nbIter = 100;
    sizeTrain = 100;
    [sizeVTSaumon,~] = size(VTSaumon);
    [sizeVTBar,~] = size(VTBar);
    
    for i=1:nbIter
        TrainSaumonIndice = randperm(sizeVTSaumon, sizeTrain);
        TrainBarIndice = randperm(sizeVTBar,sizeTrain);
        TrainSaumon = VTSaumon(TrainSaumonIndice);
        TrainBar = VTBar(TrainBarIndice);
        muSaumonTrain = mean(TrainSaumon);
        sigmaSaumonTrain = sqrt(var(TrainSaumon));
        muBarTrain = mean(TrainBar);
        sigmaBarTrain = sqrt(var(TrainBar));
        TestBar = VTBar;
        TestSaumon = VTSaumon;
        ResBar = mle(TestBar,'distribution','norm');
        ResSaumon = mle(TestSaumon);
        nbBarErreur = size(ResBar,1)-sum(ResBar)
        nbSaumonErreur = sum(ResSaumon)
    end;
    
umonTrain);
        nbBarErreur = size(ResBar,1)-sum(ResBar);
        nbSaumonErreur = sum(ResSaumon);
    end;    
    disp(nbBarErreur);
    
% vector containing errors made at each iteration
% function allowing display an error curve according to the iteration

function [ Err ] = Entrain_Erreurs( Res )
% Res matrice carre si i == j on est sur la case juste le reste c'est de l'erreur
Err = zeros(1,size(Res,1));
somme = sum(Res,2);
% Somme ligne par ligne
for i = 1 : size(Res,1)
Err(i) = ((somme(i)-Res(i,i))/somme(i)) * 100;
end
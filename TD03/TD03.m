%% EXERCICE 1 : Vérité terrain

% VT = load('VTSaumonBar.mat');
% VTSaumon = VT.VTSaumon;
% VTBar = VT.VTBar;
% sizeVTSaumon = length(VTSaumon);
% sizeVTBar = length(VTBar);
% 
% close all
% hold on;
% histogram(VTSaumon);
% histogram(VTBar);
% 
%%%%%%%%%%%%%%%%VTAlzheimer%%%%%%%%%%%%
% close all
% hold on;
% load('VTAlzheimer2.mat')
%%plotmatrix(VTAD(:,1),VTAD(:,2),'*b')
%%plotmatrix(VTCN(:,1),VTAD(:,2),'*r')
%%title(BigAx,'Age et taille de l''hippocampe en % du volume global du cerveau classe CN )')
%%legend('groupe de malades','groupe de contrôle')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% EXERCICE 2 : Boucle d'évaluation d'un classifieur
% 
nbIter = 100;
sizeTrain = 100;
[sizeVTSaumon,~] = size(VTSaumon);
[sizeVTBar,~] = size(VTBar);
Saumon = 0;
Bar = 0;

vectErr = [0 0];
ErrSaumon = zeros(1,100);
ErrBar = zeros(1, 100);

for i=1:nbIter
    %%extraction de l’ensemble d’entraînement 
    TrainSaumonIndice = randperm(sizeVTSaumon, sizeTrain);
    TrainBarIndice = randperm(sizeVTBar,sizeTrain);
    
    %%entraînement
    TrainSaumon = VTSaumon(TrainSaumonIndice);
    TrainBar = VTBar(TrainBarIndice);
    
    muSaumonTrain = mean(TrainSaumon);
    sigmaSaumonTrain = sqrt(var(TrainSaumon));
    muBarTrain = mean(TrainBar);
    sigmaBarTrain = sqrt(var(TrainBar));
    
    %%test 
    TestSaumon = VTSaumon;
    TestBar = VTBar;
    
    %%Evaluation du classifieur Maximum Likelihood
%   ResBar = MyClassify(TestBar,muBarTrain,sigmaBarTrain,muSaumonTrain,sigmaSaumonTrain);
%   ResSaumon = MyClassify(TestSaumon,muBarTrain,sigmaBarTrain, muSaumonTrain,sigmaSaumonTrain);

    %%Evaluation du classifieur basée sur le «Maximum a Posteriori»
    ResBar = MyClassify2(TestBar,muBarTrain,sigmaBarTrain,muSaumonTrain,sigmaSaumonTrain,2/3,1/3);
    ResSaumon = MyClassify2(TestSaumon,muBarTrain,sigmaBarTrain, muSaumonTrain,sigmaSaumonTrain,2/3,1/3);

    %%Evaluation du classifieur bayésien
%     risque = [0 2 1 0];
%     ResBar = MyClassify3(TestBar,muBarTrain,sigmaBarTrain,muSaumonTrain,sigmaSaumonTrain,2/3,1/3,risque);
%     ResSaumon = MyClassify3(TestSaumon,muBarTrain,sigmaBarTrain, muSaumonTrain,sigmaSaumonTrain,2/3,1/3,risque);

    %%récupération des erreurs 
    nbBarErreur = size(ResBar,2)-sum(ResBar); %% Utiliser size(ResBar,1)-sum(ResBar) avec myClassify.
    nbSaumonErreur = sum(ResSaumon);
    
    Saumon = Saumon + nbSaumonErreur;
    Bar = Bar + nbBarErreur;
    
    %%vecteur contenant les erreurs commises à chaque itération
    vectErr = vectErr + [nbBarErreur nbSaumonErreur];
    
    ErrSaumon(i) = nbSaumonErreur;
    ErrBar(i) = nbBarErreur;
end  

%%fonction permettant d’afficher une courbe des erreurs en fonction de l’itération
close all
figure('Name', 'Evaluation du classifieur bayésien')
hold on;
plot(ErrSaumon)
plot(ErrBar)
hold off;
legend('Erreur Saumon','Erreur Bar','Location','east')

%%moyenne des erreurs
moyenneErr = vectErr / nbIter;

%MyClassify return a boolean vector wich indicate   
% if pBar > pSaumon (0,1)

function res = MyClassify(vt,mu1,sigma1,mu2,sigma2)
pBar = normpdf(vt,mu1,sigma1);
pSaumon = normpdf(vt,mu2,sigma2);

res = pBar > pSaumon;

end

% EXERCICE 3 : Classification MAP

function resPost = MyClassify2(test, mu1, sigma1, mu2, sigma2, probSaumon, probBar)
resPost = zeros(1, length(test));
for i=1:length(test)
    if(probBar*(normpdf(test(i), mu1, sigma1)) > probSaumon*(normpdf(test(i), mu2, sigma2)))
            resPost(i) = 1;
    end
end
end

function resBay = MyClassify3(test, mu1, sigma1, mu2, sigma2, probSaumon, probBar, risque)
resBay = zeros(1, length(test));
for i=1:length(test)
    R1 = risque(1)*probBar*(normpdf(test(i), mu1, sigma1))+risque(2)*probSaumon*(normpdf(test(i), mu2, sigma2));
    R2 = risque(3)*probBar*(normpdf(test(i), mu1, sigma1))+risque(4)*probSaumon*(normpdf(test(i), mu2, sigma2));
    if(R1 < R2)
            resBay(i) = 1;
    end
end
end



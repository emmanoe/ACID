%% --------------------------------------------------
clc;
clear;
close all;

%% --------------------------------------------------
% LOAD DATASET

% Data sample square matrix for ACP 
echantillon = [0.50 0.25;0.25 0.50];


%% --------------------------------------------------
%En utilisant un classifieur bayésien basé sur le maximum de vraisemblance,
%comparez les résultats obtenus avec les échantillons bruts (descripteur de dimension 2)
%et les résultats obtenus avec les échantillons projetés sur 
%l’axe de plus grande valeur propre (descripteur de dimension 1).

% --------------------------------------------------
% Maximum de vraissemblance 

%% Comparer erreur MyClassify2D et CalculACP
results_salmons = ClassifyML2D( salmons_for_testing, model_salmons, model_bars );
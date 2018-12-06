%% --------------------------------------------------
clc;
clear;
close all;

%% --------------------------------------------------
% LOAD DATASET
load('Dataset2D.mat');

% Load the dataset
dataset = load( 'Dataset2D.mat' );

% Fetch data of each class
salmons    = dataset.VTSaumon;
bars       = dataset.VTBar;
nb_salmons = size( salmons, 1 );
nb_bars    = size( bars, 1 );
nb_total   = nb_salmons + nb_bars;

% Compute statistics
model_salmons = StatisticalModel2D( salmons );
model_bars    = StatisticalModel2D( bars    );
mini = min( model_salmons.mini, model_bars.mini );
maxi = max( model_salmons.maxi, model_bars.maxi );
prior_salmons = nb_salmons / nb_total;
prior_bars    = nb_bars    / nb_total;

% Data sample square matrix for ACP 
%echantillon = [0.50 0.25;0.25 0.50];

%% --------------------------------------------------
%En utilisant un classifieur bayésien basé sur le maximum de vraisemblance,
%comparez les résultats obtenus avec les échantillons bruts (descripteur de dimension 2)

% --------------------------------------------------
% Maximum de vraissemblance 

% colors
light = 60;
color_salmons = [ 99, 169, 217] / 255;
color1 = ([ 99, 169, 217] - light) / 255;

% Settings
nb_iterations  = 100;

% Error buffer
error_bars_ML      = zeros( nb_iterations, 1 );
error_salmons_ML   = zeros( nb_iterations, 1 );
error_ML           = zeros( nb_iterations, 1 );

% Accuracy buffer
accuracy_bars_ML      = zeros( nb_iterations, 1 );
accuracy_salmons_ML   = zeros( nb_iterations, 1 );
accuracy_ML           = zeros( nb_iterations, 1 );
accuracy_bars_MAP     = zeros( nb_iterations, 1 );
accuracy_salmons_MAP  = zeros( nb_iterations, 1 );
accuracy_MAP          = zeros( nb_iterations, 1 );
accuracy_bars_risk    = zeros( nb_iterations, 1 );
accuracy_salmons_risk = zeros( nb_iterations, 1 );
accuracy_risk         = zeros( nb_iterations, 1 );

proportion_for_training = 0.1;

for i = 1 : nb_iterations
    
    % --------------------------------------------------
    % Split the examples into two groups (training, testing)
    
    [salmons_for_training, salmons_for_testing] = SplitTrainAndTest( salmons, proportion_for_training );
    [bars_for_training,    bars_for_testing]    = SplitTrainAndTest( bars,    proportion_for_training );
    nb_salmons_for_testing = size(salmons_for_testing, 1);
    nb_bars_for_testing    = size(bars_for_testing, 1);
    
    labels_salmons = ones(nb_salmons_for_testing, 1);
    labels_bars    = ones(nb_bars_for_testing,    1);
    
    % --------------------------------------------------
    % Compute statistics on the current batch
    
    model_salmons = StatisticalModel2D( salmons_for_training );
    model_bars    = StatisticalModel2D( bars_for_training    );
    mini          = min( model_salmons.mini, model_bars.mini );
    maxi          = max( model_salmons.maxi, model_bars.maxi );
    
    % --------------------------------------------------
    % Maximum de vraissemblance 

    results_salmons = ClassifyML2D( salmons_for_testing, model_salmons, model_bars );
    results_bars    = ClassifyML2D( bars_for_testing,    model_bars, model_salmons );
    
    % Compute Errors
    error_salmons = ComputeError( results_salmons, labels_salmons );
    error_bars    = ComputeError( results_bars,    labels_bars    );
    
    % Save errors
    error_salmons_ML(i) = error_salmons * 100;
    error_bars_ML(i)    = error_bars    * 100;
    error_ML(i)         = ( nb_salmons_for_testing * error_salmons_ML(i) + nb_bars_for_testing *  error_bars_ML(i) ) / ( nb_salmons_for_testing + nb_bars_for_testing );
   
    % Compute Accuracy
    accuracy_salmons = ComputeAccuracy( results_salmons, labels_salmons );
    accuracy_bars    = ComputeAccuracy( results_bars,    labels_bars    );
    
    % Save accuracy
    accuracy_salmons_ML(i) = accuracy_salmons * 100;
    accuracy_bars_ML(i)    = accuracy_bars    * 100;
    accuracy_ML(i)         = ( nb_salmons_for_testing * accuracy_salmons_ML(i) + nb_bars_for_testing *  accuracy_bars_ML(i) ) / ( nb_salmons_for_testing + nb_bars_for_testing );
    
end

% Maximum Likelihood
error_salmons_ML_mean    = mean( error_salmons_ML );
error_bars_ML_mean       = mean( error_bars_ML );
error_ML_mean            = mean( error_ML );
accuracy_salmons_ML_mean = mean( accuracy_salmons_ML );
accuracy_bars_ML_mean    = mean( accuracy_bars_ML );
accuracy_ML_mean         = mean( accuracy_ML );

%% --------------------------------------------------
% ERRORS

% Maximum Likelihood Error
f = figure;

% Salmons Error
subplot(3,3,1);
hold on;
bar( 0.5:100, error_salmons_ML, 1, 'FaceColor', color_salmons );
plot( [0,100], [error_salmons_ML_mean, error_salmons_ML_mean], 'LineWidth', 2, 'Color', color1 );
title( 'Salmons M.L. Error' );
legend( {'Salmons', 'Mean'}, 'Location', 'southeast' );
xlim([0 100])
ylim([0 50])
xlabel( 'Iteration' )
ylabel( 'Error %' )
hold off;

%et les résuvrailtats obtenus avec les échantillons projetés sur 
%l’axe de plus grande valeur propre (descripteur de dimension 1).

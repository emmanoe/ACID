%% 0 - ENVIRONMENT

% Clean matlab
clear all;
clc;
close all;

% Add subfolder to path
addpath( 'Bayesian' );
addpath( 'Perceptron' );
addpath( 'Plots' );
addpath( 'Projection' );
addpath( 'Recenter' );
addpath( 'Reduction' );

%LOAD THE DATASET
load( 'Dataset3D.mat' );

grade = 0;

%% 1 - PLOTS

% % PLOT DESCRIPTORS 3D
% f1 = PlotDescriptors3D( dataset_3d.training_split );
% saveas( f1, 'Outputs/Figure-01-Descriptors3D.png' );
% 
% PLOT DESCRIPTORS 2D
f2 = PlotDescriptors2D( dataset_3d.training_split, [1,2] );
f3 = PlotDescriptors2D( dataset_3d.training_split, [2,3] );
f4 = PlotDescriptors2D( dataset_3d.training_split, [1,3] );
saveas( f2, 'Outputs/Figure-02-Descriptors2D-12.png' );
saveas( f3, 'Outputs/Figure-03-Descriptors2D-23.png' );
saveas( f4, 'Outputs/Figure-04-Descriptors2D-13.png' );

% % PLOT DESCRIPTOR DISTRIBUTIONS
% f5 = PlotDistributions( dataset_3d.training_split );
% saveas( f5, 'Outputs/Figure-05-Distributions.png' );
% 
% %% 2 - MAP 3D
% 
% % Train two bayesian models on the training split
% models = TrainMAPClassifier( dataset_3d.training_split );
% 
% % Classify the descriptors of both categories
% predictions{1} = ClassifyWithMAP( models, dataset_3d.testing_split.descriptors{ 1 } );
% predictions{2} = ClassifyWithMAP( models, dataset_3d.testing_split.descriptors{ 2 } );
% 
% % Compute accuracies
% accuracies = ComputeAccuracy( dataset_3d.testing_split, predictions );
% PrintAccuracy( dataset_3d.testing_split, accuracies, 'MAP 3D' );
% 
% % Grade
% if ( CheckAccuracy(accuracies, [94.48, 94.23, 94.36] ) )
%     grade = grade + 3;
% end
% 
% %% 3 - MAP 2D MANUEL
% 
% % Define a manual projection matrix and project the dataset
% W = [0, 0; ...
%      0, 0; ...
%      0, 0];
% dataset_2d = ProjectDataset( dataset_3d, W );
% 
% % Train two bayesian models on the training split
% models = TrainMAPClassifier( dataset_2d.training_split );
% 
% % Classify the descriptors of both categories
% predictions{1} = ClassifyWithMAP( models, dataset_2d.testing_split.descriptors{1} );
% predictions{2} = ClassifyWithMAP( models, dataset_2d.testing_split.descriptors{2} );
% 
% % Compute accuracies
% accuracies     = ComputeAccuracy( dataset_2d.testing_split, predictions );
% PrintAccuracy( dataset_2d.testing_split, accuracies, 'MAP 2D' );
% 
% % Grade
% if ( CheckAccuracy(accuracies, [94.48, 94.23, 94.36] ) )
%     grade = grade + 3;
% end
% 
% %% 4 - MAP 2D PCA
% 
% % Recenter the dataset on (0,0,0)
% dataset_3d_centered = RecenterDataset( dataset_3d );
% 
% % Plot the distributions of the 3 descriptors
% PlotDistributions( dataset_3d_centered.training_split );
% 
% % Compute a projection matrix using PCA and project the dataset
% W              = ComputePCA( dataset_3d_centered.training_split, 2 );
% dataset_2d_pca = ProjectDataset( dataset_3d_centered, W );
% 
% % Plot the distributions of the 2 new descriptors
% PlotDistributions( dataset_2d_pca.training_split );
% 
% % Train two bayesian models on the training split
% models = TrainMAPClassifier( dataset_2d_pca.training_split );
% 
% % Classify the descriptors of both categories
% predictions{1} = ClassifyWithMAP( models, dataset_2d_pca.testing_split.descriptors{1} );
% predictions{2} = ClassifyWithMAP( models, dataset_2d_pca.testing_split.descriptors{2} );
% 
% % Compute accuracies
% accuracies     = ComputeAccuracy( dataset_2d_pca.testing_split, predictions );
% PrintAccuracy( dataset_2d_pca.testing_split, accuracies, 'PCA + MAP' );
% 
% % Grade
% if ( CheckAccuracy(accuracies, [93.72, 93.52, 93.62] ) )
%     grade = grade + 3;
% end
% 
% %% 5 - MAP 1D ICA
% 
% % Compute a projection matrix using ICA and project the dataset
% W              = ComputeICA( dataset_3d.training_split, 1 );
% dataset_2d_ica = ProjectDataset( dataset_3d, W );
% 
% % Plot the distributions of the 1 new descriptors
% PlotDistributions( dataset_2d_ica.training_split );
% 
% % Train two bayesian models on the training split
% models         = TrainMAPClassifier( dataset_2d_ica.training_split );
% predictions{1} = ClassifyWithMAP( models, dataset_2d_ica.testing_split.descriptors{1} );
% predictions{2} = ClassifyWithMAP( models, dataset_2d_ica.testing_split.descriptors{2} );
% 
% % Compute accuracies
% accuracies     = ComputeAccuracy( dataset_2d_ica.testing_split, predictions );
% PrintAccuracy( dataset_2d_ica.testing_split, accuracies, 'ICA + MAP' );
% 
% % Grade
% if ( CheckAccuracy(accuracies, [97.25, 97.00, 97.13] ) )
%     grade = grade + 3;
% end
% 
% %% 6 - PERCEPTRON
% 
% % Initial line equation
% line = [ 1; -4; 40 ];
% 
% % Plot the inital line on the scattered data
% PlotDescriptors2DAndLine( dataset_2d.training_split, line );
% 
% % Optimize the line equation using the perceptron
% line = TrainPerceptron( dataset_2d.training_split, line );
% 
% % Plot the resulting line on the scattered data
% PlotDescriptors2DAndLine( dataset_2d.training_split, line );
% 
% % Classify the two set of descriptiors using the line
% predictions{1} = ClassifyWithPerceptron( line, dataset_2d.testing_split.descriptors{1}, [1, 2] );
% predictions{2} = ClassifyWithPerceptron( line, dataset_2d.testing_split.descriptors{2}, [2, 1] );
% 
% % Compute accuracy
% accuracies     = ComputeAccuracy( dataset_2d.testing_split, predictions );
% PrintAccuracy( dataset_2d.testing_split, accuracies, 'Perceptron' );
% 
% % Grade
% if ( CheckAccuracy(accuracies, [95.65, 100, 97.83] ) )
%     grade = grade + 3;
% end
% 
% %% Grade:
% 
% fprintf( 'Grade without plots: %3d / 20\n', grade );
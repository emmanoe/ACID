function [f] = PlotDistributions( split )
    % PLOTDISTRIBUTIONS
    %
    % Displays the distribution of all the descriptors in the given 'split'
    % in separate histogram subplots.
    % 
    % Arguments:
    %     split (struct): The split whoes descriptors to plot
    
    % Fetch split fields
    descriptors_1 = split.descriptors{ 1 };
    descriptors_2 = split.descriptors{ 2 };
    minimums      = split.minimums;
    maximums      = split.maximums;
    headers       = split.headers;
    names         = split.names;
    dims          = split.dims;
    
    % Plot settings
    face_color_1 = [252, 151, 113] / 255;
    face_color_2 = [ 99, 169, 217] / 255;
    edge_color_1 = face_color_1 - (60 / 255);
    edge_color_2 = face_color_2 - (60 / 255);
    nb_bins      = 32;
    face_alpha   = 0.9;
    
    mini = min( minimums(:,1), minimums(:,2) );
    maxi = max( maximums(:,1), maximums(:,2) );
    
    % axis used for plots
    x = mini : 0.1 : maxi;
    
    % Computes statistics of the descriptors_1 set
    model_descriptors_1.mini = minimums(:,1);
    model_descriptors_1.maxi = maximums(:,1);
    model_descriptors_1.mean = mean(descriptors_1);
    model_descriptors_1.var = sqrt(var(descriptors_1));
    
    % Computes statistics of the descriptors_2 set
    model_descriptors_2.mini = minimums(:,2);
    model_descriptors_2.maxi = maximums(:,2);
    model_descriptors_2.mean = mean(descriptors_2);
    model_descriptors_2.var = sqrt(var(descriptors_2));
    
    % Calculate the distribution values
    normpdf_descriptors_1 = normpdf( x, model_descriptors_1.mean, model_descriptors_1.var );
    normpdf_descriptors_2    = normpdf( x, model_descriptors_2.mean, model_descriptors_2.var    );
    
    % Draw the plot
    f = figure;
    hold on;
    % Datas
    histogram( descriptors_1, nb_bins, 'Normalization', 'pdf', 'BinWidth', 0.5 );
    histogram( descriptors_2, nb_bins, 'Normalization', 'pdf', 'BinWidth', 0.5 );
    plot( x, normpdf_descriptors_1, 'LineWidth',2, 'Color', face_color_1 );
    plot( x, normpdf_descriptors_2, 'LineWidth',2, 'Color', face_color_2 );
 
    % settings
    xlim( [minimums(1), maximums(1)] );
    xlabel(headers{1})
    ylabel(headers{2})
    legend(names{1},names{2});
    
    for i = 1 : dims
        subplot( dims, 1, i );
    end
end


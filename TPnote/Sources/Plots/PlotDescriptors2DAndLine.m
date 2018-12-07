function [f] = PlotDescriptors2DAndLine( split, line )
    % PLOTDESCRIPTORS2DANDLINE
    %
    % Plots a 2D scatter point cloud of the descriptors against each other 
    % and draws the given separation line on top of it.
    %
    % Arguments:
    %     split (struct): The split whoes descriptors to display
    %     line   (Array): Line coeficients defines as
    %                     y = -( line(1) + x*line(2) ) / line(3)
    %
    
    % Fetch split fields
    descriptors_1 = split.descriptors{ 1 };
    descriptors_2 = split.descriptors{ 2 };
    minimums      = split.minimums;
    maximums      = split.maximums;
    headers       = split.headers;
    names         = split.names;
    titletext     = sprintf( '2D Scatter plot of the descriptors of the %s split', split.title );
    
    % Add a name for the line in the legend
    names{end+1} = 'Line';
    
    % Compute several points on the line
    x = linspace( minimums(1), maximums(1), 1000 );
    y = -( line(1) + x * line(2) ) / line(3);
    
    % Plot settings
    marker_line_color_1 = [252, 151, 113] / 255;
    marker_line_color_2 = [ 99, 169, 217] / 255;
    marker_edge_color_1 = marker_line_color_1 - (60 / 255);
    marker_edge_color_2 = marker_line_color_2 - (60 / 255);
    line_color          = [196, 31, 53] / 255;
    scatter_line_width  = 1;
    line_width          = 2;
    
    % Draw the plot
    f = figure;
    warning( 'Fonction a implémenter' );
end


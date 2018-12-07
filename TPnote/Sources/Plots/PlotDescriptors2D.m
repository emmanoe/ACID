function [f] = PlotDescriptors2D( split, dims )
    % PLOTDESCRIPTORS2D
    %
    % Plots a 2D scatter point cloud of the descriptors against each other.
    %
    % Arguments:
    %     split (struct): The split whoes descriptors to display
    %     dims   (Array): Array containing the indexes of the two
    %                     descriptors to display agains each other
    %

    % Fetch split fields
    descriptors_1 = split.descriptors{ 1 };
    descriptors_2 = split.descriptors{ 2 };
    minimums      = split.minimums;
    maximums      = split.maximums;
    headers       = split.headers;
    names         = split.names;
    titletext     = sprintf('2D Scatter plof of two descriptors of the %s split', split.title );

    % Plot settings
    marker_face_color_1 = [252, 151, 113] / 255;
    marker_face_color_2 = [ 99, 169, 217] / 255;
    marker_edge_color_1  = marker_face_color_1 - (60 / 255);
    marker_edge_color_2  = marker_face_color_2 - (60 / 255);
    line_width = 1;
     
    % Draw the plot
    f = figure;
    scatter2( descriptors_1(:,1), descriptors_1(:,2),'MarkerFaceColor', marker_face_color_1, 'MarkerEdgeColor', marker_edge_color_1, 'LineWidth', line_width);
    scatter2( descriptors_2(:,1), descriptors_2(:,2), 'MarkerFaceColor', marker_face_color_2, 'MarkerEdgeColor', marker_edge_color_2, 'LineWidth', line_width);
    % Settings
    xlabel(headers{1});
    ylabel(headers{2});
    xlim( [minimums(1), maximums(1)] );
    ylim( [minimums(2), maximums(2)] );
    title(titletext);
    hold off;
    legend(names{1},names{2});
end
function [f] = PlotDescriptors3D( split )
    % PLOTDESCRIPTORS3D
    %
    % Displays a 3D scatter plot of the descritors of the two category
    % found in the given 'split.
    %
    % Arguments:
    %     split (struct): The split whoes descriptors to display
    %

    % Fetch split fields
    descriptors_1 = split.descriptors{ 1 };
    descriptors_2 = split.descriptors{ 2 };
    minimums  = split.minimums;
    maximums  = split.maximums;
    headers   = split.headers;
    names     = split.names;
    titletext = sprintf('3D Scatter plof the descriptors for the %s split', split.title );
    
    % Plot settings
    marker_face_color_1 = [252, 151, 113] / 255;
    marker_face_color_2 = [ 99, 169, 217] / 255;
    marker_edge_color_1  = marker_face_color_1 - (60 / 255);
    marker_edge_color_2  = marker_face_color_2 - (60 / 255);
    line_width = 1;
    view_orientation = [-30, 30];
    
    % Draw the plot
    f = figure;
    hold on;
    % Plot data as point cloud
    scatter3( descriptors_1(:,1), descriptors_1(:,2), descriptors_1(:,3),'MarkerEdgeColor', marker_edge_color_1, 'MarkerFaceColor', marker_face_color_1, 'LineWidth', line_width);
    scatter3( descriptors_2(:,1), descriptors_2(:,2), descriptors_2(:,3),'MarkerEdgeColor', marker_edge_color_2, 'MarkerFaceColor', marker_face_color_2, 'LineWidth', line_width);
    % Settings
    xlabel(headers(:,1));
    ylabel(headers(:,2));
    zlabel(headers(:,3));
    xlim( [minimums(1), maximums(1)] );
    ylim( [minimums(2), maximums(2)] );
    title(titletext);
    view(view_orientation);
    hold off;
    legend(names{1},names{2})
end


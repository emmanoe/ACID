function [ split_out ] = ProjectSplit( split_in, W )
% PROJECTSPLIT
%
% Projects the descriptors of the given 'split_in'
% using the given projection matrix 'W'.
%
% Arguments:
%     split_in (struct): The split whoes descriptors to project
%     W        (matrix): The matrix used to project the descriptors
%
% Returns:
%     split_out (struct): The split with projected descriptors
%

% Copy Split fields
split_out = split_in;

% Project Descriptors
split_out.descriptors{1} = ProjectDescriptors( split_out.descriptors{1}, W );
split_out.descriptors{2} = ProjectDescriptors( split_out.descriptors{2}, W );

% Dims update
split_out.dims = size(W, 2);

% Minimum / Maximum
mini_1 = min( split_out.descriptors{1} );
maxi_1 = max( split_out.descriptors{1} );
mini_2 = min( split_out.descriptors{2} );
maxi_2 = max( split_out.descriptors{2} );
mini   = min( mini_1, mini_2 );
maxi   = max( maxi_1, maxi_2 );
split_out.minimums = mini;
split_out.maximums = maxi;

% Headers
headers = cell(split_out.dims,1);
for i = 1 : split_out.dims
    headers{ i } = sprintf( 'Projection N°%d', i );
end
split_out.headers = headers;


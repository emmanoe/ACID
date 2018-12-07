function [ split_out ] = RecenterSplit( split_in, mu )
%RECENTERSPLIT

split_out = split_in;
split_out.descriptors{1} = RecenterDescriptors( split_out.descriptors{1}, mu );
split_out.descriptors{2} = RecenterDescriptors( split_out.descriptors{2}, mu );

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
    headers{ i } = sprintf( 'Recentered %s', split_out.headers{i} );
end
split_out.headers = headers;
end


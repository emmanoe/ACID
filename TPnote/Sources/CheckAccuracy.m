function [ ok ] = CheckAccuracy( computed, expected )
%CHECKACCURACY
differences = abs( round(computed,2) - expected );
ok = sum( differences ) < 0.06;
end


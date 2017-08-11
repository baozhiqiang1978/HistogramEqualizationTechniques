function [outI] = udionHE( inI )
%udionHE Summary of this function goes here
%   Detailed explanation goes here
    [counts, binLocs] = imhist(inI);
    cdf = cumsum(counts)/sum(counts);
    %to avoid indexing array problem I will replace all the
    %zeros to ones
    inI(inI == 0) = 1;
    % i--->cdf(i)
    outI = cdf(inI);
end


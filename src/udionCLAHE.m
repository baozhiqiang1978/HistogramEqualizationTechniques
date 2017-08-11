function [outI] = udionCLAHE(inI,n,thresh)
%udionCLAHE implements the CLAHE algorithm 
%using udionClip() and AHEcdf()
%   Detailed explanation goes here
    [counts, binLocs] = imhist(inI);
    %assume thresh to be in 0 to 1
    a = max(counts);
    [counts, binLocs] = udionClip(counts, binLocs, thresh*a);
    cdf = cumsum(counts)/sum(counts);
    outI = udionAHEcdf(inI,n,cdf);
end


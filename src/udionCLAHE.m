function [outI] = myCLAHE(inI,n,thresh)
%MYCLAHE implements the CLAHE algorithm 
%using myClip() and AHEcdf()
%   Detailed explanation goes here
    [counts, binLocs] = imhist(inI);
    %assume thresh to be in 0 to 1
    a = max(counts);
    [counts, binLocs] = myClip(counts, binLocs, thresh*a);
    cdf = cumsum(counts)/sum(counts);
    outI = myAHEcdf(inI,n,cdf);
end


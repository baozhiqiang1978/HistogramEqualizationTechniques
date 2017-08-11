function [counts_out, binLocs_out] = udionClip(counts, binLocs, thresh)
%udionCLIP helps in clahe, clips the given histogram
%according to prescription given in clahe algo 
%   Detailed explanation goes here
    binLocs_out = binLocs;
    overflow = 0;
    [n_counts,v] = size(counts);
    [n_bins,v] = size(binLocs);
    for i = 1:n_counts
        if(counts(i)>thresh)
            overflow = overflow + counts(i)-thresh;
            counts(i) = thresh;
        end
    end
    f = floor(overflow/n_bins);
    adjust = ones(size(binLocs))*f;
    counts_out = counts+adjust;
end


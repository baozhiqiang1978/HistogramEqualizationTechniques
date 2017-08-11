function [outI] = udionAHE(inI, n)
%udionAHE implements the AHE algo, by 
%iterating over all pixels
%   Detailed explanation goes here
    [h,w] = size(inI);
    p = ceil((n-1)/2);
    p_ = floor((n-1)/2);
    aheI = double(zeros(h,w));
    for i = 1:h
        for j = 1:w
            lowi = max(1,i-p);
            highi = min(h,i+p_);
            lowj = max(1,j-p);
            highj = min(w,j+p_);
            
            tile = inI(lowi:highi, lowj:highj);      
            HEtile = udionHE(tile);
            [hh,ww] = size(HEtile);
            if i<=p
                x=i;
            elseif h-p_+1<=i & i<=h
                x=p;
            else
               x = ceil(hh/2);
            end
            if j<=p
                y=j;
            elseif w-p_+1<=j & j<=w
                y=p;
            else
                y = ceil(ww/2);
            end
            aheI(i,j) = HEtile(x,y);
        end
    end
    outI = aheI;
end
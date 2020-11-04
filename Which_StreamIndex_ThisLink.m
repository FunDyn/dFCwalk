function index = Which_StreamIndex_ThisLink(i,j, dFCstream)

% FUNCTION index = Which_StreamIndex_ThisLink(i,j, dFCstream)  
% returns theordinal index of a link in the vector representation of a 
% symmetric FC matrix, where the maximum value for (i,j) is equal to the 
% number of regions. 
% NB: j must be strictly larger than i for this conversion to make sense.
% If j < i is provided link is computed supposing that (i,j) = (j,i)

M = size(dFCstream,1);
nregions = (1+sqrt(1+8*M))/2;


if max(i,j)>nregions
    disp('please provide valide values! max(i|j) = numer of regions')
else
    if (j <= i)
        inew = j;
        j = i;
        i = inew;
    end
    
    index = (i-1)*nregions -sum(0:(i-1)) + j-i;
end


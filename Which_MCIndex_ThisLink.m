function index = Which_MCIndex_ThisLink(i,j, MC)

% FUNCTION index = Which_MCIndex_ThisLink(i,j) returns the ordinal index of a
% link in the meta-connectivity (MC) representation of a directed link from i to j.

M = size(MC,1);
nregions = (1 + sqrt(1+4*M))/2;

if (i == j)
    disp('Careful! Slef-loops are excluded from MC representation!')
    return
end
if (max(i,j) > nregions)
    disp('Careful! You are giving an index bigger than the number of regions!')
    return
end
if (j < i)
	suffix = j;
end
if (j > i)
	suffix = j-1;
end
index = (nregions-1)*(i-1) + suffix;

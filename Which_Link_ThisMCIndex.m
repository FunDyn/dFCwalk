function link = Which_Link_ThisMCIndex(index, MC)

% FUNCTION link = Which_Link_ThisMCIndex(index, MC) returns the directed
% link i=link(1) to j=link(2) corresponding to index in the meta-connectivity
% (MC) representation.


M = size(MC,1);
nregions = (1 + sqrt(1+4*M))/2;
if index > M
    disp('please provide valide value for index!')
else
link = zeros(1,2);
i = ceil(index/(nregions-1)); 
suffix = index-(nregions-1)*(i-1);
if (suffix >=i)
    j = suffix + 1;
else
    j = suffix;
end

link(1) = i;
link(2) = j;
end
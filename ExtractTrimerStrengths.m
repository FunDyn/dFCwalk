function TrimerStrengths = ExtractTrimerStrengths(MC, entries_list)
% FUNCTION TrimerStrengths = ExtractTrimerStrengths(MC, nregions, entries_list);
%
% This function takes as compulsory input: i) a MC matrix; ii) a number of
% regions nregions
% As optional argument one can also give a list of entries to limit the
% calculation on (e.g. the list of links in a dFC module, coming from a
% modular extraction from MC). The default is all links (unrestricted MC).
% 
% The output TrimerStrengths is a vector of size nregions of the
% TrimerStrengths of the nregions regions under the choice of (module-restricted) MC

if (nargin < 2)
    entries_list = 1:size(MC,1);
end

TableLinks = zeros(length(entries_list),2);
for l = 1:length(entries_list)
    TableLinks(l,:) = Which_Link_ThisMCIndex(entries_list(l), MC);
end
TableLinks = TableLinks(TableLinks(:,2) > TableLinks(:,1),:);

ll = size(MC,1);
nregions = (1+sqrt(1+4*ll))/2;
TrimerStrengths = zeros(1,nregions);
Regions_start = unique(TableLinks(:,1));
for r = 1:size(Regions_start)
    r_start = Regions_start(r);
    wo_start = find(TableLinks(:,1) == r_start); %links having a certain region as start
    %All MC trimers will be pairs of links into this list of links
    %starting from a region!
    for i = 1:length(wo_start)
        x = wo_start(i);
        woMC_x = Which_MCIndex_ThisLink(TableLinks(x,1),TableLinks(x,2), MC);
        for j = [1:(i-1), (i+1):length(wo_start)]
            y = wo_start(j);
            woMC_y = Which_MCIndex_ThisLink(TableLinks(y,1),TableLinks(y,2), MC);
            TrimerStrengths(r_start) = TrimerStrengths(r_start) + MC(woMC_x, woMC_y);
        end
    end
end
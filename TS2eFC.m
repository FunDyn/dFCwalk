function eFC = TS2eFC(TS)

% FUNCTION eFC = TS2eFC(TS)
% takes time-series (TS) as input and calculates edge functional connectivity
% (eFC) as output.
%
% inputs: TS(t,n) --> rows are t different time-points;
%                     columns are n different regions;
%                
% Example: efc = TS2eFC(ts)

t = size(TS,1); % length of time-serie
n = size(TS,2); % number of nodes
l = n*(n-1)/2;  % number of links

CN = nchoosek(1:n,2);

zTS = zscore(TS')'; 
stream = zeros(t,l);

for i = 1:length(CN)
    stream(:,i) = zTS(:,CN(i,1)).*zTS(:,CN(i,2));
end

eFC = corr(stream);

end


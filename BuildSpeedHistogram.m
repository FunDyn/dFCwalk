function Histo = BuildSpeedHistogram(Speeds, Bins, plotting)

% FUNCTION [BinCenters, BinCounts, BinCounts_low, Bincounts_high] = BuildSpeedHistogram(Speeds, Bins, plotting)
% This function takes as compulsory input: Speeds, a temporally ordered or
% disordered time-serie of dFC_Speeds and constructs an histogram of the speed
% distribution. An optional argument Bins can be given. If Bins is an
% integer then it is used to build bins in the provided number. If Bins is
% a vector, its entries are used as BinCenters.
% A third argument plotting = 0 can be given to suppress the production of
% the plot.
%
% BuildSpeedHistogram always computes a polygon plot of the speed
% distribution. An optional output arguments can be given in order to
% regenerate this plot. Then the output Histo is a structure containing the
% following fields:
%
% BinCenters = the centers of the used bins
% BinCounts = the height of the bars
% BinCounts_low and _high = the lower and higehr confidence interval for
% the counts
%
% Example: histo = BuildSpeedHistogram(Speeds,10)

if (nargin < 1)
    disp('You should provide at least a list of dFC speeds')
    return
end
if (nargin < 2)
    Bins = 20;
end
if (nargin < 3)
    plotting = 1;
end

% concretely compute, normalize and store the dists histogram
[Y,X] = hist(Speeds,Bins); 
yyy = Y;
Y = Y./(sum(Y)*(X(2)-X(1)));

Histo.BinCenters = X;
Histo.BinCounts = Y;

% Agresti-Coull Interval calculation
% Agresti, Alan; Coull, Brent A. (1998). "Approximate is better than 'exact'
% for interval estimation of binomial proportions".
% The American Statistician 52: 119-126. doi:10.2307/2685469
nnn = 8*length(Speeds);
nn95 = nnn + 3.84;
yy95 = (8*yyy + 0.5*3.84)/nn95;
delta95 = sqrt(3.84*yy95.*(1-yy95)/nn95);
Histo.BinCounts_low = (yy95-delta95)/(X(2)-X(1));
Histo.Bincounts_high = (yy95+delta95)/(X(2)-X(1));

if (plotting)
    figure
    PlotSpeedHisto(Histo)
    xlabel 'dFC speed'
    ylabel 'Frequency'
end
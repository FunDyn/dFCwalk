function FC = TS2FC(TS, format)

% FUNCTION FC = TS2FC(TS, format)
% takes time-series (TS) as input and calculates static functional connectivity
% (FC) as output.
%
% inputs: TS(t,n) --> rows are t different time-points;
%                     columns are n different regions;
%         format  --> '2D' (default) provides a square [n]x[n] FC matrix;
%                     '1D' provides the lower-triangular portion of the
%                      FC matrix as [n(n-1)/2]x[1] column vector;
%
% Example: fc = TS2FC(ts,'1D')

if (nargin < 2)
    format = '2D';
end
if (~strcmp(format, '1D'))
    format = '2D';
end

n = size(TS,2);
xo = find(tril(ones(n),-1));

FCm = corr(TS);
FCv = FCm(xo);

if(strcmp(format, '1D'))
    FC = FCv;
else
    FC = FCm;
end

end

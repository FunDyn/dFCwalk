function dFCstream = TS2dFCstream(TS, W, lag, format)

% FUNCTION dFCstream = TS2dFCstream(TS, W, lag, format)
% takes time-series (TS), size of window (W), and value of shift of window
% (lag) as input and calculates dynamic functional connectivity stream
% (dFCstream) as output.
%
% inputs: TS(t,n) --> rows are t different time-points;
%                     columns are n different regions;
%         W       --> size of window to slide;
%         lag     --> shifting value, default is lag=W;
%         format  --> '2D' (default) provides a [l]x[F] dFCstream
%                     (FC vector over time) where l=n(n-1)/2 is the number
%                     of links for n regions and F is the number of frames
%                      depending on values of (t,W,lag);
%                     '3D' provides a [n]x[n]x[F] dFCstream (FC matrix
%                     over time).
%
% Example: dfcstream = TS2dFCstream(ts,10,10,'2D')
% Example: dfcstream = TS2dFCstream(ts,10,[],'2D')
% computes the dFCstream with window size 10 and without overlap between
% windows. Since lag assumes a value equal to the default one and the
% default is '2D', the syntax above is equivalent to the simpler syntax below:
% Example: dfcstream = TS2dFCstream(ts,10)

if ~exist('W','var') || isempty(W)
    disp('Provide at least a window size!!!')
    return
end
if ~exist('lag','var') || isempty(lag)
    lag = W;  % default value for the size of sliding window if no argument for it is given
end
if ~exist('format','var') || isempty(format)
    format = '2D';
end

t = size(TS,1);
n = size(TS,2);
l = n*(n-1)/2;

% calculate F
wstart = 1;
wstop = W;
k = 0;
while (wstop <= t)
    k = k+1;
    wstart = wstart + lag;
    wstop = wstop + lag;
end
kmax = k;

% preallocate the dFCstream
if (strcmp(format, '3D'))
    dFCstream = zeros(n,n,kmax);
else
    dFCstream = zeros(l,kmax);
end

if (strcmp(format, '3D'))
    
    wstart = 1;
    wstop = W;
    k = 0;
    while (wstop <= t)
        k = k+1;
        % compute FC matrix for each lag column between wstart and wstop
        dFCstream(1:n, 1:n, k) = TS2FC(TS(wstart:wstop, :), '2D');
        wstart = wstart + lag;
        wstop = wstop + lag;
    end
    
else
    
    wstart = 1;
    wstop = W;
    k = 0;
    while (wstop <= t)
        k = k+1;
        % compute FC vector for each lag column between wstart and wstop
        dFCstream(:, k) = TS2FC(TS(wstart:wstop, :), '1D');
        wstart = wstart + lag;
        wstop = wstop + lag;
    end
    
end

function TS_rnd = PhaseRand_surrogates(TS, value)

% FUNCTION TS_rnd = PhaseRand_surrogates(TS, value)
% takes time-series (TS) and type of randomization (value) as inputs and 
% provides phase-randomized TS as output.
%
% inputs: TS(t,n) --> rows are t different time-points;
%                     columns are n different regions;
%         value   --> '1' (default) phases are coherently randomized, i.e.
%                     to preserve the same sample covariance matrix as the
%                     original TS(thus randomizing dFC, but not FC)
%                     '0' phases are incoherently randomized (thus randomizing
%                     both dFC and FC)
%                
% PS: thanks to R. Hindriks for providing the code
% (cf. Hindriks R, et al. (2016) Can sliding-window correlations reveal 
% dynamic functional connectivity in resting-state fMRI? NeuroImage
% 127:242?256.)


if (nargin < 2)
    value = 1;
end


[N,M] = size(TS);
s = fft(TS); %apply FFT

if value == 0
    phase_rnd=zeros(N,M);
    phase_rnd(1,1:M)=0;
    if (odd(N)==1)
        ph=2*pi.*rand(M,(N-1)/2)-pi;
        phase_rnd(2:N,1:M)=[ph';-flipdim(ph,2)'];
    end
    if (odd(N)==0)
        ph(1:M,1:(N-2)/2)=2*pi.*rand(M,(N-2)/2)-pi;
        phase_rnd(2:N,1:M)=[ph';zeros(1,M);-flipdim(ph,2)'];
    end
    
    %randomize the phases of all columns of s
    for m=1:M
    s_rnd(:,m) = abs(s(:,m)).*exp(i.*(angle(s(:,m)) + phase_rnd(:,m)));
    s_rnd(1,m) = s(1,m); %to make sure that s_rnd(1) is real 
    end
end

if value == 1 
    %construct (conjugate symmetric) array of random phases
    phase_rnd = zeros(N,1);
    %define first phase
    phase_rnd(1) = 0;
    if (odd(N) == 1)
        ph = 2*pi.*rand(1,(N-1)/2) - pi; 
        phase_rnd(2:N) = [ph,-flipdim(ph,2)];
    end
    if (odd(N) == 0)
        ph(1:(N-2)/2) = 2*pi.*rand(1,(N-2)/2) - pi;
        phase_rnd(2:N) = [ph,0,-flipdim(ph,2)];
    end
    
    %randomize the phases of all columns of s
    s_rnd = zeros(N,M); %initialization
    for m=1:M
        %s_rnd(:,m) = abs(s(:,m)).*exp(i.*(angle(s(:,m)) + phase_rnd(:,m)));
        s_rnd(:,m) = abs(s(:,m)).*exp(i.*(angle(s(:,m)) + phase_rnd));
        s_rnd(1,m) = s(1,m); %to make sure that s_rnd(1) is real 
    end
end

%apply inverse FFT
TS_rnd = ifft(s_rnd,'symmetric'); %use "symmetric" because of round-off errors

%define output
output = TS_rnd;

%---------------------------------------------------------
% o = odd(n) equals 1 if n is odd, 0 if n is even
function outp = odd(n)

for i = 1:round(n/2)
    if (2*i == n)
        outp = 0;
    else 
        outp = 1;
    end
end

if (n == 0)
    outp = 0;
end
end
%---------------------------------------------------------

end


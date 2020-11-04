function [MI, H, P1, P2, P12] = Mutual_Information_Labels(S1, S2)

% FUNCTION [MI, H, P1, P2, P12] = Mutual_Information_Labels(S1, S2)
% This function takes as input two sequences of integer labels S1 and S2
% (should have the same length) and returns as main output the Shannon mutual
% information between the two sequences. Optional output arguments can be:
% the largest entropy H among the two sequence entropies (to compute relative
% mutual information, MI/H); the probability distributions P1 (or P2) over 
% labels for the sequences S1 and S2, in vector form; the joint probability 
% distribution P12 of labels for the two sequences (in matrix form).
%
% Example application may include calculations of mutual information
% between module assignements into a modular analysis of FC or MC, or
% mutual information between clusters of FC(t), if a clustering of a
% dFCstream is performed to extract "hard" FC states

if (min(S1) > 1)
    S1 = S1-min(S1)+1;
end
if (min(S2) > 1)
    S2 = S2-min(S2)+1;
end
m1 = max(S1);
m2 = max(S2);

T = min(length(S1), length(S2));

P1 = zeros(1,m1);
P2 = zeros(1,m2);
P12 = zeros(m1,m2);

for t = 1:T
    P1(S1(t)) = P1(S1(t))+1;
    P2(S2(t)) = P2(S2(t))+1;
    P12(S1(t), S2(t)) = P12(S1(t), S2(t))+1;
end
P1 = P1/sum(P1);
P2 = P2/sum(P2);
P12 = P12/sum(sum(P12));

H1 = 0;
for s = 1:m1
    if (P1(s) > 0)
        H1 = H1 - P1(s)*log(P1(s));
    end
end
H2 = 0;
for s = 1:m2
    if (P2(s) > 0)
        H2 = H2 - P2(s)*log(P2(s));
    end
end
H = max(H1,H2);

MI = 0;
for s1 = 1:m1
    if (P1(s1) > 0)
        for s2 = 1:m2
            if (P2(s2) > 0)
                if (P12(s1,s2) > 0)
                    MI = MI + P12(s1,s2)*log(P12(s1,s2)/(P1(s1)*P2(s2)));
                end
            end
        end
    end
end
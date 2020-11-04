function Starstream = Pick_StarStream(dFCstream, region)

% FUNCTION Starstream = Pick_StarStream(dFCstream, region)
% This function takes as input: i) dFCstream is a dFCstream object generated by
% TS2dFCstream, in either 2D or 3D formats;
% ii) region is the index of a region which is the center of the sequence of star
% graphs that one wants to extract.
% The output Starstream (always in vector format, independently from input
% format) is the stream of stars extracted from dFCstream

invalidstream = 1;

if (ndims(dFCstream) == 3)   
    nregions = size(dFCstream,1);
    nslices = size(dFCstream, 3);
    Starstream = zeros((nregions-1), nslices);
    for k = 1:nslices
        Starstream(1:(nregions-1), k) = squeeze(dFCstream([1:(region-1), (region+1):nregions], region, k));
    end
    invalidstream = 0;
end

if (ndims(dFCstream) == 2)   
    nregions = (1 + sqrt(1+8*size(dFCstream,1)))/2;
    nslices = size(dFCstream, 2);
    Starstream = zeros((nregions-1), nslices);
    
    GoodRows = zeros((nregions-1),1);
    k = 0;
    g = 0;
    for i = 1 : (nregions - 1)
        for j = (i+1):nregions
            k = k+1;
            if (i < region)
                if (j == region)
                    g = g+1;
                    GoodRows(g) = k;
                end
            end
            if (i == region)
                    g = g+1;
                    GoodRows(g) = k;
            end
            
        end
    end
    Starstream = dFCstream(GoodRows, 1:nslices);
    invalidstream = 0;
end
    
if (invalidstream)
    disp('Provide a valid size dFCstream (3D or stream objects)!')
end

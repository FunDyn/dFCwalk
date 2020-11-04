function dFC = dFCstream2dFC(dFCstream)

% FUNCTION dFC = dFCstream2dFC(dFCstream)
% takes dFCstream as input ('2D' or '3D') and calculates dFC [FxF] matrix,
% where F is the number of network frames in the input dFCstream.
%                
% Example: dfc = dFCstream2dFC(dfcstream)


if (ndims(dFCstream) == 3)
    dFCstream_2D = Matrix2Vec(dFCstream);
end

if (ndims(dFCstream) == 2)
    dFCstream_2D = dFCstream;
end

if (ndims(dFCstream) < 2)
    disp('Provide a valid size dFCstream (3D or stream objects)!')
    return
end

if (ndims(dFCstream) > 3)
    disp('Provide a valid size dFCstream (3D or stream objects)!')
    return
end

% Now dFCstream_2D is a '2D' of dFCstream and we can compute dFC
dFC = corr(dFCstream_2D);

end

function dFCstream_2D = Matrix2Vec(dFCstream_3D)

% FUNCTION dFCstream_2D = Matrix2Vec(dFCstream_3D)
% takes '3D' dFCstream as input and convert it to '2D' dFCstream
% or
% takes '2D' FC matrix as input and convert it to '1D' FC vector

n = size(dFCstream_3D, 1);
l = n*(n-1)/2;
F = size(dFCstream_3D, 3);
xo = find(tril(ones(n),-1));

dFCstream_2D = zeros(l, F);

for i = 1:F
    fc = dFCstream_3D(:,:,i);
    dFCstream_2D(:,i) = fc(xo);
end

end

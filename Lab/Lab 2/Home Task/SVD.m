A = [4 0; 3 -5; 0 2];

% Compute SVD
[U, S, V] = svd(A);

% Display results
disp('U matrix:');
disp(U);
disp('Singular values (S matrix):');
disp(S);
disp('V matrix:');
disp(V);

% Verify the decomposition
A_reconstructed = U * S * V';
disp('Reconstructed A:');
disp(A_reconstructed);
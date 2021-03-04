function adjacency_matrix = generate_adjacency_matrix(n, min_cut_weight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Number of nodes
c=10;
% Construction of random adjacency matrix
A = zeros(n,n);
for i=1:n
    for j=i+1:n
        A(i,j) = randi([1,10]);   % Experiment with this range
    end
end
% Modify adjacency matrix to obtain fixed solution - try any other solution you want
A(1,2:c+1) = 1;
% Mirror the upper piece to the lower, which doubles the diagonal so subtract off the diagonal
adjacency_matrix = A + A.' - diag(diag(A)); 
end

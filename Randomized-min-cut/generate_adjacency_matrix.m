function adjacency_matrix = generate_adjacency_matrix(n, min_cut_weight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Construction of random adjacency matrix
A = zeros(n,n);
for i=1:n
    for j=i+1:n
        A(i,j) = randi([1,10]);   % Experiment with this range
    end
end
% Modify adjacency matrix to obtain fixed solution - try any other solution you want
A(1,2:min_cut_weight+1) = 1;
A(1,min_cut_weight+2:n) = 0;
% Mirror the upper piece to the lower, which doubles the diagonal so subtract off the diagonal
adjacency_matrix = A + A';
end

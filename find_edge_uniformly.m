function [u, v] = find_edge_uniformly(A)

[m, n] = size(A);

num_of_edges = sum(sum(A))/2;          % total number of edges
rand_edge = randi([1, num_of_edges]);  % random number in [1-num_of_edges]

% Scan matrix A to identify the corresponding pair of nodes
edge = 0;

for ii=1:m
    for jj=ii+1:n
        edge = edge + A(ii,jj);
        if (edge >= rand_edge)
            u = ii;
            v = jj;
            return
        end
    end
end
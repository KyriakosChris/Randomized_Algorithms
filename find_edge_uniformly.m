function [u, v] = find_edge_uniformly(A)

n = length(A);

num_of_edges = sum(sum(A))/2;          % total number of edges
rand_edge = randi([1, num_of_edges]);  % random number in [1-num_of_edges]

% Scan matrix A to identify the corresponding pair of nodes
edge = 0;

for i=1:n
    for j=i+1:n
        edge = edge + A(i,j);
        if (edge >= rand_edge)
            u = i;
            v = j;
            return
        end
    end
end
function [Adj] = G_n_p(n,p)
% Generates an adjacency matrix of a Gnp graph

% create a random adjacency matrix for the Gnp graph
Adj = zeros(n);
for i=1:n
    for j=i+1:n
        if rand() <= p
            % add each edge with probability p
            Adj(i,j) =  1;
        end
        Adj(j,i) = Adj(i,j);
    end
end
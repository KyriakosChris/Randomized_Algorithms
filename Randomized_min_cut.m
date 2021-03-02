clear all;
close all;
clc

% Number of nodes
n = randi([50 100]);
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
B = A + A.' - diag(diag(A)); 
                             
min_cut_sum = 10^6;   % Large initial value  
% Graph partitions - the algorithm returns two nodes 
opt1 = [];
opt2 = [];    

for kk=1:10 % n*(n-1)*log(n)   % Repeat randomized min-cut algorithm
    kk

    % Randomized min-cut algorithm 
    % Initialization
    AA = A;
    nodes = cell(n,1);
    for jj=1:n
      nodes{jj} = jj;
    end

    % Main body
    for ii=n:-1:3    % perform n-2 iterations  
        [u, v] = find_edge_uniformly(AA);          % find edge (u,v) * uniformly at random * from existing edges
        AA = update_adjacency_matrix(AA, u, v);    % contract edge 1) update adjacency matrix
        nodes = update_nodes(nodes, u, v);         % contract edge 2) update (merge) nodes 
    end

    % Save best solution 
    if ( AA(1,2) < min_cut_sum )
       opt1 = nodes{1}(:)                       % component 1
       opt2 = nodes{2}(:)                       % component 2
       min_cut_sum = AA(1,2), pause             % size of cut-set
    end
end
% 
% opt1
% opt2
% min_cut_sum
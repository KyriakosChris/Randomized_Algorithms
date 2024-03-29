%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% M file for testing the randomized min-cut algorithm             %
%                                                                 %
% K.Christodoulidis, March 9, 2021                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear, clc

% Number of nodes
n = 500;
min_cut_weight = n/5;

A = generate_adjacency_matrix(n, min_cut_weight);

for iter=1:100 % Repeat the whole process 
    
    iter 
    
    % Graph partitions - the algorithm returns two nodes 
    opt1 = [];
    opt2 = [];    
    
    inner_iter = 0;
    found = 0;
    while (found == 0)
        inner_iter = inner_iter + 1; 
      
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
      
        
        % Check weight of output 
        if ( AA(1,2) == min_cut_weight )
            found = 1;
            fprintf('\nMin-cut found...\n');
            opt1 = sort(nodes{1}(:));
            opt2 = sort(nodes{2}(:));
        else
            fprintf('\nMin-cut failed...\n')
        end
   
    end
    iters(iter) = inner_iter;
end
a = hist(iters, [1:max(iters)]);
bar(a/iter)
title('Histogram')
ylabel('Possibility')
xlabel('Number of Iterations')
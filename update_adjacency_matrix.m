function [A_updated] = update_adjacency_matrix(A, i1, i2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [A_updated] = update_adjacency_matrix(A, i1, i2)            %
%                                                             %
% Contract edge (i1, i2)                                      %
%                                                             %
% A. P. Liavas, Febr. 26, 2015                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m, n] = size(A);

A_updated = A;
A_updated(i1, :) = A(i1,:) + A(i2,:);    % Add edges that are associated with nodes i1 and i2
A_updated(:, i1) = A_updated(i1,:)';     %             symmetrize
A_updated = A_updated([[1:i2-1] [i2+1:m]],[[1:i2-1] [i2+1:n]]);   % Contract node i2  

A_updated(i1, i1) = 0;                   % delete self-loops


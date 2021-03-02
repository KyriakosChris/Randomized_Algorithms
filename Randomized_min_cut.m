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

clear all;
close all;
clc
% Quicksort implementation
% This implementation works in place and runs in O(n)=n*log(n) (average case).
% The purpose of this implementation is to show that quicksort can be
% implemented in Matlab with O(n)=n*log(n) average case runtime.
% This implementations, counts how many comparisons it needs until the
% array is sorted.
n=1000;
simulations= 100;
counter=zeros(1,simulations);
for l = 1:simulations
    X = ['Simulation: ',num2str(l)];
    disp(X)
    A=randi(n,1,n); % create an array with n random numbers 
    [B,counter(1,l)]=quicksortAndCount(A);
end
Counter_Mean = sum(counter)/length(counter); %calculates the mean
X = ['Average Comparisons: ',num2str(Counter_Mean)];
disp(X)
histogram(counter)
title('Histogram')
ylabel('Possibility')
xlabel('Number of Comparasons')
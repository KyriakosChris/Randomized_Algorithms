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
global counter;
simulations= 100;
for l = 1:simulations
    
    A=randi(n,1,n); % create an array with n random numbers 
    counter=0;
    B=quicksort(A);
    disp(counter);
end
function [y] = quicksort(x)
    n=length(x);
    global counter;
    if n<2
        y = x;
        counter=counter+1;
        return;
    end

    x1 = [];
    x2 = [];

    for i = 1:n-1

        if x(i)<x(n)
            x1 = [x1 x(i)];
            counter=counter+1;
        else
            x2 = [x2 x(i)];
            counter=counter+1;
        end
    end

    y = [quicksort(x1) x(n) quicksort(x2)];

end
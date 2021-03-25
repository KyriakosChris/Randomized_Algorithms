clear all;
close all;
clc
n=1000;
simulations= 100;
counterQuickSort=zeros(1,simulations);
counterMedian=zeros(1,simulations);
for l = 1:simulations
    X = ['Simulation: ',num2str(l)];
    disp(X)
    A=randi(n,1,n); % create an array with n random numbers 
    [B,counterQuickSort(1,l)]=quicksortAndCount(A);
    [m,counterMedian(1,l)] = RandomizedMedian(A);
end
CounterQuick_Mean = sum(counterQuickSort)/length(counterQuickSort); %calculates the mean
X = ['Average Comparisons: ',num2str(CounterQuick_Mean)];
disp(X)
histogram(counterQuickSort)
title('Histogram')
ylabel('Possibility')
xlabel('Number of Comparasons')
figure
CounterMedian_Mean = sum(counterMedian)/length(counterMedian); %calculates the mean
X = ['Average Comparisons: ',num2str(CounterMedian_Mean)];
disp(X)
histogram(counterMedian)
title('Histogram')
ylabel('Possibility')
xlabel('Number of Comparasons')
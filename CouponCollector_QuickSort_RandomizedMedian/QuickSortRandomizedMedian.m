clear all;
close all;
clc
simulations= 50;
n = 200:200:10000;
counterQuickSort=zeros(1,simulations);
counterMedian=zeros(1,simulations);
counterQuickSortHist=zeros(1,simulations);
counterMedianHist=zeros(1,simulations);
for i = 1:simulations
    X = ['Simulation: ',num2str(i)];
    disp(X)
    A=randi(100000,1,n(i)); % create an array with n random numbers between 1 and 100000
    C=randi(100000,1,1000); % create an array with n random numbers between 1 and 100000
    % Creates Histogram, running in a 1000 element array for 50 simulations
    [~,counterQuickSortHist(1,i)]=quicksortAndCount(C);
    [~,counterMedianHist(1,i)] = RandomizedMedian(C);
    % Creates Plot, running in a 200 to 10000 element array
    [~,counterQuickSort(1,i)]=quicksortAndCount(A);
    [~,counterMedian(1,i)] = RandomizedMedian(A);
end
CounterQuick_Mean = sum(counterQuickSort)/length(counterQuickSort); %calculates the mean
X = ['Average QuickSort Comparisons: ',num2str(CounterQuick_Mean)];
disp(X)
histogram(counterQuickSortHist)
title('Histogram of QuickSort')
ylabel('Possibility')
xlabel('Number of Comparasons')

figure
CounterMedian_Mean = sum(counterMedian)/length(counterMedian); %calculates the mean
X = ['Average Randomized Median Comparisons: ',num2str(CounterMedian_Mean)];
disp(X)
histogram(counterMedianHist)
title('Histogram of Randomized Median')
ylabel('Possibility')
xlabel('Number of Comparasons')

figure
plot(n,counterQuickSort);
hold on;
plot(n,counterMedian);
legend('Counter of QuickSort', 'Counter of Randomized Median');
hold off;
suptitle('QuickSort And Randomized Median Comparasons')
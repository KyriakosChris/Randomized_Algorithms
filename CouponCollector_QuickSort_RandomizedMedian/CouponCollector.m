clear all;
close all;
clc

n =1000; %input number of coupons
simulations = 100; %input amount of repeats 
x = 1:n;    %create a vector of all nums 1 -> couponnum
T = zeros(1,ceil(simulations)); %create a vector of zeros which will track the steps till completion
random = zeros(1,simulations);
for l = 1:simulations 
    X = ['Simulation: ',num2str(l)];
    disp(X)
    j = 0; %sets j = 0 at the start of each new repeat
    y = zeros(1,n); %creates a vector of 0's for each new repeat
    while sum(x)~= sum(y)
        r = randi([1,n]); %creates a random number between 1 and the max
        random(l)= random(l)+r;
        for k = 1:n 
            if r == y(k) %checks if the random number is already in the vector y
            else
                y(r) = r; %if not adds the number to the vector in the position of the number

            end
        end
        j = sum(y); %tracks to see if all the coupons have been selected
        T(l) = T(l) + 1; %counts the number of times a selection has taken place
    end
end
T_mean = sum(T)/length(T); %calculates the mean
R_mean = sum(random)/length(random); %calculates the mean
X = ['Average Repetition: ',num2str(T_mean)];
disp(X)
histogram(T)
title('Histogram')
ylabel('Possibility')
xlabel('Number of Repetitions')

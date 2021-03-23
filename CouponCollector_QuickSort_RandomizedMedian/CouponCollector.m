clear all;
close all;
clc

prompt_m = 'How many times would you like to run this?';
prompt_coupon_num = 'How many coupons are in the set?';
m = input(prompt_m); %input amount of repeats
coupon_num = input(prompt_coupon_num); %input number of coupons
x = zeros(1,coupon_num); %create a vector of all nums 1 -> couponnum
for i = 1:coupon_num
    x(i) = i;
end
s = sum(x);
T = zeros(1,m); %create a vector of zeros which will track the steps till completion
for l = 1:m 
    j = 0; %sets j = 0 at the start of each new repeat
    y = zeros(1,coupon_num); %creates a vector of 0's for each new repeat
    while j<s
    r = randi([1,coupon_num]); %creates a random number between 1 and the max
    for k = 1:coupon_num 
        if r == y(k) %checks if the random number is already in the vector y
        else
            y(r) = r; %if not adds the number to the vector in the position of the number
        end
    end
    j = sum(y); %tracks to see if all the coupons have been selected
    T(l) = T(l) + 1; %counts the number of times a selection has taken place
    end
end
T_mean = sum(T)/m; %calculates the mean
disp(T_mean); 
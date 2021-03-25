clear all;
close all;
clc

n=1000;
simulations= 100;
global counter
counter=zeros(1,simulations);

    X = ['Simulation: ',num2str(1)];
    disp(X)
    A=randi(n,1,n); % create an array with n random numbers 
    [B] = Median(A);
    
    
 function [k] = Median(x)
    n=length(x);
    y= power(n,0.75);
    b=n-y;
    a=randi([1 floor(b)],1,1);
    B=x(a:floor(a+y));
    [B,counter]=quicksortAndCount(B);
    l=B(floor(y/2 -sqrt(n)));
    u=B(ceil(y/2 +sqrt(n)));
    
%     while 1
%         
%         
%     end
        
 end

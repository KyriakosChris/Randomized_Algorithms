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
    [m,B] = Median(A);
    
 function [element,counter] = Median(x)
    while 1
        n=length(x);
        y= power(n,0.75);   %n^3/4  
        dif=n-y;                 
        a=randi([1 floor(dif)],1,1);    
        B=x(a:floor(a+y));              % take a random dif size piece of the Array
        % Sort this smaller array with Quicksort, and count the compares
        [B,counter]=quicksortAndCount(B);   
        d=B(floor(y/2 -sqrt(n)));   % Set d
        u=B(ceil(y/2 +sqrt(n)));    % Set u
        C=zeros(1,n);
        ld=zeros(1,n);
        lu=zeros(1,n);
        for i=1:n
            if(x(i)>=d && x(i)<=u)
                C(i)=x(i);
            end
            if(x(i)<d)
                ld(i)=x(i);
            end
            if(x(i)>u)
                lu(i)=x(i);
            end
        end 
        % remove all cells with zeros
        lu(lu==0) = [];
        ld(ld==0) = [];
        C(C==0) = [];
        if((length(ld)>n/2 || length(lu)>n/2) && length(C)> 4*y)
            disp('FAIL');
            continue;
        end
        [C,c]=quicksortAndCount(C);
        counter=counter+c;
        element=C(floor(n/2)-length(ld)+1);
        return;
    end
        
 end

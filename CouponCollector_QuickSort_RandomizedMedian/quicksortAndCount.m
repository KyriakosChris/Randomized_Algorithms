function [list,c] = quicksortAndCount(A)
    global count
    count=0;
    list = quicksort(A);
    c=count;
end

function [y] = quicksort(x)
    n=length(x);
    global count
    if n<2
        y = x;
        count=count+1;
        return;
    end

    x1 = [];
    x2 = [];

    for i = 1:n-1

        if x(i)<x(n)
            x1 = [x1 x(i)];
            count=count+1;
        else
            x2 = [x2 x(i)];
            count=count+1;
        end
    end
    y = [quicksort(x1) x(n) quicksort(x2)];

end
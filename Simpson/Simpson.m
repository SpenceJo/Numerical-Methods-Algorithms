function [I] = Simpson(x,y)
%UNTITLED2 Summary of this function goes here
%   This function will take inputted correspoing x values and y values and
%   then perform Simpson's 1/3 Rule to find the integral of the data
%   sets. If there are an odd number of intervals that need to be
%   intgerated, then the last interval's area will be computed using the
%   trapezoidal rule. 

format short
spacing=(diff(x));     %Checks to make sure the x matrix is evenely spaced 
if range(spacing)>.00000001
    error('your x matrix values must be equally spaced apart')
end
format long
if size(x)~=size(y)
    error('Your x and y matrices must have the same dimensions')  %checks that the x and y matrices are the same dimensions
end
h=(x(3)-x(1)); %Sets a variable h, which is used for (b-a) in the equations

l=numel(x)-1;  %sets a veriable l that represents the size of the matrix x 
if l<3
    error('you must input an x vector with at least three values') %Checks if the x matrix is at least of size three
end
c=mod(numel(x),2);  %Checks whether the matrix has an odd or even number of variables 
if c>0
    I=0;  %if the interval number is even, then use only Simpson's 1/3 Rule
    for n=1:2:l-2
        I=I+h*((y(n)+(4*y(n+1))+y(n+2))/6); %Equation for Simpson's 1/3
    end
else
    I=0;        %If the interval number is odd then use Simpson's 1/3 and Trap Rule
    for n=1:2:l-3
        I=I+h*((y(n)+(4*y(n+1))+y(n+2))/6);  %Simpson's 1/3 Rule equation
    end
    I=I+(h*(y(l-1)+y(l)/2));  %Adds the last interval to the integral using the Trap Rule
    disp('trapezoid rule was used to find area of last interval')
end
end


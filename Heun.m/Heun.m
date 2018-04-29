function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
% This function uses Heun's method to approximate the curve of the solution
% to an inputted differential equation. 
% The function uses Heun's method with iterations, specified by the user,
% to approximate the solution to the inputted differential euqation. The
% function will also compare ea to es to determine if the value is within
% the error bound before the maximum iterations are reached.
% Inputs: dydt-Differential equation, tspan-The interval which Heun's
% method will use to approximate the solution, y0-The inital condition of
% the differential equation, h-The step size used for the function, es-The
% desired error bound for the values calculated, maxit-The maximum
% iterations desired by the user. 
% Outputs: t-The t values of the equation found with the step size, y-The
% approximated y values of the solution to the differential equation. 

m=2;                      %sets a counter for making the t and y matrices
iter=0;    
ea=100;                   %sets a large error for the first iteration, 
A=[tspan(1):h:tspan(2)];  %Creates an A matrix which will be used to find if the step size h can be applied to the inputted tspan values
oldslope=0;
corrector=0;
if A(end)==tspan(end)     %preallocates the size of t and y according to the number of values which the function will find 
    y=zeros(length(A),1);
    t=zeros(length(A),1);
else
    y=zeros(length(A)+1,1);
    t=zeros(length(A)+1,1);
end
    
t(1)=tspan(1);            %sets the first value in the t matrix to the first tspan value
y(1)=y0;                  %Sets the first value to y0 in the y matrix

if nargin<4       %Checks the number of inputted variables and sets es and maxit to default values if the user does not specify them
    error('you hve not inputted enough arguments')
elseif nargin<5   
       maxit=50;
       es=.001;
elseif nargin<6
    maxit=50;
    
end

for i=(tspan(1)+h):h:tspan(2)        %Begins the for loop for the t values being used in the computations
    SL=dydt((i-h),y0);               %Finds the slope left value
    predictor=(y0)+(i*SL);           %Finds the predictor value
    while es<ea && iter<maxit        %Starts a while loop which will terminate the itterations once the error is within bounds or the max iterations is reached
        SR=dydt(i,predictor);        %Finds the slope right value
        corrector=y0+((SL+SR)/2)*h;  %Finds the corrector value using y0, slope right, slope left, and the step size h
        iter=iter+1;                 
        ea=(abs(corrector-oldslope)/corrector)*100; %Calculates the error
        predictor=corrector;
    end
    y0=corrector;    %resets the y0 value to the final prediction of y in the previous iteration
    y(m)=corrector;  %make the two y and t vectors with the calculated vectors
    t(m)=i;          
    m=m+1;           
    iter=0;          %Resets the iter and ea values for future iterations
    ea=100;
end

if tspan(end)~=A(end)    %Checks to see if the step size aligns with the tspan matrix. If it does not, the function corrects the h value and runs an iteration with the new step size
    h=tspan(end)-A(end);    
    for i=(A(end)+h):h:tspan(end)   %This section is the same as above, just being ran with the altered step size to find the last value of y
     SL=dydt((i-h),y0);
    predictor=(y0)+(i*SL);    
    while es<ea && iter<maxit 
        SR=dydt(i,predictor);
        corrector=y0+((SL+SR)/2)*h;
        iter=iter+1;
        ea=(abs(corrector-oldslope)/corrector)*100;
        predictor=corrector;
    end
    y0=corrector;
    y(m)=corrector;
    t(m)=i;
    m=m+1;
    end    
end        
plot(t,y)     %Plots the t values against the calculated y values
end


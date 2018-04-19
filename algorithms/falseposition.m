
xcfunction [root,fx,ea,iter] = falseposition(func,xl,xu,es,maxiter)
%This function is used to approximate roots of functions using the
%false-position. The user will input a function with initial guesses to
%'bracket' the desired root. The function will then use that bracket to
%find the actual root within .001% percent of the real value. 

% Inputs and Outputs for the function
% Inputs
% func: The function which is being evaluated t
poo find the roots
% xl: the lower guess
% xu: The upper limit
% es: The resired relative error (default is 0.0001% if none is given)
% inter: The number of iteration the function performs (default is 200)
% Outputs
% Root: The estimated root location
% fx: The function evaluated at the root location
% ea: The approximate relative error
% Iter: How many iterations the function performs 
ea=1;
root=0;
iter=0;
f=func;
old=0; %The value of the previous root guess that this function produces 
fx=0;
if nargin < 5 %checks to ensure that the number of arguments are correct
    es=.0001;
    if nargin <= 4
        maxiter=200;
    end
end

if f(xl)*f(xu)>0
    error('your bracket guesses are ') %Checks to ensure the initial guesses for the brackets work
end

while ea>es && f(xl)*f(xu)<0 && iter<=maxiter
    iter=iter+1;
    root=(xu)-(f(xu)*(xl-xu)/(f(xl)-f(xu)));
    ea=abs((root-old))/root;
    old=root;
    if f(root)*f(xl)<0
        xu=root;
    else
        xl=root;
    end
       fx=f(root);  
end


   disp(double(fx))   %function value at the final root guess
   disp(double(root)) %The final guess for the root of the function
   disp(double(iter)) %The number of iterations performed by the function
   disp(double(ea))   %The final error associated with the root guess
end
   
        
    
    
    
        
    
    
   
    




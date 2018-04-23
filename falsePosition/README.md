# `falsePosition.m` 
## inputs 
the function,
xl,
xu,
desired relative error,
desired number of iterations
## outputs
root guess,
function value at the root guess,
approximate relative error of guess,
the number of iterations performed
## description
This function is used to approximate the zeros of a funcion. It uses two inital guesses xl (the lower limit) and xu (the upper limit) to compute a zero of a specified inputted function. This method uses a bracketing based algorithm so xl and xu must be x values of the function that are known to bracket a root. The function is able to check for errors in the number of arguments inputted and if xl and xu do in fact bracket a root. The default iterations the function will perform is 200 unless otherwise specifed or the desired approximate relative error is achieved, and the error bound will default to .0001% if not provided by the user. Once the function has ran it will output the number of iterations ran, the approximate relative error, and the x and y values of the root approximation after applying the equation for false position using the function and the guesses.

# Numerical-Methods-Algorithms
This repository holds several algorithms from my Numerical Methods class in Spring Semester of 2018
# `falsePosition.m` 
## inputs 
the function
xl
xu
desired relative error
desired number of iterations
## outputs
root guess
function value at the root guess
approximate relative error of guess
the number of iterations performed
## description
This function is used to approximate the zeros of a funcion. It uses two inital guesses xl (the lower limit) and xu (the upper limit) to compute a zero of a specified inputted function. This method uses a bracketing based algorithm so xl and xu must be x values of the function that are known to bracket a root. The function is able to check for errors in the number of arguments inputted and if xl and xu do in fact bracket a root. The default iterations the function will perform is 200 unless otherwise specifed or the desired approximate relative error is achieved, and the error bound will default to .0001% if not provided by the user. Once the function has ran it will output the number of iterations ran, the approximate relative error, and the x and y values of the root approximation after applying the equation for false position using the function and the guesses. 
# `Simpson.m`
## inputs
x matrix
y matrix
## outputs
Approximate integral
## description
This algorithm uses Simpson's 1/3 rule (and the trapezoidal rule if necessary) to find the approximate integral over a given function. The user inputs two matrices when calling the function. The first matrix corresponds with the x values of the desired function and the second matrix corresponds to the y values of this function. The algorithm checks for errors in the lengths of matrices, if they match in length, if the values in the x matrix are evenly spaced, and that the inputted matrices have at least three values in them. The algorithm then applies Simpson's 1/3 rule only to find the approximated intgral if there are an odd number of inputted values in the matrices. If there is an even number of values in these matrices, and therefore an odd number of sub intervals, the basic trapezoidal rule will be applied to the last interval and added to the value found using Simpson's 1/3 rule on the rest of the intervals in order to find the total value of the integral. 
# `luFactor.m`
## inputs 
A matrix
## outputs
L matrix
U matrix
P matrix
## Description
luFactor performs LU factorization on an inputted matrix A using Gaussian elimination with partial pivoting. During this process an L matrix, P matrix, and U matrix are made as products of the LU factorization. The L matrix corresponds to the lower triangular matrix created through this process, it contains the values used for elimination in the Gauss process. The U matrix is an upper triangular which holds the new augmented A matrix. This U matrix is created through Gauess elimination in order for the matrix to be able to be solved using back substituion, partial pivotting is used during the gauss elimination if necessary (meaning if the maximum value is not in the highest row during the elimination, it will be pivotted so that it is). The P matrix is an identy matrix which pivots its rows in accordance to the pivotting of the A matrix during Gauss elimation. 

# `Simpson.m`
## inputs
x matrix,
y matrix
## outputs
Approximate integral
## description
This algorithm uses Simpson's 1/3 rule (and the trapezoidal rule if necessary) to find the approximate integral over a given function. The user inputs two matrices when calling the function. The first matrix corresponds with the x values of the desired function and the second matrix corresponds to the y values of this function. The algorithm checks for errors in the lengths of matrices, if they match in length, if the values in the x matrix are evenly spaced, and that the inputted matrices have at least three values in them. The algorithm then applies Simpson's 1/3 rule only to find the approximated intgral if there are an odd number of inputted values in the matrices. If there is an even number of values in these matrices, and therefore an odd number of sub intervals, the basic trapezoidal rule will be applied to the last interval and added to the value found using Simpson's 1/3 rule on the rest of the intervals in order to find the total value of the integral. 

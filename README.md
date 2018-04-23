# Numerical-Methods-Algorithms
This repository holds several algorithms from my Numerical Methods class in Spring Semester of 2018
 

# `luFactor.m`
## inputs 
A matrix
## outputs
L matrix,
U matrix,
P matrix
## Description
luFactor performs LU factorization on an inputted matrix A using Gaussian elimination with partial pivoting. During this process an L matrix, P matrix, and U matrix are made as products of the LU factorization. The L matrix corresponds to the lower triangular matrix created through this process, it contains the values used for elimination in the Gauss process. The U matrix is an upper triangular which holds the new augmented A matrix. This U matrix is created through Gauess elimination in order for the matrix to be able to be solved using back substituion, partial pivotting is used during the gauss elimination if necessary (meaning if the maximum value is not in the highest row during the elimination, it will be pivotted so that it is). The P matrix is an identy matrix which pivots its rows in accordance to the pivotting of the A matrix during Gauss elimation. 

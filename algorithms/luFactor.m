function [L,U,P] = luFactor(A)
%lulfactor: l u factorization
%   This function performs l u factorization on an iputted matrix A of
%   dimentions x by x. It will output both a lower(L) and upper(U) triangular
%   matrix and a P matrix which corresponds with the pivoting performed on
%   matrix U. 

[row,col]=size(A); %Finds the number of rows in the matrix A
L=zeros(row);    %Creates a zeros matrix that will be used for L
P=eye(row);      %Creates an identity matrix which will be used for P
U=A;             %Sets matrix U equal to the initial matrix A

%Checks number of function inputs
if nargin > 1
    error 'You have given the function too mant inputs'    
elseif nargin < 1
    error 'You have not inputted a matrix'
else
end 
%Makes sure A's dimensions are equal to each other
if row~=col
      error 'your matrix dimentions must be equal to each other'
end
%Makes sure the A matrix is greater than 1x1
if row==1 && col==1
    error 'your inputted matrix must be greater than a 1x1'
end

%Begins by created a variable to represent the current row and column the
%algorithm is working with. 
for z=1:row
[~,pivotrow]=max(abs(U(z:end,z))); %Finds the row number of the maximum value in the z:endth row and zth column and assigns that to 'pivotrow'
pivotrow=pivotrow+(z-1); 
%Begins the steps for pivotting the U matrix using 'z' as the index
%of which row the algorithm is working with
     if pivotrow~=z           %Checks if the max value for the current rows being worked with is in the first row
         orow=U(z,:);         %Sets the row that is going to be replaced by the max row to a variable
         U(z,:)=U(pivotrow,:);%Moves the max value row up to the top (or to the 'top' in respect to current iteration)
         U(pivotrow,:)=orow;  %Moves the row which was swapped for the max value row to where the max value row initially was
         %These steps repeat what was done above in the U matrix on the P
         %matrix in order to properly pivot it. 
         orow=P(z,:);         
         P(z,:)=P(pivotrow,:);
         P(pivotrow,:)=orow;
         %Pivots the L matrix in accordance to the pivotting of the U 
         %matrix. Does this for only z>=2 because there cannot be
         %pivotting necessary for the first itteration since only one
         %elimination has been done. 
         if z >= 2 
               orow=L(z,1:z-1);              
               L(z,1:z-1)=L(pivotrow,1:z-1); %Will do nothing if U is not pivotted because then pivotrow will be the same as z
               L(pivotrow,1:z-1)=orow;
         end
     end
     %Begins the Gauss elimination 
     for x=z+1:row
             L(x,z)=U(x,z)/U(z,z);        %Sets the location of the cancelation variable used in Gauss to the appropriate location in the L matrix
             U(x,:)=U(x,:)-L(x,z)*U(z,:); %Replaces the xth row of U with the new row created using the cancelation variable
     end
end
%Gives the L matrix the appropriate 1's it needs
for v=1:row 
    L(v,v)=1;
end
%Displays all the needed variables
display(U)
display(P)
display(L)
end
    
    









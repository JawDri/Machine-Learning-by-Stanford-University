function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
err_matrix=zeros(64,3);
err_row=0;
C_temp=[0.01 0.03 0.1 0.3 1, 3, 10 30];
sigma_temp=[0.01 0.03 0.1 0.3 1, 3, 10 30];
for i=1:8,
  for j=1:8,
     err_row=err_row+1;
	 model=svmTrain(X,y,C_temp(i),@(x1,x2) gaussianKernel(x1,x2,sigma_temp(j)));
     predictions=svmPredict(model,Xval);
	 err=mean(double(predictions~=yval));
	 err_matrix(err_row,:)=[C_temp(i) sigma_temp(j) err];
  end
end
res=sortrows(err_matrix,3);
C=res(1,1);
sigma=res(1,2);



% =========================================================================

end

function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

gx=X*theta;
h=1+(e.^(-gx));
hx=1./h;
a=(y)'*(log(hx));
b=(1-y)'*(log(1-hx));
c=a+b;
c=-c;
thetasqr=0;
n=size(theta);
for i=2:n,
  xpd=(theta(i)*theta(i));
  thetasqr=thetasqr+xpd;
  end;
thetasqr=(lambda/(2*m)).*thetasqr;
J=(c/m)+thetasqr;
d=hx-y;
f=X'*d;
thetasum=(lambda/m).*theta;
thetasum(1)=0;
grad=((1/m).*f)+thetasum;





% =============================================================

end

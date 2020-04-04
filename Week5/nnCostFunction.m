function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network


%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
a1=[ones(m,1) X];
z1=a1*Theta1';
a2=sigmoid(z1);
a2=[ones(m,1) a2];
zout=a2*Theta2';
hx=sigmoid(zout);
temp=0;
for i=1:num_labels,
    ymid=y==i;
	temp=temp+((ymid'*log(hx(:,i)))+((1-ymid)'*log(1-hx(:,i))));
end;
temp=-temp;
temp=temp/m;
theta1sum=sum(sum(Theta1(:,2:end).^2));
theta2sum=sum(sum(Theta2(:,2:end).^2));
w=lambda/(2*m);
thetasum=w*(theta1sum+theta2sum);
J=temp+thetasum;
Big_Del1=0;
Big_Del2=0;
for i=1:m,
    b1=a1(i,:)';
	m1=Theta1*b1;
    b2=[1;sigmoid(m1)];
	m2=Theta2*b2;
    yfinal_layer=sigmoid(m2);
    y_output_label=y(i);
	ylast=zeros(num_labels,1);
	ylast(y_output_label)=1;
	del_last=yfinal_layer-ylast;
	del_hidden=(Theta2(:,2:end)'*del_last).*sigmoidGradient(m1);
	Big_Del1=Big_Del1+(del_hidden*b1');
	Big_Del2=Big_Del2+(del_last*b2');
end;
Theta1_grad=(Big_Del1/m)+(lambda/m)*[zeros(hidden_layer_size,1) Theta1(:,2:end)];
Theta2_grad=(Big_Del2/m)+(lambda/m)*[zeros(num_labels,1) Theta2(:,2:end)];
	
	

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
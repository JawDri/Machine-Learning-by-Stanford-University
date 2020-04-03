function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
matrix=load('ex2data1.txt');
X=matrix(:,1:2);
y=matrix(:,3);
pos=find(y==1);
neg=find(y==0);
plot(X(pos,1),X(pos,2),'k+');
hold on;
plot(X(neg,1),X(neg,2),'ro');
legend('X1','X2');
xlabel('X1');
ylabel('X2');


% =========================================================================



hold off;

end

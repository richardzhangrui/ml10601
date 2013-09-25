function [modle] = lr_train(Xtrain, Ytrain)

alpha = 0.05;
epsilon = 0.001;
lamda = 0.0001;
%lamda = cross_validation(Xtrain, Ytrain, alpha, epsilon);

modle = pre_train(Xtrain, Ytrain, alpha, lamda, epsilon);

end

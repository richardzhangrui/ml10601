function [result] = one_fold(Xtrain, Ytrain, Xtest, Ytest, alpha, lamda, epsilon)

model = pre_train(Xtrain, Ytrain, alpha, lamda, epsilon);

test_result = lr_test(model, Xtest);

result = sum(test_result == Ytest) / size(Ytest, 1);

end

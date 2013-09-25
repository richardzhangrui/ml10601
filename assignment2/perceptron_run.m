function perceptron_run(Xtrain, Ytrain, Xtest, Ytest)

%t = cputime;
model = perceptron_train(Xtrain, Ytrain);
Pred_per = perceptron_test(model, Xtest);
%e = cputime-t;

Pred_per = sign(Pred_per + 1);
save Pred_per.mat Pred_per;

a = sum((Pred_per == Ytest) .* (~Pred_per));
b = sum((Pred_per ~= Ytest) .* Pred_per);
c = sum((Pred_per ~= Ytest) .* Ytest);
d = sum((Pred_per == Ytest) .* Pred_per);

precision = d/(b + d);
recall = d/(c + d);
accuracy = (a + d)/(a + b + c + d);

%fprintf('Elapsed Time:%fs\n', e);
fprintf('P:%.3f, R:%.3f, A:%.3f', precision, recall, accuracy);

end
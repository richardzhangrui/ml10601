function lr_run(Xtrain, Ytrain, Xtest, Ytest)

model = lr_train(Xtrain, Ytrain);

Pred_lr = lr_test(model, Xtest);

save Pred_lr.mat Pred_lr;

a = sum((Pred_lr == Ytest) .* (~Pred_lr));
b = sum((Pred_lr ~= Ytest) .* Pred_lr);
c = sum((Pred_lr ~= Ytest) .* Ytest);
d = sum((Pred_lr == Ytest) .* Pred_lr);

precision = d/(b + d);
recall = d/(c + d);
accuracy = (a + d)/(a + b + c + d);

fprintf('P:%.3f, R:%.3f, A:%.3f', precision, recall, accuracy);

end

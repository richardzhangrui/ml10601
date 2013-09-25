function nb_run(Xtrain, Ytrain, Xtest, Ytest)

%t = cputime;
model = nb_train(Xtrain, Ytrain);
Pred_nb = nb_test(model, Xtest);
%e = cputime-t;

save Pred_nb.mat Pred_nb;

a = sum((Pred_nb == Ytest) .* (~Pred_nb));
b = sum((Pred_nb ~= Ytest) .* Pred_nb);
c = sum((Pred_nb ~= Ytest) .* Ytest);
d = sum((Pred_nb == Ytest) .* Pred_nb);

precision = d/(b + d);
recall = d/(c + d);
accuracy = (a + d)/(a + b + c + d);

%fprintf('Elapsed Time:%fs\n', e);
fprintf('P:%.3f, R:%.3f, A:%.3f', precision, recall, accuracy);

end

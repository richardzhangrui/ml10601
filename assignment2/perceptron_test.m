function [Pred_per] = perceptron_test(model, Xtest)

s = sign(Xtest * transpose(model(1:end,2:end)));

t = s * model(1:end, 1);

Pred_per = sign(t);

end




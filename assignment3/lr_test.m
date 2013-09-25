function [Pred_lr] = lr_test(model, Xtest)

middle1 = 1 ./ (1 + exp(-Xtest * transpose(model)));
middle2 = 1 - middle1;

Pred_lr = middle1 > middle2;

end

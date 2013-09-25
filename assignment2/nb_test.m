function [Pred_nb] = nb_test(model, Xtest)

rows = size(Xtest, 1);

eTest = [ones(rows, 1) Xtest];

middle_result1 = eTest * transpose(model(1, 1:end));

middle_result2 = eTest * transpose(model(2, 1:end));

Pred_nb = middle_result1 < middle_result2;

end
    
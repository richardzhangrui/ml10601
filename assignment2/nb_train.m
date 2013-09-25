function [model] = nb_train(Xtrain, Ytrain)

numberYstar = size(Xtrain, 1);
numberY = zeros(2, 1);
numberWstar = zeros(2, 1);
numberW = zeros(2, size(Xtrain, 2));

for i = 1:numberYstar
    index = Ytrain(i) + 1;
    numberY(index) = numberY(index) + 1;
    numberW(index, 1:end) = numberW(index, 1:end) + Xtrain(i, 1:end);
    numberWstar(index) = numberWstar(index) + sum(Xtrain(i, 1:end));
end

numberY = numberY + 1;
numberYstar = numberYstar + 2;

portion1 = numberY(1)/numberYstar;
portion2 = 1. - portion1;

numberW = numberW + 1;
numberWstar = numberWstar + size(Xtrain, 2);

numberW(1, 1:end) = numberW(1, 1:end)/numberWstar(1);
numberW(2, 1:end) = numberW(2, 1:end)/numberWstar(2);

model = [[portion1; portion2] numberW];
model = log(model);

end
    
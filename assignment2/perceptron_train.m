function [model] = perceptron_train(Xtrain, Ytrain)

k = 1;
t = 0;
numberOfSet = size(Ytrain, 1);
cw = zeros(numberOfSet, size(Xtrain, 2) + 1);
T = 3;

Y = Ytrain * 2 - 1;

while t < T
    for i = 1:numberOfSet
        if Y(i) * dot(cw(k, 2:end), Xtrain(i, 1:end)) <= 0
            cw(k+1, 1:end) = [1 (cw(k, 2:end) + Y(i)*Xtrain(i, 1:end))];
            k = k + 1;
        else
            cw(k, 1) = cw(k, 1) + 1;
        end
    end
    t = t + 1;
end

model = cw;
end

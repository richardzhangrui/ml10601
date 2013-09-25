function [model] = pre_train(Xtrain, Ytrain, alpha, lamda, epsilon)

Xtrain = full(Xtrain);

w = zeros(1, size(Xtrain, 2));

p = 1 ./ (1 + exp(-Xtrain * transpose(w)));
logp = log(p);
logmp = log(1-p);

LCL = dot(Ytrain, logp) + dot((1-Ytrain), logmp);
reg = lamda * w * transpose(w);

old = LCL - reg;
rows = size(Ytrain, 1);

rd = 0;

while rd < 56
    rd = rd + 1;
    order = randperm(rows);

    for i = order
            p(i) = 1 ./ (1 + exp(-Xtrain(i,:) * transpose(w)));
            w = w + alpha * ((Ytrain(i) - p(i)) * Xtrain(i,:) - 2 * lamda * w);
    end

    p = 1 ./ (1 + exp(-Xtrain * transpose(w)));
    logp = log(p);
    logmp = log(1-p);

    LCL = dot(Ytrain, logp) + dot((1-Ytrain), logmp);
    reg = lamda * w * transpose(w);

    new = LCL - reg;

    %fprintf('%d: newValue:%f, oldValue:%f, change:%f, sum:%d\n', rd, new, old, abs(new-old), s);
    %fflush(1);

    if abs(new - old) < epsilon
        break
    end

    old = new;
    
end

model = w;

end


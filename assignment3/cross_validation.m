function [final_lamda] = cross_validation(Xtrain, Ytrain, alpha, epsilon)

lamdas = [0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.1 1];

cols = size(lamdas ,2);

accuracy = 0;

for i = 1:cols
	%tmp = all_folds(Xtrain,Ytrain, alpha, lamdas(1, i), epsilon);	
	tmp = all_folds(Xtrain,Ytrain, alpha, lamdas(1, i), epsilon);	
	if tmp > accuracy
		accuracy = tmp;
		final_lamda = lamdas(1, i);
	end
end

fprintf('%f', accuracy);

end

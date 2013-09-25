function [result] = all_folds(Xtrain, Ytrain, alpha, lamda, epsilon)

rs = zeros(1,10);

rows = size(Xtrain, 1);
rs_size = size(rs,2);

for i = 1:rs_size
	mask = [(1:rows*(i-1)/rs_size) (rows*i/rs_size+1 : rows)];
	mask_t = [rows*(i-1)/rs_size+1  rows*i/rs_size];
	rs(1,i) = one_fold(Xtrain(mask, :), Ytrain(mask, :), Xtrain(mask_t, :), Ytrain(mask_t, :), alpha, lamda, epsilon);	
end

result = mean(rs);

end

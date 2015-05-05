%%Preferation: We use sigmoid function

function [y] = sigmoid(X)
	y = 1 ./ (1 + e .^ ((-1) * X));
end
function [Y_p, w_final, iter] = perceptron (X, Y, w, theta = 0.2, alpha = 0.1)

%% Step.1 Set Initial Values
%% w, theta = [-0.5, 0.5]

iter = 0;
p = zeros(4,1);
Y_p = zeros(4,1);
w_delta = zeros(size(w));

%% Step.2 Interation
while(1)
	iter++;
	p = sum(X.*w,2) - theta;
	Y_p = p > 0;								% Step Function i >= 0 then 1 or 0
	e_p = Y - Y_p;								% Error of Original Y and Perceptron Y
	w_delta = alpha * X .* e_p;					% Calculate delta of weight
	w = w + w_delta;							% Update weight

	if any(e_p) == 0
		break;
	end
end
Y_p;
w_final = w;
iter;
end
%% Perceptron Multilayer
%% Version 0.1
%% Authour : Junmo Roger Kang
%% On write : 5/2/2015

clc;
clear;

X = [1 ; 1];
Y = 0;
alpha = 0.1;
iter = 1000;
neuron(1).Theta = [ 0.5 0.9; 0.4 1.0];
neuron(2).Theta = [ -1.2; 1.1];
neuron(1).rg = [ 0.8; -0.1];
neuron(2).rg = [ 0.3];
neuron(1).layer = [];
neuron(2).layer = [];

	

num_layer = size(neuron)(2);
err_report = [];
fprintf('Number of Layers: %d\n',num_layer);

for k = 1:iter
	fprintf('iter %d ',k);

	%%%%%%%%%% Forward Propagation
	for i = 1:num_layer
		% Set input layer
		if i == 1
			neuron(i).layer = sigmoid(neuron(i).Theta' * X - neuron(i).rg);
		else
			neuron(i).layer = sigmoid(neuron(i).Theta' * neuron(i-1).layer - neuron(i).rg);
		end
	end

	output = neuron(num_layer).layer;
	err = Y - output;

	% err_report = [err_report, err]
	
	%%%%%%%%%% Backward Propagation
	y_def = neuron(2).layer .* (1 - neuron(2).layer) .* err;

	% Set delta
	for i = 1:num_layer
		neuron(i).dw = [];
		neuron(i).dt = [];
	end
	% Caluculate deltas
	for i = fliplr(1:num_layer)
		% Set delta
		if i == num_layer
			y = y_def;
		else
			y = neuron(i).layer .* (1 - neuron(i).layer) * y_def .* neuron(i+1).Theta;
		end

		% Set layer
		if i == 1
			layer = X;
		else
			layer = neuron(i-1).layer;
		end

		% Assign delta
		neuron(i).dw = alpha .* layer .* y;
		neuron(i).dt = alpha * (-1) * y;
	end

	%Update Theta and.rg
	for i = 1:num_layer
		if size(neuron(i).Theta)(2) == 1
			neuron(i).Theta = neuron(i).Theta + neuron(i).dw;
		else
			for j = 1:size(neuron(i).Theta)(2)
				neuron(i).Theta(j,:) = neuron(i).Theta(j,:) + neuron(i).dw(:)';
			end
		end
		neuron(i).Theta;
		neuron(i).dw;
		neuron(i).rg = neuron(i).rg + neuron(i).dt;
	end
	fprintf('error %.4f \n',err);
	err_report = [err_report,err];

end
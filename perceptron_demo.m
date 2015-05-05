%% Show initial setting
fprintf('Initial value of X and Y is ... (Press any key to continue');
w = [ 0.3 -0.1; 0.3 -0.1; 0.3 -0.1; 0.2 -0.1;]
X = [ 0 0; 0 1; 1 0; 1 1]
Y = [ 0; 0; 0; 1]
pause;

[Y_w_final, iter] = perceptron(X, Y, w)

pause;

X = [1 2];
Y = 0;
w_ik = [ 0.5 0.9; 0.4 1.0];
w_jk = [ 0.4 1.0];
theta_j = [0.8, -0.1];
theta_k = [0.3];



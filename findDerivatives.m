function [J, theta, Jx, Jy] = findDerivatives(I, Gx, Gy)
%% Define Function Global Variables

Sigma_x = [1,-1];
Sigma_y = [1;-1];
Dx_Smoothed = conv2(conv2(Gx,Sigma_x,'same'),Gy, 'same');
Dy_Smoothed = conv2(conv2(Gy,Sigma_y,'same'),Gx, 'same');

%% Smoothing Out And Take The Derivative The Image

%Padding the original image
I_padded_x = padarray(I, [0,5], 'symmetric');
I_padded_y = padarray(I, [5,0], 'symmetric');

%Taking the derivative w.r.t. x
I_x = conv2(double(I_padded_x), Dx_Smoothed, 'valid');

%Taking the derivative w.r.t. x
I_y = conv2(double(I_padded_y), Dy_Smoothed, 'valid');

%% Getting Returns

Abs_Ixy = sqrt(I_x.^2 + I_y.^2);
J = double(Abs_Ixy);
or = atan2(-I_y, I_x);
or(or < 0) = or(or < 0) + pi;
or_degree = or*180/pi;
theta = or_degree;
Jx =  abs(I_x);
Jy =  abs(I_y); 



end

function [x,y] = filter_scatter_data(x,y)
% fit_scatter_data  - Fitting the scattered datapoint with linear
% interpolation for each trial
%   Details later


figure

plot(x,y,'b.')

x2 = 0:0.001:4;
mx = nanmean(x)';

%y2=interp1(x,y,x2,'spline');

%plot(x2,y2,'ro')

f=fit(mx,y,"smoothingspline");

keyboard

end
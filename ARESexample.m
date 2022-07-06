%% Example using the ARESLab package to model curvature vs. distance
%
%  Download the ARESLab package from 
%  http://www.cs.rtu.lv/jekabsons/regression.html

more off % Allow the command window to scroll if it becomes full

% Read sample data.  Time in seconds, distance in meters, accelerations in
% gravities, gz is the yaw rate in degrees/s, heading is in degrees.
% Only time, ay and speed will be used here.
lap3 = readtable('MidOhioLap3.csv');

% Curvature based on ay
kappa = lap3.ay * 9.82 ./ lap3.speed;     

% Path length s calculated from speed and time
dist = zeros(size(lap3.time));
dist(2:end) = (lap3.time(2:end) - lap3.time(1:end-1)) ...
        .* (lap3.speed(1:end-1) + lap3.speed(2:end))/2;
dist = cumsum(dist);

% Set parameters for ARES model building.  
% maxFuncs is the maximum number of basis functions in the forward pass
% c affects the pruning process in the backward pass.  c = 2 is the default
% cubic = true for cubic spline model, false for piecewise linear model
% vervose = true for detailed output during model building
params = aresparams2('maxFuncs', 100, 'c', 6, 'cubic', true);

% Build the ARES model 
fprintf('\n')
[model, time, resultsEval] = aresbuild(dist, kappa, params);

% Generate a set of points for plotting the model
splot = linspace(min(dist), max(dist), 1000)'; % Must be a column vector
kplot = arespredict(model, splot);   

% Plot the data, the fitted model, and the knot points
figure(1); clf; hold on
plot(dist, kappa, 'r.')  % Raw data points
plot(splot, kplot, 'b-', 'LineWidth', 1)  % Model
knots = sort(cell2mat(model.knotsites));  % Knot points
plot(knots, arespredict(model, knots), 'bo', 'MarkerFaceColor', 'b')

set(gca, 'FontSize', 18)
xlabel('Distance (m)')
ylabel('Curvature (rad/m)')
grid on
box on
axis([0 3600 -0.8 0.8])
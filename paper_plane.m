%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005

global CL CD S m g rho	
S =	0.017;			% Reference Area, m^2
AR = 0.86;			% Wing Aspect Ratio
e = 0.9;			% Oswald Efficiency Factor;
m =	0.003;			% Mass, kg
g =	9.8;			% Gravitational acceleration, m/s^2
rho = 1.225;			% Air density at Sea Level, kg/m^3	
CLa = 3.141592 * AR/(1 + sqrt(1 + (AR / 2)^2));
						% Lift-Coefficient Slope, per rad
CDo = 0.02;			% Zero-Lift Drag Coefficient
epsilon	= 1 / (3.141592 * e * AR);% Induced Drag Factor	
CL = sqrt(CDo / epsilon);	% CL for Maximum Lift/Drag Ratio
CD = CDo + epsilon * CL^2;	% Corresponding CD
LDmax =	CL / CD;			% Maximum Lift/Drag Ratio
Gam = -atan(1 / LDmax);	% Corresponding Flight Path Angle, rad
V =	sqrt(2 * m * g /(rho * S * (CL * cos(Gam) - CD * sin(Gam))));
						% Corresponding Velocity, m/s
Alpha =	CL / CLa;			% Corresponding Angle of Attack, rad

% a) Equilibrium Glide at Maximum Lift/Drag Ratio
H =	2;			% Initial Height, m
R =	0;			% Initial Range, m
to = 0;			% Initial Time, sec
tf = 6;			% Final Time, sec
tspan =	[to tf];
xo = [V;Gam;H;R];
[ta,xa] = ode23('EqMotion',tspan,xo);

% b) Oscillating Glide due to Zero Initial Flight Path Angle
xo = [V;0;H;R];
[tb,xb]	= ode23('EqMotion',tspan,xo);

% c) Effect of Increased Initial Velocity
xo = [1.5*V;0;H;R];
[tc,xc]	= ode23('EqMotion',tspan,xo);

% d) Effect of Further Increase in Initial Velocity
xo = [3*V;0;H;R];
[td,xd] = ode23('EqMotion',tspan,xo);

% figure
% plot(xa(:,4),xa(:,3),xb(:,4),xb(:,3),xc(:,4),xc(:,3),xd(:,4),xd(:,3))
% xlabel('Range, m'), ylabel('Height, m'), grid
% 
% figure
% subplot(2,2,1)
% plot(ta,xa(:,1),tb,xb(:,1),tc,xc(:,1),td,xd(:,1))
% xlabel('Time, s'), ylabel('Velocity, m/s'), grid
% subplot(2,2,2)
% plot(ta,xa(:,2),tb,xb(:,2),tc,xc(:,2),td,xd(:,2))
% xlabel('Time, s'), ylabel('Flight Path Angle, rad'), grid
% subplot(2,2,3)
% plot(ta,xa(:,3),tb,xb(:,3),tc,xc(:,3),td,xd(:,3))
% xlabel('Time, s'), ylabel('Altitude, m'), grid
% subplot(2,2,4)
% plot(ta,xa(:,4),tb,xb(:,4),tc,xc(:,4),td,xd(:,4))
% xlabel('Time, s'), ylabel('Range, m'), grid

% % PART 1:

    % Define variations
    vel_var = [3.55-2, 3.55+7.5]; % Nominal velocity: 3.55 m/s
    gamma_var = [-0.18-0.5, -0.18+0.4]; % Nominal flight path angle: -0.18 rad

    % Initialize figure
    figure

    % Plot trajectories for varying initial velocity
    subplot(2,1,1)
    hold on
    for i = 1:length(vel_var)
        % Set initial conditions
        xo = [vel_var(i); -0.18; 2; 0];
        % Run simulation
        [t, x] = ode23(@EqMotion, tspan, xo);
        % Plot trajectory
        plot(x(:,4), x(:,3), 'k', 'LineWidth', 1); % Nominal in black
    end
    xlabel('Range, m')
    ylabel('Height, m')
    grid on

    % Plot trajectories for varying initial flight path angle
    subplot(2,1,2)
    hold on
    for i = 1:length(gamma_var)
        % Set initial conditions
        xo = [3.55; gamma_var(i); 2; 0];
        % Run simulation
        [t, x] = ode23(@EqMotion, tspan, xo);
        % Plot trajectory
        if i == 1
            plot(x(:,4), x(:,3), 'r', 'LineWidth', 1); % Lower value in red
        elseif i == 2
            plot(x(:,4), x(:,3), 'g', 'LineWidth', 1); % Higher value in green
        else
            plot(x(:,4), x(:,3), 'k', 'LineWidth', 1); % Nominal in black
        end
    end
    xlabel('Range, m')
    ylabel('Height, m')
    grid on

% % PART 2

    % Define expected ranges for parameters
    vel_min = 3.55 - 2;
    vel_max = 3.55 + 7.5;
    gamma_min = -0.18 - 0.5;
    gamma_max = -0.18 + 0.4;

    % Initialize figure
    figure
    hold on

    % Perform 100 runs with random parameters
    for run = 1:100
        % Generate random parameters
        vel = vel_min + (vel_max - vel_min) * rand(1);
        gamma = gamma_min + (gamma_max - gamma_min) * rand(1);

        % Set initial conditions
        xo = [vel; gamma; 2; 0];

        % Run simulation
        [t, x] = ode23(@EqMotion, tspan, xo);

        % Plot trajectory with suitable color and line style
        plot(x(:,4), x(:,3), 'b', 'LineStyle', '-', 'LineWidth', 1); % Gray color with solid line
    end

    % Labeling and grid
    xlabel('Range, m')
    ylabel('Height, m')
    grid on

% % PART 3 & PART 4

    % Initialize arrays to store trajectory data
    all_time = [];
    all_range = [];
    all_height = [];

    % Perform 100 runs with random parameters
    for run = 1:100
        % Generate random parameters
        vel = vel_min + (vel_max - vel_min) * rand(1);
        gamma = gamma_min + (gamma_max - gamma_min) * rand(1);

        % Set initial conditions
        xo = [vel; gamma; 2; 0];

        % Run simulation
        [t, x] = ode23(@EqMotion, tspan, xo);

        % Concatenate trajectory data
        all_time = [all_time; t];
        all_range = [all_range; x(:,4)];
        all_height = [all_height; x(:,3)];

        % Plot individual trajectories
        subplot(2,1,1)
        plot(x(:,4), x(:,3), 'b', 'LineStyle', '-', 'LineWidth', 1); % Gray color with solid line
        hold on
    end

    % Fit polynomials to the concatenated data
    range_poly = polyfit(all_time, all_range, 3); % Fit a cubic polynomial to range data
    height_poly = polyfit(all_time, all_height, 3); % Fit a cubic polynomial to height data

    % Generate time points for plotting the fitted curves
    time_fit = linspace(min(all_time), max(all_time), 100);

    % Evaluate the polynomial functions to get fitted curves
    range_fit = polyval(range_poly, time_fit);
    height_fit = polyval(height_poly, time_fit);

    % Plot the average trajectories
    subplot(2,1,2)
    plot(range_fit, height_fit, 'r-', 'LineWidth', 2); % Plot the fitted curve for average trajectory
    xlabel('Range, m')
    ylabel('Height, m')
    title('Average Trajectory')
    grid on

% % PART 5

% Compute the first time derivatives
height_deriv = polyder(height_poly); % Derivative of height polynomial
range_deriv = polyder(range_poly); % Derivative of range polynomial

% Evaluate the derivatives at time_fit points
height_deriv_val = polyval(height_deriv, time_fit);
range_deriv_val = polyval(range_deriv, time_fit);

% Plot the derivatives in subplots
figure
subplot(2,1,1)
plot(time_fit, height_deriv_val, 'r-', 'LineWidth', 1); % Plot height derivative
xlabel('Time, s')
ylabel('d(Height)/dt, m/s')
title('Height Derivative')
grid on

subplot(2,1,2)
plot(time_fit, range_deriv_val, 'b-', 'LineWidth', 1); % Plot range derivative
xlabel('Time, s')
ylabel('d(Range)/dt, m/s')
title('Range Derivative')
grid on


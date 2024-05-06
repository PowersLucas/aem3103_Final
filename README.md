# Paper Airplane Numerical Study
Final Project: AEM 3103 Spring 2024

- By: Lucas Powers

## Summary of Findings

| Parameter Variation    | Lower Bound | Nominal Value | Upper Bound |
|------------------------|-------------|---------------|-------------|
| Initial Velocity (m/s) | 1.55        | 3.55          | 11.05       |
| Initial Flight Path Angle (rad) | -0.68 | -0.18         | 0.22        |

In this project, I conducted an experiment on the flight dynamics of a paper airplane with varying parameters. The varying parameters include differences in initial velocity and differences in the flight path angle of the paper plane. From the simulations, we observed the following:

1. Increasing the initial velocity resulted in longer range flights.
2. Higher flight path angles led to steeper descent trajectories.
3. The Monte Carlo simulation revealed a wide range of possible trajectories due to parameter variations.

# Code Listing

- [EqMotion.m](EqMotion.m): MATLAB script containing the equations of motion for the aircraft.
  - This script calculates the derivatives of the state variables based on the current state and global aerodynamic parameters.

# Figures

## Fig. 1: Single Parameter Variation
![Single Parameter Variation](single_parameter_variation.png)

This figure shows the 2D trajectory simulated by varying a single parameter at a time. The nominal trajectory is also displayed for reference.

## Fig. 2: Monte Carlo Simulation
![Monte Carlo Simulation](monte_carlo_simulation.png)

This figure displays the 2D trajectories simulated using random sampling of parameters. Polynomial fits are overlaid onto the plot to show the average trajectory.

## Fig. 3: Time Derivatives
![Time Derivatives](time_derivatives.png)

This figure shows the time-derivative of height and range for the fitted trajectory. It provides insight into the rate of change of these parameters over time.

  Briefly describe what is being shown in the figure.

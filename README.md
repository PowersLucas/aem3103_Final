# Paper Airplane Numerical Study
Final Project: AEM 3103 Spring 2024

- By: Lucas Powers

## Summary of Findings

| Parameter Variation    | Lower Bound | Nominal Value | Upper Bound |
|------------------------|-------------|---------------|-------------|
| Initial Velocity (m/s) | 1.55        | 3.55          | 11.05       |
| Initial Flight Path Angle (rad) | -0.68 | -0.18         | 0.22        |

In this project, I experimented with the flight dynamics of a paper airplane with varying parameters. The varying parameters include differences in initial velocity and differences in the flight path angle of the paper plane. From my calculations, I can state that an increase in the initial velocity resulted in longer-range flights, higher flight path angles led to steeper descent trajectories, and that the Monte Carlo simulation was able to demonstrate a wide range of possible trajectories due to parameter variations and limits.

# Code Listing

- [EqMotion.m](EqMotion.m)
  - This function calculates the first-order time derivatives of the state variables, which describe the motion of the aircraft over time.

- [paper_plane.m](paper_plane.m)
  - This script declares the global variables of the paper plane and analyzes its behavior with varying parameters. 
# Figures

## Fig. 1: Single Parameter Variation
![Single Parameter Variation](single_parameter_variation.png)

This figure shows the 2D trajectory simulated by varying a single parameter at a time. The nominal trajectory is displayed with the black line anything lower than the nominal is red and anything higher is green.

## Fig. 2: Monte Carlo Simulation
![Monte Carlo Simulation](monte_carlo_simulation.png)

This figure displays the 2D trajectories simulated using 100 random samples of parameters. The bottom graph displays a polynomial fit that is ploted to show the average trajectory out of the random 100 samples.

## Fig. 3: Time Derivatives
![Time Derivatives](time_derivatives.png)

This figure shows the time-derivative of height and range for the fitted trajectory. It provides insight into the rate of change of these parameters over time.

  

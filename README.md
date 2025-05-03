
# GyroToEuler-Quaternion-Sim

This MATLAB Simulink project estimates Euler angles and quaternions from rate gyro data. Using Euler and Poisson kinematic equations, the model computes attitude representation and axis-angle parameters (theta and unit vector **ē**) from angular velocity inputs.

## Features

* Converts rate gyro data to:

  * Euler angles (roll, pitch, yaw)
  * Quaternions (q0, q1, q2, q3)
  * Axis-angle representation (θ and **ē**)
* Visualization of orientation using the Aircraft Animation Toolbox
* Random x, y, z motion used to simulate position input

## How to Run

1. Clone or download the repository.
2. Ensure `angular_velocity.mat` is included in your MATLAB path.
3. Open and run the `eulerangle.m` script to initialize and launch the Simulink model.

## Files

* `eulerangle.m`: Main script to load data and run the simulation
* `angular_velocity.mat`: Input data file containing gyro readings
* Simulink model (`.slx`) with animation and output scopes
* Aircraft Animation Toolbox for 3D visualization

## Requirements

* MATLAB with Simulink
* Aerospace Toolbox (for animation)

## Notes

Euler angles and quaternion outputs can be viewed in Simulink scopes. The animation block visualizes 3D orientation with random positional input and computed attitude.



within BSM1.Modules;

model MPC "Icon for Model Predictive Control (MPC)"
  extends BSM1.Modules.Icons.MPC;
  Modelica.Blocks.Interfaces.RealInput u_PV annotation(
    Placement(visible = true, transformation(origin = {-81, 27}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-71, 25}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_SP annotation(
    Placement(visible = true, transformation(origin = {-81, -29}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-71, -27}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y1 annotation(
    Placement(visible = true, transformation(origin = {90, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {87, 23}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y2 annotation(
    Placement(visible = true, transformation(origin = {90, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {87, -25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  // Entrada
  Real U[1, 2] = [u_PV, u_SP];
  // Salida
  Real Y[1, 2];
  // Matrices de estado, modelo de segundo grado (Holenda, 2007)
  //Holenda, B. (2007). Development of modelling, control and optimization tools for the activated sludge process. Cand. Diss. Pannonia, 155.
  Real X[2, 2];
  Real A[2, 2] = [-100.03, 115; 167.77, -211.47];
  Real B[2, 1] = [0.87; -1.55];
  Real C[1, 2] = [7.55, 0.32];
equation
  der(X) = A * X + B * U;
  Y = C * X;
  y1 = Y[1, 1];
  y2 = Y[1, 2];
  annotation(
    Documentation(info = "

Main Author:
 Mikel Gorrotxategi Zipitria

The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

    "));
  annotation(
    Documentation(info = "MPC to control the Kla of the blower of a tank in an ASM1 model of WWTP"));
end MPC;

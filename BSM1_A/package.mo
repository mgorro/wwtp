package BSM1_A "Component models for the Benchmark Simulation Model No.1"
  package Modules "Component models for the Benchmark Simulated Model No.1"
    package Interfaces "Connectors and partial ASM1 model for Wastewater Treatment Modelling"
      extends Modelica.Icons.Library;

      connector WWFlowAsm1in "Inflow connector of ASM1 components"
        package WWU = WasteWater.WasteWaterUnits;
        flow WWU.VolumeFlowRate Q;
        WWU.MassConcentration Si;
        WWU.MassConcentration Ss;
        WWU.MassConcentration Xi;
        WWU.MassConcentration Xs;
        WWU.MassConcentration Xbh;
        WWU.MassConcentration Xba;
        WWU.MassConcentration Xp;
        WWU.MassConcentration So;
        WWU.MassConcentration Sno;
        WWU.MassConcentration Snh;
        WWU.MassConcentration Snd;
        WWU.MassConcentration Xnd;
        WWU.Alkalinity Salk;
        annotation(
          Window(x = 0.45, y = 0.01, width = 0.35, height = 0.49),
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid), Text(extent = {{-88, 92}, {88, -94}}, lineColor = {255, 255, 255}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid, textString = "%name")}),
          Documentation(info = "Connectors WWFlowAsm1in and WWFlowAsm1out are nearly identical.
The difference is in the icons to more easily identify the inflow and outflow
side of a component.
The connector consists of one flow variable and 13 potential variables (ASM1 concentrations).
          "));
      end WWFlowAsm1in;

      connector WWFlowAsm1out "Outflow connector of ASM1 components"
        package WWU = WasteWater.WasteWaterUnits;
        flow WWU.VolumeFlowRate Q;
        WWU.MassConcentration Si;
        WWU.MassConcentration Ss;
        WWU.MassConcentration Xi;
        WWU.MassConcentration Xs;
        WWU.MassConcentration Xbh;
        WWU.MassConcentration Xba;
        WWU.MassConcentration Xp;
        WWU.MassConcentration So;
        WWU.MassConcentration Sno;
        WWU.MassConcentration Snh;
        WWU.MassConcentration Snd;
        WWU.MassConcentration Xnd;
        WWU.Alkalinity Salk;
        annotation(
          Window(x = 0.45, y = 0.01, width = 0.35, height = 0.49),
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(extent = {{-88, 92}, {94, -92}}, textString = "%name")}),
          Documentation(info = "Connectors WWFlowAsm1in and WWFlowAsm1out are nearly identical.
The difference is in the icons to more easily identify the inflow and outflow
side of a component.
The connector consists of one flow variable and 13 potential variables (ASM1 concentrations).
          "));
      end WWFlowAsm1out;

      connector AirFlow "Airflow connector"
        package WWU = WasteWater.WasteWaterUnits;
        flow WWU.VolumeFlowRate Q_air;
        annotation(
          Documentation(info = "The Airflow connector consits of a flow variable describing the exchange of
air between blower and nitrification tank."),
          Window(x = 0.4, y = 0.35, width = 0.6, height = 0.6));
      end AirFlow;

      partial model stoichiometry "ASM1 stoichiometric coefficients"
        // Stoichiometric parameters based on the original ASM1 publication//
        parameter Real Y_h = 0.67 "Heterotrophic Yield [g Xbh COD formed/(g COD utilised)]";
        parameter Real Y_a = 0.24 "Autotrophic Yield [g Xba COD formed/(g N utilised)]";
        parameter Real f_p = 0.08 "Fraction of biomass to particulate products [-]";
        parameter Real i_xb = 0.08 "Fraction nitrogen in biomass [g N/(g COD)]";
        parameter Real i_xp = 0.06 "Fraction nitrogen in particulate products [g N/(g COD)]";
        annotation(
          Window(x = 0.45, y = 0.01, width = 0.35, height = 0.49),
          Documentation(info = "This is a partial model providing the stoichiometric coefficients of the ASM1 model."));
      end stoichiometry;

      partial model ASM1base "Base class of WWTP modelling by ASM1"
        extends Interfaces.stoichiometry;
        package WWU = WasteWater.WasteWaterUnits;
        // parameters based on the original ASM1 publication based on 15 deg C
        Real mu_h "Maximum heterotrophic growth rate f(T) [day^-1]";
        Real b_h "Heterotrophic decay rate f(T) [day^-1]";
        Real mu_a "Maximum autotrophic growth rate f(T) [day^-1]";
        //Real K_nh "Half-saturation (auto. growth) f(T) [g NH-N/m3]";
        Real b_a "Autotrophic decay rate f(T) [day^-1]";
        Real k_a "Ammonification rate f(T) [m3/(g COD day)]";
        Real k_h "Maximum specific hydrolysis rate f(T) [g Xs/(g Xbh COD day)]";
        Real K_x "Half-saturation (hydrolysis) f(T) [g Xs/(g Xbh COD)]";
        parameter Real mu_h_T = 4.0 "Maximum heterotrophic growth rate at T=15 deg C [day^-1]";
        parameter Real b_h_T = 0.3 "Heterotrophic decay rate at T=15 deg C [day^-1]";
        parameter Real mu_a_T = 0.5 "Maximum autotrophic growth rate at T=15 deg C[day^-1]";
        parameter Real b_a_T = 0.05 "Autotrophic decay rate at T=15 deg C [day^-1]";
        parameter Real k_a_T = 0.05 "Ammonification rate at T=15 deg C [m3/(g COD day)]";
        parameter Real k_h_T = 3.0 "Maximum specific hydrolysis rate at T=15 deg C [g Xs/(g Xbh COD day)]";
        parameter Real K_x_T = 0.1 "Half-saturation (hydrolysis) at T=15 deg C [g Xs/(g Xbh COD)]";
        parameter Real K_nh = 1.0 "Half-saturation (auto. growth) [g NH-N/m3]";
        parameter Real K_s = 10.0 "Half-saturation (hetero. growth) [g COD/m3]";
        parameter Real K_oh = 0.2 "Half-saturation (hetero. oxygen) [g O/m3]";
        parameter Real K_no = 0.5 "Half-saturation (nitrate) [g NO-N/m3]";
        parameter Real K_oa = 0.4 "Half-saturation (auto. oxygen) [g O/m3]";
        parameter Real ny_g = 0.8 "Anoxic growth rate correction factor [-]";
        parameter Real ny_h = 0.8 "Anoxic hydrolysis rate correction factor [-]";
        WWU.MassConcentration Si "Soluble inert organic matter";
        WWU.MassConcentration Ss "Readily biodegradable substrate";
        WWU.MassConcentration Xi "Particulate inert organic matter";
        WWU.MassConcentration Xs "Slowly biodegradable substrate";
        WWU.MassConcentration Xbh "Active heterotrophic biomass";
        WWU.MassConcentration Xba "Active autotrophic biomass";
        WWU.MassConcentration Xp "Particulate products from biomass decay";
        WWU.MassConcentration So "Dissolved oxygen";
        WWU.MassConcentration Sno "Nitrate and nitrite nitrogen";
        WWU.MassConcentration Snh "Ammonium nitrogen";
        WWU.MassConcentration Snd "Soluble biodegradable organic nitrogen";
        WWU.MassConcentration Xnd "Particulate biodegradable organic nitrogen";
        WWU.Alkalinity Salk "Alkalinity";
        Real p1;
        Real p2;
        Real p3;
        Real p4;
        Real p5;
        Real p6;
        Real p7;
        Real p8;
        Real r1;
        Real r2;
        Real r3;
        Real r4;
        Real r5;
        Real r6;
        Real r7;
        Real r8;
        Real r9;
        Real r10;
        Real r11;
        Real r12;
        Real r13;
        Real inputSi;
        Real inputSs;
        Real inputXi;
        Real inputXs;
        Real inputXbh;
        Real inputXba;
        Real inputXp;
        Real inputSo;
        Real inputSno;
        Real inputSnh;
        Real inputSnd;
        Real inputXnd;
        Real inputSalk;
        Real aeration;
        WWFlowAsm1in In annotation(
          Placement(transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
        WWFlowAsm1out Out annotation(
          Placement(transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
        WWFlowAsm1out MeasurePort annotation(
          Placement(transformation(extent = {{50, 40}, {60, 50}}, rotation = 0)));
        Modelica.Blocks.Interfaces.RealInput T annotation(
          Placement(transformation(extent = {{-110, 30}, {-90, 50}}, rotation = 0)));
      equation
// Temperature dependent Kinetic parameters based on 15 deg C //
// may be adapted to 10 or 20 deg C
        mu_h = mu_h_T * exp(0.069 * (T - 15));
        b_h = b_h_T * exp(0.069 * (T - 15));
        mu_a = mu_a_T * exp(0.098 * (T - 15));
//K_nh=1.0*exp(0.069*(T.signal[1]-15));
        b_a = b_a_T * exp(0.08 * (T - 15));
        k_a = k_a_T * exp(0.069 * (T - 15));
        k_h = k_h_T * exp(0.11 * (T - 15));
        K_x = K_x_T * exp(0.11 * (T - 15));
// Process Rates //
        p1 = mu_h * (Ss / (K_s + Ss)) * (So / (K_oh + So)) * Xbh;
        p2 = mu_h * (Ss / (K_s + Ss)) * (K_oh / (K_oh + So)) * (Sno / (K_no + Sno)) * ny_g * Xbh;
        p3 = mu_a * (Snh / (K_nh + Snh)) * (So / (K_oa + So)) * Xba;
        p4 = b_h * Xbh;
        p5 = b_a * Xba;
        p6 = k_a * Snd * Xbh;
        p7 = k_h * (Xs / Xbh / (K_x + Xs / Xbh)) * (So / (K_oh + So) + ny_h * (K_oh / (K_oh + So)) * (Sno / (K_no + Sno))) * Xbh;
        p8 = p7 * Xnd / Xs;
// biochemical reactions
        r1 = 0;
        r2 = ((-p1) - p2) / Y_h + p7;
        r3 = 0;
        r4 = (1 - f_p) * (p4 + p5) - p7;
        r5 = p1 + p2 - p4;
        r6 = p3 - p5;
        r7 = f_p * (p4 + p5);
        r8 = (-(1 - Y_h) / Y_h * p1) - (4.57 - Y_a) / Y_a * p3;
        r9 = (-(1 - Y_h) / (2.86 * Y_h) * p2) + p3 / Y_a;
        r10 = (-i_xb * (p1 + p2)) - (i_xb + 1 / Y_a) * p3 + p6;
        r11 = (-p6) + p8;
        r12 = (i_xb - f_p * i_xp) * (p4 + p5) - p8;
        r13 = (-i_xb / 14 * p1) + ((1 - Y_h) / (14 * 2.86 * Y_h) - i_xb / 14) * p2 - (i_xb / 14 + 1 / (7 * Y_a)) * p3 + p6 / 14;
// derivatives
        der(Si) = inputSi + r1;
        der(Ss) = inputSs + r2;
        der(Xi) = inputXi + r3;
        der(Xs) = inputXs + r4;
        der(Xbh) = inputXbh + r5;
        der(Xba) = inputXba + r6;
        der(Xp) = inputXp + r7;
        der(So) = inputSo + r8 + aeration;
        der(Sno) = inputSno + r9;
        der(Snh) = inputSnh + r10;
        der(Snd) = inputSnd + r11;
        der(Xnd) = inputXnd + r12;
        der(Salk) = inputSalk + r13;
// Outputs
        Out.Q + In.Q = 0;
        Out.Si = Si;
        Out.Ss = Ss;
        Out.Xi = Xi;
        Out.Xs = Xs;
        Out.Xbh = Xbh;
        Out.Xba = Xba;
        Out.Xp = Xp;
        Out.So = So;
        Out.Sno = Sno;
        Out.Snh = Snh;
        Out.Snd = Snd;
        Out.Xnd = Xnd;
        Out.Salk = Salk;
        MeasurePort.Si = Si;
        MeasurePort.Ss = Ss;
        MeasurePort.Xi = Xi;
        MeasurePort.Xs = Xs;
        MeasurePort.Xbh = Xbh;
        MeasurePort.Xba = Xba;
        MeasurePort.Xp = Xp;
        MeasurePort.So = So;
        MeasurePort.Sno = Sno;
        MeasurePort.Snh = Snh;
        MeasurePort.Snd = Snd;
        MeasurePort.Xnd = Xnd;
        MeasurePort.Salk = Salk;
        annotation(
          Window(x = 0.03, y = 0.03, width = 0.35, height = 0.49),
          Documentation(info = "This partial model provides connectors and equations that are needed in the biological 
components (nitrification and denitrification tank) for ASM1 wastewater treatment plant models.
Parameters are coded according the ASM1 [1,2] standard distribution.
Changes to this parameters are subject to the modeller.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de


References:

[1] M. Henze and C.P.L. Grady Jr and W. Gujer and G.v.R. Marais and T. Matsuo:
    Activated Sludge Model No.1. IAWQ, 1987.
[2] M. Henze and W.Gujer and T. Mino and. M.v. Loosdrecht: Activated Sludge
    Models ASM1, ASM2, ASM2d, and ASM3. IWA Task Group on Mathematical Modelling
    for Design and Operation of Biological Wastewater Treatment, 2000.


This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2000 - 2002, Gerald Reichl
          "));
      end ASM1base;
      annotation(
        Window(x = 0.45, y = 0.01, width = 0.44, height = 0.65, library = 1, autolayout = 1),
        Documentation(info = "This package contains connectors and interfaces (partial models) for
wastewater treatment components based on the Acticated Sludge Model No.1 (ASM1).

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany

This package is free software; it can be redistributed and/or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file \"Modelica/package.mo\".

Copyright (C) 2000 - 2001, Gerald Reichl
        "));
    end Interfaces;

    package Icons "Icon definitions for the WasteWater library"
      extends Modelica.Icons.Library;

      partial model nitri "Icon for a nitrification tank"
        annotation(
          Window(x = 0.45, y = 0.01, width = 0.35, height = 0.49),
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-80, 20}, {80, -80}}, lineColor = {255, 255, 255}, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Line(points = {{-80, -6}, {-80, -80}, {80, -80}, {80, -6}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{-80, 6}, {-80, 20}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{80, 6}, {80, 20}}, color = {0, 0, 0}, thickness = 0.5), Rectangle(extent = {{-90, 6}, {-80, -6}}, lineColor = {223, 191, 159}, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Rectangle(extent = {{80, 6}, {90, -6}}, lineColor = {223, 191, 159}, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Line(points = {{-90, -6}, {-80, -6}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{-90, 6}, {-80, 6}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{80, 6}, {90, 6}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{80, -6}, {90, -6}}, color = {0, 0, 0}, thickness = 0.5), Text(extent = {{-100, 100}, {100, 60}}, textString = "%name"), Line(points = {{-70, -74}, {70, -74}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{0, -80}, {0, -74}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{0, -80}, {0, -94}}, color = {0, 0, 0}, thickness = 0.5), Polygon(points = {{-70, -70}, {-68, -74}, {-62, -74}, {-60, -70}, {-70, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{60, -70}, {62, -74}, {68, -74}, {70, -70}, {60, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{4, -70}, {6, -74}, {12, -74}, {14, -70}, {4, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-14, -70}, {-12, -74}, {-6, -74}, {-4, -70}, {-14, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-52, -70}, {-50, -74}, {-44, -74}, {-42, -70}, {-52, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-32, -70}, {-30, -74}, {-24, -74}, {-22, -70}, {-32, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{42, -70}, {44, -74}, {50, -74}, {52, -70}, {42, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{22, -70}, {24, -74}, {30, -74}, {32, -70}, {22, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -56}, {-62, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-62, -66}, {-60, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -66}, {-66, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-70, -62}, {-68, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -62}, {-62, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -56}, {-66, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -50}, {-66, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -42}, {-66, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -36}, {-66, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -32}, {-66, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -24}, {-62, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -18}, {-66, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -8}, {-62, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, 0}, {-66, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-62, 12}, {-60, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-70, -70}, {-68, -74}, {-62, -74}, {-60, -70}, {-70, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -56}, {-62, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-62, -66}, {-60, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -66}, {-66, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-70, -62}, {-68, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -62}, {-62, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -56}, {-66, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -50}, {-66, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -42}, {-66, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -36}, {-66, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -32}, {-66, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -24}, {-62, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -18}, {-66, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -8}, {-62, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, 0}, {-66, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-62, 12}, {-60, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-52, -70}, {-50, -74}, {-44, -74}, {-42, -70}, {-52, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -56}, {-44, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-44, -66}, {-42, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -66}, {-48, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-52, -62}, {-50, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -62}, {-44, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -56}, {-48, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -50}, {-48, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -42}, {-48, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -36}, {-48, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -32}, {-48, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -24}, {-44, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -18}, {-48, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -8}, {-44, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, 0}, {-48, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-44, 12}, {-42, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-32, -70}, {-30, -74}, {-24, -74}, {-22, -70}, {-32, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -56}, {-24, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-24, -66}, {-22, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -66}, {-28, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-32, -62}, {-30, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -62}, {-24, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -56}, {-28, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -50}, {-28, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -42}, {-28, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -36}, {-28, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -32}, {-28, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -24}, {-24, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -18}, {-28, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -8}, {-24, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, 0}, {-28, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-24, 12}, {-22, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-14, -70}, {-12, -74}, {-6, -74}, {-4, -70}, {-14, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -56}, {-6, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-6, -66}, {-4, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -66}, {-10, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-14, -62}, {-12, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -62}, {-6, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -56}, {-10, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -50}, {-10, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -42}, {-10, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -36}, {-10, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -32}, {-10, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -24}, {-6, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -18}, {-10, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -8}, {-6, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, 0}, {-10, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-6, 12}, {-4, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{4, -70}, {6, -74}, {12, -74}, {14, -70}, {4, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -56}, {12, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{12, -66}, {14, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -66}, {8, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{4, -62}, {6, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -62}, {12, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -56}, {8, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -50}, {8, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -42}, {8, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -36}, {8, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -32}, {8, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -24}, {12, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -18}, {8, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -8}, {12, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, 0}, {8, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{12, 12}, {14, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{22, -70}, {24, -74}, {30, -74}, {32, -70}, {22, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -56}, {30, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{30, -66}, {32, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -66}, {26, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{22, -62}, {24, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -62}, {30, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -56}, {26, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -50}, {26, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -42}, {26, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -36}, {26, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -32}, {26, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -24}, {30, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -18}, {26, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -8}, {30, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, 0}, {26, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{30, 12}, {32, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{42, -70}, {44, -74}, {50, -74}, {52, -70}, {42, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -56}, {50, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{50, -66}, {52, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -66}, {46, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{42, -62}, {44, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -62}, {50, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -56}, {46, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -50}, {46, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -42}, {46, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -36}, {46, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -32}, {46, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -24}, {50, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -18}, {46, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{40, -8}, {38, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, 0}, {46, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{50, 12}, {52, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{60, -70}, {62, -74}, {68, -74}, {70, -70}, {60, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -56}, {68, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{68, -66}, {70, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -66}, {64, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{60, -62}, {62, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -62}, {68, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -56}, {64, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -50}, {64, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -42}, {64, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -36}, {64, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -32}, {64, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -24}, {68, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -18}, {64, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -8}, {68, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, 0}, {64, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{68, 12}, {70, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{54, -6}, {57, 40}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Ellipse(extent = {{50, -6}, {60, -16}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-56, -6}, {-53, 40}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-60, -6}, {-50, -16}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-90, 40}, {-53, 40}}, color = {0, 0, 0})}),
          Documentation(info = "Nitrifikationsbecken"),
          Documentation(info = "Icon for a nitrification tank "),
          Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-80, 20}, {80, -80}}, lineColor = {255, 255, 255}, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Line(points = {{-80, -6}, {-80, -80}, {80, -80}, {80, -6}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{-80, 6}, {-80, 20}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{80, 6}, {80, 20}}, color = {0, 0, 0}, thickness = 0.5), Rectangle(extent = {{-90, 6}, {-80, -6}}, lineColor = {223, 191, 159}, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Rectangle(extent = {{80, 6}, {90, -6}}, lineColor = {223, 191, 159}, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Line(points = {{-90, -6}, {-80, -6}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{-90, 6}, {-80, 6}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{80, 6}, {90, 6}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{80, -6}, {90, -6}}, color = {0, 0, 0}, thickness = 0.5), Text(extent = {{-100, 100}, {100, 60}}, textString = "%name"), Line(points = {{-70, -74}, {70, -74}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{0, -80}, {0, -74}}, color = {0, 0, 0}, thickness = 0.5), Line(points = {{0, -80}, {0, -94}}, color = {0, 0, 0}, thickness = 0.5), Polygon(points = {{-70, -70}, {-68, -74}, {-62, -74}, {-60, -70}, {-70, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{60, -70}, {62, -74}, {68, -74}, {70, -70}, {60, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{4, -70}, {6, -74}, {12, -74}, {14, -70}, {4, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-14, -70}, {-12, -74}, {-6, -74}, {-4, -70}, {-14, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-52, -70}, {-50, -74}, {-44, -74}, {-42, -70}, {-52, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-32, -70}, {-30, -74}, {-24, -74}, {-22, -70}, {-32, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{42, -70}, {44, -74}, {50, -74}, {52, -70}, {42, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{22, -70}, {24, -74}, {30, -74}, {32, -70}, {22, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -56}, {-62, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-62, -66}, {-60, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -66}, {-66, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-70, -62}, {-68, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -62}, {-62, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -56}, {-66, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -50}, {-66, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -42}, {-66, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -36}, {-66, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -32}, {-66, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -24}, {-62, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -18}, {-66, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -8}, {-62, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, 0}, {-66, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-62, 12}, {-60, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-70, -70}, {-68, -74}, {-62, -74}, {-60, -70}, {-70, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -56}, {-62, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-62, -66}, {-60, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -66}, {-66, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-70, -62}, {-68, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -62}, {-62, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -56}, {-66, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -50}, {-66, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -42}, {-66, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -36}, {-66, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -32}, {-66, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -24}, {-62, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, -18}, {-66, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-64, -8}, {-62, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-68, 0}, {-66, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-62, 12}, {-60, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-52, -70}, {-50, -74}, {-44, -74}, {-42, -70}, {-52, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -56}, {-44, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-44, -66}, {-42, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -66}, {-48, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-52, -62}, {-50, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -62}, {-44, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -56}, {-48, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -50}, {-48, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -42}, {-48, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -36}, {-48, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -32}, {-48, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -24}, {-44, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, -18}, {-48, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-46, -8}, {-44, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-50, 0}, {-48, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-44, 12}, {-42, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-32, -70}, {-30, -74}, {-24, -74}, {-22, -70}, {-32, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -56}, {-24, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-24, -66}, {-22, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -66}, {-28, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-32, -62}, {-30, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -62}, {-24, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -56}, {-28, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -50}, {-28, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -42}, {-28, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -36}, {-28, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -32}, {-28, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -24}, {-24, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, -18}, {-28, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-26, -8}, {-24, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-30, 0}, {-28, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-24, 12}, {-22, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{-14, -70}, {-12, -74}, {-6, -74}, {-4, -70}, {-14, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -56}, {-6, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-6, -66}, {-4, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -66}, {-10, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-14, -62}, {-12, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -62}, {-6, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -56}, {-10, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -50}, {-10, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -42}, {-10, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -36}, {-10, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -32}, {-10, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -24}, {-6, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, -18}, {-10, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-8, -8}, {-6, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-12, 0}, {-10, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-6, 12}, {-4, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{4, -70}, {6, -74}, {12, -74}, {14, -70}, {4, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -56}, {12, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{12, -66}, {14, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -66}, {8, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{4, -62}, {6, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -62}, {12, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -56}, {8, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -50}, {8, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -42}, {8, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -36}, {8, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -32}, {8, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -24}, {12, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, -18}, {8, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{10, -8}, {12, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{6, 0}, {8, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{12, 12}, {14, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{22, -70}, {24, -74}, {30, -74}, {32, -70}, {22, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -56}, {30, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{30, -66}, {32, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -66}, {26, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{22, -62}, {24, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -62}, {30, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -56}, {26, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -50}, {26, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -42}, {26, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -36}, {26, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -32}, {26, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -24}, {30, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, -18}, {26, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{28, -8}, {30, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{24, 0}, {26, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{30, 12}, {32, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{42, -70}, {44, -74}, {50, -74}, {52, -70}, {42, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -56}, {50, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{50, -66}, {52, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -66}, {46, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{42, -62}, {44, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -62}, {50, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -56}, {46, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -50}, {46, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -42}, {46, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -36}, {46, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -32}, {46, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{48, -24}, {50, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, -18}, {46, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{40, -8}, {38, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{44, 0}, {46, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{50, 12}, {52, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Polygon(points = {{60, -70}, {62, -74}, {68, -74}, {70, -70}, {60, -70}}, lineColor = {0, 0, 255}, fillColor = {127, 191, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -56}, {68, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{68, -66}, {70, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -66}, {64, -68}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{60, -62}, {62, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -62}, {68, -64}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -56}, {64, -58}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -50}, {64, -48}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -42}, {64, -44}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -36}, {64, -38}}, lineColor = {0, 127, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -32}, {64, -34}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -24}, {68, -26}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, -18}, {64, -20}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{66, -8}, {68, -10}}, lineColor = {0, 127, 255}, fillColor = {0, 95, 191}, fillPattern = FillPattern.Solid), Rectangle(extent = {{62, 0}, {64, -2}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{68, 12}, {70, 10}}, lineColor = {0, 127, 255}, fillColor = {0, 127, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{54, -6}, {57, 40}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Ellipse(extent = {{50, -6}, {60, -16}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-56, -6}, {-53, 40}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Ellipse(extent = {{-60, -6}, {-50, -16}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-90, 40}, {-53, 40}}, color = {0, 0, 0})}));
      end nitri;

      partial model ControlledDivider2 "Icon for a controlled divider into 2 flows"
        annotation(
          Window(x = 0.45, y = 0.01, width = 0.35, height = 0.49),
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Rectangle(extent = {{-45, 47}, {47, -37}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {128, 128, 128}), Rectangle(extent = {{90, 40}, {2, 10}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Rectangle(extent = {{90, 0}, {3, -30}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Ellipse(extent = {{-40, 40}, {40, -30}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {192, 192, 192}), Rectangle(extent = {{-91, 20}, {8, -14}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Ellipse(extent = {{-38, 38}, {38, -28}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Rectangle(extent = {{3, 37}, {90, 13}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Rectangle(extent = {{5, -3}, {90, -27}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Polygon(points = {{-29, -3}, {29, 18}, {29, 15}, {-29, -6}, {-29, -3}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-2, 38}, {2, -28}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {128, 128, 128}), Rectangle(extent = {{-3, -48}, {3, -44}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {128, 128, 128}), Rectangle(extent = {{-10, -47}, {10, -50}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {160, 160, 164}), Rectangle(extent = {{-91, 16}, {-32, -10}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Polygon(points = {{24, -21}, {43, -21}, {42, -19}, {48, -22}, {42, -25}, {43, -23}, {24, -23}, {24, -21}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{59, 23}, {78, 23}, {77, 25}, {83, 22}, {77, 19}, {78, 21}, {59, 21}, {59, 23}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{51, -8}, {70, -8}, {69, -6}, {75, -9}, {69, -12}, {70, -10}, {51, -10}, {51, -8}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{-46, 11}, {-27, 11}, {-28, 13}, {-22, 10}, {-28, 7}, {-27, 9}, {-46, 9}, {-46, 11}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{-81, 1}, {-62, 1}, {-63, 3}, {-57, 0}, {-63, -3}, {-62, -1}, {-81, -1}, {-81, 1}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{17, 32}, {36, 32}, {35, 34}, {41, 31}, {35, 28}, {36, 30}, {17, 30}, {17, 32}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-20, -37}, {20, -44}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {192, 192, 192}), Text(extent = {{-100, 90}, {99, 51}}, textString = "%name"), Documentation}),
          Documentation(info = "Icon for a controlled divider into 2 flows"),
          Window(x = 0.4, y = 0.31, width = 0.6, height = 0.6),
          Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Rectangle(extent = {{-45, 47}, {47, -37}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {128, 128, 128}), Rectangle(extent = {{90, 40}, {2, 10}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Rectangle(extent = {{90, 0}, {3, -30}}, lineColor = {0, 0, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Ellipse(extent = {{-40, 40}, {40, -30}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {192, 192, 192}), Rectangle(extent = {{-91, 20}, {8, -14}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Ellipse(extent = {{-38, 38}, {38, -28}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Rectangle(extent = {{3, 37}, {90, 13}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Rectangle(extent = {{5, -3}, {90, -27}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Polygon(points = {{-29, -3}, {29, 18}, {29, 15}, {-29, -6}, {-29, -3}}, lineColor = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-2, 38}, {2, -28}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {128, 128, 128}), Rectangle(extent = {{-3, -48}, {3, -44}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {128, 128, 128}), Rectangle(extent = {{-10, -47}, {10, -50}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Sphere, fillColor = {160, 160, 164}), Rectangle(extent = {{-91, 16}, {-32, -10}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {223, 191, 159}, fillPattern = FillPattern.Solid), Polygon(points = {{24, -21}, {43, -21}, {42, -19}, {48, -22}, {42, -25}, {43, -23}, {24, -23}, {24, -21}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{59, 23}, {78, 23}, {77, 25}, {83, 22}, {77, 19}, {78, 21}, {59, 21}, {59, 23}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{51, -8}, {70, -8}, {69, -6}, {75, -9}, {69, -12}, {70, -10}, {51, -10}, {51, -8}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{-46, 11}, {-27, 11}, {-28, 13}, {-22, 10}, {-28, 7}, {-27, 9}, {-46, 9}, {-46, 11}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{-81, 1}, {-62, 1}, {-63, 3}, {-57, 0}, {-63, -3}, {-62, -1}, {-81, -1}, {-81, 1}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{17, 32}, {36, 32}, {35, 34}, {41, 31}, {35, 28}, {36, 30}, {17, 30}, {17, 32}}, lineColor = {0, 0, 255}, pattern = LinePattern.None, fillColor = {191, 95, 0}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-20, -37}, {20, -44}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, fillColor = {192, 192, 192}), Text(extent = {{-99, 90}, {100, 50}}, textString = "%name")}),
          Documentation(info = "Icon for a controlled divider into 2 flows"));
      end ControlledDivider2;
    end Icons;

    extends Modelica.Icons.Library;

    model WWSource "Wastewater source"
      extends WasteWater.Icons.WWSource;
      WasteWater.ASM1.Interfaces.WWFlowAsm1out Out annotation(
        Placement(visible = true, transformation(origin = {99.0392, -67.6014}, extent = {{-10.9091, -10.9091}, {10.9091, 10.9091}}, rotation = 0), iconTransformation(origin = {99.0392, -65.6014}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      parameter Integer nin = 14 "Number of inputs";
      Modelica.Blocks.Interfaces.RealInput u[nin] "Connector of Real input signals" annotation(
        Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
    equation
      Out.Q = -u[1];
      Out.Si = u[2];
      Out.Ss = u[3];
      Out.Xi = u[4];
      Out.Xs = u[5];
      Out.Xbh = u[6];
      Out.Xba = u[7];
      Out.Xp = u[8];
      Out.So = u[9];
      Out.Sno = u[10];
      Out.Snh = u[11];
      Out.Snd = u[12];
      Out.Xnd = u[13];
      Out.Salk = u[14];
      annotation(
        Documentation(info = "This component provides all ASM1 data at the influent of a wastewater treatment plant.
The dimension of InPut is 14.

  1 volumeflowrate Q of incoming wastewater [m3/d]
  2 Si  [g COD/m3]
  3 Ss  [g COD/m3]
  4 Xi  [g COD/m3]
  5 Xs  [g COD/m3]
  6 Xbh [g COD/m3]
  7 Xba [g COD/m3]
  8 Xp  [g COD/m3]
  9 So  [g O2/m3]
 10 Sno [g N/m3]
 11 Snh [g N/m3]
 12 Snd [g N/m3]
 13 Xnd [g N/m3]
 14 Salk[mmol/l]
        "));
    end WWSource;

    model Source "Wastewater source"
      extends WasteWater.Icons.WWSource;
      //Real A;
      // variable ficticia para cuadrar modelo
      Interfaces.WWFlowAsm1out Out annotation(
        Placement(visible = true, transformation(origin = {69.0392, -51.6014}, extent = {{-10.9091, -10.9091}, {10.9091, 10.9091}}, rotation = 0), iconTransformation(origin = {69.0392, -51.6014}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    equation
      Out.Q = -18446;
      Out.Si = 30;
      Out.Ss = 69.5;
      Out.Xi = 51.2;
      Out.Xs = 202.32;
      Out.Xbh = 28.17;
      Out.Xba = 0;
      Out.Xp = 0;
      Out.So = 0;
      Out.Sno = 0;
      Out.Snh = 31.56;
      Out.Snd = 6.95;
      Out.Xnd = 10.59;
      Out.Salk = 7;
      annotation(
        Documentation(info = "This component provides all ASM1 data at the influent of a wastewater treatment plant.
The dimension of InPort is 14.

  1 volumeflowrate Q of incoming wastewater [m3/d]
  2 Si  [g COD/m3]
  3 Ss  [g COD/m3]
  4 Xi  [g COD/m3]
  5 Xs  [g COD/m3]
  6 Xbh [g COD/m3]
  7 Xba [g COD/m3]
  8 Xp  [g COD/m3]
  9 So  [g O2/m3]
 10 Sno [g N/m3]
 11 Snh [g N/m3]
 12 Snd [g N/m3]
 13 Xnd [g N/m3]
 14 Salk[mmol/l]

        "));
    end Source;

    model deni "ASM1 denitrification tank"
      //denitrification tank based on the ASM1 model
      extends WasteWater.Icons.deni;
      extends Modules.Interfaces.ASM1base;
      // tank specific parameters
      parameter Modelica.SIunits.Volume V = 1000 "Volume of denitrification tank";
      Interfaces.WWFlowAsm1in In annotation(
        Placement(transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
      Interfaces.WWFlowAsm1out Out annotation(
        Placement(transformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
      Interfaces.WWFlowAsm1out MeasurePort annotation(
        Placement(transformation(extent = {{50, 40}, {60, 50}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T annotation(
        Placement(transformation(extent = {{-110, 30}, {-90, 50}}, rotation = 0)));
    equation
      aeration = 0;
// no aeration in this tank //
// volume dependent dilution term of each concentration
      inputSi = (In.Si - Si) * In.Q / V;
      inputSs = (In.Ss - Ss) * In.Q / V;
      inputXi = (In.Xi - Xi) * In.Q / V;
      inputXs = (In.Xs - Xs) * In.Q / V;
      inputXbh = (In.Xbh - Xbh) * In.Q / V;
      inputXba = (In.Xba - Xba) * In.Q / V;
      inputXp = (In.Xp - Xp) * In.Q / V;
      inputSo = (In.So - So) * In.Q / V;
      inputSno = (In.Sno - Sno) * In.Q / V;
      inputSnh = (In.Snh - Snh) * In.Q / V;
      inputSnd = (In.Snd - Snd) * In.Q / V;
      inputXnd = (In.Xnd - Xnd) * In.Q / V;
      inputSalk = (In.Salk - Salk) * In.Q / V;
      annotation(
        Window(x = 0.15, y = 0.05, width = 0.35, height = 0.49),
        Documentation(info = "This component models the ASM1 processes and reactions taking place in an unaerated (denitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

    - all stoichiometric and kinetic parameters of the activated sludge model No.1 (ASM1)
  V - volume of the tank [m3]
        "));
    end deni;

    model nitri "ASM1 nitrification tank"
      // nitrification (aerated) tank, based on the ASM1 model
      extends Modules.Icons.nitri;
      extends Modules.Interfaces.ASM1base;
      // tank specific parameters
      parameter Modelica.SIunits.Volume V = 1333 "Volume of nitrification tank";
      // aeration system dependend parameters
      parameter Real To = 119 "start time [d]";
      parameter Real Kla = 240 "Oxygen transfer coefficient [1/d]";
      parameter Real alpha = 0.7 "Oxygen transfer factor";
      parameter Modelica.SIunits.Length de = 4.5 "depth of aeration";
      parameter Real R_air = 23.5 "specific oxygen feed factor [gO2/(m^3*m)]";
      // WWU.MassConcentration So_sat "Dissolved oxygen saturation for openloop (without blowers)";
      package WWU = WasteWater.WasteWaterUnits;
      parameter WWU.MassConcentration So_sat = 8 "Dissolved oxygen saturation for openloop (with blowers)";
      WWU.MassConcentration TSS "Total solids in the tank";
      final Real ME = 24 * 0.005 * V "Mixing Energy in Kwh";
      Real AE;
      Real KLA;
      Modules.Interfaces.WWFlowAsm1in In annotation(
        Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      Modules.Interfaces.WWFlowAsm1out Out annotation(
        Placement(transformation(extent = {{90, -10}, {110, 10}})));
      Modules.Interfaces.WWFlowAsm1out MeasurePort annotation(
        Placement(transformation(extent = {{50, 40}, {60, 50}})));
      Modelica.Blocks.Interfaces.RealInput T annotation(
        Placement(transformation(extent = {{-110, 30}, {-90, 50}})));
      Modules.Interfaces.AirFlow AirIn annotation(
        Placement(transformation(extent = {{-5, -103}, {5, -93}})));
    equation
      TSS = 0.75 * (Xs + Xi + Xbh + Xba + Xp) * V;
// Temperature dependend oxygen saturation by Simba
//KLA = 24*Kla "for openloop (without blowers)";
      KLA = alpha / So_sat * AirIn.Q_air * R_air * de / V;
      aeration = KLA * (So_sat - So) "for openloop (with blowers)";
      AE = alpha * AirIn.Q_air * R_air * de / 1800;
//AirIn.Q_air=AirIn.Q_b "Dummy equation to adapt Modelica V.3";
//So_sat = 13.89 + (-0.3825 + (0.007311 - 6.588e-05 * T) * T) * T "for openloop (without blowers)";
//aeration = Kla*(So_sat - So)*(if time <To then 0 else 1) "for openloop (without blowers)";
      inputSi = (In.Si - Si) * In.Q / V;
      inputSs = (In.Ss - Ss) * In.Q / V;
      inputXi = (In.Xi - Xi) * In.Q / V;
      inputXs = (In.Xs - Xs) * In.Q / V;
      inputXbh = (In.Xbh - Xbh) * In.Q / V;
      inputXba = (In.Xba - Xba) * In.Q / V;
      inputXp = (In.Xp - Xp) * In.Q / V;
      inputSo = (In.So - So) * In.Q / V;
      inputSno = (In.Sno - Sno) * In.Q / V;
      inputSnh = (In.Snh - Snh) * In.Q / V;
      inputSnd = (In.Snd - Snd) * In.Q / V;
      inputXnd = (In.Xnd - Xnd) * In.Q / V;
      inputSalk = (In.Salk - Salk) * In.Q / V;
      annotation(
        Documentation(info = "This component models the ASM1 processes and reactions taking place in an aerated (nitrification) tank
of a wastewater treatment plant.

The InPut signal gives the tank temperature to the model.

Parameters:

        - all soichiometric and kinetic parameters of the activated sludge model No.1 (ASM1)
  V     - volume of the tank [m3]
  alpha - oxygen transfer factor
  de    - depth of the aeration system [m]
  R_air - specific oxygen feed factor [g O2/(m3*m)]
        "));
    end nitri;

    model ADsensor_Q "Advanced sensor to measure the flow rate and averages of solids of an ASM1 wastewater stream"
      extends WasteWater.Icons.sensor_Q;
      parameter Real avg_start = 119;
      parameter Real avg_period = 1 / 96;
      parameter Real gamma = 1;
      constant Real f_p = 0.08;
      constant Real i_xb = 0.08;
      constant Real i_xp = 0.06;
      constant Real ialpha_NH = 4;
      constant Real ialpha_TN = 2.7;
      constant Real ibeta_NH = 12;
      constant Real ibeta_TN = 8.1;
      constant Real beta0_NH = 2.7;
      constant Real beta0_TN = 1.4;
      constant Real limit_NH = 4;
      constant Real limit_TN = 12;
      Real Qm;
      Real Sim;
      Real Ssm;
      Real Xim;
      Real Xsm;
      Real Xbhm;
      Real Xbam;
      Real Xpm;
      Real Som;
      Real Snom;
      Real Snhm;
      Real Sndm;
      Real Xndm;
      Real Salkm;
      Real SPm;
      Real TSSs;
      Real CODs;
      Real BOD5s_e;
      Real BOD5s_0;
      Real TKNs;
      Real EQ;
      Real IQ;
      Real Ntot;
      Real TSS;
      Real COD;
      Real TKN;
      Real BOD5;
      Real Ntotvm;
      Real TSSvm;
      Real CODvm;
      Real BOD5vm;
      Real Snhvm;
      Real SP0m;
      Real EF_NH;
      Real EF_TN;
      Real EFs_NH;
      Real EFs_TN;
      Real EFm_NH;
      Real EFm_TN;
      discrete Real Qs;
      discrete Real Sis;
      discrete Real Sss;
      discrete Real Xis;
      discrete Real Xss;
      discrete Real Xbhs;
      discrete Real Xbas;
      discrete Real Xps;
      discrete Real Sos;
      discrete Real Snos;
      discrete Real Snhs;
      discrete Real Snds;
      discrete Real Xnds;
      discrete Real Salks;
      discrete Real n;
      discrete Real Ntotv;
      discrete Real CODv;
      discrete Real Snhv;
      discrete Real TSSv;
      discrete Real BOD5v;
      discrete Real TSS0s;
      WasteWater.ASM1.Interfaces.WWFlowAsm1out Out annotation(
        Placement(visible = true, transformation(origin = {89.6832, 8.24427}, extent = {{-6.77369, -6.77369}, {6.77369, 6.77369}}, rotation = 0), iconTransformation(origin = {89.6832, 8.24427}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
      WasteWater.ASM1.Interfaces.WWFlowAsm1in In annotation(
        Placement(visible = true, transformation(origin = {-92.5078, 8.24423}, extent = {{-6.1579, -6.1579}, {6.1579, 6.1579}}, rotation = 0), iconTransformation(origin = {-92.5078, 8.24423}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Q annotation(
        Placement(visible = true, transformation(origin = {-4.56288, -76.1403}, extent = {{-12, 12}, {12, -12}}, rotation = -90), iconTransformation(origin = {-4.56288, -76.1403}, extent = {{-9.01578, 9.01578}, {9.01578, -9.01578}}, rotation = -90)));
    equation
      when sample(avg_start, avg_period) then
        Qs = gamma * pre(Qs) + abs(In.Q);
        Sis = gamma * pre(Sis) + In.Si * abs(In.Q);
        Sss = gamma * pre(Sss) + In.Ss * abs(In.Q);
        Xis = gamma * pre(Xis) + In.Xi * abs(In.Q);
        Xss = gamma * pre(Xss) + In.Xs * abs(In.Q);
        Xbhs = gamma * pre(Xbhs) + In.Xbh * abs(In.Q);
        Xbas = gamma * pre(Xbas) + In.Xba * abs(In.Q);
        Xps = gamma * pre(Xps) + In.Xp * abs(In.Q);
        Sos = gamma * pre(Sos) + In.So * abs(In.Q);
        Snos = gamma * pre(Snos) + In.Sno * abs(In.Q);
        Snhs = gamma * pre(Snhs) + In.Snh * abs(In.Q);
        Snds = gamma * pre(Snds) + In.Snd * abs(In.Q);
        Xnds = gamma * pre(Xnds) + In.Xnd * abs(In.Q);
        Salks = gamma * pre(Salks) + In.Salk * abs(In.Q);
        n = gamma * pre(n) + 1;
        EF_NH = abs(In.Q) * (if In.Snh > limit_NH then ialpha_NH * limit_NH + beta0_NH + ibeta_NH * (In.Snh - limit_NH) else ialpha_NH * In.Snh) / 1000;
        EF_TN = abs(In.Q) * (if Ntot > limit_TN then ialpha_TN * limit_TN + beta0_TN + ibeta_TN * (Ntot - limit_TN) else ialpha_TN * Ntot) / 1000;
        EFs_NH = gamma * pre(EFs_NH) + EF_NH;
        EFs_TN = gamma * pre(EFs_TN) + EF_TN;
        Ntot = In.Sno + TKN;
        TSS = 0.75 * (In.Xs + In.Xi + In.Xbh + In.Xba + In.Xp);
        COD = In.Ss + In.Si + In.Xs + In.Xbh + In.Xba + In.Xp + In.Xi;
        TKN = In.Snh + In.Snd + In.Xnd + i_xb * (In.Xbh + In.Xba) + i_xp * (In.Xp + In.Xi);
        BOD5 = 0.25 * (In.Ss + In.Xs + (1 - f_p) * (In.Xbh + In.Xba));
        TSS0s = gamma * pre(TSS0s) + TSS * abs(In.Q);
        Ntotv = if Ntot < 18 then gamma * pre(Ntotv) else gamma * pre(Ntotv) + 1;
        CODv = if COD < 100 then gamma * pre(CODv) else gamma * pre(CODv) + 1;
        Snhv = if In.Snh < 4 then gamma * pre(Snhv) else gamma * pre(Snhv) + 1;
        TSSv = if TSS < 30 then gamma * pre(TSSv) else gamma * pre(TSSv) + 1;
        BOD5v = if BOD5 < 10 then gamma * pre(BOD5v) else gamma * pre(BOD5v) + 1;
        Qm = Qs / n;
        Sim = Sis / Qs;
        Ssm = Sss / Qs;
        Xim = Xis / Qs;
        Xsm = Xss / Qs;
        Xbhm = Xbhs / Qs;
        Xbam = Xbas / Qs;
        Xpm = Xps / Qs;
        Som = Sos / Qs;
        Snom = Snos / Qs;
        Snhm = Snhs / Qs;
        Sndm = Snds / Qs;
        Xndm = Xnds / Qs;
        Salkm = Salks / Qs;
        TSSs = 0.75 * (Xss + Xis + Xbhs + Xbas + Xps);
        CODs = Sss + Sis + Xss + Xbhs + Xbas + Xps + Xis;
        TKNs = Snhs + Snds + Xnds + i_xb * (Xbhs + Xbas) + i_xp * (Xps + Xis);
        BOD5s_e = 0.25 * (Sss + Xss + (1 - f_p) * (Xbhs + Xbas));
        BOD5s_0 = 0.65 * (Sss + Xss + (1 - f_p) * (Xbhs + Xbas));
        EQ = (2 * TSSs + CODs + 30 * TKNs + 10 * Snos + 2 * BOD5s_e) / (1000 * n);
        IQ = (2 * TSSs + CODs + 30 * TKNs + 10 * Snos + 2 * BOD5s_0) / (1000 * n);
        SPm = TSSs / n;
        SP0m = TSS0s / n;
        Ntotvm = Ntotv / n;
        CODvm = CODv / n;
        Snhvm = Snhv / n;
        TSSvm = TSSv / n;
        BOD5vm = BOD5v / n;
        EFm_NH = EFs_NH / n;
        EFm_TN = EFs_TN / n;
      end when;
      In.Q + Out.Q = 0;
      Q = In.Q;
      In.Si = Out.Si;
      In.Ss = Out.Ss;
      In.Xi = Out.Xi;
      In.Xs = Out.Xs;
      In.Xbh = Out.Xbh;
      In.Xba = Out.Xba;
      In.Xp = Out.Xp;
      In.So = Out.So;
      In.Sno = Out.Sno;
      In.Snh = Out.Snh;
      In.Snd = Out.Snd;
      In.Xnd = Out.Xnd;
      In.Salk = Out.Salk;
      annotation(
        Documentation(info = "Advanced sensor to measure the flow rate and averages of solids of an ASM1 wastewater stream"));
      annotation(
        Documentation(info = "

Main Author:
   Ph.D. Felix Hernandez del Olmo
   Faculty of Informatics
   National Distance University (UNED)
   Madrid
   Spain
  
The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

        "));
    end ADsensor_Q;

    model WWSignal "Wastewater source"
      extends Modelica.Blocks.Interfaces.SIMO(nout = 14);
      parameter String dir = "INF/";
      Modelica.Blocks.Sources.SawTooth Tiempo1(period = 14, amplitude = 14) annotation(
        Placement(visible = true, transformation(origin = {-74.7331, 73.6655}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2D Q(tableName = "Inf_Q", fileName = dir + "Q.txt", tableOnFile = true) annotation(
        Placement(visible = true, transformation(origin = {0.355872, 84.6975}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2D Si(tableName = "Inf_Si", fileName = dir + "Si.txt", tableOnFile = true) annotation(
        Placement(visible = true, transformation(origin = {0.355872, 62.6335}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2D Ss(tableName = "Inf_Ss", fileName = dir + "Ss.txt", tableOnFile = true) annotation(
        Placement(visible = true, transformation(origin = {0.711744, 40.5694}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2D Xi(tableName = "Inf_Xi", fileName = dir + "Xi.txt", tableOnFile = true) annotation(
        Placement(visible = true, transformation(origin = {0.711744, 18.1495}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2D Xs(tableName = "Inf_Xs", fileName = dir + "Xs.txt", tableOnFile = true) annotation(
        Placement(visible = true, transformation(origin = {0.355872, -3.91459}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2D Xbh(tableName = "Inf_Xbh", fileName = dir + "Xbh.txt", tableOnFile = true) annotation(
        Placement(visible = true, transformation(origin = {0.355872, -26.3345}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2D Snh(tableName = "Inf_Sh", fileName = dir + "Sh.txt", tableOnFile = true) annotation(
        Placement(visible = true, transformation(origin = {0.355872, -48.3986}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2D Snd(tableName = "Inf_Snd", fileName = dir + "Snd.txt", tableOnFile = true) annotation(
        Placement(visible = true, transformation(origin = {0.711744, -70.4626}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Tables.CombiTable2D Xnd(tableName = "Inf_Xnd", fileName = dir + "Xnd.txt", tableOnFile = true) annotation(
        Placement(visible = true, transformation(origin = {0.711744, -91.4591}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant Xba(k = 0) annotation(
        Placement(visible = true, transformation(origin = {56.5836, 76.1566}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant Xp(k = 0) annotation(
        Placement(visible = true, transformation(origin = {56.5836, 37.3665}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant So(k = 0) annotation(
        Placement(visible = true, transformation(origin = {56.5836, 1.06762}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant Sno(k = 0) annotation(
        Placement(visible = true, transformation(origin = {57.6512, -35.2313}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Sources.Constant Salk(k = 7) annotation(
        Placement(visible = true, transformation(origin = {60.1424, -73.3096}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    equation
      connect(Tiempo1.y, Q.u1) annotation(
        Line(points = {{-61.5331, 73.6655}, {-55.1601, 73.6655}, {-55.1601, 93.2384}, {-14.0441, 93.2384}, {-14.0441, 91.8975}}));
      connect(Tiempo1.y, Si.u1) annotation(
        Line(points = {{-61.5331, 73.6655}, {-55.516, 73.6655}, {-55.516, 69.395}, {-14.0441, 69.395}, {-14.0441, 69.8335}}));
      connect(Tiempo1.y, Ss.u1) annotation(
        Line(points = {{-61.5331, 73.6655}, {-55.516, 73.6655}, {-55.516, 47.331}, {-13.6883, 47.331}, {-13.6883, 47.7694}}));
      connect(Tiempo1.y, Xi.u1) annotation(
        Line(points = {{-61.5331, 73.6655}, {-54.8043, 73.6655}, {-54.8043, 25.9786}, {-13.6883, 25.9786}, {-13.6883, 25.3495}}));
      connect(Tiempo1.y, Xs.u1) annotation(
        Line(points = {{-61.5331, 73.6655}, {-55.516, 73.6655}, {-55.516, 3.20285}, {-14.0441, 3.20285}, {-14.0441, 3.28541}}));
      connect(Tiempo1.y, Xbh.u1) annotation(
        Line(points = {{-61.5331, 73.6655}, {-55.1601, 73.6655}, {-55.1601, -19.9288}, {-14.0441, -19.9288}, {-14.0441, -19.1345}}));
      connect(Tiempo1.y, Snh.u1) annotation(
        Line(points = {{-61.5331, 73.6655}, {-55.1601, 73.6655}, {-55.1601, -41.9929}, {-14.0441, -41.9929}, {-14.0441, -41.1986}}));
      connect(Tiempo1.y, Snd.u1) annotation(
        Line(points = {{-61.5331, 73.6655}, {-55.1601, 73.6655}, {-55.1601, -63.7011}, {-13.6883, -63.7011}, {-13.6883, -63.2626}}));
      connect(Tiempo1.y, Xnd.u1) annotation(
        Line(points = {{-61.5331, 73.6655}, {-54.8043, 73.6655}, {-54.8043, -83.9858}, {-13.6883, -83.9858}, {-13.6883, -84.2591}}));
      connect(u, Xnd.u2) annotation(
        Line(points = {{-120, 0}, {-40.9253, 0}, {-40.9253, -98.5765}, {-13.6883, -98.5765}, {-13.6883, -98.6591}}));
      connect(u, Snd.u2) annotation(
        Line(points = {{-120, 0}, {-40.5694, 0}, {-40.5694, -77.5801}, {-13.6883, -77.5801}, {-13.6883, -77.6626}}));
      connect(u, Snh.u2) annotation(
        Line(points = {{-120, 0}, {-40.9253, 0}, {-40.9253, -55.8719}, {-14.0441, -55.8719}, {-14.0441, -55.5986}}));
      connect(u, Xbh.u2) annotation(
        Line(points = {{-120, 0}, {-40.9253, 0}, {-40.9253, -33.0961}, {-14.0441, -33.0961}, {-14.0441, -33.5345}}));
      connect(u, Xs.u2) annotation(
        Line(points = {{-120, 0}, {-40.5694, 0}, {-40.5694, -11.7438}, {-14.0441, -11.7438}, {-14.0441, -11.1146}}));
      connect(u, Xi.u2) annotation(
        Line(points = {{-120, 0}, {-40.5694, 0}, {-40.5694, 10.3203}, {-13.6883, 10.3203}, {-13.6883, 10.9495}}));
      connect(u, Ss.u2) annotation(
        Line(points = {{-120, 0}, {-40.9253, 0}, {-40.9253, 33.452}, {-13.6883, 33.452}, {-13.6883, 33.3694}}));
      connect(u, Si.u2) annotation(
        Line(points = {{-120, 0}, {-40.5694, 0}, {-40.5694, 55.1601}, {-14.0441, 55.1601}, {-14.0441, 55.4335}}));
      connect(u, Q.u2) annotation(
        Line(points = {{-120, 0}, {-40.9253, 0}, {-40.9253, 77.5801}, {-14.0441, 77.5801}, {-14.0441, 77.4975}}));
      y[1] = Q.y;
      y[2] = Si.y;
      y[3] = Ss.y;
      y[4] = Xi.y;
      y[5] = Xs.y;
      y[6] = Xbh.y;
      y[7] = Xba.y;
      y[8] = Xp.y;
      y[9] = So.y;
      y[10] = Sno.y;
      y[11] = Snh.y;
      y[12] = Snd.y;
      y[13] = Xnd.y;
      y[14] = Salk.y;
      annotation(
        Documentation(info = "This component provides all ASM1 data at the influent of a wastewater treatment plant.
The dimension of InPort is 14.

  1 volumeflowrate Q of incoming wastewater [m3/d]
  2 Si  [g COD/m3]
  3 Ss  [g COD/m3]
  4 Xi  [g COD/m3]
  5 Xs  [g COD/m3]
  6 Xbh [g COD/m3]
  7 Xba [g COD/m3]
  8 Xp  [g COD/m3]
  9 So  [g O2/m3]
 10 Sno [g N/m3]
 11 Snh [g N/m3]
 12 Snd [g N/m3]
 13 Xnd [g N/m3]
 14 Salk[mmol/l]
        "));
      annotation(
        Documentation(info = "

Main Author:
   by Ph.D. Felix Hernandez del Olmo
   Faculty of Informatics
   National Distance University (UNED)
   Madrid
   Spain
  

The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

        "),
  Diagram,
  Icon(graphics = {Rectangle(rotation = 0, lineColor = {0, 0, 0}, fillColor = {255, 255, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.Solid, lineThickness = 0.25, extent = {{-26.3345, 82.9181}, {29.8932, 70.1068}}), Text(rotation = 0, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-13.1673, 81.4947}, {14.5907, 72.5979}}, textString = "STEADY"), Text(rotation = 0, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-77.9359, 86.4769}, {-33.0961, 66.9039}}, textString = "-1"), Ellipse(rotation = 0, lineColor = {255, 255, 0}, fillColor = {255, 255, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.Solid, lineThickness = 0.25, extent = {{-9.96441, 49.1103}, {17.7936, 22.4199}}), Text(rotation = 0, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-5.33808, 41.9929}, {14.9466, 29.8932}}, textString = "DRY"), Text(rotation = 0, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-64.7687, 45.1957}, {-37.3665, 24.1993}}, textString = "0"), Ellipse(rotation = 0, lineColor = {255, 255, 0}, fillColor = {189, 193, 195}, pattern = LinePattern.Solid, fillPattern = FillPattern.Solid, lineThickness = 0.25, extent = {{-16.726, -1.77936}, {23.4875, -15.3025}}), Text(rotation = 0, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-9.60854, -3.20285}, {17.0819, -13.879}}, textString = "RAIN"), Text(rotation = 0, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-72.9537, 2.4911}, {-29.1815, -18.8612}}, textString = "1"), Line(points = {{-16.0142, -17.0819}, {-21.7082, -24.1993}}, rotation = 0, color = {0, 0, 255}, pattern = LinePattern.Solid, thickness = 1.75), Line(points = {{-15.3025, -23.4875}, {-23.8434, -33.8078}}, rotation = 0, color = {0, 0, 255}, pattern = LinePattern.Solid, thickness = 1.75), Line(points = {{-4.98221, -21.3523}, {-11.7438, -29.5374}, {-12.0996, -29.5374}}, rotation = 0, color = {0, 0, 255}, pattern = LinePattern.Solid, thickness = 1.75), Line(points = {{-11.7438, -33.452}, {-17.0819, -39.8577}}, rotation = 0, color = {0, 0, 255}, pattern = LinePattern.Solid, thickness = 1.75), Line(points = {{5.69395, -18.8612}, {-0.355872, -25.9786}, {-0.355872, -25.9786}}, rotation = 0, color = {0, 0, 255}, pattern = LinePattern.Solid, thickness = 1.75), Line(points = {{5.69395, -28.4698}, {-1.06762, -38.0783}}, rotation = 0, color = {0, 0, 255}, pattern = LinePattern.Solid, thickness = 1.75), Line(points = {{18.5053, -14.9466}, {12.4555, -23.8434}}, rotation = 0, color = {0, 0, 255}, pattern = LinePattern.Solid, thickness = 1.75), Line(points = {{21.3523, -23.1317}, {16.0142, -32.0285}}, rotation = 0, color = {0, 0, 255}, pattern = LinePattern.Solid, thickness = 1.75), Ellipse(rotation = 0, lineColor = {255, 255, 0}, fillColor = {189, 193, 195}, pattern = LinePattern.Solid, fillPattern = FillPattern.Solid, lineThickness = 0.25, extent = {{-16.3701, -48.3986}, {23.1317, -61.9217}}), Text(rotation = 0, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-9.60854, -49.4662}, {16.726, -61.5658}}, textString = "STORM"), Text(rotation = 0, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-63.7011, -45.9075}, {-38.79, -65.4804}}, textString = "2"), Polygon(points = {{7.11744, -64.0569}, {-16.726, -84.3416}, {0, -74.0214}, {-4.98221, -68.3274}, {7.11744, -64.0569}}, rotation = 0, lineColor = {255, 255, 0}, fillColor = {255, 255, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.Solid, lineThickness = 0.25)}));
    end WWSignal;

    model sensor_class_A
      extends Modelica.Blocks.Interfaces.SISO;
      constant Real T90 = 1 / 24 / 60;
      constant Real T = T90 / 3.89;
      Modelica.Blocks.Continuous.TransferFunction transferfunction2(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {6.66134e-16, -2.22045e-16}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction transferfunction1(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {-56.8675, -0.481928}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    equation
      connect(transferfunction2.y, y) annotation(
        Line(points = {{13.2, -2.22045e-16}, {103.133, -2.22045e-16}, {103.133, 0}, {110, 0}}));
      connect(u, transferfunction1.u) annotation(
        Line(points = {{-120, 0}, {-73.253, 0}, {-73.253, -0.481928}, {-71.2675, -0.481928}}));
      connect(transferfunction1.y, transferfunction2.u) annotation(
        Line(points = {{-43.6675, -0.481928}, {-13.9759, -0.481928}, {-13.9759, -2.22045e-16}, {-14.4, -2.22045e-16}}));
      annotation(
        Icon(graphics = {Text(rotation = 0, lineColor = {0, 0, 255}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-60.7229, 53.9759}, {48.6747, -42.8916}}, textString = "class A")}));
      annotation(
        Documentation(info = "

Main Author:
   Ph.D. Felix Hernandez del Olmo
   Faculty of Informatics
   National Distance University (UNED)
   Madrid
   Spain
  

The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

        "));
    end sensor_class_A;

    model sensor_class_B
      extends Modelica.Blocks.Interfaces.SISO;
      constant Real T90 = 10 / 24 / 60;
      constant Real T = T90 / 11.7724;
      Modelica.Blocks.Continuous.TransferFunction transferfunction8(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {62.1687, -34.2169}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction transferfunction7(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {16.3855, -36.1446}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction transferfunction6(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {-26.988, -37.1084}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction transferfunction5(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {-67.9518, -37.5904}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction transferfunction4(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {57.3494, 18.7952}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction transferfunction3(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {13.494, 17.3494}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction transferfunction2(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {-27.9518, 16.8675}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction transferfunction1(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {-70.3615, 17.3494}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    equation
      connect(u, transferfunction1.u) annotation(
        Line(points = {{-120, 0}, {-85.7831, 0}, {-85.7831, 17.3494}, {-84.7615, 17.3494}}));
      connect(transferfunction8.y, y) annotation(
        Line(points = {{75.3687, -34.2169}, {87.2289, -34.2169}, {87.2289, 0.481928}, {110, 0.481928}, {110, 0}}));
      connect(transferfunction7.y, transferfunction8.u) annotation(
        Line(points = {{29.5855, -36.1446}, {46.747, -36.1446}, {46.747, -34.2169}, {47.7687, -34.2169}}));
      connect(transferfunction6.y, transferfunction7.u) annotation(
        Line(points = {{-13.788, -37.1084}, {-0.481928, -37.1084}, {-0.481928, -36.1446}, {1.9855, -36.1446}}));
      connect(transferfunction5.y, transferfunction6.u) annotation(
        Line(points = {{-54.7518, -37.5904}, {-42.4096, -37.5904}, {-42.4096, -37.1084}, {-41.388, -37.1084}}));
      connect(transferfunction4.y, transferfunction5.u) annotation(
        Line(points = {{70.5494, 18.7952}, {79.5181, 18.7952}, {79.5181, -13.9759}, {-89.6386, -13.9759}, {-89.6386, -37.1084}, {-82.3518, -37.1084}, {-82.3518, -37.5904}}));
      connect(transferfunction3.y, transferfunction4.u) annotation(
        Line(points = {{26.694, 17.3494}, {41.9277, 17.3494}, {41.9277, 18.7952}, {42.9494, 18.7952}}));
      connect(transferfunction2.y, transferfunction3.u) annotation(
        Line(points = {{-14.7518, 16.8675}, {-0.481928, 16.8675}, {-0.481928, 17.3494}, {-0.906, 17.3494}}));
      connect(transferfunction1.y, transferfunction2.u) annotation(
        Line(points = {{-43.6675, -0.481928}, {-13.9759, -0.481928}, {-13.9759, -2.22045e-16}, {-14.4, -2.22045e-16}}));
      annotation(
        Icon(graphics = {Text(rotation = 0, lineColor = {0, 0, 255}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-60.7229, 53.9759}, {48.6747, -42.8916}}, textString = "class B")}));
      annotation(
        Documentation(info = "

Main Author:
   Felix Hernandez del Olmo
   Faculty of Informatics
   National Distance University (UNED)
   Madrid
   Spain
  
The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

        "));
    end sensor_class_B;

    model KLA_dynamics
      extends Modelica.Blocks.Interfaces.SISO;
      constant Real T90 = 4 / 24 / 60;
      constant Real T = T90 / 3.89;
      Modelica.Blocks.Continuous.TransferFunction transferfunction2(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {6.66134e-16, -2.22045e-16}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction transferfunction1(a = {T, 1}) annotation(
        Placement(visible = true, transformation(origin = {-56.8675, -0.481928}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    equation
      connect(transferfunction2.y, y) annotation(
        Line(points = {{13.2, -2.22045e-16}, {103.133, -2.22045e-16}, {103.133, 0}, {110, 0}}));
      connect(u, transferfunction1.u) annotation(
        Line(points = {{-120, 0}, {-73.253, 0}, {-73.253, -0.481928}, {-71.2675, -0.481928}}));
      connect(transferfunction1.y, transferfunction2.u) annotation(
        Line(points = {{-43.6675, -0.481928}, {-13.9759, -0.481928}, {-13.9759, -2.22045e-16}, {-14.4, -2.22045e-16}}));
      annotation(
        Icon(graphics = {Text(rotation = 0, lineColor = {0, 0, 255}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-60.7229, 53.9759}, {48.6747, -42.8916}}, textString = "class A")}));
      annotation(
        Documentation(info = "

Main Author:
   Ph.D. Felix Hernandez del Olmo
   Faculty of Informatics
   National Distance University (UNED)
   Madrid
   Spain
  
The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

        "));
    end KLA_dynamics;

    model Noise
      extends Modelica.Blocks.Interfaces.SISO;
      extends BSM1.Config;
      parameter Real ymax = 1;
      parameter Real delta = 1;
      parameter Real nl = 0.025;
      parameter Real noise_start = 0;
      parameter Real noise_sampling = 1 / 24 / 60 * 60;
    protected
      discrete Real n(start = 0);
    equation
      when sample(noise_start, noise_sampling) then
        n = RandomNormal(time) * delta * ymax * nl;
      end when;
      y = u + n;
      annotation(
        Icon(graphics = {Text(rotation = 0, lineColor = {0, 0, 255}, fillColor = {0, 0, 0}, pattern = LinePattern.Solid, fillPattern = FillPattern.None, lineThickness = 0.25, extent = {{-60.7229, 53.9759}, {48.6747, -42.8916}}, textString = "Noise")}));
      annotation(
        Documentation(info = "

 Main Author:
   Ph.D. Felix Hernandez del Olmo
   Faculty of Informatics
   National Distance University (UNED)
   Madrid
   Spain
  
The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

        "));
    end Noise;

    block CombiTimeTable "Table look-up with respect to time and linear/periodic extrapolation methods (data from matrix/file)"
      extends Modelica.Blocks.Interfaces.MO(final nout = max([size(columns, 1); size(offset, 1)]));
      parameter Boolean tableOnFile = false "= true, if table is defined on file or in function usertab" annotation(
        Dialog(group = "Table data definition"));
      parameter Real table[:, :] = fill(0.0, 0, 2) "Table matrix (time = first column; e.g., table=[0,2])" annotation(
        Dialog(group = "Table data definition", enable = not tableOnFile));
      parameter String tableName = "NoName" "Table name on file or in function usertab (see docu)" annotation(
        Dialog(group = "Table data definition", enable = tableOnFile));
      parameter String fileName = "NoName" "File where matrix is stored" annotation(
        Dialog(group = "Table data definition", enable = tableOnFile, loadSelector(filter = "Text files (*.txt);;MATLAB MAT-files (*.mat)", caption = "Open file in which table is present")));
      parameter Boolean verboseRead = true "= true, if info message that file is loading is to be printed" annotation(
        Dialog(group = "Table data definition", enable = tableOnFile));
      parameter Integer columns[:] = 2:size(table, 2) "Columns of table to be interpolated" annotation(
        Dialog(group = "Table data interpretation"));
      parameter Modelica.Blocks.Types.Smoothness smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments "Smoothness of table interpolation" annotation(
        Dialog(group = "Table data interpretation"));
      parameter Modelica.Blocks.Types.Extrapolation extrapolation = Modelica.Blocks.Types.Extrapolation.LastTwoPoints "Extrapolation of data outside the definition range" annotation(
        Dialog(group = "Table data interpretation"));
      parameter Real offset[:] = {0} "Offsets of output signals" annotation(
        Dialog(group = "Table data interpretation"));
      parameter Modelica.SIunits.Time startTime = 0 "Output = offset for time < startTime" annotation(
        Dialog(group = "Table data interpretation"));
      final parameter Modelica.SIunits.Time t_min(fixed = false) "Minimum abscissa value defined in table";
      final parameter Modelica.SIunits.Time t_max(fixed = false) "Maximum abscissa value defined in table";
    protected
      final parameter Real p_offset[nout] = if size(offset, 1) == 1 then ones(nout) * offset[1] else offset "Offsets of output signals";
      Modelica.Blocks.Types.ExternalCombiTimeTable tableID = Modelica.Blocks.Types.ExternalCombiTimeTable(if tableOnFile then tableName else "NoName", if tableOnFile and fileName <> "NoName" and not Modelica.Utilities.Strings.isEmpty(fileName) then fileName else "NoName", table, startTime, columns, smoothness, extrapolation) "External table object";
      discrete Modelica.SIunits.Time nextTimeEvent(start = 0, fixed = true) "Next time event instant";
      parameter Real tableOnFileRead(fixed = false) "= 1, if table was successfully read from file";

      function readTableData "Read table data from ASCII text or MATLAB MAT-file"
        extends Modelica.Icons.Function;
        input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
        input Boolean forceRead = false "= true: Force reading of table data; = false: Only read, if not yet read.";
        output Real readSuccess "Table read success";
        input Boolean verboseRead "= true: Print info message; = false: No info message";
      
        external "C" readSuccess = ModelicaStandardTables_CombiTimeTable_read(tableID, forceRead, verboseRead) annotation(
          Library = {"ModelicaStandardTables"});
      end readTableData;

      function getTableValue "Interpolate 1-dim. table where first column is time"
        extends Modelica.Icons.Function;
        input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
        input Integer icol;
        input Modelica.SIunits.Time timeIn;
        discrete input Modelica.SIunits.Time nextTimeEvent;
        discrete input Modelica.SIunits.Time pre_nextTimeEvent;
        input Real tableAvailable "Dummy input to ensure correct sorting of function calls" annotation(
          __OpenModelica_UnusedVariable = true);
        output Real y;
      
        external "C" y = ModelicaStandardTables_CombiTimeTable_getValue(tableID, icol, timeIn, nextTimeEvent, pre_nextTimeEvent) annotation(
          Library = {"ModelicaStandardTables"});
        annotation(
          derivative(noDerivative = nextTimeEvent, noDerivative = pre_nextTimeEvent, noDerivative = tableAvailable) = getDerTableValue);
      end getTableValue;

      function getTableValueNoDer "Interpolate 1-dim. table where first column is time (but do not provide a derivative function)"
        extends Modelica.Icons.Function;
        input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
        input Integer icol;
        input Modelica.SIunits.Time timeIn;
        discrete input Modelica.SIunits.Time nextTimeEvent;
        discrete input Modelica.SIunits.Time pre_nextTimeEvent;
        input Real tableAvailable "Dummy input to ensure correct sorting of function calls" annotation(
          __OpenModelica_UnusedVariable = true);
        output Real y;
      
        external "C" y = ModelicaStandardTables_CombiTimeTable_getValue(tableID, icol, timeIn, nextTimeEvent, pre_nextTimeEvent) annotation(
          Library = {"ModelicaStandardTables"});
      end getTableValueNoDer;

      function getDerTableValue "Derivative of interpolated 1-dim. table where first column is time"
        extends Modelica.Icons.Function;
        input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
        input Integer icol;
        input Modelica.SIunits.Time timeIn;
        discrete input Modelica.SIunits.Time nextTimeEvent;
        discrete input Modelica.SIunits.Time pre_nextTimeEvent;
        input Real tableAvailable "Dummy input to ensure correct sorting of function calls" annotation(
          __OpenModelica_UnusedVariable = true);
        input Real der_timeIn;
        output Real der_y;
      
        external "C" der_y = ModelicaStandardTables_CombiTimeTable_getDerValue(tableID, icol, timeIn, nextTimeEvent, pre_nextTimeEvent, der_timeIn) annotation(
          Library = {"ModelicaStandardTables"});
      end getDerTableValue;

      function getTableTimeTmin "Return minimum time value of 1-dim. table where first column is time"
        extends Modelica.Icons.Function;
        input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
        input Real tableAvailable "Dummy input to ensure correct sorting of function calls" annotation(
          __OpenModelica_UnusedVariable = true);
        output Modelica.SIunits.Time timeMin "Minimum time value in table";
      
        external "C" timeMin = ModelicaStandardTables_CombiTimeTable_minimumTime(tableID) annotation(
          Library = {"ModelicaStandardTables"});
      end getTableTimeTmin;

      function getTableTimeTmax "Return maximum time value of 1-dim. table where first column is time"
        extends Modelica.Icons.Function;
        input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
        input Real tableAvailable "Dummy input to ensure correct sorting of function calls" annotation(
          __OpenModelica_UnusedVariable = true);
        output Modelica.SIunits.Time timeMax "Maximum time value in table";
      
        external "C" timeMax = ModelicaStandardTables_CombiTimeTable_maximumTime(tableID) annotation(
          Library = {"ModelicaStandardTables"});
      end getTableTimeTmax;

      function getNextTimeEvent "Return next time event value of 1-dim. table where first column is time"
        extends Modelica.Icons.Function;
        input Modelica.Blocks.Types.ExternalCombiTimeTable tableID;
        input Modelica.SIunits.Time timeIn;
        input Real tableAvailable "Dummy input to ensure correct sorting of function calls" annotation(
          __OpenModelica_UnusedVariable = true);
        output Modelica.SIunits.Time nextTimeEvent "Next time event in table";
      
        external "C" nextTimeEvent = ModelicaStandardTables_CombiTimeTable_nextTimeEvent(tableID, timeIn) annotation(
          Library = {"ModelicaStandardTables"});
      end getNextTimeEvent;
    initial algorithm
      if tableOnFile then
        tableOnFileRead := readTableData(tableID, false, verboseRead);
      else
        tableOnFileRead := 1.;
      end if;
      t_min := getTableTimeTmin(tableID, tableOnFileRead);
      t_max := getTableTimeTmax(tableID, tableOnFileRead);
    equation
      if tableOnFile then
        assert(tableName <> "NoName", "tableOnFile = true and no table name given");
      else
        assert(size(table, 1) > 0 and size(table, 2) > 0, "tableOnFile = false and parameter table is an empty matrix");
      end if;
      when {time >= pre(nextTimeEvent), initial()} then
        nextTimeEvent = getNextTimeEvent(tableID, time, tableOnFileRead);
      end when;
      if smoothness == Modelica.Blocks.Types.Smoothness.ConstantSegments then
        for i in 1:nout loop
          y[i] = p_offset[i] + getTableValueNoDer(tableID, i, time, nextTimeEvent, pre(nextTimeEvent), tableOnFileRead);
        end for;
      else
        for i in 1:nout loop
          y[i] = p_offset[i] + getTableValue(tableID, i, time, nextTimeEvent, pre(nextTimeEvent), tableOnFileRead);
        end for;
      end if;
      annotation(
        Documentation(info = "<HTML>
<p>
This block generates an output signal y[:] by <b>linear interpolation</b> in
a table. The time points and function values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the other columns contain the data to be interpolated.
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/CombiTimeTable.png\"
   alt=\"CombiTimeTable.png\">
</p>

<p>
Via parameter <b>columns</b> it can be defined which columns of the
table are interpolated. If, e.g., columns={2,4}, it is assumed that
2 output signals are present and that the first output is computed
by interpolation of column 2 and the second output is computed
by interpolation of column 4 of the table matrix.
The table interpolation has the following properties:
</p>
<ul>
<li>The time points need to be <b>strictly increasing</b> if smoothness
  is ContinuousDerivative, otherwise <b>monotonically increasing</b>.</li>
<li><b>Discontinuities</b> are allowed, by providing the same
  time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
  extrapolation according to the setting of parameter
  <b>extrapolation</b>:
<pre>
extrapolation = 1: hold the first or last value of the table,
                   if outside of the table scope.
              = 2: extrapolate by using the derivative at the first/last table
                   points if outside of the table scope.
                   (If smoothness is LinearSegments or ConstantSegments
                   this means to extrapolate linearly through the first/last
                   two table points.).
              = 3: periodically repeat the table data
                   (periodical function).
              = 4: no extrapolation, i.e. extrapolation triggers an error
</pre></li>
<li>Via parameter <b>smoothness</b> it is defined how the data is interpolated:
<pre>
smoothness = 1: linear interpolation
           = 2: smooth interpolation with Akima-splines such
                that der(y) is continuous, also if extrapolated.
           = 3: constant segments
</pre></li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
  the table values of this row are just returned.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
  by the table can be shifted both in time and in the ordinate value.
  The time instants stored in the table are therefore <b>relative</b>
  to <b>startTime</b>.
  If time &lt; startTime, no interpolation is performed and the offset
  is used as ordinate value for all outputs.</li>
<li>The table is implemented in a numerically sound way by
  generating <b>time events</b> at interval boundaries.
  This generates continuously differentiable values for the integrator.</li>
<li>For special applications it is sometimes needed to know the minimum
  and maximum time instant defined in the table as a parameter. For this
  reason parameters <b>t_min</b> and <b>t_max</b> are provided and can be
  accessed from the outside of the table object.</li>
</ul>
<p>
Example:
</p>
<pre>
 table = [0  0
          1  0
          1  1
          2  4
          3  9
          4 16]; extrapolation = 3 (default)
If, e.g., time = 1.0, the output y =  0.0 (before event), 1.0 (after event)
  e.g., time = 1.5, the output y =  2.5,
  e.g., time = 2.0, the output y =  4.0,
  e.g., time = 5.0, the output y = 23.0 (i.e., extrapolation via last 2 points).
</pre>
<p>
The table matrix can be defined in the following ways:
</p>
<ol>
<li> Explicitly supplied as <b>parameter matrix</b> \"table\",
   and the other parameters have the following values:
<pre>
 tableName is \"NoName\" or has only blanks,
 fileName  is \"NoName\" or has only blanks.
</pre></li>
<li> <b>Read</b> from a <b>file</b> \"fileName\" where the matrix is stored as
    \"tableName\". Both ASCII and MAT-file format is possible.
    (The ASCII format is described below).
    The MAT-file format comes in four different versions: v4, v6, v7 and v7.3.
    The library supports at least v4, v6 and v7 whereas v7.3 is optional.
    It is most convenient to generate the MAT-file from FreeMat or MATLAB&reg;
    by command
<pre>
 save tables.mat tab1 tab2 tab3
</pre>
    or Scilab by command
<pre>
 savematfile tables.mat tab1 tab2 tab3
</pre>
    when the three tables tab1, tab2, tab3 should be used from the model.<br>
    Note, a fileName can be defined as URI by using the helper function
    <a href=\"modelica://Modelica.Utilities.Files.loadResource\">loadResource</a>.</li>
<li>  Statically stored in function \"usertab\" in file \"usertab.c\".
    The matrix is identified by \"tableName\". Parameter
    fileName = \"NoName\" or has only blanks. Row-wise storage is always to be
    preferred as otherwise the table is reallocated and transposed.</li>
</ol>
<p>
When the constant \"NO_FILE_SYSTEM\" is defined, all file I/O related parts of the
source code are removed by the C-preprocessor, such that no access to files takes place.
</p>
<p>
If tables are read from an ASCII-file, the file needs to have the
following structure (\"-----\" is not part of the file content):
</p>
<pre>
-----------------------------------------------------
#1
double tab1(6,2)   # comment line
0   0
1   0
1   1
2   4
3   9
4  16
double tab2(6,2)   # another comment line
0   0
2   0
2   2
4   8
6  18
8  32
-----------------------------------------------------
</pre>
<p>
Note, that the first two characters in the file need to be
\"#1\" (a line comment defining the version number of the file format).
Afterwards, the corresponding matrix has to be declared
with type (= \"double\" or \"float\"), name and actual dimensions.
Finally, in successive rows of the file, the elements of the matrix
have to be given. The elements have to be provided as a sequence of
numbers in row-wise order (therefore a matrix row can span several
lines in the file and need not start at the beginning of a line).
Numbers have to be given according to C syntax (such as 2.3, -2, +2.e4).
Number separators are spaces, tab (\t), comma (,), or semicolon (;).
Several matrices may be defined one after another. Line comments start
with the hash symbol (#) and can appear everywhere.
Other characters, like trailing non comments, are not allowed in the file.
</p>
<p>
MATLAB is a registered trademark of The MathWorks, Inc.
</p>
</html>", revisions = "<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>April 09, 2013</i>
     by Thomas Beutlich:<br>
     Implemented as external object.</li>
<li><i>March 31, 2001</i>
     by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
     Used CombiTableTime as a basis and added the
     arguments <b>extrapolation, columns, startTime</b>.
     This allows periodic function definitions.</li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100.0, -100.0}, {100.0, 100.0}}, initialScale = 0.1), graphics = {Polygon(visible = true, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-80.0, 90.0}, {-88.0, 68.0}, {-72.0, 68.0}, {-80.0, 90.0}}), Line(visible = true, points = {{-80.0, 68.0}, {-80.0, -80.0}}, color = {192, 192, 192}), Line(visible = true, points = {{-90.0, -70.0}, {82.0, -70.0}}, color = {192, 192, 192}), Polygon(visible = true, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90.0, -70.0}, {68.0, -62.0}, {68.0, -78.0}, {90.0, -70.0}}), Rectangle(visible = true, lineColor = {255, 255, 255}, fillColor = {255, 215, 136}, fillPattern = FillPattern.Solid, extent = {{-48.0, -50.0}, {2.0, 70.0}}), Line(visible = true, points = {{-48.0, -50.0}, {-48.0, 70.0}, {52.0, 70.0}, {52.0, -50.0}, {-48.0, -50.0}, {-48.0, -20.0}, {52.0, -20.0}, {52.0, 10.0}, {-48.0, 10.0}, {-48.0, 40.0}, {52.0, 40.0}, {52.0, 70.0}, {2.0, 70.0}, {2.0, -51.0}})}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-80, 68}, {-80, -80}}, color = {95, 95, 95}), Line(points = {{-90, -70}, {82, -70}}, color = {95, 95, 95}), Polygon(points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-20, 90}, {20, -30}}, lineColor = {255, 255, 255}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-20, -30}, {-20, 90}, {80, 90}, {80, -30}, {-20, -30}, {-20, 0}, {80, 0}, {80, 30}, {-20, 30}, {-20, 60}, {80, 60}, {80, 90}, {20, 90}, {20, -30}}, color = {0, 0, 0}), Text(extent = {{-71, -42}, {-32, -54}}, lineColor = {0, 0, 0}, textString = "offset"), Polygon(points = {{-31, -30}, {-33, -40}, {-28, -40}, {-31, -30}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Polygon(points = {{-31, -70}, {-34, -60}, {-29, -60}, {-31, -70}, {-31, -70}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-31, -31}, {-31, -70}}, color = {95, 95, 95}), Line(points = {{-20, -30}, {-20, -70}}, color = {95, 95, 95}), Text(extent = {{-42, -74}, {6, -84}}, lineColor = {0, 0, 0}, textString = "startTime"), Line(points = {{-20, -30}, {-80, -30}}, color = {95, 95, 95}), Text(extent = {{-73, 93}, {-44, 74}}, lineColor = {0, 0, 0}, textString = "y"), Text(extent = {{66, -81}, {92, -92}}, lineColor = {0, 0, 0}, textString = "time"), Text(extent = {{-19, 83}, {20, 68}}, lineColor = {0, 0, 0}, textString = "time"), Text(extent = {{21, 82}, {50, 68}}, lineColor = {0, 0, 0}, textString = "y[1]"), Line(points = {{50, 90}, {50, -30}}, color = {0, 0, 0}), Line(points = {{80, 0}, {100, 0}}, color = {0, 0, 255}), Text(extent = {{34, -30}, {71, -42}}, textString = "columns", lineColor = {0, 0, 255}), Text(extent = {{51, 82}, {80, 68}}, lineColor = {0, 0, 0}, textString = "y[2]")}));
    end CombiTimeTable;

    model ADsensor_Q_air "Advanced sensor to measure the flow rate and averages of solids of an ASM1 wastewater stream"
      extends WasteWater.Icons.sensor_Q_air;
      Real Qm_air;
      discrete Real Qs_air;
      WasteWater.ASM1.Interfaces.WWFlowOut Out annotation(
        Placement(visible = true, transformation(origin = {89.6832, 8.24427}, extent = {{-6.77369, -6.77369}, {6.77369, 6.77369}}, rotation = 0), iconTransformation(origin = {89.6832, 8.24427}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
      WasteWater.ASM1.Interfaces.WWFlowIn In annotation(
        Placement(visible = true, transformation(origin = {-92.5078, 8.24423}, extent = {{-6.1579, -6.1579}, {6.1579, 6.1579}}, rotation = 0), iconTransformation(origin = {-92.5078, 8.24423}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Q_air annotation(
        Placement(visible = true, transformation(origin = {-4.56288, -76.1403}, extent = {{-12, 12}, {12, -12}}, rotation = -90), iconTransformation(origin = {-4.56288, -76.1403}, extent = {{-9.01578, 9.01578}, {9.01578, -9.01578}}, rotation = -90)));
    equation
      when sample(avg_start, avg_period) then
        Qs_air = gamma * pre(Qs_air) + abs(In.Q_air);
        Qm_air = Qs_air / n;
      end when;
      In.Q_air + Out.Q_air = 0;
      Q_air = In.Q_air;
      annotation(
        Documentation(info = "Advanced sensor to measure the flow rate and averages of solids of an ASM1 wastewater stream"));
      annotation(
        Documentation(info = "

Main Author:
 Ph.D. Felix Hernandez del Olmo
 Faculty of Informatics
 National Distance University (UNED)
 Madrid
 Spain

The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

    "));
    end ADsensor_Q_air;
  end Modules;

  record Config
    constant String BSM1_Directory = "C:/Users/Usuario/Desktop/felixhdelolmo-wastewater-systems/BSM1/";
    constant String noise_include = "#include \"" + BSM1_Directory + "RandomNormal/ext_RandNormal.c\"";

    function RandomNormal
      output Real y;
      input Real u;
    
      external "C" y = ext_RandomNormal(u) annotation(
        Include = "#include \"/home/felix/TRABAJO/BSM1/RandomNormal/ext_RandNormal.c\"");
    end RandomNormal;
  end Config;

  model BSM1_ClosedLoop
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
    Modelica.Blocks.Sources.Constant constant1(k = 1) annotation(
      Placement(visible = true, transformation(origin = {13.5231, -72.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {73.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.divider2 divider annotation(
      Placement(visible = true, transformation(origin = {28.8256, 2.84698}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank5(Kla = 84, Salk(start = 4.13), Si(start = 30), Snd(start = 0.688), Snh(start = 1.73), Sno(start = 10.4), So(start = 0.491), Ss(start = 0.889), V = 1333, Xba(start = 150), Xbh(start = 2559), Xi(start = 1149), Xnd(start = 3.53), Xp(start = 452), Xs(start = 49.3)) annotation(
      Placement(visible = true, transformation(origin = {1.74327, 3.41715}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank4(Si(start = 30), Ss(start = 0.995), Xi(start = 1149), Xs(start = 55.7), Xbh(start = 2559), Xba(start = 150), Xp(start = 451), So(start = 2.43), Sno(start = 9.3), Snh(start = 2.97), Snd(start = 0.767), Xnd(start = 3.88), Salk(start = 4.29), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-27.758, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank2(Si(start = 30), Ss(start = 1.46), Xi(start = 1149), Xs(start = 76.4), Xbh(start = 2553), Xba(start = 148), Xp(start = 450), So(start = 0.0000631), Sno(start = 3.66), Snh(start = 8.34), Snd(start = 0.882), Xnd(start = 5.03), Salk(start = 5.08)) annotation(
      Placement(visible = true, transformation(origin = {-7.82918, 27.4021}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank3(Si(start = 30), Ss(start = 1.15), Xi(start = 1149), Xs(start = 64.9), Xbh(start = 2557), Xba(start = 149), Xp(start = 450), So(start = 1.72), Sno(start = 6.54), Snh(start = 5.55), Snd(start = 0.829), Xnd(start = 4.39), Salk(start = 4.67), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-55.8719, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank1(Si(start = 30), Ss(start = 2.81), Xi(start = 1149), Xs(start = 82.1), Xbh(start = 2552), Xba(start = 148), Xp(start = 449), So(start = 0.0043), Sno(start = 5.37), Snh(start = 7.92), Snd(start = 1.22), Xnd(start = 5.28), Salk(start = 4.93)) annotation(
      Placement(visible = true, transformation(origin = {-38.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-54.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {25.2029, -20.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant2(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-81.1388, -81.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 76.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(startTime = 130, offset = -1, height = 1) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.FixedDelay fixeddelay1(delayTime = 1 / 6 / 24) annotation(
      Placement(visible = true, transformation(origin = {10.3203, 67.9715}, extent = {{-6.77369, -6.77369}, {6.77369, 6.77369}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax = 10, uMin = 0.1) annotation(
      Placement(visible = true, transformation(origin = {32.7402, 68.3274}, extent = {{-6.77369, -6.77369}, {6.77369, 6.77369}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {45.5516, 90.7473}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI2(k = 0.828, T = 0.02) annotation(
      Placement(visible = true, transformation(origin = {68.6833, 91.1032}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Sources.Step OxygenSetpoint(startTime = 0, height = 2) annotation(
      Placement(visible = true, transformation(origin = {21.7082, 45.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {46.9751, 46.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_NO sensor_no1 annotation(
      Placement(visible = true, transformation(origin = {-8.54093, 48.3986}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o21 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI1(k = 0.833, T = 0.042) annotation(
      Placement(visible = true, transformation(origin = {68.3274, 55.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant NitrogenSetpoint(k = 1) annotation(
      Placement(visible = true, transformation(origin = {12.8114, 90.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-53.7461, -36.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-56.6282, -55.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {8.4072, -45.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -29.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {55.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
  BSM1_A.Modules.ADsensor_Q aDsensor_Q_air annotation(
      Placement(visible = true, transformation(origin = {6, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  equation
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2.38167, -30.8379}, {39.452, -30.8379}, {39.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {42.6426, -27.3276}, {42.6426, -46.378}, {19.5081, -46.378}}));
    connect(PI1.y, blower3.u) annotation(
      Line(points = {{77.3432, 55.516}, {87.9004, 55.516}, {87.9004, -21.7082}, {47.9644, -21.7082}, {47.9644, -23}, {33, -23}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19.4813, -30.8379}, {-46.2651, -30.8379}, {-45.421, -34.8277}, {-45.421, -34.8277}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{54.871, -53.4521}, {54.871, -53.1716}, {55.0621, -64.5783}, {60.9901, -64.5783}, {60.9901, -64.934}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.871, -31.3087}, {54.871, -31.5892}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{-2.35478, -46.378}, {-41.4458, -46.378}, {-45.5474, -52.9105}, {-45.5474, -52.9105}}));
    connect(constant1.y, WastePump.u) annotation(
      Line(points = {{24.4322, -72.5979}, {34.2169, -72.5979}, {34.2169, -89.1566}, {93.494, -89.1566}, {93.494, -31.8072}, {82.5306, -11.6782}, {82.5306, -11.6782}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-68.0536, -58.2534}, {-94.4578, -58.2534}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(constant1.y, ReturnPump.u) annotation(
      Line(points = {{24.4322, -72.5979}, {34.2169, -72.5979}, {34.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -59.0464}, {-42.9968, -58.5307}, {-42.9968, -58.5307}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-62.3301, -38.842}, {-87.2289, -38.842}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(PI2.y, RecyclePump.u) annotation(
      Line(points = {{76.8795, 91.1032}, {97.153, 91.1032}, {97.153, -93.9502}, {-34.1637, -93.9502}, {-34.1637, -38.4342}, {-43.5046, -39.0503}, {-43.5046, -39.0503}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8.30088}, {-66.455, 8.30088}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-90.0356, 43.7284}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-20.9964, 43.7284}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-53.7367, 43.7284}, {-53.7367, 33.1866}, {-52.4822, 33.1866}}));
    connect(NitrogenSetpoint.y, feedback1.u1) annotation(
      Line(points = {{21.0075, 90.0356}, {38.0783, 90.0356}, {38.0783, 90.7473}, {38.9947, 90.7473}}));
    connect(feedback2.y, PI1.u) annotation(
      Line(points = {{53.6811, 46.6192}, {56.9395, 46.6192}, {56.9395, 55.1601}, {58.492, 55.1601}, {58.492, 55.516}}));
    connect(sensor_o21.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 40.6584}, {46.9751, 40.6584}}));
    connect(tank5.MeasurePort, sensor_o21.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(sensor_no1.Sno, fixeddelay1.u) annotation(
      Line(points = {{-0.763161, 49.1333}, {1.06762, 49.1333}, {1.06762, 67.9715}, {2.19187, 67.9715}}));
    connect(tank2.MeasurePort, sensor_no1.In) annotation(
      Line(points = {{-3.03896, 33.0188}, {-3.55872, 33.0188}, {-3.55872, 38.79}, {-8.8968, 38.79}, {-8.8968, 42.6548}, {-8.81566, 42.6548}}));
    connect(OxygenSetpoint.y, feedback2.u1) annotation(
      Line(points = {{30.724, 45.1958}, {40.9253, 45.1958}, {40.9253, 46.6192}, {41.0143, 46.6192}}));
    connect(feedback1.y, PI2.u) annotation(
      Line(points = {{52.9281, 90.7473}, {59.0747, 90.7473}, {59.0747, 91.1032}, {59.742, 91.1032}}));
    connect(limiter1.y, feedback1.u2) annotation(
      Line(points = {{40.1913, 68.3274}, {46.6192, 68.3274}, {46.6192, 83.9858}, {45.5516, 83.9858}, {45.5516, 84.1904}}));
    connect(fixeddelay1.y, limiter1.u) annotation(
      Line(points = {{17.7713, 67.9715}, {24.1993, 67.9715}, {24.1993, 68.3274}, {24.6118, 68.3274}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44.9477, 77.2242}, {-44.9477, 77.0035}, {-44.9477, 77.0035}}));
    connect(WWSource.Out, mixer.In1) annotation(
      Line(points = {{-21.6085, 70.6762}, {-10.6762, 70.6762}, {-10.6762, 51.2456}, {-88.6121, 51.2456}, {-88.6121, 29.8932}, {-83.6174, 29.8932}, {-83.6174, 29.4271}}));
    connect(constant2.y, blower2.u) annotation(
      Line(points = {{-71.2214, -81.8505}, {-39.5018, -81.8505}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(constant2.y, blower1.u) annotation(
      Line(points = {{-71.2214, -81.8505}, {-39.8577, -81.8505}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 27.4967}, {-50.9246, 27.4967}}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-26.7805, 27.2452}, {-18.8612, 27.2452}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(tank2.Out, tank3.In) annotation(
      Line(points = {{3.15167, 26.7411}, {11.032, 26.7411}, {11.032, 19.2171}, {-76.5125, 19.2171}, {-76.5125, 3.20285}, {-66.802, 3.20285}, {-66.802, 3.09607}}));
    connect(tank4.Out, tank5.In) annotation(
      Line(points = {{-16.6544, 3.09607}, {-11.032, 3.09607}, {-11.032, 2.90823}, {-10.2799, 2.90823}}));
    connect(tank3.Out, tank4.In) annotation(
      Line(points = {{-44.7683, 3.09607}, {-38.79, 3.09607}, {-38.79, 3.09607}, {-38.6881, 3.09607}}));
    connect(tank5.Out, divider.In) annotation(
      Line(points = {{13.9572, 2.90824}, {21.7082, 2.90824}, {21.7082, 3.23132}, {20.242, 3.23132}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 28.0807}, {60.2777, 28.0807}}));
    annotation(
      Diagram(graphics = {Text(origin = {-222, 78}, extent = {{-6, 4}, {90, -16}}, textString = "BSM1 A: DO Cascade Control")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_ClosedLoop;

  extends Modelica.Icons.Library;
  annotation(
    Documentation(info = "This library contains components to build models of biological municipal
wastewater treatment plants based on the Benchmark Simulation Model No.1 (BSM1)"),
  uses(WasteWater(version = "2.1.0")));
end BSM1_A;

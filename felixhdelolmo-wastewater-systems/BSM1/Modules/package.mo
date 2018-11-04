within BSM1;

package Modules "Component models for the Benchmark Simulated Model No.1"




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

  model ADsensor_Q_air "Advanced sensor to measure the air flow rate and averages from a blower to a tank"
    extends BSM1.Modules.Icons.sensor_Q_air;
    
    parameter Real avg_start = 119;
    parameter Real avg_period = 1 / 96;
    parameter Real gamma = 1;
    
    Real Qm_air;
    discrete Real Qs_air;
    discrete Real n;
       
    BSM1.Modules.Interfaces.AirFlowOut Out annotation(
      Placement(visible = true, transformation(origin = {89.6832, 8.24427}, extent = {{-6.77369, -6.77369}, {6.77369, 6.77369}}, rotation = 0), iconTransformation(origin = {-92.3168, 0.24427}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    BSM1.Modules.Interfaces.AirFlowIn In annotation(
      Placement(visible = true, transformation(origin = {-92.5078, 8.24423}, extent = {{-6.1579, -6.1579}, {6.1579, 6.1579}}, rotation = 0), iconTransformation(origin = {91.4922, 0.24423}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Q_air annotation(
      Placement(visible = true, transformation(origin = {-4.56288, -76.1403}, extent = {{-12, 12}, {12, -12}}, rotation = -90), iconTransformation(origin = {-0.56288, -90.1403}, extent = {{-9.01578, 9.01578}, {9.01578, -9.01578}}, rotation = -90)));
  
  equation
    when sample(avg_start, avg_period) then
      Qs_air = gamma * pre(Qs_air) + abs(In.Q_air);
      n = gamma * pre(n) + 1;
      Qm_air = Qs_air / n;  
    end when;  
    In.Q_air + Out.Q_air = 0;
    Q_air = In.Q_air;
   
    annotation(
      Documentation(info = "Advanced sensor to measure the flow rate and averages of solids of an ASM1 wastewater stream"));
    annotation(
      Documentation(info = "

Main Author:
   Mikel Gorrotxategi Zipitria
  
The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

      "));
  end ADsensor_Q_air;







  model ADsensor_NH "Advanced sensor to measure the flow rate and averages of solids of an ASM1 wastewater stream"
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
    Modelica.Blocks.Interfaces.RealOutput Snh annotation(
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
    Snh = In.Snh;
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
  end ADsensor_NH;





  model ControlledDivider2Dig "Controlled flow divider"
    // divides one flow of wastewater into 2 Flows controlled by the
    // digital input signal u; u=1 means Out1.Q=0 and u=0 means Out2.Q=0
    extends BSM1.Modules.Icons.ControlledDivider2;
    
    Interfaces.WWFlowAsm1in In annotation(
      Placement(transformation(extent = {{-111, -7}, {-91, 13}})));
    Interfaces.WWFlowAsm1out Out1 annotation(
      Placement(transformation(extent = {{90, 15}, {110, 35}})));
    Interfaces.WWFlowAsm1out Out2 annotation(
      Placement(transformation(extent = {{90, -25}, {110, -5}})));
    Modelica.Blocks.Interfaces.BooleanInput InControlDig annotation(
      Placement(visible = true, transformation(origin = {0, -70}, extent = {{20, -20}, {-20, 20}}, rotation = -90), iconTransformation(origin = {0, -60}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  
  equation
  
  if InControlDig then
    Out1.Q = 0;
    Out2.Q = -In.Q;
    else
    Out1.Q = -In.Q;
    Out2.Q = 0;
    end if;
    
    Out1.Si = In.Si;
    Out1.Ss = In.Ss;
    Out1.Xi = In.Xi;
    Out1.Xs = In.Xs;
    Out1.Xbh = In.Xbh;
    Out1.Xba = In.Xba;
    Out1.Xp = In.Xp;
    Out1.So = In.So;
    Out1.Sno = In.Sno;
    Out1.Snh = In.Snh;
    Out1.Snd = In.Snd;
    Out1.Xnd = In.Xnd;
    Out1.Salk = In.Salk;
    Out2.Si = In.Si;
    Out2.Ss = In.Ss;
    Out2.Xi = In.Xi;
    Out2.Xs = In.Xs;
    Out2.Xbh = In.Xbh;
    Out2.Xba = In.Xba;
    Out2.Xp = In.Xp;
    Out2.So = In.So;
    Out2.Sno = In.Sno;
    Out2.Snh = In.Snh;
    Out2.Snd = In.Snd;
    Out2.Xnd = In.Xnd;
    Out2.Salk = In.Salk;
    annotation(
      Documentation(info = "This component divides one wastewater flow (ASM1) into two flows which are controlled by the signal u (0...1).
Is u.signal=1, the flow goes to output 1 (Out1) and is u.signal=0, the flow goes to output 2 (Out2).
The concentrations of the outport-flows are equal to the concentration at inport."));
  end ControlledDivider2Dig;





  model ADsensor_kk "Advanced sensor to measure the air flow rate and averages from a blower to a tank"
    extends BSM1.Modules.Icons.sensor_Q_air;
    parameter Real avg_start = 119;
    parameter Real avg_period = 1 / 96;
    parameter Real gamma = 1;
    Real Qm_air;
    Real x;
    discrete Real Qs_air;
    discrete Real n;
    BSM1.Modules.Interfaces.AirFlowOut Out annotation(
      Placement(visible = true, transformation(origin = {89.6832, 8.24427}, extent = {{-6.77369, -6.77369}, {6.77369, 6.77369}}, rotation = 0), iconTransformation(origin = {-92.3168, 0.24427}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    BSM1.Modules.Interfaces.AirFlowIn In annotation(
      Placement(visible = true, transformation(origin = {-92.5078, 8.24423}, extent = {{-6.1579, -6.1579}, {6.1579, 6.1579}}, rotation = 0), iconTransformation(origin = {91.4922, 0.24423}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Q_air annotation(
      Placement(visible = true, transformation(origin = {-4.56288, -76.1403}, extent = {{-12, 12}, {12, -12}}, rotation = -90), iconTransformation(origin = {-0.56288, -90.1403}, extent = {{-9.01578, 9.01578}, {9.01578, -9.01578}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput kk annotation(
      Placement(visible = true, transformation(origin = {92, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    when sample(avg_start, avg_period) then
      Qs_air = gamma * pre(Qs_air) + abs(In.Q_air);
      n = gamma * pre(n) + 1;
      Qm_air = Qs_air / n;
    end when;
    In.Q_air + Out.Q_air = 0;
    Q_air = In.Q_air;
    
  
    der(x)= 2*x + 5*In.Q_air ;
    kk=4*x ;
    
    annotation(
      Documentation(info = "Advanced sensor to measure the flow rate and averages of solids of an ASM1 wastewater stream"));
    annotation(
      Documentation(info = "

Main Author:
   Mikel Gorrotxategi Zipitria
  
The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

      "));
  end ADsensor_kk;












  
  



































end Modules;

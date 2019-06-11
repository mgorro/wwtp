package BSM1 "Component models for the Benchmark Simulation Model No.1"
  extends Modelica.Icons.Library;

  model BSM1_A_dry
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {41.5231, -72.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {-50.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-54.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 76.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 1, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {178.268, 0.235701}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step OxygenSetpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {9.7082, 85.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {38.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45000000) annotation(
      Placement(visible = true, transformation(origin = {90.3274, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-107.903, 10.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {-253.593, -155.389}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  equation
<<<<<<< HEAD
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
=======
>>>>>>> 6a0bb4bbbac3dc9b7d19e3009e80b169585e0535
    connect(WWSource.Out, mixer.In1) annotation(
      Line(points = {{-21.6085, 70.6762}, {-10.6762, 70.6762}, {-10.6762, 51.2456}, {-88.6121, 51.2456}, {-88.6121, 29.8932}, {-122, 29.8932}, {-122, 16}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-122, 26.988}, {-122, 4}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-122, 23.6145}, {-122, 10}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-93, 10}, {-51.0843, 10}, {-51.0843, 28}, {-64, 28}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{-264, -156}, {-19.5, -156}, {-19.5, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -156}, {-242, -156}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 3}, {166, 3}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{52, -73}, {58.2169, -73}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{52, -73}, {58.2169, -73}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(OxygenSetpoint.y, feedback2.u1) annotation(
      Line(points = {{18, 86}, {32, 86}, {32, 84}, {34, 84}}, color = {0, 0, 127}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-38, 28}, {-18.8612, 28}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-53.7367, 43.7284}, {-53.7367, 33}, {-64, 33}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{46, 85}, {52.9395, 85}, {52.9395, 85.1601}, {80, 85.1601}, {80, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{99, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 79}, {39, 79}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8.30088}, {-66.455, 8.30088}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-90.0356, 43.7284}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-20.9964, 43.7284}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
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
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
      Diagram(graphics = {Text(origin = {-189, 78}, extent = {{-57, 20}, {39, -20}}, textString = "A: DO Cascade Control")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_A_dry;




  model BSM1_B1_dry
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -72.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.divider2 divider annotation(
      Placement(visible = true, transformation(origin = {28.8256, 2.84698}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank5(Kla = 84, Salk(start = 4.13), Si(start = 30), Snd(start = 0.688), Snh(start = 1.73), Sno(start = 10.4), So(start = 0.491), Ss(start = 0.889), V = 1333, Xba(start = 150), Xbh(start = 2559), Xi(start = 1149), Xnd(start = 3.53), Xp(start = 452), Xs(start = 49.3)) annotation(
      Placement(visible = true, transformation(origin = {1.743, 3.41701}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank4(Si(start = 30), Ss(start = 0.995), Xi(start = 1149), Xs(start = 55.7), Xbh(start = 2559), Xba(start = 150), Xp(start = 451), So(start = 2.43), Sno(start = 9.3), Snh(start = 2.97), Snd(start = 0.767), Xnd(start = 3.88), Salk(start = 4.29), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-27.758, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank2(Si(start = 30), Ss(start = 1.46), Xi(start = 1149), Xs(start = 76.4), Xbh(start = 2553), Xba(start = 148), Xp(start = 450), So(start = 0.0000631), Sno(start = 3.66), Snh(start = 8.34), Snd(start = 0.882), Xnd(start = 5.03), Salk(start = 5.08)) annotation(
      Placement(visible = true, transformation(origin = {-7.82918, 27.4021}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank3(Si(start = 30), Ss(start = 1.15), Xi(start = 1149), Xs(start = 64.9), Xbh(start = 2557), Xba(start = 149), Xp(start = 450), So(start = 1.72), Sno(start = 6.54), Snh(start = 5.55), Snd(start = 0.829), Xnd(start = 4.39), Salk(start = 4.67), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-55.8719, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank1(Si(start = 30), Ss(start = 2.81), Xi(start = 1149), Xs(start = 82.1), Xbh(start = 2552), Xba(start = 148), Xp(start = 449), So(start = 0.0043), Sno(start = 5.37), Snh(start = 7.92), Snd(start = 1.22), Xnd(start = 5.28), Salk(start = 4.93)) annotation(
      Placement(visible = true, transformation(origin = {-38.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-56.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 76.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-71.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 1, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-134.829, 41.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 22.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {68.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {100.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-29.7461, -44.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 300, k = -6) annotation(
      Placement(visible = true, transformation(origin = {46, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {27, 63}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0.5) annotation(
      Placement(visible = true, transformation(origin = {214.811, 58.036}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Noise.UniformNoise uniformNoise1(samplePeriod = 2, useAutomaticLocalSeed = true, useGlobalSeed = true, y_max = 2.5, y_min = 0.5) annotation(
      Placement(visible = true, transformation(origin = {218, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -10}, {2, -18}, {3, -18}}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{27, 54}, {15, 54}, {15, 26}, {16, 26}, {16, 9}, {9, 9}}, color = {0, 0, 255}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-124, 42}, {-90.0356, 42}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 9}, {-11, 9}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{9, 9}, {6.40569, 9}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(tank4.Out, tank5.In) annotation(
      Line(points = {{-16.6544, 3.09607}, {-11.032, 3.09607}, {-11.032, 3}, {-11, 3}}));
    connect(tank5.Out, divider.In) annotation(
      Line(points = {{15, 3}, {21.7082, 3}, {21.7082, 3.23132}, {20.242, 3.23132}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -73}, {58.2169, -73}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -73}, {58.2169, -73}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -41}, {-18, -41}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-42, -48}, {-87.2289, -48}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -48}, {-19, -48}}, color = {0, 0, 127}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -7}, {-58, -7}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-48, -18.1495}, {-48, -19}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{109, 86}, {116, 86}, {116, 72}, {52, 72}, {52, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{76, 85}, {76.9395, 85}, {76.9395, 85.1601}, {90, 85.1601}, {90, 86}}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 79}, {69, 79}}));
    connect(PI_NH4.y, feedback2.u1) annotation(
      Line(points = {{55, 84}, {60.5, 84}, {60.5, 85}, {63, 85}}, color = {0, 0, 127}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(aDsensor_Q_air_tank5.Q_air, feedback3.u2) annotation(
      Line(points = {{12, -27}, {18, -27}, {18, -23}, {52, -23}, {52, 50}, {68, 50}, {68, 52}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {182, 58}, {182, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -18}, {30.5, -18}, {30.5, -27}, {22, -27}}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{36, 63}, {28, 63}, {28, 70}, {16, 70}, {16, 82}}, color = {0, 0, 127}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-124, 42}, {-53.7367, 42}, {-53.7367, 33.1866}, {-52.4822, 33.1866}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-124, 42}, {-20.9964, 42}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-124, 42}, {-89.6797, 42}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-124, 42}, {-89.6797, 42}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8.30088}, {-66.455, 8.30088}}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77}, {-85, 77}}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {28, 88}, {28, 84}, {36, 84}}, color = {0, 0, 127}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(WWSource.Out, mixer.In1) annotation(
      Line(points = {{-21.6085, 70.6762}, {-18.6762, 70.6762}, {-18.6762, 53.2456}, {-88.6121, 53.2456}, {-88.6121, 29.8932}, {-83.6174, 29.8932}, {-83.6174, 29.4271}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 27.4967}, {-50.9246, 27.4967}}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-26.7805, 27.2452}, {-18.8612, 27.2452}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(tank2.Out, tank3.In) annotation(
      Line(points = {{3.15167, 26.7411}, {11.032, 26.7411}, {11.032, 19.2171}, {-76.5125, 19.2171}, {-76.5125, 3.20285}, {-66.802, 3.20285}, {-66.802, 3.09607}}));
    connect(tank3.Out, tank4.In) annotation(
      Line(points = {{-44.7683, 3.09607}, {-38.79, 3.09607}, {-38.79, 3.09607}, {-38.6881, 3.09607}}));
    annotation(
      Diagram(graphics = {Text(origin = {-171, 80}, extent = {{-57, 20}, {39, -20}}, textString = "B1: Ammonium Based control: feedback")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_B1_dry;



  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;
  extends Modelica.Icons.Library;

  model BSM1_B2_dry
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
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
    Modelica.Blocks.Sources.Step NH4Setpoint(startTime = 0, height = 2) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 24, k = -3.5) annotation(
      Placement(visible = true, transformation(origin = {40, 90}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {40, 54}, {40, 76}, {52, 76}, {52, 82}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {27, 88}, {27, 90}, {30, 90}}, color = {0, 0, 127}));
    connect(add1.u1, PI_NH4.y) annotation(
      Line(points = {{59, 90}, {49, 90}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
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
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
    annotation(
      Diagram(graphics = {Text(origin = {-173, 78}, extent = {{-57, 20}, {39, -20}}, textString = "B2: Ammonium Based control: feedforward"), Text(origin = {-169, 47}, extent = {{-37, 9}, {35, -3}}, textString = "FF del tank 2")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_B2_dry;




  model BSM1_C_dry
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {51.5231, -64.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
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
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 24, k = -3.5) annotation(
      Placement(visible = true, transformation(origin = {40, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    BSM1.Modules.MPC mpc annotation(
      Placement(visible = true, transformation(origin = {164, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{62, -65}, {58.2169, -65}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{62, -65}, {58.2169, -65}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {36, 54}, {36, 72}, {56, 72}, {56, 82}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(blower3.u, mpc.y1) annotation(
      Line(points = {{32, -38}, {184, -38}, {184, -4}, {172, -4}, {172, -6}, {172, -6}}, color = {0, 0, 127}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(feedback3.y, mpc.u_PV) annotation(
      Line(points = {{76, 58}, {126, 58}, {126, -6}, {156, -6}, {156, -6}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, mpc.u_SP) annotation(
      Line(points = {{44, 24}, {44, 24}, {44, 10}, {116, 10}, {116, -10}, {156, -10}, {156, -10}}, color = {0, 0, 127}));
    connect(add1.u1, PI_NH4.y) annotation(
      Line(points = {{59, 90}, {48, 90}, {48, 88}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {30, 88}, {30, 88}, {30, 88}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
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
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
      Diagram(graphics = {Text(origin = {-173, 78}, extent = {{-57, 20}, {39, -20}}, textString = "C: Advanced controller"), Text(origin = {-185, 57}, extent = {{-37, 9}, {37, -9}}, textString = "FF de la entrada o del tank 2???")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_C_dry;




  model BSM1_D_dry
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank5(Kla = 84, Salk(start = 4.13), Si(start = 30), Snd(start = 0.688), Snh(start = 1.73), Sno(start = 10.4), So(start = 0.491), Ss(start = 0.889), V = 1333, Xba(start = 150), Xbh(start = 2559), Xi(start = 1149), Xnd(start = 3.53), Xp(start = 452), Xs(start = 49.3)) annotation(
      Placement(visible = true, transformation(origin = {1.74327, 3.41715}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank4(Si(start = 30), Ss(start = 0.995), Xi(start = 1149), Xs(start = 55.7), Xbh(start = 2559), Xba(start = 150), Xp(start = 451), So(start = 2.43), Sno(start = 9.3), Snh(start = 2.97), Snd(start = 0.767), Xnd(start = 3.88), Salk(start = 4.29), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-27.758, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank2(Si(start = 30), Ss(start = 1.46), Xi(start = 1149), Xs(start = 76.4), Xbh(start = 2553), Xba(start = 148), Xp(start = 450), So(start = 0.0000631), Sno(start = 3.66), Snh(start = 8.34), Snd(start = 0.882), Xnd(start = 5.03), Salk(start = 5.08)) annotation(
      Placement(visible = true, transformation(origin = {-7.82918, 27.4021}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank3(Si(start = 30), Ss(start = 1.15), Xi(start = 1149), Xs(start = 64.9), Xbh(start = 2557), Xba(start = 149), Xp(start = 450), So(start = 1.72), Sno(start = 6.54), Snh(start = 5.55), Snd(start = 0.829), Xnd(start = 4.39), Salk(start = 4.67), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-75.8719, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank1(Si(start = 30), Ss(start = 2.81), Xi(start = 1149), Xs(start = 82.1), Xbh(start = 2552), Xba(start = 148), Xp(start = 449), So(start = 0.0043), Sno(start = 5.37), Snh(start = 7.92), Snd(start = 1.22), Xnd(start = 5.28), Salk(start = 4.93)) annotation(
      Placement(visible = true, transformation(origin = {-38.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-74.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-127.139, -83.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(startTime = 130, offset = -1, height = 1) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-194.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {126.811, -81.9644}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 24, k = -3.5) annotation(
      Placement(visible = true, transformation(origin = {40, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    BSM1.Modules.ControlledDivider2Dig ctrlDividerTank3 annotation(
      Placement(visible = true, transformation(origin = {-214, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    WasteWater.ASM1.divider2 divider annotation(
      Placement(visible = true, transformation(origin = {28.8256, 2.84698}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.mixer2 mixerTank4 annotation(
      Placement(visible = true, transformation(origin = {-52, -2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.mixer2 mixerTank3 annotation(
      Placement(visible = true, transformation(origin = {-106, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM1.Modules.ControlledDivider2Dig ctrlDividerPreTank3_4 annotation(
      Placement(visible = true, transformation(origin = {-174, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM1.Modules.nitri pretank3(V = 1800) annotation(
      Placement(visible = true, transformation(origin = {-141, -5}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
    WasteWater.ASM1.blower blower0(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-140, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual greaterEqual1 annotation(
      Placement(visible = true, transformation(origin = {158, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.LessEqual lessEqual_1 annotation(
      Placement(visible = true, transformation(origin = {158, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.Timer timerGreater annotation(
      Placement(visible = true, transformation(origin = {180, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.Timer timerLess annotation(
      Placement(visible = true, transformation(origin = {180, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const_1(k = -1) annotation(
      Placement(visible = true, transformation(origin = {129, -53}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
      Placement(visible = true, transformation(origin = {129, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual timerLessCmp annotation(
      Placement(visible = true, transformation(origin = {206, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual timerGreaterCmp annotation(
      Placement(visible = true, transformation(origin = {202, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const_timers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {177, -59}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Logical.And and1 annotation(
      Placement(visible = true, transformation(origin = {-133, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Logical.Not not1 annotation(
      Placement(visible = true, transformation(origin = {-151, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Logical.Switch switchBlower0 annotation(
      Placement(visible = true, transformation(origin = {-113, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = -1) annotation(
      Placement(visible = true, transformation(origin = {-135.139, -61.8505}, extent = {{-5.01578, -5.01578}, {5.01578, 5.01578}}, rotation = 0)));
    Modelica.Blocks.Logical.Or or1 annotation(
      Placement(visible = true, transformation(origin = {225, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {42, 54}, {42, 74}, {52, 74}, {52, 84}, {58, 84}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(or1.y, ctrlDividerTank3.InControlDig) annotation(
      Line(points = {{230, -18}, {240, -18}, {240, -104}, {-214, -104}, {-214, -2}}, color = {255, 0, 255}));
    connect(ctrlDividerTank3.Out1, mixerTank3.In1) annotation(
      Line(points = {{-204, 6.5}, {-116, 6.5}, {-116, 4}}));
    connect(ctrlDividerTank3.Out2, ctrlDividerPreTank3_4.In) annotation(
      Line(points = {{-204, 2.5}, {-184, 2.5}, {-184, -22}}));
    connect(tank2.Out, ctrlDividerTank3.In) annotation(
      Line(points = {{4, 28}, {4, 10}, {-226, 10}, {-226, 4}, {-224, 4}}));
    connect(pretank3.T, Temperature.y) annotation(
      Line(points = {{-154, 0}, {-170, 0}, {-170, 44.5}, {-184, 44.5}, {-184, 44}}, color = {0, 0, 127}));
    connect(timerLessCmp.y, or1.u2) annotation(
      Line(points = {{214, -36}, {216, -36}, {216, -24}, {218, -24}, {218, -24}}, color = {255, 0, 255}));
    connect(timerGreaterCmp.y, or1.u1) annotation(
      Line(points = {{210, -4}, {214, -4}, {214, -20}, {218, -20}, {218, -18}}, color = {255, 0, 255}));
    connect(const_timers.y, timerGreaterCmp.u2) annotation(
      Line(points = {{185, -59}, {192, -59}, {192, -10}}, color = {0, 0, 127}));
    connect(timerGreater.y, timerGreaterCmp.u1) annotation(
      Line(points = {{189, -4}, {192, -4}}, color = {0, 0, 127}));
    connect(timerGreaterCmp.y, and1.u1) annotation(
      Line(points = {{211, -4}, {238, -4}, {238, -102}, {-212, -102}, {-212, -46}, {-139, -46}, {-139, -45}}, color = {255, 0, 255}));
    connect(const_timers.y, timerLessCmp.u2) annotation(
      Line(points = {{185, -59}, {198, -59}, {198, -42}, {196, -42}}, color = {0, 0, 127}));
    connect(timerLess.y, timerLessCmp.u1) annotation(
      Line(points = {{189, -36}, {196, -36}}, color = {0, 0, 127}));
    connect(timerLessCmp.y, ctrlDividerPreTank3_4.InControlDig) annotation(
      Line(points = {{215, -36}, {234, -36}, {234, -100}, {-174, -100}, {-174, -28}}, color = {255, 0, 255}));
    connect(not1.u, timerLessCmp.y) annotation(
      Line(points = {{-157, -53}, {-174, -53}, {-174, -100}, {234, -100}, {234, -36}, {215, -36}}, color = {255, 0, 255}));
    connect(lessEqual_1.y, timerLess.u) annotation(
      Line(points = {{166, -36}, {170, -36}}, color = {255, 0, 255}));
    connect(greaterEqual1.y, timerGreater.u) annotation(
      Line(points = {{166, -4}, {170, -4}}, color = {255, 0, 255}));
    connect(switchBlower0.u1, constant_blowers.y) annotation(
      Line(points = {{-118, -40}, {-124, -40}, {-124, -34}, {-102, -34}, {-102, -84}, {-118, -84}, {-118, -84}}, color = {0, 0, 127}));
    connect(and1.y, switchBlower0.u2) annotation(
      Line(points = {{-128, -44}, {-120, -44}, {-120, -44}, {-118, -44}}, color = {255, 0, 255}));
    connect(switchBlower0.y, blower0.u) annotation(
      Line(points = {{-108, -44}, {-104, -44}, {-104, -30}, {-130, -30}, {-130, -28}, {-130, -28}}, color = {0, 0, 127}));
    connect(const.y, switchBlower0.u3) annotation(
      Line(points = {{-130, -62}, {-120, -62}, {-120, -50}, {-120, -50}}, color = {0, 0, 127}));
    connect(not1.y, and1.u2) annotation(
      Line(points = {{-145, -53}, {-139, -53}, {-139, -49}}, color = {255, 0, 255}));
    connect(ctrlDividerPreTank3_4.Out2, mixerTank4.In2) annotation(
      Line(points = {{-164, -24}, {-160, -24}, {-160, -70}, {-100, -70}, {-100, -30}, {-62, -30}, {-62, -2}, {-60, -2}, {-60, -4}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{135, -82}, {146, -82}, {146, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-117, -84}, {-39.5018, -84}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-117, -84}, {-39.8577, -84}, {-39.8577, -18.1495}, {-66, -18.1495}, {-66, -19}}));
    connect(PI_Qair.y, greaterEqual1.u1) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -4}, {148, -4}}, color = {0, 0, 127}));
    connect(PI_Qair.y, lessEqual_1.u1) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -36}, {148, -36}}, color = {0, 0, 127}));
    connect(const_1.y, lessEqual_1.u2) annotation(
      Line(points = {{136, -52}, {148, -52}, {148, -42}, {148, -42}, {148, -42}}, color = {0, 0, 127}));
    connect(const1.y, greaterEqual1.u2) annotation(
      Line(points = {{136, -14}, {148, -14}, {148, -10}, {148, -10}}, color = {0, 0, 127}));
    connect(pretank3.AirIn, blower0.AirOut) annotation(
      Line);
    connect(ctrlDividerPreTank3_4.Out1, pretank3.In) annotation(
      Line(points = {{-164, -20}, {-154, -20}, {-154, -5}}));
    connect(pretank3.Out, mixerTank3.In2) annotation(
      Line(points = {{-128, -5}, {-116, -5}, {-116, 0}}));
    connect(mixerTank3.Out, tank3.In) annotation(
      Line(points = {{-96, 2.5}, {-88, 2.5}, {-88, 4}}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-184, 44}, {-53.7367, 44}, {-53.7367, 33.1866}, {-52.4822, 33.1866}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-184, 44}, {-20.9964, 44}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-184, 44}, {-90.0356, 44}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-184, 44}, {-89.6797, 44}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-184, 44}, {-89.6797, 44}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8}, {-88, 8}}));
    connect(tank3.Out, mixerTank4.In1) annotation(
      Line(points = {{-64, 4}, {-60, 4}, {-60, 0}, {-60, 0}}));
    connect(mixerTank4.Out, tank4.In) annotation(
      Line(points = {{-44, -2}, {-40, -2}, {-40, 4}, {-40, 4}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-75.8719, -8.20128}, {-76.0454, -8.20128}, {-76.0454, -13.3458}, {-76.195, -13.3458}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 28.0807}, {60.2777, 28.0807}}));
    connect(tank5.Out, divider.In) annotation(
      Line(points = {{13.9572, 2.90824}, {21.7082, 2.90824}, {21.7082, 3.23132}, {20.242, 3.23132}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(add1.u1, PI_NH4.y) annotation(
      Line(points = {{59, 90}, {48, 90}, {48, 88}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {30, 88}, {30, 88}, {30, 88}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 27.4967}, {-50.9246, 27.4967}}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-26.7805, 27.2452}, {-18.8612, 27.2452}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(tank4.Out, tank5.In) annotation(
      Line(points = {{-16.6544, 3.09607}, {-11.032, 3.09607}, {-11.032, 2.90823}, {-10.2799, 2.90823}}));
    annotation(
      Diagram(graphics = {Text(origin = {-161, 78}, extent = {{-57, 20}, {39, -20}}, textString = "D: Control of the aerobic volume")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_D_dry;




  model BSM1_A_rain
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {41.5231, -72.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {-50.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-54.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 76.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 2, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {178.268, 0.235701}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step OxygenSetpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {9.7082, 85.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {38.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45000000) annotation(
      Placement(visible = true, transformation(origin = {90.3274, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {-253.593, -155.389}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
    
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{-264, -156}, {-19.5, -156}, {-19.5, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -156}, {-242, -156}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 3}, {166, 3}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{52, -73}, {58.2169, -73}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{52, -73}, {58.2169, -73}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(OxygenSetpoint.y, feedback2.u1) annotation(
      Line(points = {{18, 86}, {32, 86}, {32, 84}, {34, 84}}, color = {0, 0, 127}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-38, 28}, {-18.8612, 28}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 28}, {-64, 28}}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-53.7367, 43.7284}, {-53.7367, 33}, {-64, 33}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{46, 85}, {52.9395, 85}, {52.9395, 85.1601}, {80, 85.1601}, {80, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{99, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 79}, {39, 79}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8.30088}, {-66.455, 8.30088}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-90.0356, 43.7284}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-20.9964, 43.7284}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
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
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
      Diagram(graphics = {Text(origin = {-189, 78}, extent = {{-57, 20}, {39, -20}}, textString = "A: DO Cascade Control")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_A_rain;



  model BSM1_B1_rain
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -70.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.divider2 divider annotation(
      Placement(visible = true, transformation(origin = {28.8256, 2.84698}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank5(Kla = 84, Salk(start = 4.13), Si(start = 30), Snd(start = 0.688), Snh(start = 1.73), Sno(start = 10.4), So(start = 0.491), Ss(start = 0.889), V = 1333, Xba(start = 150), Xbh(start = 2559), Xi(start = 1149), Xnd(start = 3.53), Xp(start = 452), Xs(start = 49.3)) annotation(
      Placement(visible = true, transformation(origin = {23.743, 3.41701}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank4(Si(start = 30), Ss(start = 0.995), Xi(start = 1149), Xs(start = 55.7), Xbh(start = 2559), Xba(start = 150), Xp(start = 451), So(start = 2.43), Sno(start = 9.3), Snh(start = 2.97), Snd(start = 0.767), Xnd(start = 3.88), Salk(start = 4.29), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-27.758, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank2(Si(start = 30), Ss(start = 1.46), Xi(start = 1149), Xs(start = 76.4), Xbh(start = 2553), Xba(start = 148), Xp(start = 450), So(start = 0.0000631), Sno(start = 3.66), Snh(start = 8.34), Snd(start = 0.882), Xnd(start = 5.03), Salk(start = 5.08)) annotation(
      Placement(visible = true, transformation(origin = {-7.82918, 27.4021}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank3(Si(start = 30), Ss(start = 1.15), Xi(start = 1149), Xs(start = 64.9), Xbh(start = 2557), Xba(start = 149), Xp(start = 450), So(start = 1.72), Sno(start = 6.54), Snh(start = 5.55), Snd(start = 0.829), Xnd(start = 4.39), Salk(start = 4.67), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-55.8719, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank1(Si(start = 30), Ss(start = 2.81), Xi(start = 1149), Xs(start = 82.1), Xbh(start = 2552), Xba(start = 148), Xp(start = 449), So(start = 0.0043), Sno(start = 5.37), Snh(start = 7.92), Snd(start = 1.22), Xnd(start = 5.28), Salk(start = 4.93)) annotation(
      Placement(visible = true, transformation(origin = {-38.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-56.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 76.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-71.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 2, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-134.829, 41.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 22.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {68.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {100.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-29.7461, -44.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 10000, k = -7) annotation(
      Placement(visible = true, transformation(origin = {46, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {27, 63}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0.5) annotation(
      Placement(visible = true, transformation(origin = {214.811, 58.036}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Noise.UniformNoise uniformNoise1(samplePeriod = 2, useAutomaticLocalSeed = true, useGlobalSeed = true, y_max = 2.5, y_min = 0.5) annotation(
      Placement(visible = true, transformation(origin = {218, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(tank5.Out, divider.In) annotation(
      Line(points = {{37, 3}, {21.7082, 3}, {21.7082, 3.23132}, {20.242, 3.23132}}));
    connect(tank4.Out, tank5.In) annotation(
      Line(points = {{-16.6544, 3.09607}, {-11.032, 3.09607}, {-11.032, 3}, {11, 3}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{31, 9}, {6.40569, 9}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-124, 42}, {-90.0356, 42}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 9}, {11, 9}}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{27, 54}, {15, 54}, {15, 26}, {16, 26}, {16, 9}, {31, 9}}, color = {0, 0, 255}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{24, -10}, {24, -18}, {3, -18}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -71}, {58.2169, -71}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -71}, {58.2169, -71}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -41}, {-18, -41}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-42, -48}, {-87.2289, -48}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -48}, {-19, -48}}, color = {0, 0, 127}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -7}, {-58, -7}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-48, -18.1495}, {-48, -19}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{109, 86}, {116, 86}, {116, 72}, {52, 72}, {52, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{76, 85}, {76.9395, 85}, {76.9395, 85.1601}, {90, 85.1601}, {90, 86}}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 79}, {69, 79}}));
    connect(PI_NH4.y, feedback2.u1) annotation(
      Line(points = {{55, 84}, {60.5, 84}, {60.5, 85}, {63, 85}}, color = {0, 0, 127}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(aDsensor_Q_air_tank5.Q_air, feedback3.u2) annotation(
      Line(points = {{12, -27}, {18, -27}, {18, -23}, {52, -23}, {52, 50}, {68, 50}, {68, 52}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {182, 58}, {182, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -18}, {30.5, -18}, {30.5, -27}, {22, -27}}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{36, 63}, {28, 63}, {28, 70}, {16, 70}, {16, 82}}, color = {0, 0, 127}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-124, 42}, {-53.7367, 42}, {-53.7367, 33.1866}, {-52.4822, 33.1866}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-124, 42}, {-20.9964, 42}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-124, 42}, {-89.6797, 42}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-124, 42}, {-89.6797, 42}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8.30088}, {-66.455, 8.30088}}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77}, {-85, 77}}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {28, 88}, {28, 84}, {36, 84}}, color = {0, 0, 127}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(WWSource.Out, mixer.In1) annotation(
      Line(points = {{-21.6085, 70.6762}, {-18.6762, 70.6762}, {-18.6762, 53.2456}, {-88.6121, 53.2456}, {-88.6121, 29.8932}, {-83.6174, 29.8932}, {-83.6174, 29.4271}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 27.4967}, {-50.9246, 27.4967}}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-26.7805, 27.2452}, {-18.8612, 27.2452}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(tank2.Out, tank3.In) annotation(
      Line(points = {{3.15167, 26.7411}, {11.032, 26.7411}, {11.032, 19.2171}, {-76.5125, 19.2171}, {-76.5125, 3.20285}, {-66.802, 3.20285}, {-66.802, 3.09607}}));
    connect(tank3.Out, tank4.In) annotation(
      Line(points = {{-44.7683, 3.09607}, {-38.79, 3.09607}, {-38.79, 3.09607}, {-38.6881, 3.09607}}));
    annotation(
      Diagram(graphics = {Text(origin = {-171, 80}, extent = {{-57, 20}, {39, -20}}, textString = "B1: Ammonium Based control: feedback")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_B1_rain;




  model BSM1_B2_rain
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {45.5231, -78.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 2, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2.5, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {30.4072, -61.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 24, k = -3.5) annotation(
      Placement(visible = true, transformation(origin = {40, 90}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {12, 56}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 61}, {-9, 61}}, color = {0, 0, 255}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{56, -79}, {58.2169, -79}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{56, -79}, {58.2169, -79}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -62}, {42, -62}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{20, -62}, {-19.5, -62}, {-19.5, -58}, {-47, -58}}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {12, 32}, {12, 48}}));
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{20, 56}, {40, 56}, {40, 76}, {52, 76}, {52, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {27, 88}, {27, 90}, {30, 90}}, color = {0, 0, 127}));
    connect(add1.u1, PI_NH4.y) annotation(
      Line(points = {{59, 90}, {49, 90}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
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
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
    annotation(
      Diagram(graphics = {Text(origin = {-173, 78}, extent = {{-57, 20}, {39, -20}}, textString = "B2: Ammonium Based control: feedforward"), Text(origin = {-169, 47}, extent = {{-37, 9}, {35, -3}}, textString = "FF del tank 2")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_B2_rain;




  model BSM1_C_rain
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {51.5231, -64.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 2, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2.5, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 24, k = -3.5) annotation(
      Placement(visible = true, transformation(origin = {40, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    BSM1.Modules.MPC mpc annotation(
      Placement(visible = true, transformation(origin = {164, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{62, -65}, {58.2169, -65}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{62, -65}, {58.2169, -65}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {36, 54}, {36, 72}, {56, 72}, {56, 82}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(blower3.u, mpc.y1) annotation(
      Line(points = {{32, -38}, {184, -38}, {184, -4}, {172, -4}, {172, -6}, {172, -6}}, color = {0, 0, 127}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(feedback3.y, mpc.u_PV) annotation(
      Line(points = {{76, 58}, {126, 58}, {126, -6}, {156, -6}, {156, -6}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, mpc.u_SP) annotation(
      Line(points = {{44, 24}, {44, 24}, {44, 10}, {116, 10}, {116, -10}, {156, -10}, {156, -10}}, color = {0, 0, 127}));
    connect(add1.u1, PI_NH4.y) annotation(
      Line(points = {{59, 90}, {48, 90}, {48, 88}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {30, 88}, {30, 88}, {30, 88}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
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
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
      Diagram(graphics = {Text(origin = {-173, 78}, extent = {{-57, 20}, {39, -20}}, textString = "C: Advanced controller"), Text(origin = {-185, 57}, extent = {{-37, 9}, {37, -9}}, textString = "FF de la entrada o del tank 2???")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_C_rain;




  model BSM1_D_rain
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank5(Kla = 84, Salk(start = 4.13), Si(start = 30), Snd(start = 0.688), Snh(start = 1.73), Sno(start = 10.4), So(start = 0.491), Ss(start = 0.889), V = 1333, Xba(start = 150), Xbh(start = 2559), Xi(start = 1149), Xnd(start = 3.53), Xp(start = 452), Xs(start = 49.3)) annotation(
      Placement(visible = true, transformation(origin = {1.74327, 3.41715}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank4(Si(start = 30), Ss(start = 0.995), Xi(start = 1149), Xs(start = 55.7), Xbh(start = 2559), Xba(start = 150), Xp(start = 451), So(start = 2.43), Sno(start = 9.3), Snh(start = 2.97), Snd(start = 0.767), Xnd(start = 3.88), Salk(start = 4.29), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-27.758, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank2(Si(start = 30), Ss(start = 1.46), Xi(start = 1149), Xs(start = 76.4), Xbh(start = 2553), Xba(start = 148), Xp(start = 450), So(start = 0.0000631), Sno(start = 3.66), Snh(start = 8.34), Snd(start = 0.882), Xnd(start = 5.03), Salk(start = 5.08)) annotation(
      Placement(visible = true, transformation(origin = {-7.82918, 27.4021}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank3(Si(start = 30), Ss(start = 1.15), Xi(start = 1149), Xs(start = 64.9), Xbh(start = 2557), Xba(start = 149), Xp(start = 450), So(start = 1.72), Sno(start = 6.54), Snh(start = 5.55), Snd(start = 0.829), Xnd(start = 4.39), Salk(start = 4.67), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-75.8719, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank1(Si(start = 30), Ss(start = 2.81), Xi(start = 1149), Xs(start = 82.1), Xbh(start = 2552), Xba(start = 148), Xp(start = 449), So(start = 0.0043), Sno(start = 5.37), Snh(start = 7.92), Snd(start = 1.22), Xnd(start = 5.28), Salk(start = 4.93)) annotation(
      Placement(visible = true, transformation(origin = {-38.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-74.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-127.139, -83.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 2, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-194.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2.5) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {126.811, -81.9644}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 24, k = -3.5) annotation(
      Placement(visible = true, transformation(origin = {40, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    BSM1.Modules.ControlledDivider2Dig ctrlDividerTank3 annotation(
      Placement(visible = true, transformation(origin = {-214, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    WasteWater.ASM1.divider2 divider annotation(
      Placement(visible = true, transformation(origin = {28.8256, 2.84698}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.mixer2 mixerTank4 annotation(
      Placement(visible = true, transformation(origin = {-52, -2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.mixer2 mixerTank3 annotation(
      Placement(visible = true, transformation(origin = {-106, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM1.Modules.ControlledDivider2Dig ctrlDividerPreTank3_4 annotation(
      Placement(visible = true, transformation(origin = {-174, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM1.Modules.nitri pretank3(V = 1800) annotation(
      Placement(visible = true, transformation(origin = {-141, -5}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
    WasteWater.ASM1.blower blower0(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-140, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual greaterEqual1 annotation(
      Placement(visible = true, transformation(origin = {158, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.LessEqual lessEqual_1 annotation(
      Placement(visible = true, transformation(origin = {158, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.Timer timerGreater annotation(
      Placement(visible = true, transformation(origin = {180, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.Timer timerLess annotation(
      Placement(visible = true, transformation(origin = {180, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const_1(k = -1) annotation(
      Placement(visible = true, transformation(origin = {129, -53}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
      Placement(visible = true, transformation(origin = {129, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual timerLessCmp annotation(
      Placement(visible = true, transformation(origin = {206, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual timerGreaterCmp annotation(
      Placement(visible = true, transformation(origin = {202, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const_timers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {177, -59}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Logical.And and1 annotation(
      Placement(visible = true, transformation(origin = {-133, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Logical.Not not1 annotation(
      Placement(visible = true, transformation(origin = {-151, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Logical.Switch switchBlower0 annotation(
      Placement(visible = true, transformation(origin = {-113, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = -1) annotation(
      Placement(visible = true, transformation(origin = {-135.139, -61.8505}, extent = {{-5.01578, -5.01578}, {5.01578, 5.01578}}, rotation = 0)));
    Modelica.Blocks.Logical.Or or1 annotation(
      Placement(visible = true, transformation(origin = {225, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {42, 54}, {42, 74}, {52, 74}, {52, 84}, {58, 84}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(or1.y, ctrlDividerTank3.InControlDig) annotation(
      Line(points = {{230, -18}, {240, -18}, {240, -104}, {-214, -104}, {-214, -2}}, color = {255, 0, 255}));
    connect(ctrlDividerTank3.Out1, mixerTank3.In1) annotation(
      Line(points = {{-204, 6.5}, {-116, 6.5}, {-116, 4}}));
    connect(ctrlDividerTank3.Out2, ctrlDividerPreTank3_4.In) annotation(
      Line(points = {{-204, 2.5}, {-184, 2.5}, {-184, -22}}));
    connect(tank2.Out, ctrlDividerTank3.In) annotation(
      Line(points = {{4, 28}, {4, 10}, {-226, 10}, {-226, 4}, {-224, 4}}));
    connect(pretank3.T, Temperature.y) annotation(
      Line(points = {{-154, 0}, {-170, 0}, {-170, 44.5}, {-184, 44.5}, {-184, 44}}, color = {0, 0, 127}));
    connect(timerLessCmp.y, or1.u2) annotation(
      Line(points = {{214, -36}, {216, -36}, {216, -24}, {218, -24}, {218, -24}}, color = {255, 0, 255}));
    connect(timerGreaterCmp.y, or1.u1) annotation(
      Line(points = {{210, -4}, {214, -4}, {214, -20}, {218, -20}, {218, -18}}, color = {255, 0, 255}));
    connect(const_timers.y, timerGreaterCmp.u2) annotation(
      Line(points = {{185, -59}, {192, -59}, {192, -10}}, color = {0, 0, 127}));
    connect(timerGreater.y, timerGreaterCmp.u1) annotation(
      Line(points = {{189, -4}, {192, -4}}, color = {0, 0, 127}));
    connect(timerGreaterCmp.y, and1.u1) annotation(
      Line(points = {{211, -4}, {238, -4}, {238, -102}, {-212, -102}, {-212, -46}, {-139, -46}, {-139, -45}}, color = {255, 0, 255}));
    connect(const_timers.y, timerLessCmp.u2) annotation(
      Line(points = {{185, -59}, {198, -59}, {198, -42}, {196, -42}}, color = {0, 0, 127}));
    connect(timerLess.y, timerLessCmp.u1) annotation(
      Line(points = {{189, -36}, {196, -36}}, color = {0, 0, 127}));
    connect(timerLessCmp.y, ctrlDividerPreTank3_4.InControlDig) annotation(
      Line(points = {{215, -36}, {234, -36}, {234, -100}, {-174, -100}, {-174, -28}}, color = {255, 0, 255}));
    connect(not1.u, timerLessCmp.y) annotation(
      Line(points = {{-157, -53}, {-174, -53}, {-174, -100}, {234, -100}, {234, -36}, {215, -36}}, color = {255, 0, 255}));
    connect(lessEqual_1.y, timerLess.u) annotation(
      Line(points = {{166, -36}, {170, -36}}, color = {255, 0, 255}));
    connect(greaterEqual1.y, timerGreater.u) annotation(
      Line(points = {{166, -4}, {170, -4}}, color = {255, 0, 255}));
    connect(switchBlower0.u1, constant_blowers.y) annotation(
      Line(points = {{-118, -40}, {-124, -40}, {-124, -34}, {-102, -34}, {-102, -84}, {-118, -84}, {-118, -84}}, color = {0, 0, 127}));
    connect(and1.y, switchBlower0.u2) annotation(
      Line(points = {{-128, -44}, {-120, -44}, {-120, -44}, {-118, -44}}, color = {255, 0, 255}));
    connect(switchBlower0.y, blower0.u) annotation(
      Line(points = {{-108, -44}, {-104, -44}, {-104, -30}, {-130, -30}, {-130, -28}, {-130, -28}}, color = {0, 0, 127}));
    connect(const.y, switchBlower0.u3) annotation(
      Line(points = {{-130, -62}, {-120, -62}, {-120, -50}, {-120, -50}}, color = {0, 0, 127}));
    connect(not1.y, and1.u2) annotation(
      Line(points = {{-145, -53}, {-139, -53}, {-139, -49}}, color = {255, 0, 255}));
    connect(ctrlDividerPreTank3_4.Out2, mixerTank4.In2) annotation(
      Line(points = {{-164, -24}, {-160, -24}, {-160, -70}, {-100, -70}, {-100, -30}, {-62, -30}, {-62, -2}, {-60, -2}, {-60, -4}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{135, -82}, {146, -82}, {146, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-117, -84}, {-39.5018, -84}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-117, -84}, {-39.8577, -84}, {-39.8577, -18.1495}, {-66, -18.1495}, {-66, -19}}));
    connect(PI_Qair.y, greaterEqual1.u1) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -4}, {148, -4}}, color = {0, 0, 127}));
    connect(PI_Qair.y, lessEqual_1.u1) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -36}, {148, -36}}, color = {0, 0, 127}));
    connect(const_1.y, lessEqual_1.u2) annotation(
      Line(points = {{136, -52}, {148, -52}, {148, -42}, {148, -42}, {148, -42}}, color = {0, 0, 127}));
    connect(const1.y, greaterEqual1.u2) annotation(
      Line(points = {{136, -14}, {148, -14}, {148, -10}, {148, -10}}, color = {0, 0, 127}));
    connect(pretank3.AirIn, blower0.AirOut) annotation(
      Line);
    connect(ctrlDividerPreTank3_4.Out1, pretank3.In) annotation(
      Line(points = {{-164, -20}, {-154, -20}, {-154, -5}}));
    connect(pretank3.Out, mixerTank3.In2) annotation(
      Line(points = {{-128, -5}, {-116, -5}, {-116, 0}}));
    connect(mixerTank3.Out, tank3.In) annotation(
      Line(points = {{-96, 2.5}, {-88, 2.5}, {-88, 4}}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-184, 44}, {-53.7367, 44}, {-53.7367, 33.1866}, {-52.4822, 33.1866}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-184, 44}, {-20.9964, 44}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-184, 44}, {-90.0356, 44}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-184, 44}, {-89.6797, 44}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-184, 44}, {-89.6797, 44}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8}, {-88, 8}}));
    connect(tank3.Out, mixerTank4.In1) annotation(
      Line(points = {{-64, 4}, {-60, 4}, {-60, 0}, {-60, 0}}));
    connect(mixerTank4.Out, tank4.In) annotation(
      Line(points = {{-44, -2}, {-40, -2}, {-40, 4}, {-40, 4}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-75.8719, -8.20128}, {-76.0454, -8.20128}, {-76.0454, -13.3458}, {-76.195, -13.3458}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 28.0807}, {60.2777, 28.0807}}));
    connect(tank5.Out, divider.In) annotation(
      Line(points = {{13.9572, 2.90824}, {21.7082, 2.90824}, {21.7082, 3.23132}, {20.242, 3.23132}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(add1.u1, PI_NH4.y) annotation(
      Line(points = {{59, 90}, {48, 90}, {48, 88}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {30, 88}, {30, 88}, {30, 88}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 27.4967}, {-50.9246, 27.4967}}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-26.7805, 27.2452}, {-18.8612, 27.2452}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(tank4.Out, tank5.In) annotation(
      Line(points = {{-16.6544, 3.09607}, {-11.032, 3.09607}, {-11.032, 2.90823}, {-10.2799, 2.90823}}));
    annotation(
      Diagram(graphics = {Text(origin = {-161, 78}, extent = {{-57, 20}, {39, -20}}, textString = "D: Control of the aerobic volume")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_D_rain;




  model BSM1_A_storm
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {41.5231, -72.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {-50.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-54.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 76.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 3, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {178.268, 0.235701}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step OxygenSetpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {9.7082, 85.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {38.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 6, k = 45000000) annotation(
      Placement(visible = true, transformation(origin = {90.3274, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {-253.593, -155.389}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{-264, -156}, {-19.5, -156}, {-19.5, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -156}, {-242, -156}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 3}, {166, 3}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{52, -73}, {58.2169, -73}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{52, -73}, {58.2169, -73}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(OxygenSetpoint.y, feedback2.u1) annotation(
      Line(points = {{18, 86}, {32, 86}, {32, 84}, {34, 84}}, color = {0, 0, 127}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-38, 28}, {-18.8612, 28}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 28}, {-64, 28}}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-53.7367, 43.7284}, {-53.7367, 33}, {-64, 33}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{46, 85}, {52.9395, 85}, {52.9395, 85.1601}, {80, 85.1601}, {80, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{99, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 79}, {39, 79}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8.30088}, {-66.455, 8.30088}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-90.0356, 43.7284}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-20.9964, 43.7284}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
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
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
      Diagram(graphics = {Text(origin = {-189, 78}, extent = {{-57, 20}, {39, -20}}, textString = "A: DO Cascade Control")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_A_storm;




  model BSM1_B1_storm
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {35.5231, -70.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.divider2 divider annotation(
      Placement(visible = true, transformation(origin = {28.8256, 2.84698}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank5(Kla = 84, Salk(start = 4.13), Si(start = 30), Snd(start = 0.688), Snh(start = 1.73), Sno(start = 10.4), So(start = 0.491), Ss(start = 0.889), V = 1333, Xba(start = 150), Xbh(start = 2559), Xi(start = 1149), Xnd(start = 3.53), Xp(start = 452), Xs(start = 49.3)) annotation(
      Placement(visible = true, transformation(origin = {23.743, 3.41701}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank4(Si(start = 30), Ss(start = 0.995), Xi(start = 1149), Xs(start = 55.7), Xbh(start = 2559), Xba(start = 150), Xp(start = 451), So(start = 2.43), Sno(start = 9.3), Snh(start = 2.97), Snd(start = 0.767), Xnd(start = 3.88), Salk(start = 4.29), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-27.758, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank2(Si(start = 30), Ss(start = 1.46), Xi(start = 1149), Xs(start = 76.4), Xbh(start = 2553), Xba(start = 148), Xp(start = 450), So(start = 0.0000631), Sno(start = 3.66), Snh(start = 8.34), Snd(start = 0.882), Xnd(start = 5.03), Salk(start = 5.08)) annotation(
      Placement(visible = true, transformation(origin = {-7.82918, 27.4021}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank3(Si(start = 30), Ss(start = 1.15), Xi(start = 1149), Xs(start = 64.9), Xbh(start = 2557), Xba(start = 149), Xp(start = 450), So(start = 1.72), Sno(start = 6.54), Snh(start = 5.55), Snd(start = 0.829), Xnd(start = 4.39), Salk(start = 4.67), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-55.8719, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank1(Si(start = 30), Ss(start = 2.81), Xi(start = 1149), Xs(start = 82.1), Xbh(start = 2552), Xba(start = 148), Xp(start = 449), So(start = 0.0043), Sno(start = 5.37), Snh(start = 7.92), Snd(start = 1.22), Xnd(start = 5.28), Salk(start = 4.93)) annotation(
      Placement(visible = true, transformation(origin = {-38.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-56.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 76.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-71.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 3, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-134.829, 41.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 22.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-4.2918, 87.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {68.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {100.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-29.7461, -44.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 10000, k = -7) annotation(
      Placement(visible = true, transformation(origin = {46, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {27, 63}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0.5) annotation(
      Placement(visible = true, transformation(origin = {214.811, 58.036}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Noise.UniformNoise uniformNoise1(samplePeriod = 2, useAutomaticLocalSeed = true, useGlobalSeed = true, y_max = 2.5, y_min = 0.5) annotation(
      Placement(visible = true, transformation(origin = {218, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{46, -71}, {58.2169, -71}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{46, -71}, {58.2169, -71}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{5, 87}, {10, 87}, {10, 88}}, color = {0, 0, 127}));
    connect(tank5.Out, divider.In) annotation(
      Line(points = {{37, 3}, {21.7082, 3}, {21.7082, 3.23132}, {20.242, 3.23132}}));
    connect(tank4.Out, tank5.In) annotation(
      Line(points = {{-16.6544, 3.09607}, {-11.032, 3.09607}, {-11.032, 3}, {11, 3}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{31, 9}, {6.40569, 9}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-124, 42}, {-90.0356, 42}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 9}, {11, 9}}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{27, 54}, {15, 54}, {15, 26}, {16, 26}, {16, 9}, {31, 9}}, color = {0, 0, 255}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{24, -10}, {24, -18}, {3, -18}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -41}, {-18, -41}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-42, -48}, {-87.2289, -48}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -48}, {-19, -48}}, color = {0, 0, 127}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -7}, {-58, -7}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-48, -18.1495}, {-48, -19}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{109, 86}, {116, 86}, {116, 72}, {52, 72}, {52, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{76, 85}, {76.9395, 85}, {76.9395, 85.1601}, {90, 85.1601}, {90, 86}}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 79}, {69, 79}}));
    connect(PI_NH4.y, feedback2.u1) annotation(
      Line(points = {{55, 84}, {60.5, 84}, {60.5, 85}, {63, 85}}, color = {0, 0, 127}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(aDsensor_Q_air_tank5.Q_air, feedback3.u2) annotation(
      Line(points = {{12, -27}, {18, -27}, {18, -23}, {52, -23}, {52, 50}, {68, 50}, {68, 52}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {182, 58}, {182, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -18}, {30.5, -18}, {30.5, -27}, {22, -27}}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{36, 63}, {28, 63}, {28, 70}, {16, 70}, {16, 82}}, color = {0, 0, 127}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-124, 42}, {-53.7367, 42}, {-53.7367, 33.1866}, {-52.4822, 33.1866}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-124, 42}, {-20.9964, 42}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-124, 42}, {-89.6797, 42}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-124, 42}, {-89.6797, 42}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8.30088}, {-66.455, 8.30088}}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77}, {-85, 77}}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {28, 88}, {28, 84}, {36, 84}}, color = {0, 0, 127}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(WWSource.Out, mixer.In1) annotation(
      Line(points = {{-21.6085, 70.6762}, {-18.6762, 70.6762}, {-18.6762, 53.2456}, {-88.6121, 53.2456}, {-88.6121, 29.8932}, {-83.6174, 29.8932}, {-83.6174, 29.4271}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 27.4967}, {-50.9246, 27.4967}}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-26.7805, 27.2452}, {-18.8612, 27.2452}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(tank2.Out, tank3.In) annotation(
      Line(points = {{3.15167, 26.7411}, {11.032, 26.7411}, {11.032, 19.2171}, {-76.5125, 19.2171}, {-76.5125, 3.20285}, {-66.802, 3.20285}, {-66.802, 3.09607}}));
    connect(tank3.Out, tank4.In) annotation(
      Line(points = {{-44.7683, 3.09607}, {-38.79, 3.09607}, {-38.79, 3.09607}, {-38.6881, 3.09607}}));
    annotation(
      Diagram(graphics = {Text(origin = {-171, 80}, extent = {{-57, 20}, {39, -20}}, textString = "B1: Ammonium Based control: feedback")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_B1_storm;










  model BSM1_B2_storm
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {45.5231, -78.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 3, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2.5, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {30.4072, -61.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {57.8603, -44.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 24, k = -3.5) annotation(
      Placement(visible = true, transformation(origin = {40, 90}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {12, 56}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {57, -31.3087}, {57, -34}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{57, -55}, {57, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 61}, {-9, 61}}, color = {0, 0, 255}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{56, -79}, {58.2169, -79}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{56, -79}, {58.2169, -79}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -62}, {42, -62}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{20, -62}, {-19.5, -62}, {-19.5, -58}, {-47, -58}}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {12, 32}, {12, 48}}));
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{20, 56}, {40, 56}, {40, 76}, {52, 76}, {52, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {27, 88}, {27, 90}, {30, 90}}, color = {0, 0, 127}));
    connect(add1.u1, PI_NH4.y) annotation(
      Line(points = {{59, 90}, {49, 90}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
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
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
    annotation(
      Diagram(graphics = {Text(origin = {-173, 78}, extent = {{-57, 20}, {39, -20}}, textString = "B2: Ammonium Based control: feedforward"), Text(origin = {-169, 47}, extent = {{-37, 9}, {35, -3}}, textString = "FF del tank 2")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_B2_storm;










  model BSM1_C_storm
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {51.5231, -64.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 3, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2.5, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 24, k = -3.5) annotation(
      Placement(visible = true, transformation(origin = {40, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    BSM1.Modules.MPC mpc annotation(
      Placement(visible = true, transformation(origin = {164, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
  
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{62, -65}, {58.2169, -65}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{62, -65}, {58.2169, -65}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {36, 54}, {36, 72}, {56, 72}, {56, 82}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(blower3.u, mpc.y1) annotation(
      Line(points = {{32, -38}, {184, -38}, {184, -4}, {172, -4}, {172, -6}, {172, -6}}, color = {0, 0, 127}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(feedback3.y, mpc.u_PV) annotation(
      Line(points = {{76, 58}, {126, 58}, {126, -6}, {156, -6}, {156, -6}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, mpc.u_SP) annotation(
      Line(points = {{44, 24}, {44, 24}, {44, 10}, {116, 10}, {116, -10}, {156, -10}, {156, -10}}, color = {0, 0, 127}));
    connect(add1.u1, PI_NH4.y) annotation(
      Line(points = {{59, 90}, {48, 90}, {48, 88}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {30, 88}, {30, 88}, {30, 88}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
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
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
      Diagram(graphics = {Text(origin = {-173, 78}, extent = {{-57, 20}, {39, -20}}, textString = "C: Advanced controller"), Text(origin = {-185, 57}, extent = {{-37, 9}, {37, -9}}, textString = "FF de la entrada o del tank 2???")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_C_storm;










  model BSM1_D_storm
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
      //Félix Hernández del Olmo:
    //Variables para tener conseguir OC
    parameter Real avg_period = 1 / 96;
    parameter Real agent_start = 100;
    parameter Real gamma1 = 0.1;
    parameter Real gamma2 = 0.5;
    Real SP;
    Real PE;
    Real AE;
    Real ME;
    Real EF;
    //Real Energy;
    //Real EFm;
    //Real SPm;
    Real OC;
    Real EQ;
    //Real IQ;
    //*************************
    //Variables para suavizar OC:
    parameter Real plant_start = 1;
    parameter Real plant_period = 14 / 24 / 60;
    parameter Real smooth_days=1;
    final Real gamma = exp(log(0.01) / ceil(smooth_days / plant_period));
    final Real n = 1 / (1 - gamma);
    Real OCm;
    //****************************
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank5(Kla = 84, Salk(start = 4.13), Si(start = 30), Snd(start = 0.688), Snh(start = 1.73), Sno(start = 10.4), So(start = 0.491), Ss(start = 0.889), V = 1333, Xba(start = 150), Xbh(start = 2559), Xi(start = 1149), Xnd(start = 3.53), Xp(start = 452), Xs(start = 49.3)) annotation(
      Placement(visible = true, transformation(origin = {1.74327, 3.41715}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank4(Si(start = 30), Ss(start = 0.995), Xi(start = 1149), Xs(start = 55.7), Xbh(start = 2559), Xba(start = 150), Xp(start = 451), So(start = 2.43), Sno(start = 9.3), Snh(start = 2.97), Snd(start = 0.767), Xnd(start = 3.88), Salk(start = 4.29), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-27.758, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank2(Si(start = 30), Ss(start = 1.46), Xi(start = 1149), Xs(start = 76.4), Xbh(start = 2553), Xba(start = 148), Xp(start = 450), So(start = 0.0000631), Sno(start = 3.66), Snh(start = 8.34), Snd(start = 0.882), Xnd(start = 5.03), Salk(start = 5.08)) annotation(
      Placement(visible = true, transformation(origin = {-7.82918, 27.4021}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank3(Si(start = 30), Ss(start = 1.15), Xi(start = 1149), Xs(start = 64.9), Xbh(start = 2557), Xba(start = 149), Xp(start = 450), So(start = 1.72), Sno(start = 6.54), Snh(start = 5.55), Snd(start = 0.829), Xnd(start = 4.39), Salk(start = 4.67), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-75.8719, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank1(Si(start = 30), Ss(start = 2.81), Xi(start = 1149), Xs(start = 82.1), Xbh(start = 2552), Xba(start = 148), Xp(start = 449), So(start = 0.0043), Sno(start = 5.37), Snh(start = 7.92), Snd(start = 1.22), Xnd(start = 5.28), Salk(start = 4.93)) annotation(
      Placement(visible = true, transformation(origin = {-38.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-74.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-127.139, -83.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 3, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-194.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2.5) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {126.811, -81.9644}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 24, k = -3.5) annotation(
      Placement(visible = true, transformation(origin = {40, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    BSM1.Modules.ControlledDivider2Dig ctrlDividerTank3 annotation(
      Placement(visible = true, transformation(origin = {-214, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    WasteWater.ASM1.divider2 divider annotation(
      Placement(visible = true, transformation(origin = {28.8256, 2.84698}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.mixer2 mixerTank4 annotation(
      Placement(visible = true, transformation(origin = {-52, -2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.mixer2 mixerTank3 annotation(
      Placement(visible = true, transformation(origin = {-106, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM1.Modules.ControlledDivider2Dig ctrlDividerPreTank3_4 annotation(
      Placement(visible = true, transformation(origin = {-174, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM1.Modules.nitri pretank3(V = 1800) annotation(
      Placement(visible = true, transformation(origin = {-141, -5}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
    WasteWater.ASM1.blower blower0(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-140, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual greaterEqual1 annotation(
      Placement(visible = true, transformation(origin = {158, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.LessEqual lessEqual_1 annotation(
      Placement(visible = true, transformation(origin = {158, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.Timer timerGreater annotation(
      Placement(visible = true, transformation(origin = {180, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.Timer timerLess annotation(
      Placement(visible = true, transformation(origin = {180, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const_1(k = -1) annotation(
      Placement(visible = true, transformation(origin = {129, -53}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
      Placement(visible = true, transformation(origin = {129, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual timerLessCmp annotation(
      Placement(visible = true, transformation(origin = {206, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual timerGreaterCmp annotation(
      Placement(visible = true, transformation(origin = {202, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const_timers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {177, -59}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Logical.And and1 annotation(
      Placement(visible = true, transformation(origin = {-133, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Logical.Not not1 annotation(
      Placement(visible = true, transformation(origin = {-151, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Logical.Switch switchBlower0 annotation(
      Placement(visible = true, transformation(origin = {-113, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = -1) annotation(
      Placement(visible = true, transformation(origin = {-135.139, -61.8505}, extent = {{-5.01578, -5.01578}, {5.01578, 5.01578}}, rotation = 0)));
    Modelica.Blocks.Logical.Or or1 annotation(
      Placement(visible = true, transformation(origin = {225, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  equation
  // Felix Hernandez del Olmo
    //Añadiendo el hook que permite suavizar el OC
    when sample(plant_start, plant_period) then
      OCm=gamma*pre(OCm)+OC/n;
    end when;
    
  
      SP = (ADsensor_Waste.TSS + ADsensor_Effluent.TSS) / 1000;
      PE = 0.004 * abs(ADsensor_Recycle.Out.Q) + 0.008 * abs(ADsensor_Return.Out.Q) + 0.05 * abs(ADsensor_Waste.Out.Q);
      AE = tank3.AE + tank4.AE + tank5.AE;
      ME = tank1.ME + tank2.ME;
      EF = ADsensor_Effluent.EF_NH + ADsensor_Effluent.EF_TN;
      //Energy = gamma * pre(Energy) + (AE + PE + ME) / n;
      //EFm = gamma * pre(EFm) + EF / n;
      //SPm = gamma * pre(SPm) + SP / n;
      OC = gamma1 * (AE + PE + ME) + gamma2 * SP + EF / 10;
      EQ = ADsensor_Effluent.EQ;
    //IQ = ADsensor_Influent.IQ;
    
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {42, 54}, {42, 74}, {52, 74}, {52, 84}, {58, 84}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(or1.y, ctrlDividerTank3.InControlDig) annotation(
      Line(points = {{230, -18}, {240, -18}, {240, -104}, {-214, -104}, {-214, -2}}, color = {255, 0, 255}));
    connect(ctrlDividerTank3.Out1, mixerTank3.In1) annotation(
      Line(points = {{-204, 6.5}, {-116, 6.5}, {-116, 4}}));
    connect(ctrlDividerTank3.Out2, ctrlDividerPreTank3_4.In) annotation(
      Line(points = {{-204, 2.5}, {-184, 2.5}, {-184, -22}}));
    connect(tank2.Out, ctrlDividerTank3.In) annotation(
      Line(points = {{4, 28}, {4, 10}, {-226, 10}, {-226, 4}, {-224, 4}}));
    connect(pretank3.T, Temperature.y) annotation(
      Line(points = {{-154, 0}, {-170, 0}, {-170, 44.5}, {-184, 44.5}, {-184, 44}}, color = {0, 0, 127}));
    connect(timerLessCmp.y, or1.u2) annotation(
      Line(points = {{214, -36}, {216, -36}, {216, -24}, {218, -24}, {218, -24}}, color = {255, 0, 255}));
    connect(timerGreaterCmp.y, or1.u1) annotation(
      Line(points = {{210, -4}, {214, -4}, {214, -20}, {218, -20}, {218, -18}}, color = {255, 0, 255}));
    connect(const_timers.y, timerGreaterCmp.u2) annotation(
      Line(points = {{185, -59}, {192, -59}, {192, -10}}, color = {0, 0, 127}));
    connect(timerGreater.y, timerGreaterCmp.u1) annotation(
      Line(points = {{189, -4}, {192, -4}}, color = {0, 0, 127}));
    connect(timerGreaterCmp.y, and1.u1) annotation(
      Line(points = {{211, -4}, {238, -4}, {238, -102}, {-212, -102}, {-212, -46}, {-139, -46}, {-139, -45}}, color = {255, 0, 255}));
    connect(const_timers.y, timerLessCmp.u2) annotation(
      Line(points = {{185, -59}, {198, -59}, {198, -42}, {196, -42}}, color = {0, 0, 127}));
    connect(timerLess.y, timerLessCmp.u1) annotation(
      Line(points = {{189, -36}, {196, -36}}, color = {0, 0, 127}));
    connect(timerLessCmp.y, ctrlDividerPreTank3_4.InControlDig) annotation(
      Line(points = {{215, -36}, {234, -36}, {234, -100}, {-174, -100}, {-174, -28}}, color = {255, 0, 255}));
    connect(not1.u, timerLessCmp.y) annotation(
      Line(points = {{-157, -53}, {-174, -53}, {-174, -100}, {234, -100}, {234, -36}, {215, -36}}, color = {255, 0, 255}));
    connect(lessEqual_1.y, timerLess.u) annotation(
      Line(points = {{166, -36}, {170, -36}}, color = {255, 0, 255}));
    connect(greaterEqual1.y, timerGreater.u) annotation(
      Line(points = {{166, -4}, {170, -4}}, color = {255, 0, 255}));
    connect(switchBlower0.u1, constant_blowers.y) annotation(
      Line(points = {{-118, -40}, {-124, -40}, {-124, -34}, {-102, -34}, {-102, -84}, {-118, -84}, {-118, -84}}, color = {0, 0, 127}));
    connect(and1.y, switchBlower0.u2) annotation(
      Line(points = {{-128, -44}, {-120, -44}, {-120, -44}, {-118, -44}}, color = {255, 0, 255}));
    connect(switchBlower0.y, blower0.u) annotation(
      Line(points = {{-108, -44}, {-104, -44}, {-104, -30}, {-130, -30}, {-130, -28}, {-130, -28}}, color = {0, 0, 127}));
    connect(const.y, switchBlower0.u3) annotation(
      Line(points = {{-130, -62}, {-120, -62}, {-120, -50}, {-120, -50}}, color = {0, 0, 127}));
    connect(not1.y, and1.u2) annotation(
      Line(points = {{-145, -53}, {-139, -53}, {-139, -49}}, color = {255, 0, 255}));
    connect(ctrlDividerPreTank3_4.Out2, mixerTank4.In2) annotation(
      Line(points = {{-164, -24}, {-160, -24}, {-160, -70}, {-100, -70}, {-100, -30}, {-62, -30}, {-62, -2}, {-60, -2}, {-60, -4}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{135, -82}, {146, -82}, {146, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-117, -84}, {-39.5018, -84}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-117, -84}, {-39.8577, -84}, {-39.8577, -18.1495}, {-66, -18.1495}, {-66, -19}}));
    connect(PI_Qair.y, greaterEqual1.u1) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -4}, {148, -4}}, color = {0, 0, 127}));
    connect(PI_Qair.y, lessEqual_1.u1) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -36}, {148, -36}}, color = {0, 0, 127}));
    connect(const_1.y, lessEqual_1.u2) annotation(
      Line(points = {{136, -52}, {148, -52}, {148, -42}, {148, -42}, {148, -42}}, color = {0, 0, 127}));
    connect(const1.y, greaterEqual1.u2) annotation(
      Line(points = {{136, -14}, {148, -14}, {148, -10}, {148, -10}}, color = {0, 0, 127}));
    connect(pretank3.AirIn, blower0.AirOut) annotation(
      Line);
    connect(ctrlDividerPreTank3_4.Out1, pretank3.In) annotation(
      Line(points = {{-164, -20}, {-154, -20}, {-154, -5}}));
    connect(pretank3.Out, mixerTank3.In2) annotation(
      Line(points = {{-128, -5}, {-116, -5}, {-116, 0}}));
    connect(mixerTank3.Out, tank3.In) annotation(
      Line(points = {{-96, 2.5}, {-88, 2.5}, {-88, 4}}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-184, 44}, {-53.7367, 44}, {-53.7367, 33.1866}, {-52.4822, 33.1866}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-184, 44}, {-20.9964, 44}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-184, 44}, {-90.0356, 44}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-184, 44}, {-89.6797, 44}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-184, 44}, {-89.6797, 44}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8}, {-88, 8}}));
    connect(tank3.Out, mixerTank4.In1) annotation(
      Line(points = {{-64, 4}, {-60, 4}, {-60, 0}, {-60, 0}}));
    connect(mixerTank4.Out, tank4.In) annotation(
      Line(points = {{-44, -2}, {-40, -2}, {-40, 4}, {-40, 4}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-75.8719, -8.20128}, {-76.0454, -8.20128}, {-76.0454, -13.3458}, {-76.195, -13.3458}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 28.0807}, {60.2777, 28.0807}}));
    connect(tank5.Out, divider.In) annotation(
      Line(points = {{13.9572, 2.90824}, {21.7082, 2.90824}, {21.7082, 3.23132}, {20.242, 3.23132}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(add1.u1, PI_NH4.y) annotation(
      Line(points = {{59, 90}, {48, 90}, {48, 88}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {30, 88}, {30, 88}, {30, 88}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 27.4967}, {-50.9246, 27.4967}}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-26.7805, 27.2452}, {-18.8612, 27.2452}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(tank4.Out, tank5.In) annotation(
      Line(points = {{-16.6544, 3.09607}, {-11.032, 3.09607}, {-11.032, 2.90823}, {-10.2799, 2.90823}}));
    annotation(
      Diagram(graphics = {Text(origin = {-161, 78}, extent = {{-57, 20}, {39, -20}}, textString = "D: Control of the aerobic volume")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_D_storm;



  model BSM1_ClosedLoop_plus_sensor
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
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
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI1(k = 0.833, T = 0.042) annotation(
      Placement(visible = true, transformation(origin = {68.3274, 55.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    WasteWater.ASM1.sensor_NO sensor_no1 annotation(
      Placement(visible = true, transformation(origin = {-8.54093, 48.3986}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant NitrogenSetpoint annotation(
      Placement(visible = true, transformation(origin = {12.8114, 90.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
  equation
    connect(NitrogenSetpoint.y, feedback1.u1) annotation(
      Line(points = {{21.0075, 90.0356}, {38.0783, 90.0356}, {38.0783, 90.7473}, {38.9947, 90.7473}}));
    connect(sensor_no1.Sno, fixeddelay1.u) annotation(
      Line(points = {{-0.763161, 49.1333}, {1.06762, 49.1333}, {1.06762, 67.9715}, {2.19187, 67.9715}}));
    connect(tank2.MeasurePort, sensor_no1.In) annotation(
      Line(points = {{-3.03896, 33.0188}, {-3.55872, 33.0188}, {-3.55872, 38.79}, {-8.8968, 38.79}, {-8.8968, 42.6548}, {-8.81566, 42.6548}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(PI1.y, blower3.u) annotation(
      Line(points = {{77.3432, 55.516}, {87.9004, 55.516}, {87.9004, -23.7082}, {39.9644, -23.7082}, {39.9644, -37}, {31, -37}}));
    connect(PI2.y, RecyclePump.u) annotation(
      Line(points = {{76.8795, 91.1032}, {97.153, 91.1032}, {97.153, -93.9502}, {-34.1637, -93.9502}, {-34.1637, -44}, {-59, -44}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
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
    connect(feedback2.y, PI1.u) annotation(
      Line(points = {{53.6811, 46.6192}, {56.9395, 46.6192}, {56.9395, 55.1601}, {58.492, 55.1601}, {58.492, 55.516}}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 40.6584}, {46.9751, 40.6584}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
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
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
      Diagram(coordinateSystem(initialScale = 0.1)));
  end BSM1_ClosedLoop_plus_sensor;

  model BSM1_OpenLoop_A
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {-50.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-54.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 76.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 3, offset = -1, startTime = 200) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step OxygenSetpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {9.7082, 85.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {38.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.0075, k = 1000000) annotation(
      Placement(visible = true, transformation(origin = {90.3274, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {138, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 1) annotation(
      Placement(visible = true, transformation(origin = {26.811, 58.036}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
  equation
    connect(const.y, feedback3.u1) annotation(
      Line(points = {{36, 58}, {62, 58}, {62, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {128, 58}, {128, 58}, {128, 58}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{146, 58}, {182, 58}, {182, -34}, {32, -34}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(OxygenSetpoint.y, feedback2.u1) annotation(
      Line(points = {{18, 86}, {32, 86}, {32, 84}, {34, 84}}, color = {0, 0, 127}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-38, 28}, {-18.8612, 28}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 28}, {-64, 28}}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-53.7367, 43.7284}, {-53.7367, 33}, {-64, 33}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{46, 85}, {52.9395, 85}, {52.9395, 85.1601}, {80, 85.1601}, {80, 86}}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 79}, {39, 79}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8.30088}, {-66.455, 8.30088}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-89.6797, 43.7284}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-90.0356, 43.7284}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-95.9199, 43.7284}, {-20.9964, 43.7284}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
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
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
      Diagram(graphics = {Text(origin = {-189, 78}, extent = {{-57, 20}, {39, -20}}, textString = "A: DO Cascade Control")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_OpenLoop_A;

  model BSM1_OpenLoop_B1
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {-56.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 76.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-71.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 2, offset = -1, startTime = 200) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-134.829, 41.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 22.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {68.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45000000) annotation(
      Placement(visible = true, transformation(origin = {100.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-29.7461, -44.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 0.005) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 5, k = -0.5) annotation(
      Placement(visible = true, transformation(origin = {46, 84}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {27, 63}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 0.5) annotation(
      Placement(visible = true, transformation(origin = {214.811, 58.036}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Noise.UniformNoise uniformNoise1(samplePeriod = 2, useAutomaticLocalSeed = true, useGlobalSeed = true, y_max = 2.5, y_min = 0.5) annotation(
      Placement(visible = true, transformation(origin = {218, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = -2) annotation(
      Placement(visible = true, transformation(origin = {42.811, 98.036}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
  equation
    connect(const1.y, feedback2.u1) annotation(
      Line(points = {{52, 98}, {62, 98}, {62, 84}, {64, 84}}, color = {0, 0, 127}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -41}, {-18, -41}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-42, -48}, {-87.2289, -48}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -48}, {-19, -48}}, color = {0, 0, 127}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -7}, {-58, -7}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-48, -18.1495}, {-48, -19}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{109, 86}, {116, 86}, {116, 72}, {52, 72}, {52, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{76, 85}, {76.9395, 85}, {76.9395, 85.1601}, {90, 85.1601}, {90, 86}}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 79}, {69, 79}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(aDsensor_Q_air_tank5.Q_air, feedback3.u2) annotation(
      Line(points = {{12, -27}, {18, -27}, {18, -23}, {52, -23}, {52, 50}, {68, 50}, {68, 52}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {182, 58}, {182, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -18}, {30.5, -18}, {30.5, -27}, {22, -27}}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -18}, {3, -18}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{36, 63}, {28, 63}, {28, 70}, {16, 70}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{27, 54}, {15, 54}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-124, 42}, {-53.7367, 42}, {-53.7367, 33.1866}, {-52.4822, 33.1866}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-124, 42}, {-20.9964, 42}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-124, 42}, {-90.0356, 42}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-124, 42}, {-89.6797, 42}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-124, 42}, {-89.6797, 42}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8.30088}, {-66.455, 8.30088}}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-58, 77}, {-44.9477, 77}, {-44.9477, 77.0035}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77}, {-85, 77}}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {28, 88}, {28, 84}, {36, 84}}, color = {0, 0, 127}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(WWSource.Out, mixer.In1) annotation(
      Line(points = {{-21.6085, 70.6762}, {-18.6762, 70.6762}, {-18.6762, 53.2456}, {-88.6121, 53.2456}, {-88.6121, 29.8932}, {-83.6174, 29.8932}, {-83.6174, 29.4271}}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
    annotation(
      Diagram(graphics = {Text(origin = {-171, 80}, extent = {{-57, 20}, {39, -20}}, textString = "B1: Ammonium Based control: feedback")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_OpenLoop_B1;

  model BSM1_OpenLoop_B2
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 0, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 0, offset = -1, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 7, k = -3) annotation(
      Placement(visible = true, transformation(origin = {40, 90}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 2) annotation(
      Placement(visible = true, transformation(origin = {46.811, 102.036}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
  equation
    connect(const.y, add1.u1) annotation(
      Line(points = {{56, 102}, {58, 102}, {58, 90}, {58, 90}}, color = {0, 0, 127}));
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {40, 54}, {40, 76}, {52, 76}, {52, 82}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {27, 88}, {27, 90}, {30, 90}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
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
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
    annotation(
      Diagram(graphics = {Text(origin = {-173, 78}, extent = {{-57, 20}, {39, -20}}, textString = "B2: Ammonium Based control: feedforward"), Text(origin = {-169, 47}, extent = {{-37, 9}, {35, -3}}, textString = "FF del tank 2")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_OpenLoop_B2;

  model BSM1_OpenLoop_C
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
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
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-93.1388, -91.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 0, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-106.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {148.811, 92.0356}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 9, k = -1.25) annotation(
      Placement(visible = true, transformation(origin = {40, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    BSM1.Modules.MPC mpc annotation(
      Placement(visible = true, transformation(origin = {164, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 2) annotation(
      Placement(visible = true, transformation(origin = {46.811, 104.036}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
  equation
    connect(const.y, add1.u1) annotation(
      Line(points = {{56, 104}, {58, 104}, {58, 90}, {58, 90}, {58, 90}}, color = {0, 0, 127}));
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {36, 54}, {36, 72}, {56, 72}, {56, 82}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(blower3.u, mpc.y1) annotation(
      Line(points = {{32, -38}, {184, -38}, {184, -4}, {172, -4}, {172, -6}, {172, -6}}, color = {0, 0, 127}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-83, -92}, {-39.8577, -92}, {-39.8577, -18.1495}, {-46.7453, -18.1495}, {-46.7453, -18.7429}}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-83, -92}, {-39.5018, -92}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(feedback3.y, mpc.u_PV) annotation(
      Line(points = {{76, 58}, {126, 58}, {126, -6}, {156, -6}, {156, -6}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, mpc.u_SP) annotation(
      Line(points = {{44, 24}, {44, 24}, {44, 10}, {116, 10}, {116, -10}, {156, -10}, {156, -10}}, color = {0, 0, 127}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {30, 88}, {30, 88}, {30, 88}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{157, 92}, {192, 92}, {192, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-55.6984, -5.05814}, {-55.8719, -5.05814}, {-55.8719, -10.2027}, {-56.0215, -10.2027}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
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
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
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
      Diagram(graphics = {Text(origin = {-173, 78}, extent = {{-57, 20}, {39, -20}}, textString = "C: Advanced controller"), Text(origin = {-185, 57}, extent = {{-37, 9}, {37, -9}}, textString = "FF de la entrada o del tank 2???")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_OpenLoop_C;

  model BSM1_OpenLoop_D
    extends Config;
    constant String INF_dir = BSM1_Directory + "INF/";
    Modelica.Blocks.Sources.Constant constant_pumps(k = 1) annotation(
      Placement(visible = true, transformation(origin = {43.5231, -74.5979}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.SludgeSink WasteSludge annotation(
      Placement(visible = true, transformation(origin = {79.7179, -64.7069}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank5(Kla = 84, Salk(start = 4.13), Si(start = 30), Snd(start = 0.688), Snh(start = 1.73), Sno(start = 10.4), So(start = 0.491), Ss(start = 0.889), V = 1333, Xba(start = 150), Xbh(start = 2559), Xi(start = 1149), Xnd(start = 3.53), Xp(start = 452), Xs(start = 49.3)) annotation(
      Placement(visible = true, transformation(origin = {1.74327, 3.41715}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    BSM1.Modules.nitri tank4(Si(start = 30), Ss(start = 0.995), Xi(start = 1149), Xs(start = 55.7), Xbh(start = 2559), Xba(start = 150), Xp(start = 451), So(start = 2.43), Sno(start = 9.3), Snh(start = 2.97), Snd(start = 0.767), Xnd(start = 3.88), Salk(start = 4.29), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-27.758, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank2(Si(start = 30), Ss(start = 1.46), Xi(start = 1149), Xs(start = 76.4), Xbh(start = 2553), Xba(start = 148), Xp(start = 450), So(start = 0.0000631), Sno(start = 3.66), Snh(start = 8.34), Snd(start = 0.882), Xnd(start = 5.03), Salk(start = 5.08)) annotation(
      Placement(visible = true, transformation(origin = {-7.82918, 27.4021}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.nitri tank3(Si(start = 30), Ss(start = 1.15), Xi(start = 1149), Xs(start = 64.9), Xbh(start = 2557), Xba(start = 149), Xp(start = 450), So(start = 1.72), Sno(start = 6.54), Snh(start = 5.55), Snd(start = 0.829), Xnd(start = 4.39), Salk(start = 4.67), V = 1333, To = 0.0) annotation(
      Placement(visible = true, transformation(origin = {-75.8719, 3.55872}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.deni tank1(Si(start = 30), Ss(start = 2.81), Xi(start = 1149), Xs(start = 82.1), Xbh(start = 2552), Xba(start = 148), Xp(start = 449), So(start = 0.0043), Sno(start = 5.37), Snh(start = 7.92), Snd(start = 1.22), Xnd(start = 5.28), Salk(start = 4.93)) annotation(
      Placement(visible = true, transformation(origin = {-38.8594, 27.9724}, extent = {{-13.2, -13.2}, {13.2, 13.2}}, rotation = 0)));
    WasteWater.ASM1.blower blower1(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-74.8043, -16.3701}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    WasteWater.ASM1.blower blower2(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-26.3345, -16.3701}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.blower blower3(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {23.2029, -34.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_blowers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {-127.139, -83.8505}, extent = {{-9.01578, -9.01578}, {9.01578, 9.01578}}, rotation = 0)));
    BSM1.Modules.WWSource WWSource annotation(
      Placement(visible = true, transformation(origin = {-29.8932, 80.8683}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    BSM1.Modules.WWSignal WWSignal(dir = INF_dir) annotation(
      Placement(visible = true, transformation(origin = {-69.0391, 77.2242}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 0, offset = -1, startTime = 130) annotation(
      Placement(visible = true, transformation(origin = {-105.338, 77.5801}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Temperature(k = 15) annotation(
      Placement(visible = true, transformation(origin = {-194.829, 43.7284}, extent = {{-9.91736, -9.91736}, {9.91736, 9.91736}}, rotation = 0)));
    WasteWater.ASM1.EffluentSink Effluent annotation(
      Placement(visible = true, transformation(origin = {148.268, 28.2357}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.SecClarModTakacs Settler(S1.X.start = 6394, S1.Si.start = 30, S1.Ss.start = 0.889, S1.So.start = 0.491, S1.Sno.start = 10.4, S1.Snh.start = 1.73, S1.Snd.start = 0.688, S1.Salk.start = 4.13, S2.X.start = 356, S2.Si.start = 30, S2.Ss.start = 0.889, S2.So.start = 0.491, S2.Sno.start = 10.4, S2.Snh.start = 1.73, S2.Snd.start = 0.688, S2.Salk.start = 4.13, S3.X.start = 356, S3.Si.start = 30, S3.Ss.start = 0.889, S3.So.start = 0.491, S3.Sno.start = 10.4, S3.Snh.start = 1.73, S3.Snd.start = 0.688, S3.Salk.start = 4.13, S4.X.start = 356, S4.Si.start = 30, S4.Ss.start = 0.889, S4.So.start = 0.491, S4.Sno.start = 10.4, S4.Snh.start = 1.73, S4.Snd.start = 0.688, S4.Salk.start = 4.13, S5.X.start = 356, S5.Si.start = 30, S5.Ss.start = 0.889, S5.So.start = 0.491, S5.Sno.start = 10.4, S5.Snh.start = 1.73, S5.Snd.start = 0.688, S5.Salk.start = 4.13, S6.X.start = 356, S6.Si.start = 30, S6.Ss.start = 0.889, S6.So.start = 0.491, S6.Sno.start = 10.4, S6.Snh.start = 1.73, S6.Snd.start = 0.688, S6.Salk.start = 4.13, S7.X.start = 69, S7.Si.start = 30, S7.Ss.start = 0.889, S7.So.start = 0.491, S7.Sno.start = 10.4, S7.Snh.start = 1.73, S7.Snd.start = 0.688, S7.Salk.start = 4.13, S8.X.start = 29.5, S8.Si.start = 30, S8.Ss.start = 0.889, S8.So.start = 0.491, S8.Sno.start = 10.4, S8.Snh.start = 1.73, S8.Snd.start = 0.688, S8.Salk.start = 4.13, S9.X.start = 18.1, S9.Si.start = 30, S9.Ss.start = 0.889, S9.So.start = 0.491, S9.Sno.start = 10.4, S9.Snh.start = 1.73, S9.Snd.start = 0.688, S9.Salk.start = 4.13, S10.X.start = 12.5, S10.Si.start = 30, S10.Ss.start = 0.889, S10.So.start = 0.491, S10.Sno.start = 10.4, S10.Snh.start = 1.73, S10.Snd.start = 0.688, S10.Salk.start = 4.13) annotation(
      Placement(visible = true, transformation(origin = {66.6767, 26.1501}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    Modelica.Blocks.Sources.Step NH4Setpoint(height = 2) annotation(
      Placement(visible = true, transformation(origin = {-6.2918, 89.1958}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {80.9751, 84.6192}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    WasteWater.ASM1.sensor_O2 sensor_o2_tank5 annotation(
      Placement(visible = true, transformation(origin = {35.2313, 23.1317}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_O2(T = 0.3, k = 45) annotation(
      Placement(visible = true, transformation(origin = {104.327, 85.516}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
    WasteWater.ASM1.mixer3 mixer annotation(
      Placement(visible = true, transformation(origin = {-73.903, 26.8318}, extent = {{-14.52, -14.52}, {14.52, 14.52}}, rotation = 0)));
    WasteWater.ASM1.pump RecyclePump(Q_min = 0.0, Q_max = 55338) annotation(
      Placement(visible = true, transformation(origin = {-69.7461, -40.5288}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    WasteWater.ASM1.pump ReturnPump(Q_max = 18446) annotation(
      Placement(visible = true, transformation(origin = {-62.6282, -63.1746}, extent = {{15.972, 15.972}, {-15.972, -15.972}}, rotation = 0)));
    WasteWater.ASM1.pump WastePump(Q_max = 385) annotation(
      Placement(visible = true, transformation(origin = {72.2891, -9.15663}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Return annotation(
      Placement(visible = true, transformation(origin = {18.4072, -57.3887}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Recycle annotation(
      Placement(visible = true, transformation(origin = {-8.71927, -43.8486}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
    BSM1.Modules.ADsensor_Q ADsensor_Effluent annotation(
      Placement(visible = true, transformation(origin = {104.8, 29.5691}, extent = {{-12, -12}, {12, 12}}, rotation = 360)));
    BSM1.Modules.ADsensor_Q ADsensor_Waste annotation(
      Placement(visible = true, transformation(origin = {59.8603, -42.6901}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
    BSM1.Modules.ADsensor_Q_air aDsensor_Q_air_tank5 annotation(
      Placement(visible = true, transformation(origin = {12, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant_recycle_p(k = 1) annotation(
      Placement(visible = true, transformation(origin = {126.811, -81.9644}, extent = {{-7.45106, -7.45106}, {7.45106, 7.45106}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {68, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_Qair(T = 0.01, k = 10) annotation(
      Placement(visible = true, transformation(origin = {92, 58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Continuous.PI PI_NH4(T = 15, k = -5.5) annotation(
      Placement(visible = true, transformation(origin = {40, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {16, 88}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank2 annotation(
      Placement(visible = true, transformation(origin = {8, 54}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.sensor_NH sensor_NH_tank5 annotation(
      Placement(visible = true, transformation(origin = {21, 39}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BSM1.Modules.ADsensor_NH aDsensor_NH annotation(
      Placement(visible = true, transformation(origin = {-18, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {66, 86}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    BSM1.Modules.ControlledDivider2Dig ctrlDividerTank3 annotation(
      Placement(visible = true, transformation(origin = {-214, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    WasteWater.ASM1.divider2 divider annotation(
      Placement(visible = true, transformation(origin = {28.8256, 2.84698}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    WasteWater.ASM1.mixer2 mixerTank4 annotation(
      Placement(visible = true, transformation(origin = {-52, -2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    WasteWater.ASM1.mixer2 mixerTank3 annotation(
      Placement(visible = true, transformation(origin = {-106, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM1.Modules.ControlledDivider2Dig ctrlDividerPreTank3_4 annotation(
      Placement(visible = true, transformation(origin = {-174, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BSM1.Modules.nitri pretank3(V = 1800) annotation(
      Placement(visible = true, transformation(origin = {-141, -5}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
    WasteWater.ASM1.blower blower0(Q_max = 34574.2654508612) annotation(
      Placement(visible = true, transformation(origin = {-140, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual greaterEqual1 annotation(
      Placement(visible = true, transformation(origin = {158, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.LessEqual lessEqual_1 annotation(
      Placement(visible = true, transformation(origin = {158, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.Timer timerGreater annotation(
      Placement(visible = true, transformation(origin = {180, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.Timer timerLess annotation(
      Placement(visible = true, transformation(origin = {180, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const_1(k = -1) annotation(
      Placement(visible = true, transformation(origin = {129, -53}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
      Placement(visible = true, transformation(origin = {129, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual timerLessCmp annotation(
      Placement(visible = true, transformation(origin = {206, -36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Logical.GreaterEqual timerGreaterCmp annotation(
      Placement(visible = true, transformation(origin = {202, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const_timers(k = 1) annotation(
      Placement(visible = true, transformation(origin = {177, -59}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    Modelica.Blocks.Logical.And and1 annotation(
      Placement(visible = true, transformation(origin = {-133, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Logical.Not not1 annotation(
      Placement(visible = true, transformation(origin = {-151, -53}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Logical.Switch switchBlower0 annotation(
      Placement(visible = true, transformation(origin = {-113, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = -1) annotation(
      Placement(visible = true, transformation(origin = {-135.139, -61.8505}, extent = {{-5.01578, -5.01578}, {5.01578, 5.01578}}, rotation = 0)));
    Modelica.Blocks.Logical.Or or1 annotation(
      Placement(visible = true, transformation(origin = {225, -19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2 annotation(
      Placement(visible = true, transformation(origin = {43, 107}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  equation
    connect(const2.y, add1.u1) annotation(
      Line(points = {{51, 107}, {58, 107}, {58, 90}}, color = {0, 0, 127}));
    connect(sensor_NH_tank2.Snh, add1.u2) annotation(
      Line(points = {{16, 54}, {42, 54}, {42, 74}, {52, 74}, {52, 84}, {58, 84}, {58, 82}, {58, 82}}, color = {0, 0, 127}));
    connect(or1.y, ctrlDividerTank3.InControlDig) annotation(
      Line(points = {{230, -18}, {240, -18}, {240, -104}, {-214, -104}, {-214, -2}}, color = {255, 0, 255}));
    connect(ctrlDividerTank3.Out1, mixerTank3.In1) annotation(
      Line(points = {{-204, 6.5}, {-116, 6.5}, {-116, 4}}));
    connect(ctrlDividerTank3.Out2, ctrlDividerPreTank3_4.In) annotation(
      Line(points = {{-204, 2.5}, {-184, 2.5}, {-184, -22}}));
    connect(tank2.Out, ctrlDividerTank3.In) annotation(
      Line(points = {{4, 28}, {4, 10}, {-226, 10}, {-226, 4}, {-224, 4}}));
    connect(pretank3.T, Temperature.y) annotation(
      Line(points = {{-154, 0}, {-170, 0}, {-170, 44.5}, {-184, 44.5}, {-184, 44}}, color = {0, 0, 127}));
    connect(timerLessCmp.y, or1.u2) annotation(
      Line(points = {{214, -36}, {216, -36}, {216, -24}, {218, -24}, {218, -24}}, color = {255, 0, 255}));
    connect(timerGreaterCmp.y, or1.u1) annotation(
      Line(points = {{210, -4}, {214, -4}, {214, -20}, {218, -20}, {218, -18}}, color = {255, 0, 255}));
    connect(const_timers.y, timerGreaterCmp.u2) annotation(
      Line(points = {{185, -59}, {192, -59}, {192, -10}}, color = {0, 0, 127}));
    connect(timerGreater.y, timerGreaterCmp.u1) annotation(
      Line(points = {{189, -4}, {192, -4}}, color = {0, 0, 127}));
    connect(timerGreaterCmp.y, and1.u1) annotation(
      Line(points = {{211, -4}, {238, -4}, {238, -102}, {-212, -102}, {-212, -46}, {-139, -46}, {-139, -45}}, color = {255, 0, 255}));
    connect(const_timers.y, timerLessCmp.u2) annotation(
      Line(points = {{185, -59}, {198, -59}, {198, -42}, {196, -42}}, color = {0, 0, 127}));
    connect(timerLess.y, timerLessCmp.u1) annotation(
      Line(points = {{189, -36}, {196, -36}}, color = {0, 0, 127}));
    connect(timerLessCmp.y, ctrlDividerPreTank3_4.InControlDig) annotation(
      Line(points = {{215, -36}, {234, -36}, {234, -100}, {-174, -100}, {-174, -28}}, color = {255, 0, 255}));
    connect(not1.u, timerLessCmp.y) annotation(
      Line(points = {{-157, -53}, {-174, -53}, {-174, -100}, {234, -100}, {234, -36}, {215, -36}}, color = {255, 0, 255}));
    connect(lessEqual_1.y, timerLess.u) annotation(
      Line(points = {{166, -36}, {170, -36}}, color = {255, 0, 255}));
    connect(greaterEqual1.y, timerGreater.u) annotation(
      Line(points = {{166, -4}, {170, -4}}, color = {255, 0, 255}));
    connect(switchBlower0.u1, constant_blowers.y) annotation(
      Line(points = {{-118, -40}, {-124, -40}, {-124, -34}, {-102, -34}, {-102, -84}, {-118, -84}, {-118, -84}}, color = {0, 0, 127}));
    connect(and1.y, switchBlower0.u2) annotation(
      Line(points = {{-128, -44}, {-120, -44}, {-120, -44}, {-118, -44}}, color = {255, 0, 255}));
    connect(switchBlower0.y, blower0.u) annotation(
      Line(points = {{-108, -44}, {-104, -44}, {-104, -30}, {-130, -30}, {-130, -28}, {-130, -28}}, color = {0, 0, 127}));
    connect(const.y, switchBlower0.u3) annotation(
      Line(points = {{-130, -62}, {-120, -62}, {-120, -50}, {-120, -50}}, color = {0, 0, 127}));
    connect(not1.y, and1.u2) annotation(
      Line(points = {{-145, -53}, {-139, -53}, {-139, -49}}, color = {255, 0, 255}));
    connect(ctrlDividerPreTank3_4.Out2, mixerTank4.In2) annotation(
      Line(points = {{-164, -24}, {-160, -24}, {-160, -70}, {-100, -70}, {-100, -30}, {-62, -30}, {-62, -2}, {-60, -2}, {-60, -4}}));
    connect(constant_recycle_p.y, RecyclePump.u) annotation(
      Line(points = {{135, -82}, {146, -82}, {146, -94}, {-34, -94}, {-34, -44}, {-60, -44}}, color = {0, 0, 127}));
    connect(constant_blowers.y, blower2.u) annotation(
      Line(points = {{-117, -84}, {-39.5018, -84}, {-39.5018, -24.5552}, {-15.6584, -24.5552}, {-15.6584, -18.1495}, {-19.0082, -18.1495}, {-19.0082, -18.5272}}));
    connect(constant_blowers.y, blower1.u) annotation(
      Line(points = {{-117, -84}, {-39.8577, -84}, {-39.8577, -18.1495}, {-66, -18.1495}, {-66, -19}}));
    connect(PI_Qair.y, greaterEqual1.u1) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -4}, {148, -4}}, color = {0, 0, 127}));
    connect(PI_Qair.y, lessEqual_1.u1) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -36}, {148, -36}}, color = {0, 0, 127}));
    connect(const_1.y, lessEqual_1.u2) annotation(
      Line(points = {{136, -52}, {148, -52}, {148, -42}, {148, -42}, {148, -42}}, color = {0, 0, 127}));
    connect(const1.y, greaterEqual1.u2) annotation(
      Line(points = {{136, -14}, {148, -14}, {148, -10}, {148, -10}}, color = {0, 0, 127}));
    connect(pretank3.AirIn, blower0.AirOut) annotation(
      Line);
    connect(ctrlDividerPreTank3_4.Out1, pretank3.In) annotation(
      Line(points = {{-164, -20}, {-154, -20}, {-154, -5}}));
    connect(pretank3.Out, mixerTank3.In2) annotation(
      Line(points = {{-128, -5}, {-116, -5}, {-116, 0}}));
    connect(mixerTank3.Out, tank3.In) annotation(
      Line(points = {{-96, 2.5}, {-88, 2.5}, {-88, 4}}));
    connect(Temperature.y, tank1.T) annotation(
      Line(points = {{-184, 44}, {-53.7367, 44}, {-53.7367, 33.1866}, {-52.4822, 33.1866}}));
    connect(Temperature.y, tank2.T) annotation(
      Line(points = {{-184, 44}, {-20.9964, 44}, {-20.9964, 32.1423}, {-20.2135, 32.1423}}));
    connect(Temperature.y, tank5.T) annotation(
      Line(points = {{-184, 44}, {-90.0356, 44}, {-90.0356, 16.0142}, {-10.3203, 16.0142}, {-10.3203, 8.63353}, {-9.89818, 8.63353}}));
    connect(Temperature.y, tank4.T) annotation(
      Line(points = {{-184, 44}, {-89.6797, 44}, {-89.6797, 16.0143}, {-39.1459, 16.0143}, {-39.1459, 8.54093}, {-38.3411, 8.54093}, {-38.3411, 8.30088}}));
    connect(Temperature.y, tank3.T) annotation(
      Line(points = {{-184, 44}, {-89.6797, 44}, {-89.6797, 16.0143}, {-66.9039, 16.0143}, {-66.9039, 8}, {-88, 8}}));
    connect(tank3.Out, mixerTank4.In1) annotation(
      Line(points = {{-64, 4}, {-60, 4}, {-60, 0}, {-60, 0}}));
    connect(mixerTank4.Out, tank4.In) annotation(
      Line(points = {{-44, -2}, {-40, -2}, {-40, 4}, {-40, 4}}));
    connect(tank3.AirIn, blower1.AirOut) annotation(
      Line(points = {{-75.8719, -8.20128}, {-76.0454, -8.20128}, {-76.0454, -13.3458}, {-76.195, -13.3458}}));
    connect(RecyclePump.Out, mixer.In2) annotation(
      Line(points = {{-82, -44}, {-87.2289, -44}, {-87.2289, 23.6145}, {-83.7208, 23.6145}, {-83.7208, 23.7432}}));
    connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
      Line(points = {{-19, -45}, {-46.2651, -45}, {-46.2651, -37}, {-58, -37}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 28.0807}, {60.2777, 28.0807}}));
    connect(tank5.Out, divider.In) annotation(
      Line(points = {{13.9572, 2.90824}, {21.7082, 2.90824}, {21.7082, 3.23132}, {20.242, 3.23132}}));
    connect(divider.Out2, Settler.Feed) annotation(
      Line(points = {{39.0747, 4.51246}, {45.5516, 4.51246}, {45.5516, 27.7249}, {57.0748, 27.7249}}));
    connect(ADsensor_Recycle.In, divider.Out1) annotation(
      Line(points = {{2, -45}, {33.452, -45}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
    connect(feedback2.u1, add1.y) annotation(
      Line(points = {{76, 84}, {74, 84}, {74, 86}, {73, 86}}, color = {0, 0, 127}));
    connect(sensor_o2_tank5.So, feedback2.u2) annotation(
      Line(points = {{43.0486, 23.7874}, {44.484, 23.7874}, {44.484, 36.2989}, {46.6192, 36.2989}, {46.6192, 71}, {76.7024, 71}, {76.7024, 79}, {81, 79}}));
    connect(feedback2.y, PI_O2.u) annotation(
      Line(points = {{88, 85}, {90.9395, 85}, {90.9395, 85.1601}, {94, 85.1601}, {94, 86}}));
    connect(PI_O2.y, feedback3.u1) annotation(
      Line(points = {{113, 86}, {118, 86}, {118, 70}, {56, 70}, {56, 58}, {62, 58}}, color = {0, 0, 127}));
    connect(mixer.In1, aDsensor_NH.Out) annotation(
      Line(points = {{-88, 32}, {-92, 32}, {-92, 46}, {-8, 46}, {-8, 58}, {-10, 58}}, color = {0, 0, 255}));
    connect(aDsensor_NH.In, WWSource.Out) annotation(
      Line(points = {{-27, 59}, {-32.75, 59}, {-32.75, 61}, {-32.5, 61}, {-32.5, 67}, {-30, 67}, {-30, 67.5}, {-18, 67.5}, {-18, 73}}, color = {0, 0, 255}));
    connect(WWSignal.y[14], WWSource.u[14]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[13], WWSource.u[13]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[12], WWSource.u[12]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[11], WWSource.u[11]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[10], WWSource.u[10]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[9], WWSource.u[9]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[8], WWSource.u[8]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[7], WWSource.u[7]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[6], WWSource.u[6]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[5], WWSource.u[5]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[4], WWSource.u[4]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[3], WWSource.u[3]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[2], WWSource.u[2]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(WWSignal.y[1], WWSource.u[1]) annotation(
      Line(points = {{-55.8391, 77.2242}, {-44, 77.2242}, {-44, 81}}));
    connect(sensor_NH_tank5.Snh, feedback1.u2) annotation(
      Line(points = {{30, 40}, {28, 40}, {28, 70}, {16, 70}, {16, 82}, {16, 82}}, color = {0, 0, 127}));
    connect(sensor_NH_tank5.In, tank5.MeasurePort) annotation(
      Line(points = {{22, 30}, {15, 30}, {15, 26}, {16, 26}, {16, 10}, {10, 10}}, color = {0, 0, 255}));
    connect(tank2.MeasurePort, sensor_NH_tank2.In) annotation(
      Line(points = {{-2, 32}, {8, 32}, {8, 46}, {8, 46}}));
    connect(NH4Setpoint.y, feedback1.u1) annotation(
      Line(points = {{2, 90}, {10, 90}, {10, 88}, {10, 88}}, color = {0, 0, 127}));
    connect(feedback1.y, PI_NH4.u) annotation(
      Line(points = {{24, 88}, {30, 88}, {30, 88}, {30, 88}}, color = {0, 0, 127}));
    connect(PI_Qair.y, blower3.u) annotation(
      Line(points = {{100, 58}, {118, 58}, {118, -38}, {32, -38}, {32, -38}, {32, -38}}, color = {0, 0, 127}));
    connect(feedback3.y, PI_Qair.u) annotation(
      Line(points = {{76, 58}, {82, 58}, {82, 58}, {82, 58}}, color = {0, 0, 127}));
    connect(feedback3.u2, aDsensor_Q_air_tank5.Q_air) annotation(
      Line(points = {{68, 52}, {50, 52}, {50, -26}, {16, -26}, {16, -28}, {12, -28}, {12, -30}}, color = {0, 0, 127}));
    connect(constant_pumps.y, WastePump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {93.494, -89.1566}, {93.494, -11.6782}, {82.5306, -11.6782}}));
    connect(constant_pumps.y, ReturnPump.u) annotation(
      Line(points = {{54, -75}, {58.2169, -75}, {58.2169, -89.1566}, {-38.1983, -89.1566}, {-38.1983, -67}, {-48, -67}}));
    connect(tank5.AirIn, aDsensor_Q_air_tank5.Out) annotation(
      Line(points = {{2, -9}, {2, -20}, {3, -20}}));
    connect(aDsensor_Q_air_tank5.In, blower3.AirOut) annotation(
      Line(points = {{21, -20}, {30.5, -20}, {30.5, -27}, {22, -27}}));
    connect(ReturnPump.Out, mixer.In3) annotation(
      Line(points = {{-79, -68}, {-94.4578, -68}, {-94.4578, 26.988}, {-83.5658, 26.988}, {-83.5658, 26.7402}}));
    connect(ADsensor_Return.Out, ReturnPump.In) annotation(
      Line(points = {{8, -58}, {-47, -58}}));
    connect(Settler.Return, ADsensor_Return.In) annotation(
      Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -58}, {30, -58}}));
    connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
      Line(points = {{59, -53}, {59, -64.5783}, {67, -64.5783}, {67, -66}}));
    connect(WastePump.Out, ADsensor_Waste.In) annotation(
      Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.9398, -31.3087}, {59, -31.3087}, {59, -32}}));
    connect(ADsensor_Effluent.Out, Effluent.In) annotation(
      Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
    connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
      Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
    connect(Settler.Waste, WastePump.In) annotation(
      Line(points = {{71.8933, 16.6216}, {80.4819, 16.6216}, {80.6142, -7.45555}, {80.6142, -7.45555}}));
    connect(tank5.MeasurePort, sensor_o2_tank5.In) annotation(
      Line(points = {{6.95965, 9.65136}, {6.40569, 9.65136}, {6.40569, 14.5907}, {34.8754, 14.5907}, {34.8754, 17.3879}, {34.9171, 17.3879}}));
    connect(step1.y, WWSignal.u) annotation(
      Line(points = {{-92.1381, 77.5801}, {-82.5623, 77.5801}, {-82.5623, 77.2242}, {-83.4391, 77.2242}}));
    connect(tank4.AirIn, blower2.AirOut) annotation(
      Line(points = {{-27.5845, -5.05814}, {-27.4021, -5.05814}, {-27.4021, -10.7634}, {-27.4411, -10.7634}}));
    connect(mixer.Out, tank1.In) annotation(
      Line(points = {{-62.38, 26.4818}, {-51.0843, 26.4818}, {-51.0843, 27.4967}, {-50.9246, 27.4967}}));
    connect(tank1.Out, tank2.In) annotation(
      Line(points = {{-26.7805, 27.2452}, {-18.8612, 27.2452}, {-18.8612, 26.9697}, {-18.7976, 26.9697}}));
    connect(tank4.Out, tank5.In) annotation(
      Line(points = {{-16.6544, 3.09607}, {-11.032, 3.09607}, {-11.032, 2.90823}, {-10.2799, 2.90823}}));
    annotation(
      Diagram(graphics = {Text(origin = {-161, 78}, extent = {{-57, 20}, {39, -20}}, textString = "D: Control of the aerobic volume")}, coordinateSystem(initialScale = 0.1)));
  end BSM1_OpenLoop_D;
  annotation(
    Documentation(info = ".

Authors:
   Carmen Prieto Estravid FYP
   Ph.D. Felix Hernandez del Olmo
   Faculty of Informatics
   National Distance University (UNED)
   Madrid
   Spain
  
The package is free software; it can be redistributed and /or modified under the terms of the Modelica license, see the license conditions and the accompanying
disclaimer in the documentation of package Modelica in file /Modelica/package.mo/.

Copyright (C) 2013
    "),
    uses(WasteWater(version = "2.1.0"), Modelica(version = "3.2.2")));
end BSM1;
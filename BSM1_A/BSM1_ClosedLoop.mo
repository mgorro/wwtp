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
    Placement(visible = true, transformation(origin = {3.20285, -16.726}, extent = {{-8.19616, -8.19616}, {8.19616, 8.19616}}, rotation = 0)));
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
equation
  connect(ADsensor_Waste.Out, WasteSludge.In) annotation(
    Line(points = {{54.871, -53.4521}, {54.871, -53.1716}, {55.0621, -64.5783}, {60.9901, -64.5783}, {60.9901, -64.934}}));
  connect(WastePump.Out, ADsensor_Waste.In) annotation(
    Line(points = {{63.7051, -11.4698}, {54.9398, -11.4698}, {54.871, -31.3087}, {54.871, -31.5892}}));
  connect(ADsensor_Effluent.Out, Effluent.In) annotation(
    Line(points = {{115.562, 30.5584}, {115.706, 30.5584}, {115.706, 31.0116}, {137.222, 31.0116}}));
  connect(Settler.Effluent, ADsensor_Effluent.In) annotation(
    Line(points = {{76.2065, 31.2693}, {93.5943, 31.2693}, {93.6991, 30.5584}, {93.6991, 30.5584}}));
  connect(ADsensor_Recycle.Out, RecyclePump.In) annotation(
    Line(points = {{-19.4813, -30.8379}, {-46.2651, -30.8379}, {-45.421, -34.8277}, {-45.421, -34.8277}}));
  connect(ADsensor_Recycle.In, divider.Out1) annotation(
    Line(points = {{2.38167, -30.8379}, {33.452, -30.8379}, {33.452, -20.9964}, {45.5516, -20.9964}, {45.5516, 2.13523}, {39.1601, 2.13523}, {39.1601, 1.90748}}));
  connect(ADsensor_Return.Out, ReturnPump.In) annotation(
    Line(points = {{-2.35478, -46.378}, {-41.4458, -46.378}, {-45.5474, -52.9105}, {-45.5474, -52.9105}}));
  connect(Settler.Return, ADsensor_Return.In) annotation(
    Line(points = {{64.8898, 16.9775}, {51.411, 16.9775}, {51.411, -27.3276}, {38.6426, -27.3276}, {38.6426, -45.7677}, {19.5081, -46.378}, {19.5081, -46.378}}));
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
  connect(PI1.y, blower3.u) annotation(
    Line(points = {{77.3432, 55.516}, {87.9004, 55.516}, {87.9004, -21.7082}, {9.96441, -21.7082}, {9.96441, -18.8831}, {10.5292, -18.8831}}));
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
  connect(tank5.AirIn, blower3.AirOut) annotation(
    Line(points = {{1.93411, -6.0614}, {2.13523, -6.0614}, {2.13523, -11.1193}, {2.0963, -11.1193}}));
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
    Diagram(graphics = {Text(origin = {-222, 78}, extent = {{-6, 4}, {90, -16}}, textString = "BSM1 A: DO Cascade Control")}));
end BSM1_ClosedLoop;

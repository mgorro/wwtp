within BSM1;

record Config
 constant String BSM1_Directory="C:/Users/User/Desktop/felixhdelolmo-wastewater-systems/BSM1/";
 constant String noise_include="#include \""+BSM1_Directory+"RandomNormal/ext_RandNormal.c\"";
 
 function RandomNormal
    output Real y;
    input Real u;
  
    external "C" y = ext_RandomNormal(u) annotation(Include = "#include \"/home/felix/TRABAJO/BSM1/RandomNormal/ext_RandNormal.c\"");
  end RandomNormal;
end Config;

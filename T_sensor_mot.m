function dT = T_sensor_mot(T_sen, T_mot,tau)

   
   dT = (T_mot - T_sen)/tau;

end
function dT = Ar_motor(T_ar, T_amb, T_mot, T_par, T_bat, T_g, UA_rad)

   global A_mot m_ar m_dot_mot h_par A_par A_g A_bat h_mot h_bat h_g;

   T_rad = T_mot;
   cp_ar = 1000;

   dT = (h_par*A_par*(T_par-T_ar) + h_mot*A_mot*(T_mot-T_ar) + UA_rad*(T_rad-T_ar) + h_bat*A_bat*(T_bat-T_ar) + h_g*A_g*(T_g-T_ar) + m_dot_mot*cp_ar*(T_amb-T_ar))/(cp_ar*m_ar);

end
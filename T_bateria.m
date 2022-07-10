function dT = T_bateria(T_bat, T_par, T_ar)

   global eps sigma h_bat A_bat m_bat cp_bat;


   dT = ((eps*sigma*(T_par^4 - T_bat^4) + h_bat*(T_ar - T_bat))*A_bat)/(cp_bat*m_bat);

end
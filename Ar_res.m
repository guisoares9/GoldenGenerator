function dT = Ar_res(T_ar, T_amb, T_res, T_par, T_sen)

   global m_ar m_dot_res h_par h1 h2 At_l At_f A_par_res m_sen cp_sen tau_res;

    cp_ar = 1000;
   

   dT = (h_par*A_par_res*(T_par-T_ar) + (T_res - T_ar)*(h1*At_l +h2*At_f) + m_sen*cp_sen*(T_sen - T_ar)/tau_res + m_dot_res*cp_ar*(T_amb-T_ar))/(cp_ar*m_ar);

end
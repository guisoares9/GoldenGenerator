function dT = T_gerador(T_g, T_ar, T_par, P_ele)

   global h_g eps sigma A_g m_g cp_g;

    n_gen = 0.9;

   dT = ((h_g*(T_ar-T_g) + eps*sigma*(T_par^4 - T_g^4) + P_ele*(1-n_gen)/(A_g*n_gen))*A_g)/(cp_g*m_g);

end
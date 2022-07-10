function dT = Par_LESTE_mot(T_par, G_sol, T_amb, T_ar, T_medMBG, T_medPAR, F, cos_theta, h_nat)

    global h_par eps sigma T_ceu alfa A_par cp_par m_par_mot
    h_for = h_par;
    A = A_par/6;
    
    dT = (h_nat*(T_amb - T_par) + h_for*(T_ar - T_par) + F*eps*sigma*(T_medMBG^4 - T_par^4) + (1-F)*eps*sigma*(T_medPAR^4 - T_par^4) + G_sol*0.1*alfa + eps*sigma*(T_ceu^4 - T_par^4) + G_sol*cos_theta*alfa)*A/(m_par_mot*cp_par);
   
end
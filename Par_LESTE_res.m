function dT = Par_LESTE_res(T_par, G_sol, T_amb, T_ar, T_medMBG, F, cos_theta, h_nat)

    global  h_par eps sigma T_ceu alfa A_par_LOTC_res cp_par m_par_res
    h_for = h_par;
    A = A_par_LOTC_res;
    
    dT = (h_nat*(T_amb - T_par) + h_for*(T_ar - T_par) + F*eps*sigma*(T_medMBG^4 - T_par^4) + G_sol*0.1*alfa + eps*sigma*(T_ceu^4 - T_par^4) + G_sol*cos_theta*alfa)*A/(m_par_res*cp_par);
   
end
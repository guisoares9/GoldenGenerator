function dT = Par_CHAO_mot(T_par, T_ar, T_medMBG, T_medPAR, F, m_par, A)

    global  h_par eps sigma cp_par T_chao S_mot k_chao
    h_for = h_par;
    
    dT = (S_mot*k_chao*(T_chao - T_par) + h_for*A*(T_ar - T_par) + F*eps*sigma*(T_medMBG^4 - T_par^4) + (1 - F)*eps*sigma*(T_medPAR^4 - T_par^4))/(m_par*cp_par);
   
end
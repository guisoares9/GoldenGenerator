function dT = motor(T_mot, T_ar, T_sen, T_par, P_ele, UA_rad)

global A_mot cp_mot m_mot eps sigma h_mot m_sen cp_sen tau;
   
    n_mot = 0.3;
    n_gen = 0.9;
    n_calor = 0.4;

   dT = (((m_sen*cp_sen)/tau)*(T_sen - T_mot) + A_mot*eps*sigma*(T_par^4-T_mot^4) + A_mot*h_mot*(T_ar-T_mot) + UA_rad*(T_ar-T_mot) + P_ele*(n_calor/(n_mot*n_gen)))/(m_mot*cp_mot);
    
end
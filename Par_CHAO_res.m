function dT = Par_CHAO_res(T_par, T_ar, T_res, F)

    global  h_par eps sigma cp_par T_chao S_res k_chao A_par_LOTC_res m_par_res;

    h_for = h_par;
    A = A_par_LOTC_res;

    dT = (S_res*k_chao*(T_chao - T_par) + h_for*A*(T_ar - T_par) + A*F*eps*sigma*(T_res^4 - T_par^4))/(m_par_res*cp_par);
   
end
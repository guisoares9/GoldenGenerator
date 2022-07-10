function dT = Corta_Fogo(T_par, T_ar, T_medMBG, T_medPAR,  F, T_par2)

    global A_par h_par eps sigma k_la_roc x_la_roc m_par_mot cp_par

    h_for = h_par;
    A = A_par/6;
    del_x_la = x_la_roc/2;

    dT = (h_for*(T_ar-T_par) + F*eps*sigma*(T_medMBG^4-T_par^4) + (1-F)*eps*sigma*(T_medPAR^4-T_par^4) + k_la_roc*(abs(T_par+T_par2)/2-T_par)*A/del_x_la)/(m_par_mot*cp_par);

end
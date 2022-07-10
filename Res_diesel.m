function dT = Res_diesel(T_res, T_p1, T_p2, T_p3, T_p4, T_p5, T_p6, T_ar)

    global eps sigma m_res cp_res At_l At_f F_res_M_rc F_res_m_rc h1 h2;

    dT = ((T_res - T_ar)*(h1*At_l +h2*At_f) + F_res_M_rc*eps*sigma*(At_l/4)*(T_p1^4 + T_p2^4 + T_p3^4 + T_p4^4 - 4*T_res^4) + F_res_m_rc*eps*sigma*(At_f/2)*(T_p5^4 + T_p6^4 - 2*T_res^4))/(m_res*cp_res) ;

end
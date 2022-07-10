function dT = mainSystem(t, T)

    global A_par F_mot m_par_mot h_nat_v h_nat_h F_res_m_cr F_res_M_cr tau...
        tau_res UA_rad;

    T_mot = T(1);
    T_ar_mot = T(2);
    T_sen = T(3);
    T_bat = T(4);
    T_g = T(5);
    T_parNorte = T(6);
    T_parSul = T(7);
    T_parLeste_mot = T(8);
    T_parOeste_mot = T(9);
    T_parTeto_mot = T(10);
    T_parLeste_res = T(11);
    T_parOeste_res = T(12);
    T_parTeto_res = T(13);
    T_CorFog_mot = T(14);
    T_CorFog_res = T(15);
    T_res = T(16);
    T_parChao_mot = T(17);
    T_parChao_res = T(18);
    T_ar_res = T(19);
    T_sen_res = T(20);

    %Exercício 2 (Comentar Pwr = Power(t))
%     Pwr = 50;

    Pwr = Power(t);

    %Exercício 3a)
%     if(t<=43200)            %12h em segundos
%         UA_rad = 100;
%     end

    %Exercício 3c)
    
    
    T_ambient = T_amb(t);
    T_medMBG = (T_mot + T_bat + T_g)/3;
    
    T_medPAR_mot = (T_parSul + T_parLeste_mot + T_parOeste_mot + T_parTeto_mot + T_parChao_mot + T_CorFog_mot)/6;
    T_medPAR_mot_S = (T_parLeste_mot + T_parOeste_mot + T_parTeto_mot + T_parChao_mot + T_CorFog_mot)/5;
    T_medPAR_mot_L = (T_parSul + T_parOeste_mot + T_parTeto_mot + T_parChao_mot + T_CorFog_mot)/5;
    T_medPAR_mot_O = (T_parSul + T_parLeste_mot + T_parTeto_mot + T_parChao_mot + T_CorFog_mot)/5;
    T_medPAR_mot_T = (T_parSul + T_parLeste_mot + T_parOeste_mot + T_parChao_mot + T_CorFog_mot)/5;
    T_medPAR_mot_C = (T_parSul + T_parLeste_mot + T_parOeste_mot + T_parTeto_mot + T_CorFog_mot)/5;
    T_medPAR_mot_Cor = (T_parSul + T_parLeste_mot + T_parOeste_mot + T_parTeto_mot + T_parChao_mot)/5;

    T_medPAR_res = (T_parChao_res + T_parTeto_res + T_parOeste_res + T_parLeste_res + T_parNorte + T_CorFog_res)/6;

    if t<=18*3600 && t>=6*3600 

        G_sol = 1000*sin(2*pi*(t/3600 - 6)/24);
    
    else
        G_sol = 0;
    end

    %Calculando o cos(theta) para as paredes leste, oeste e teto
    theta = t*2*pi/(24*3600);

    if theta>=0 && theta<=90
        cos_leste = cos(theta);
        cos_oeste = 0;
        cos_teto = cos(theta);
    if theta>=90 && theta<=180
        cos_leste = 0;
        cos_oeste = cos(theta);
        cos_teto = cos(theta);
    else
        cos_leste = 0;
        cos_oeste = 0;
        cos_teto = 0;
    end
    
    %Componentes do compartimento do motor
    dT_mot = motor(T_mot, T_ar_mot, T_sen, T_medPAR_mot, Pwr, UA_rad);
    dT_ar_mot = Ar_motor(T_ar_mot, T_ambient, T_mot, T_medPAR_mot, T_bat, T_g, UA_rad);
    dT_sensor_mot = T_sensor_mot(T_sen,T_mot, tau);
    dT_bateria = T_bateria(T_bat, T_medPAR_mot, T_ar_mot);
    dT_gerador = T_gerador(T_g, T_ar_mot,T_medPAR_mot, Pwr);

    %Paredes do compartimento do motor
    dT_ParSul =  Par_S(T_parSul, G_sol, T_ambient, T_ar_mot, T_medMBG, T_medPAR_mot_S, F_mot);
    dT_ParLESTE_mot = Par_LESTE_mot(T_parLeste_mot, G_sol, T_ambient, T_ar_mot, T_medMBG, T_medPAR_mot_L, F_mot, cos_leste, h_nat_v);
    dT_ParOESTE_mot = Par_LESTE_mot(T_parOeste_mot, G_sol, T_ambient, T_ar_mot, T_medMBG, T_medPAR_mot_O, F_mot, cos_oeste, h_nat_v);
    dT_ParTETO_mot = Par_LESTE_mot(T_parTeto_mot, G_sol, T_ambient, T_ar_mot, T_medMBG, T_medPAR_mot_T, F_mot, cos_teto, h_nat_h);
    dT_CorFog_mot = Corta_Fogo(T_CorFog_mot, T_ar_mot, T_medMBG, T_medPAR_mot_Cor, F_mot, T_CorFog_res);
    dT_CHAO_mot = Par_CHAO_mot(T_parChao_mot, T_ar_mot, T_medMBG, T_medPAR_mot_C, F_mot, m_par_mot, A_par/6);

    %Paredes do compartimento do reservatório de diesel
    dT_ParNorte = Par_N(T_parNorte, G_sol, T_ambient, T_ar_res, T_res, F_res_m_cr);
    dT_ParLESTE_res = Par_LESTE_res(T_parLeste_res, G_sol, T_ambient, T_ar_res, T_res, F_res_M_cr, cos_leste, h_nat_v);
    dT_ParOESTE_res = Par_LESTE_res(T_parOeste_res, G_sol, T_ambient, T_ar_res, T_res, F_res_M_cr, cos_oeste, h_nat_v);
    dT_ParTETO_res = Par_LESTE_res(T_parTeto_res, G_sol, T_ambient, T_ar_res, T_res, F_res_M_cr, cos_teto, h_nat_h);
    dT_CorFog_res = Corta_Fogo_res(T_CorFog_res, T_ar_res, T_res, F_res_m_cr, T_CorFog_mot);
    dT_Res_diesel = Res_diesel(T_res, T_parLeste_res, T_parOeste_res, T_parTeto_res, T_parChao_res, T_parNorte, T_CorFog_res, T_ar_res);
    dT_CHAO_res = Par_CHAO_res(T_parChao_res, T_ar_res, T_res, F_res_M_cr);
    dT_Ar_res = Ar_res(T_ar_res, T_ambient, T_res, T_medPAR_res, T_sen_res);
    dT_sensor_res = T_sensor_mot(T_sen_res,T_ar_res, tau_res);

    dT = [dT_mot; dT_ar_mot; dT_sensor_mot; dT_bateria; dT_gerador; ...
        dT_ParNorte; dT_ParSul; dT_ParLESTE_mot; dT_ParOESTE_mot; ...
        dT_ParTETO_mot; dT_ParLESTE_res; dT_ParOESTE_res; dT_ParTETO_res; ...
        dT_CorFog_mot; dT_CorFog_res; dT_Res_diesel; dT_CHAO_mot; dT_CHAO_res; ...
        dT_Ar_res; dT_sensor_res];
end
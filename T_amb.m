function T_amb = T_amb(t)

    T_amb = (28 + 5*sin(2*pi*(t/3600 - 12)/24)) + 273;
    
end
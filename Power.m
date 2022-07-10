function Pwr = Power(t)

    h = t/3600;
    
    times = [6 8 9 11 12 13 14 15 17 18 19 20 21 22];
    power_vector = [0 5 6 8 6 3 5 9 5 9 9.5 6 5 3];
    
    i = 1;
    Pwr = 0;
    
    while i < 15  
        if h < times(i) 
            Pwr = power_vector(i) * 1e4;
            i = 99;
        else
            i = i + 1;
        end
    end

end
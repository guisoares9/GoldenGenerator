clc
clear all
close all

T_ambient = [];

for t = 1:24*3600
    T_ambient = [T_ambient T_amb(t)];
end

Average_temp = mean(T_ambient);
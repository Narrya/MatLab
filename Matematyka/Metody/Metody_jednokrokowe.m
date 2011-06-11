close all;
clear all;

n = input('Podaj liczbê kroków: ');
t0 = 0;
tf = 1;
h = (tf - t0) / n;

% Dok³adne rozwi¹zanie
Y = zeros(1, n);
for k = 0 : n - 1;
    tk = t0 + k * h;
    Y(k + 1) = funy(tk);
end

% Euler
E = zeros(1, n);
E(1) = funy(t0);
for k = 1 : n - 1;
    tk = t0 + k * h;
    E(k + 1) = E(k) + h * fun(tk, E(k));   
end;

% Euler 2
E2 = zeros(1, n);
    E2(1) = funy(t0);
        for k = 1 : n - 1;
            tk = t0 + k * h;
             E2(k + 1) = E2(k) + h * fun(tk+(0.5*h), E2(k)+(0.5*h)*fun(tk, E2(k)));        
        end;
        
% Heune 
H=zeros(1, n);
H(1) = funy(t0);
for k = 1 : n - 1;  
    tk = t0 + k * h;
    y = H(k);
    H(k + 1) = y + 0.5 * h * (fun(tk, y) + fun(tk + h, y + h * fun(tk, y)));
end;

% Rungeggo - Kutty
RKVec = zeros(1, 4);
RK = zeros(1, n);
RK(1) = funy(t0);
for k = 1 : n - 1;
    tk = t0 + (k - 1) * h;
    yk = RK(k);
    RKVec(1) = fun(tk, yk);
    RKVec(2) = fun(tk + 0.5 * h, yk + 0.5 * h * RKVec(1));
    RKVec(3) = fun(tk + 0.5 * h, yk + 0.5 * h * RKVec(2));
    RKVec(4) = fun(tk + h, yk + h * RKVec(3));
    RK(k + 1) = yk + (1 / 6) * h * (RKVec(1) + 2 * RKVec(2) + 2 * RKVec(3) + RKVec(4));
end;

figure;
plot(Y, 'black');
hold on
plot(E, 'y');
hold on
plot(E2, 'r');
hold on;
plot(H, 'g');
hold on;
plot(RK, 'b');

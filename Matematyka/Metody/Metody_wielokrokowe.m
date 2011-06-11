clc
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

% Adamsa-Bashfortha
B1=zeros(1, n);
B2=zeros(1, n);
B3=zeros(1, n);
B4=zeros(1, n);
for i=1:n;
    B1(i) = RK(i);
    B2(i) = RK(i);    
    B3(i) = RK(i);    
    B4(i) = RK(i);        
end;

%r = input('Podaj rz¹d równania: ');
%if r == 1
    for k = 1 : n - 1;
        tk = t0 + k * h;
        B1(k+1) = B1(k) + h * fun(B1(k),tk);
    end
%end

%if r==2
    for k = 2 : n - 1;
        tk = t0 + k * h;        
        B2(k+1)=B2(k)+(0.5*h)*(3*fun(B2(k),tk) - fun(B2(k-1),tk));
    end
%end

%if r==3
    for k = 3 : n - 1;
        tk = t0 + k * h;          
        B3(k+1)=B3(k)+(h/12)*(23*fun(B3(k),tk) - 16*fun(B3(k-1),tk)+ 5*fun(B3(k-2),tk));
    end
%end

% if r==4
    for k = 4 : n - 1;
        tk = t0 + k * h;  
        B4(k+1)=B4(k)+(h/24)*(55*fun(B4(k),tk) - 59*fun(B4(k-1),tk)+ 37*fun(B4(k-2),tk) - 9*fun(B4(k-3),tk));
    end
% end

figure;
plot(Y, 'black');
hold on
plot(B1, 'b');
hold on
plot(B2, 'r');
hold on
plot(B3, 'g');
hold on
plot(B4, 'y');

% Adamsa-Moultona
M1=zeros(1, n);
M2=zeros(1, n);
M3=zeros(1, n);
M4=zeros(1, n);
for i=1:n;
    M1(i) = RK(i);
    M2(i) = RK(i);    
    M3(i) = RK(i);    
    M4(i) = RK(i);        
end;

% r = input('Podaj rz¹d równania: ');
% if r == 1
    for k = 1 : n - 1;
        tk = t0 + k * h;
        M1(k+1) = M1(k) + h * fun(M1(k),tk);
    end
% end

% if r==2
    for k = 2 : n - 1;
        tk = t0 + k * h;        
        M2(k+1)=M2(k)+(0.5*h)*(fun(M2(k+1),tk) +fun(M2(k),tk));
    end
% end

% if r==3
    for k = 3 : n - 1;
        tk = t0 + k * h;          
        M3(k+1)=M3(k)+(h/12)*(5*fun(M3(k+1),tk) + 8*fun(M3(k),tk)-fun(M3(k-1),tk));
    end
% end

% if r==4
    for k = 4 : n - 1;
        tk = t0 + k * h;  
        M4(k+1)=M4(k)+(h/24)*(9*fun(M4(k+1),tk) + 19*fun(M4(k),tk) - 5*fun(M4(k-1),tk) + fun(M4(k-2),tk));
    end
% end

figure;
plot(Y, 'black');
hold on
plot(M1, 'b');
hold on
plot(M2, 'r');
hold on
plot(M3, 'g');
hold on
plot(M4, 'y');
function varargout = Rownania2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rownania2_OpeningFcn, ...
                   'gui_OutputFcn',  @Rownania2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Rownania2 is made visible.
function Rownania2_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Rownania2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function edit6_Callback(hObject, eventdata, handles)
% zakres od
global t0;
t0 = str2num( get( handles.edit6 , 'string' ) );


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit7_Callback(hObject, eventdata, handles)
% zakres do
global tf;
tf = str2num( get( handles.edit7 , 'string' ) );

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit8_Callback(hObject, eventdata, handles)
% liczba kroków
global t0;
global tf
global h;
global n;
n = str2num( get( handles.edit8 , 'string' ) );
h = (tf - t0) / n;

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit9_Callback(hObject, eventdata, handles)
global x;
global y;
global fun;
fun = inline( get( handles.edit9 , 'string' ), 'x', 'y' );


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit10_Callback(hObject, eventdata, handles)
global x;
global y;
global funy;
funy = inline( get( handles.edit10 , 'string' ), 'x');

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global h;
global n;
global t0;
global tf;
global fun;
global funy;

if    ( get( handles.dokladne , 'value' ) == 1 ) 
%     funy = zeros(20,1)
    Y = zeros(1, n);
        for k = 0 : n - 1;
            tk = t0 + k * h;
            Y(k + 1) = funy(tk);
            
        end
       handles.axes2=plot(Y, 'black');
       hold on
end;

if    ( get( handles.euler , 'value' ) == 1 ) 
    E = zeros(1, n);
    E(1) = funy(t0);
        for k = 1 : n - 1;
            tk = t0 + k * h;
            E(k + 1) =E(k)+ h*fun(tk, E(k));   
        end;
       handles.axes2=plot(E, 'r');
       hold off
end;


if    ( get( handles.euler2 , 'value' ) == 1 ) 
    
    E2 = zeros(1, n);
    E2(1) = funy(t0);
        for k = 1 : n - 1;
            tk = t0 + k * h;
             E2(k + 1) = E2(k) + h * fun(tk+(0.5*h), E2(k)+(0.5*h)*fun(tk, E2(k)));        
        end;
        handles.axes2=plot(E2, 'r');
        hold off
end;

if    ( get( handles.heune , 'value' ) == 1 ) 
    
    H=zeros(1, n);
    H(1) = funy(t0);
        for k = 1 : n - 1;  
            tk = t0 + k * h;
            y = H(k);
            H(k + 1) = y + 0.5 * h * (fun(tk, y) + fun(tk + h, y + h * fun(tk, y)));
        end;
        handles.axes2=plot(H, 'g');
        hold off
end;

if    ( get( handles.runge , 'value' ) == 1 )
    
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
        handles.axes2=plot(RK, 'b');
        hold off
end;

if    ( get( handles.adamsa , 'value' ) == 1 ) 
    
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

    for k = 1 : n - 1;
        tk = t0 + k * h;
        B1(k+1) = B1(k) + h * fun(B1(k),tk);
    end

    for k = 2 : n - 1;
        tk = t0 + k * h;        
        B2(k+1)=B2(k)+(0.5*h)*(3*fun(B2(k),tk) - fun(B2(k-1),tk));
    end

    for k = 3 : n - 1;
        tk = t0 + k * h;          
        B3(k+1)=B3(k)+(h/12)*(23*fun(B3(k),tk) - 16*fun(B3(k-1),tk)+ 5*fun(B3(k-2),tk));
    end

    for k = 4 : n - 1;
        tk = t0 + k * h;  
        B4(k+1)=B4(k)+(h/24)*(55*fun(B4(k),tk) - 59*fun(B4(k-1),tk)+ 37*fun(B4(k-2),tk) - 9*fun(B4(k-3),tk));
    end
    
    handles.axes2=plot(B1, 'b');
    handles.axes2=plot(B2, 'r');
    handles.axes2=plot(B3, 'g');
    handles.axes2=plot(B4, 'y');
    hold off
end;

if    ( get( handles.adamsa2, 'value' ) == 1 )
   
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

    for k = 1 : n - 1;
        tk = t0 + k * h;
        M1(k+1) = M1(k) + h * fun(M1(k),tk);
    end

    for k = 2 : n - 1;
        tk = t0 + k * h;        
        M2(k+1)=M2(k)+(0.5*h)*(fun(M2(k+1),tk) +fun(M2(k),tk));
    end

    for k = 3 : n - 1;
        tk = t0 + k * h;          
        M3(k+1)=M3(k)+(h/12)*(5*fun(M3(k+1),tk) + 8*fun(M3(k),tk)-fun(M3(k-1),tk));
    end

    for k = 4 : n - 1;
        tk = t0 + k * h;  
        M4(k+1)=M4(k)+(h/24)*(9*fun(M4(k+1),tk) + 19*fun(M4(k),tk) - 5*fun(M4(k-1),tk) + fun(M4(k-2),tk));
    end
    handles.axes2=plot(M1, 'b');
    handles.axes2=plot(M2, 'r');
    handles.axes2=plot(M3, 'g');
    handles.axes2=plot(M4, 'y');
    hold off
end;



% --- Executes when selected object is changed in uipanel4.
function uipanel4_SelectionChangeFcn(hObject, eventdata, handles)
get(hObject,'Value'); 


% --- Executes on button press in dokladne.
function dokladne_Callback(hObject, eventdata, handles)
get(hObject,'Value')



% --- Executes on button press in euler2.
function euler2_Callback(hObject, eventdata, handles)
get(hObject,'Value')

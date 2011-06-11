function varargout = Biometria(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NewBiometria_OpeningFcn, ...
                   'gui_OutputFcn',  @NewBiometria_OutputFcn, ...
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

% --- Executes just before Biometria is made visible.
function NewBiometria_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
set(handles.edit9, 'String', 'Prosze klikac');
set(handles.edit2, 'String', '');
set(handles.edit3, 'String', '');
set(handles.edit4, 'String', '');
set(handles.edit5, 'String', '');
set(handles.edit6, 'String', '');
set(handles.edit7, 'String', '');
set(handles.edit8, 'String', '');

function varargout = NewBiometria_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global tab;
global wektor;
global count;
count = 0;
% wektor(1)=set(handles.edit2);
tab(1) = 1;
[sygnal,fs] = wavread('klasycznie.wav');
x = sygnal/max(sygnal); %znormalizowany sygnal
l=length(x);
sygnal2=x(10000:1000000);
set(handles.edit9, 'String', '');
set(handles.edit2, 'String', 'Prosze klikac');
wavplay(sygnal2,fs);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global tab
global count
count = 0;
tab(2) = 1;
[sygnal,fs] = wavread('bigbit.wav');
x = sygnal/max(sygnal); %znormalizowany sygnal
l=length(x);
sygnal2=x(10000:1000000);
set(handles.edit3, 'String', 'Prosze klikac');
wavplay(sygnal2,fs);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global tab;
global count;
count = 0;
tab(3) = 1;
[sygnal,fs] = wavread('pop.wav');
x = sygnal/max(sygnal); %znormalizowany sygnal
l=length(x);
sygnal2=x(10000:1000000);
set(handles.edit4, 'String', 'Prosze klikac');
wavplay(sygnal2,fs);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global tab
global count
count = 0;
tab(4) = 1;
[sygnal,fs] = wavread('elektro.wav');
x = sygnal/max(sygnal); %znormalizowany sygnal
l=length(x);
sygnal2=x(10000:1000000);
set(handles.edit5, 'String', 'Prosze klikac');
wavplay(sygnal2,fs);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global tab
global count
count = 0;
tab(5) = 1;
[sygnal,fs] = wavread('indie.wav');
x = sygnal/max(sygnal); %znormalizowany sygnal
l=length(x);
sygnal2=x(10000:1000000);
set(handles.edit6, 'String', 'Prosze klikac');
wavplay(sygnal2,fs);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global tab
global count
count = 0;
tab(6) = 1;
[sygnal,fs] = wavread('rock.wav');
x = sygnal/max(sygnal); %znormalizowany sygnal
l=length(x);
sygnal2=x(10000:1000000);
set(handles.edit7, 'String', 'Prosze klikac');
wavplay(sygnal2,fs);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
global tab
global count
count = 0;
tab(7) = 1;
[sygnal,fs] = wavread('arock.wav');
x = sygnal/max(sygnal); %znormalizowany sygnal
l=length(x);
sygnal2=x(10000:1000000);
set(handles.edit8, 'String', 'Prosze klikac');
wavplay(sygnal2,fs);

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
global count;
global tab;
global wektor;
count = count + 1;
min = 0;
for i = 1:7;
    if tab(i) == 1;
        min = i;
        wektor=[min count];
    end;
end;
switch min;
    case 0;
        set(handles.edit9,'String',num2str(count));
    case 1;
        set(handles.edit2,'String',num2str(count));
    case 2;
        set(handles.edit3,'String',num2str(count));
    case 3;
        set(handles.edit4,'String',num2str(count));
    case 4;
        set(handles.edit5,'String',num2str(count));
    case 5;
        set(handles.edit6,'String',num2str(count));
    case 6;
        set(handles.edit7,'String',num2str(count));
    case 7;
        set(handles.edit8,'String',num2str(count));
end;

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during oclbject creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
global tab;
global count;
count = 0;
tab = zeros(1, 7);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
global tab;
global count;
global min;
global wektor;
count = 0;

tab = zeros(1, 7);
set(handles.edit9, 'String', 'Prosze klikac');
set(handles.edit2, 'String', '');
set(handles.edit3, 'String', '');
set(handles.edit4, 'String', '');
set(handles.edit5, 'String', '');
set(handles.edit6, 'String', '');
set(handles.edit7, 'String', '');
set(handles.edit8, 'String', '');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% n=hist(min, count)
toDraw=zeros(1,7);
for i = 1 : 7;
    switch i;
    case 1;
        [value,status]=str2num(get(handles.edit2,'String'));
        if status;
            toDraw(i)=value;
        end;
    case 2;
        [value,status]=str2num(get(handles.edit3,'String'));
        if status;
            toDraw(i)=value;
        end;
    case 3;
        [value,status]=str2num(get(handles.edit4,'String'));
        if status;
            toDraw(i)=value;
        end;
    case 4;
        [value,status]=str2num(get(handles.edit5,'String'));
        if status;
            toDraw(i)=value;
        end;
    case 5;
        [value,status]=str2num(get(handles.edit6,'String'));
        if status;
            toDraw(i)=value;
        end;
    case 6;
        [value,status]=str2num(get(handles.edit7,'String'));
        if status;
            toDraw(i)=value;
        end;
    case 7;
        [value,status]=str2num(get(handles.edit8,'String'));
        if status;
            toDraw(i)=value;
        end;
    end;
end;
axes(handles.time_axes);
bar(toDraw);
guidata(hObject, handles);

% bar(tab)
% k=get(gcf,'Color');
% set(gca,'XTick',[],'YTick',[],'XTickLabel','','YTickLabel','','Color',k,'
% Position',[0 0  1 1]); 

% --- Executes during object creation, after setting all properties.
function time_axes_CreateFcn(hObject, eventdata, handles)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes on key press with focus on pushbutton8 and none of its controls.
function pushbutton8_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double

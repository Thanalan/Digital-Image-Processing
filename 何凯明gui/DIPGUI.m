function varargout = DIPGUI(varargin)
% DIPGUI MATLAB code for DIPGUI.fig
%      DIPGUI, by itself, creates a new DIPGUI or raises the existing
%      singleton*.
%
%      H = DIPGUI returns the handle to a new DIPGUI or the handle to
%      the existing singleton*.
%
%      DIPGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIPGUI.M with the given input arguments.
%
%      DIPGUI('Property','Value',...) creates a new DIPGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIPGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIPGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIPGUI

% Last Modified by GUIDE v2.5 30-Nov-2018 12:21:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIPGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DIPGUI_OutputFcn, ...
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


% --- Executes just before DIPGUI is made visible.
function DIPGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIPGUI (see VARARGIN)

% Choose default command line output for DIPGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIPGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIPGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in getpic.
function getpic_Callback(hObject, eventdata, handles)
% hObject    handle to getpic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
[filename,pathname]=...
    uigetfile({'*.*';'*.bmp';'*.tif';'*.png'},'select picture');  %选择图片路径
str=[pathname filename];  %合成路径+文件名
I=imread(str);
axes(handles.yuantu);  %使用第一个axes
imshow(I);  %显示图片


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in savepic.
function savepic_Callback(hObject, eventdata, handles)
% hObject    handle to savepic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...
                                 '*.bmp','Bitmap(*.bmp)';...
                                 '*.gif','GIF(*.gif)';...
                                 '*.*',  'All Files (*.*)'},...
                                 'Save Picture','Untitled');
if FileName==0
    return;
else
    h=getframe(handles.chulihou);
    imwrite(h.cdata,[PathName,FileName]);
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes during object creation, after setting all properties.
function uibuttongroup2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I

global BW  %定义全局变量

str=get(hObject,'string');  %拿到所选按钮的名称

axes(handles.chulihou);   %使用第二个axes

 switch str   %选择语句

    case'Initial'  %点击原图按钮

        imshow(I);  %显示原图

    case'roberts算子'  %点击Roberts边缘检测按钮

        I_gray=rgb2gray(I);
        
        BW=edge( I_gray,'roberts');

        imshow(BW);

    case'sobel算子'  %点击Sobel边缘检测按钮

        I_gray=rgb2gray(I);
        
        BW=edge(I_gray,'sobel');

        imshow(BW);

    case'prewitt算子'  %点击Prewitt边缘检测按钮

        I_gray=rgb2gray(I);
        
        BW=edge(I_gray,'prewitt');

        imshow(BW);

    case'log算子'  %点击Log边缘检测按钮      

         I_gray=rgb2gray(I);
         
        BW=edge(I_gray,'log');

        imshow(BW);

    case'canny算子'  %点击Canny边缘检测按钮

        I_gray=rgb2gray(I);
        
        BW=edge(I_gray,'canny');

        imshow(BW);

end;


% --- Executes on slider movement.
function zuixiaozhibanjing0_Callback(hObject, eventdata, handles)
% hObject    handle to zuixiaozhibanjing0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global minR
minR = get(handles.zuixiaozhibanjing0,'Value');
minR = int32(minR);
set(handles.zuixiaozhibanjing0,'Value',minR);
set(handles.zuixiaozhibanjing,'String',num2str(minR));



% --- Executes during object creation, after setting all properties.
function zuixiaozhibanjing0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zuixiaozhibanjing0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function zuixiaozhibanjing_Callback(hObject, eventdata, handles)
% hObject    handle to zuixiaozhibanjing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zuixiaozhibanjing as text
%        str2double(get(hObject,'String')) returns contents of zuixiaozhibanjing as a double
global minR
if minR~=g;
    set(handles.zuixiaozhibanjing,'String',num2str(minR));
end
% --- Executes during object creation, after setting all properties.
function zuixiaozhibanjing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zuixiaozhibanjing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function dxlbbanjing_Callback(hObject, eventdata, handles)
% hObject    handle to dxlbbanjing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global daoR
daoR = get(handles.dxlbbanjing,'Value');
daoR = int32(daoR);
set(handles.dxlbbanjing,'Value',daoR);
set(handles.dxlbbanjing1,'String',num2str(daoR));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function dxlbbanjing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dxlbbanjing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function dxlbbanjing1_Callback(hObject, eventdata, handles)
% hObject    handle to dxlbbanjing1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global daoR
set(handles.dxlvbanjing1,'String',num2str(daoR));
% Hints: get(hObject,'String') returns contents of dxlbbanjing1 as text
%        str2double(get(hObject,'String')) returns contents of dxlbbanjing1 as a double


% --- Executes during object creation, after setting all properties.
function dxlbbanjing1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dxlbbanjing1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function percent_Callback(hObject, eventdata, handles)
% hObject    handle to percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global percentg
percentg = get(handles.percent,'Value');
percentg = roundn(percentg,-3);
set(handles.percent,'Value',percentg);
set(handles.percent1,'String',num2str(percentg));

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function percent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function percent1_Callback(hObject, eventdata, handles)
% hObject    handle to percent1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global percentg
set(handles.percent1,'String',num2str(percentg));
% Hints: get(hObject,'String') returns contents of percent1 as text
%        str2double(get(hObject,'String')) returns contents of percent1 as a double


% --- Executes during object creation, after setting all properties.
function percent1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percent1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function ato_Callback(hObject, eventdata, handles)
% hObject    handle to ato (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ato
ato = get(handles.ato,'Value');
ato = int32(ato);
set(handles.ato,'Value',ato);
set(handles.ato1,'String',num2str(ato));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function ato_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ato (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function ato1_Callback(hObject, eventdata, handles)
% hObject    handle to ato1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ato
set(handles.ato1,'String',num2str(ato));
% Hints: get(hObject,'String') returns contents of ato1 as text
%        str2double(get(hObject,'String')) returns contents of ato1 as a double


% --- Executes during object creation, after setting all properties.
function ato1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ato1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I  minR daoR ato percentg
clc
percent1 = percentg;
axes(handles.chulihou);
blocksize = 2*minR + 1              %每个block为15个像素
t0=0.1;


 grayI=rgb2gray(I);
%统计<50的像素所占的比例

%%%%%%%%%%%%%%%%%%%%%%

[COUNT, x]=imhist(grayI);

under_50=0;

for i=0:50

    under_50=under_50+COUNT(x==i);

end

total=size(I,1)*size(I,2)*size(I,3);


%%%%%%%%%%%%%%%%%%%%%%

w0 = percent1

[h,w,s]=size(I);

min_I=zeros(h,w);

for i=1:h                 

    for j=1:w

        dark_I(i,j)=min(I(i,j,:));%取每个点的像素为RGB分量中最低的那个通道的值

    end

end

Radius = (blocksize-1)/2;

dark_channel = double(ordfilt2(dark_I,1,ones(blocksize,blocksize)));  %进行窗口大小为blocksize的最小值滤波

Max_dark_channel=double(max(max(dark_I)))

A = double(ato)
t=1-w0*(dark_channel/Max_dark_channel);  %求得透射率
t=max(t,t0);
T=uint8(t*255);

I_guide_norm = double(rgb2gray(I))/255;  %以灰度图作为导向图，并进行归一化
t_norm = t/255;
eps = 0.0005;
r = daoR
t = guidedfilter(I_guide_norm,t,r,eps);

T=uint8(t*255);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I1=double(I);

% J(:,:,1) = uint8((I1(:,:,1) - (1-t)*Max_dark_channel)./t);
% 
% J(:,:,2) = uint8((I1(:,:,2) - (1-t)*Max_dark_channel)./t);
% 
% J(:,:,3) =uint8((I1(:,:,3) - (1-t)*Max_dark_channel)./t);
J(:,:,1) = uint8((I1(:,:,1) - (1-t)*A)./t);

J(:,:,2) = uint8((I1(:,:,2) - (1-t)*A)./t);

J(:,:,3) =uint8((I1(:,:,3) - (1-t)*A)./t);

imshow(1.5*J);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

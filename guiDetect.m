function varargout = guiDetect(varargin)
% GUIDETECT MATLAB code for guiDetect.fig
%      GUIDETECT, by itself, creates a new GUIDETECT or raises the existing
%      singleton*.
%
%      H = GUIDETECT returns the handle to a new GUIDETECT or the handle to
%      the existing singleton*.
%
%      GUIDETECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDETECT.M with the given input arguments.
%
%      GUIDETECT('Property','Value',...) creates a new GUIDETECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiDetect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiDetect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiDetect

% Last Modified by GUIDE v2.5 21-Jan-2017 15:02:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiDetect_OpeningFcn, ...
                   'gui_OutputFcn',  @guiDetect_OutputFcn, ...
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


% --- Executes just before guiDetect is made visible.
function guiDetect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiDetect (see VARARGIN)

% Choose default command line output for guiDetect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiDetect wait for user response (see UIRESUME)
% uiwait(handles.mainGUI);


% --- Outputs from this function are returned to the command line.
function varargout = guiDetect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFile as text
%        str2double(get(hObject,'String')) returns contents of txtFile as a double


% --- Executes during object creation, after setting all properties.
function txtFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnBrowse.
function btnBrowse_Callback(hObject, ~, handles)
% hObject    handle to btnBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, filepath] = uigetfile('*.*', 'Open an image');
fullpathname = strcat(filepath, filename);
set(handles.txtFile, 'String', fullpathname);
handles.fullpathname = fullpathname;
handles.image = imread(fullpathname);
axes(handles.axOri);
imshow(handles.image);
axes(handles.axPrev);
imshow(handles.image);

handles.scale = 2.6316e-01;

guidata(hObject, handles);

% --- Executes on button press in btnUpdate.
function btnUpdate_Callback(hObject, ~, handles)
% hObject    handle to btnUpdate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

toptrim = str2double(get(handles.txtTop, 'String'));
bottrim = str2double(get(handles.txtBot, 'String'));
threshold = str2double(get(handles.txtTh, 'String'));

handles.image = imread(handles.fullpathname);
handles.image = handles.image(toptrim+1:end-bottrim, :);

axes(handles.axOri);
imshow(handles.image);

inv = get(handles.chkInvert, 'Value');

if(threshold > 0 && inv==0)
    handles.image = handles.image<=threshold;
elseif(threshold > 0 && inv==1)
    handles.image = handles.image>=threshold;
end



axes(handles.axPrev);
imshow(handles.image);





guidata(hObject, handles);


% --- Executes on button press in chkInvert.
function chkInvert_Callback(hObject, eventdata, handles)
% hObject    handle to chkInvert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkInvert



function txtTh_Callback(hObject, eventdata, handles)
% hObject    handle to txtTh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTh as text
%        str2double(get(hObject,'String')) returns contents of txtTh as a double


% --- Executes during object creation, after setting all properties.
function txtTh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTop_Callback(hObject, eventdata, handles)
% hObject    handle to txtTop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTop as text
%        str2double(get(hObject,'String')) returns contents of txtTop as a double


% --- Executes during object creation, after setting all properties.
function txtTop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtBot_Callback(hObject, eventdata, handles)
% hObject    handle to txtBot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtBot as text
%        str2double(get(hObject,'String')) returns contents of txtBot as a double


% --- Executes during object creation, after setting all properties.
function txtBot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtBot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnCalc.
function btnCalc_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = handles.image;
cw = bwconncomp(img);
totalluas = sum(sum(img));
totalluascm = totalluas*handles.scale^2;
luas = [];
for j=1:cw.NumObjects
    luas = [luas; length(cw.PixelIdxList{j})];
end
persentaseLuas = totalluas*100/(size(img, 1)*size(img, 2));
msg1 = sprintf('Total area = %d pixel = %.2f micronm^2, percentage = %.2f%%, n = %d', totalluas, totalluascm, persentaseLuas, cw.NumObjects);
h=figure;
hist(luas, 30);
xlabel('Detected area');
ylabel('Frequency');
ax=gca;
xmax = ax.XLim(2);
ymax = ax.YLim(2);

text(xmax/4, ymax/2, msg1);


% --- Executes on button press in brnExit.
function brnExit_Callback(hObject, eventdata, handles)
% hObject    handle to brnExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.mainGUI);

% --- Executes on button press in btnBrowseFolder.
function btnBrowseFolder_Callback(hObject, eventdata, handles)
% hObject    handle to btnBrowseFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folderPath = uigetdir;
cc = strsplit(folderPath, '/');
foldername = cc{end};
set(handles.txtFolder, 'String', foldername);
handles.folderPath = folderPath;
guidata(hObject, handles);

% --- Executes on button press in btnProc.
function btnProc_Callback(hObject, eventdata, handles)
% hObject    handle to btnProc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

toptrim = str2double(get(handles.txtTop, 'String'));
bottrim = str2double(get(handles.txtBot, 'String'));
threshold = str2double(get(handles.txtTh, 'String'));

inv = get(handles.chkInvert, 'Value');

curdir = pwd;
folder = handles.folderPath;
cd(folder);

fileoutput = strcat(get(handles.txtFolder, 'String'), '.csv');
filehist = strcat(get(handles.txtFolder, 'String'), '_hist.csv');
fout = fopen(fileoutput, 'w');
fhist = fopen(filehist, 'w');
fprintf(fout, 'Name, Total Area (micronm^2), Percentage, Number\n');
fprintf(fhist, 'Name ');
xsc = [0.07:0.07:1 1:2:20 20:10:100 100:50:250 250:250:500];
for j=1:length(xsc)-1
    fprintf(fhist, ', %.2f - %.2f',  xsc(j), xsc(j+1));
end
fprintf(fhist, ', > %.2f', xsc(end));
fprintf(fhist, '\n');
files = dir('*.tif');
num = 0;
persentase = 0;
for i=1:size(files, 1)
    curfile = files(i).name;
    img0 = imread(curfile);
    img0 = img0(toptrim+1:end-bottrim, :);
    if(threshold > 0 && inv==0)
        img = img0<=threshold;
    elseif(threshold > 0 && inv==1)
        img = img0>=threshold;
    end
    cw = bwconncomp(img);
    totalluas = sum(sum(img));
    luas = [];
    for j=1:cw.NumObjects
        luas = [luas; length(cw.PixelIdxList{j})];
    end
    disp(curfile)
    persentaseLuas = totalluas*100/(size(img, 1)*size(img, 2));
    msg = sprintf('Total luas = %d, banyak lubang = %d', totalluas, cw.NumObjects);
    fprintf(fout, '%s, %.2f, %.2f, %d\n', curfile, totalluas*handles.scale^2, persentaseLuas, cw.NumObjects);
    luas = luas.*handles.scale^2;
    
    persentase = persentase + persentaseLuas;
    
    hc = histc(luas, xsc);
    hc = reshape(hc, length(hc), 1);
    fprintf(fhist, '%s', curfile);
    for j=1:length(hc)
        fprintf(fhist, ', %d', hc(j));
    end
    fprintf(fhist, '\n');
    num = num + 1;
end


%fprintf('Rata-rata persentase luas %s = %.2f', dirsall(k).name, persentase/num);

fclose(fout);
fclose(fhist);
cd(curdir);



% --- Executes during object creation, after setting all properties.
function txtFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

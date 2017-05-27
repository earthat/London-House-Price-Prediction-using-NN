function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 30-Apr-2017 17:28:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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

% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using main.
if strcmp(get(hObject,'Visible'),'off')
%     plot(rand(5));
end

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;
load data2013_2014
popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        msgbox('Please Select The Quarter of Year')
    case 2
        daysahead=abs(datenum('1-Jan-2017')-datenum('31-March-2017'));
        predictedop=NNtraining1(daysahead,data2013_2014);
        startDate = datenum('1-Jan-2017');
         endDate = datenum('31-March-2017');
         xData = linspace(startDate,endDate,abs((startDate-endDate)));
         cla,legend('off')  
         plot(xData,predictedop,'-o')
         datetick('x',['dd','mmm'],'keepticks'),axis tight
%         plot(predictedop)
    case 3
         daysahead=abs(datenum('1-Jan-2017')-datenum('30-June-2017'));
         predictedop=NNtraining1(daysahead,data2013_2014);
         index=abs(datenum('1-April-2017')-datenum('30-June-2017'));
         startDate = datenum('1-April-2017');
         endDate = datenum('30-June-2017');
         xData = linspace(startDate,endDate,abs((startDate-endDate)));
         cla,legend('off') 
         plot(xData,predictedop(end:-1:end-index+1),'-o')
         datetick('x',['dd','mmm'],'keepticks'),axis tight
    case 4
        daysahead=abs(datenum('1-Jan-2017')-datenum('30-Sep-2017'));
         predictedop=NNtraining1(daysahead,data2013_2014);
         index=abs(datenum('1-July-2017')-datenum('30-Sep-2017'));
         startDate = datenum('1-July-2017');
         endDate = datenum('30-Sep-2017');
         xData = linspace(startDate,endDate,abs((startDate-endDate)));
         cla,legend('off') 

         plot(xData,predictedop(end:-1:end-index+1),'-o')
         datetick('x',['dd','mmm'],'keepticks'),axis tight
    case 5
        daysahead=abs(datenum('1-Jan-2017')-datenum('31-Dec-2017'));
         predictedop=NNtraining1(daysahead,data2013_2014);
         index=abs(datenum('1-Oct-2017')-datenum('31-Dec-2017'));
         startDate = datenum('1-Oct-2017');
         endDate = datenum('31-Dec-2017');
         xData = linspace(startDate,endDate,abs((startDate-endDate)));
         cla,legend('off') 

         plot(xData,predictedop(end:-1:end-index+1),'-o')
         datetick('x',['dd','mmm'],'keepticks')
         axis tight
end
save predictedop predictedop
handles.predictedop=predictedop;
handles.data2013_2014=data2013_2014;
handles.popup_sel_index=popup_sel_index;
guidata(hObject,handles)


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Select The Quarter Year', '1st Quarter', '2nd Quarter', '3rd Quarter', '4th Quarter'});


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
predictedop=handles.predictedop;
popup_sel_index=handles.popup_sel_index;
data2013_2014=handles.data2013_2014;
price=data2013_2014{1}(2:end,1);% transaction price
Transac_date=datenum(data2013_2014{2}(2:end)); % transaction date
prevstrt=find(Transac_date==datenum('1-Jan-0014'));
prevend=find(Transac_date==datenum('31-Dec-0014'));
switch popup_sel_index
    case 1
        msgbox('Please Select The Quarter of Year')
    case 2
        daysahead=abs(datenum('1-Jan-2017')-datenum('31-March-2017'));
       
        startDate = datenum('1-Jan-2017');
         endDate = datenum('31-March-2017');
         xData = linspace(startDate,endDate,abs((startDate-endDate)));
         cla,legend('off')   
         plot(xData,predictedop,'-ob')
         hold on
         plot(xData,price(prevstrt(1):prevstrt(1)+abs((startDate-endDate))-1),'-sr')
         datetick('x',['dd','mmm'],'keepticks'),axis tight
         grid on
         legend('HIP for 2016','HIP for 2017')
         set(handles.uitable1,'Data',[round(predictedop'),price(prevstrt(1):prevstrt(1)+abs((startDate-endDate))-1)])
%         plot(predictedop)
    case 3
         daysahead=abs(datenum('1-Jan-2017')-datenum('30-June-2017'));
        
         index=abs(datenum('1-April-2017')-datenum('30-June-2017'));
         startDate = datenum('1-April-2017');
         endDate = datenum('30-June-2017');
         prevstrt=find(Transac_date==datenum('1-April-0014'));
         xData = linspace(startDate,endDate,abs((startDate-endDate)));
         cla,legend('off') 

         plot(xData,predictedop(end:-1:end-index+1),'-ob')
         hold on
         plot(xData,price(prevstrt(1):prevstrt(1)+abs((startDate-endDate))-1),'-sr')
         datetick('x',['dd','mmm'],'keepticks'),axis tight
         grid on
         legend('HIP for 2016','HIP for 2017')
         set(handles.uitable1,'Data',[round(predictedop(end:-1:end-index+1)'),price(prevstrt(1):prevstrt(1)+abs((startDate-endDate))-1)])
    case 4
        daysahead=abs(datenum('1-Jan-2017')-datenum('30-Sep-2017'));
        
         index=abs(datenum('1-July-2017')-datenum('30-Sep-2017'));
         startDate = datenum('1-July-2017');
         endDate = datenum('30-Sep-2017');
         prevstrt=find(Transac_date==datenum('1-July-0014'));
         xData = linspace(startDate,endDate,abs((startDate-endDate)));
         cla,legend('off') 

         plot(xData,predictedop(end:-1:end-index+1),'-ob')
         hold on
         plot(xData,price(prevstrt(1):prevstrt(1)+abs((startDate-endDate))-1),'-sr')
         datetick('x',['dd','mmm'],'keepticks'),axis tight
         grid on
         legend('HIP for 2016','HIP for 2017')
         set(handles.uitable1,'Data',[round(predictedop(end:-1:end-index+1)'),price(prevstrt(1):prevstrt(1)+abs((startDate-endDate))-1)])
    case 5
        daysahead=abs(datenum('1-Jan-2017')-datenum('31-Dec-2017'));
        
         index=abs(datenum('1-Oct-2017')-datenum('31-Dec-2017'));
         startDate = datenum('1-Oct-2017');
         endDate = datenum('31-Dec-2017');
         prevstrt=find(Transac_date==datenum('1-Oct-0014'));         
         xData = linspace(startDate,endDate,abs((startDate-endDate)));
         cla,legend('off') 

         plot(xData,predictedop(end:-1:end-index+1),'-ob')
         hold on
         plot(xData,price(prevstrt(1):prevstrt(1)+abs((startDate-endDate))-1),'-sr')
         datetick('x',['dd','mmm'],'keepticks'),axis tight
         grid on
         legend('HIP for 2016','HIP for 2017')
         axis tight
         set(handles.uitable1,'Data',[round(predictedop(end:-1:end-index+1)'),price(prevstrt(1):prevstrt(1)+abs((startDate-endDate))-1)])
end

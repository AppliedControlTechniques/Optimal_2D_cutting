function [] = read_(varargin)
% Callback for pushbutton, adds new string from edit box.
S = varargin{3};  % Get the structure.
handler_listbox=evalin('base','handler_listbox');
try
    B=evalin('base','input');
catch
end

[fname,pth] = uigetfile('.txt'); % Type in name of file.
try
input=csvread([pth,fname]);
assignin('base','input',input);
catch
    f7 = errordlg('Bad input data (wrong format)','Error_f7'); 
   return;
end
input_string=num2str(input)

try
    set(handler_listbox,'string',input_string);
catch
end

end

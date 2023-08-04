function [] = remove_(varargin)
% Callback for pushbutton, adds new string from edit box.
S = varargin{3};  % Get the structure.
handler_listbox=evalin('base','handler_listbox');
try
    oldstr = get(handler_listbox,'Value'); % The string as it is now.
    % The order of the args to cat puts the new string either on top or bottom.
    %handler_listbox.String(oldstr)=[];
catch
end

try
input1=evalin('base','input');
input1(oldstr,:)=[];
catch
end

input_string=num2str(input1)
try
    set(handler_listbox,'value',1);
    set(handler_listbox,'string',input_string);
catch
end

assignin('base','input',input1);
set(handler_listbox,'visible','on');
end

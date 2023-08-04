function [] = add_(varargin)
% Callback for pushbutton, adds new string from edit box.
S = varargin{3};  % Get the structure.
handler_listbox=evalin('base','handler_listbox');
handler_edit=evalin('base','handler_edit');

%%adding the selected number
try
input2=evalin('base','input');
catch
    input2=[];
end
no_failures=0;
new_rectangle=str2num(get(handler_edit,'String'));
if length(new_rectangle)~=3
    f5 = errordlg('Bad input data','Error_f5');
    return;
end
if isnan(new_rectangle)==0
else
    f5 = errordlg('Bad input data','Error_f5');
    return;
end
[id_rows,id_columns]=size(input2);
if id_rows>0
    for i=1:1:id_rows
        if input2(i,1)==new_rectangle(1)&& input2(i,2)==new_rectangle(2)
            input2(i,3)=input2(i,3)+new_rectangle(3);
        else
            no_failures=no_failures+1;
        end
    end
    if no_failures==id_rows
        input2(id_rows+1,:)=new_rectangle;
    end
else
    input2=new_rectangle;
end
input_string=num2str(input2)
try
    set(handler_listbox,'string',input_string);
catch
end
assignin('base','input',input2);

end

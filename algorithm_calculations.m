function [] = algorithm_calculations(varargin)
% Callback for pushbutton, adds new string from edit box.
global plot_no;
plot_no=1;
global bin;
global S;
handler_text_area_levels=findobj(S.text_area_levels); 
handler_text_area_list=findobj(S.text_area_list);
handler_strip_packing=findobj(S.pb_strip_packing);
handler_bin_packing=findobj(S.pb_bin_packing);   
handler_listbox=findobj(S.ls);
handler_edit=findobj(S.ed);
handler_ed_width=findobj(S.ed_width);
handler_ed_height=findobj(S.ed_height);
handler_pb_add=findobj(S.pb_add);
handler_pb_remove=findobj(S.pb_remove);
handler_pb_save=findobj(S.pb_save);
handler_pb_read=findobj(S.pb_read);
handler_pb_calculate=findobj(S.pb_calculate);
handler_pulldown_list_strip=findobj(S.pulldown_list_strip);
handler_text_rectangles=findobj(S.text_rectangular);
handler_text_method=findobj(S.text_algorithm);
handler_text_width=findobj(S.text_width);
handler_text_height=findobj(S.text_height);
handler_pb_back_2_1=findobj(S.pb_back_2_1);
handler_pb_back_3_2=findobj(S.pb_back_3_2);
handler_pb_next_2_3=findobj(S.pb_next_2_3);
handler_pb_next_1_2=findobj(S.pb_next_1_2);
handler_pb_save_img=findobj(S.pb_save_img);
handler_text_area=findobj(S.text_area);
handler_no_board=findobj(S.which_board);
handler_save_all=findobj(S.pb_save_all);
handler_text_area_total=findobj(S.text_area_total);

try
%S = varargin{3}  % Get the structure.
handler_text_area_levels=findobj(S.text_area_levels); 
handler_text_area_list=findobj(S.text_area_list);
handler_strip_packing=findobj(S.pb_strip_packing);
handler_bin_packing=findobj(S.pb_bin_packing);   
handler_listbox=findobj(S.ls);
handler_edit=findobj(S.ed);
handler_ed_width=findobj(S.ed_width);
handler_ed_height=findobj(S.ed_height);
handler_pb_add=findobj(S.pb_add);
handler_pb_remove=findobj(S.pb_remove);
handler_pb_save=findobj(S.pb_save);
handler_pb_read=findobj(S.pb_read);
handler_pb_calculate=findobj(S.pb_calculate);
handler_pulldown_list_strip=findobj(S.pulldown_list_strip);
handler_text_rectangles=findobj(S.text_rectangular);
handler_text_method=findobj(S.text_algorithm);
handler_text_width=findobj(S.text_width);
handler_text_height=findobj(S.text_height);
handler_pb_back_2_1=findobj(S.pb_back_2_1);
handler_pb_back_3_2=findobj(S.pb_back_3_2);
handler_pb_next_2_3=findobj(S.pb_next_2_3);
handler_pb_next_1_2=findobj(S.pb_next_1_2);
handler_pb_save_img=findobj(S.pb_save_img);
handler_text_area=findobj(S.text_area);
handler_no_board=findobj(S.which_board);
handler_save_all=findobj(S.pb_save_all);
handler_text_area_total=findobj(S.text_area_total);
 handler_pulldown_list_strip=S.pulldown_list_strip;
 handler_ed_width=S.ed_width;
 handler_ed_height=S.ed_height;
input=evalin('base','input');
W=get(handler_ed_width,'String');
W=str2num(W);
if isnan(W)==0
else
   f1 = errordlg('Bad width format','Error_f1'); 
   return;
end
if W<max(input(:,2))
   f2 = errordlg('Width is too low','Error_f2'); 
   return; 
end
catch
end
if bin==1
try
    H=get(handler_ed_height,'String');
    H=str2num(H);
    if isnan(H)==0
    else
        f3 = errordlg('Bad height format','Error_f3'); 
        return;
    end
    if H<max(input(:,1))
        f4 = errordlg('Height is too low','Error_f4'); 
        return; 
    end
catch
end
end
 handler_text_area=S.text_area;
 handler_text_area_levels=S.text_area_levels;
 handler_no_board=S.which_board;
try
    cla(gca,'reset');
    set(handler_text_area,'String')=[];
    set(handler_no_board,'String')=[];
catch
end

no_algorithm = get(handler_pulldown_list_strip,'Value');

handler_save_all=findobj(S.pb_save_all);
handler_strip_packing=findobj(S.pb_strip_packing);
handler_bin_packing=findobj(S.pb_bin_packing);
handler_listbox=findobj(S.ls);
handler_edit=findobj(S.ed);
handler_ed_width=findobj(S.ed_width);
handler_ed_height=findobj(S.ed_height);
handler_pb_add=findobj(S.pb_add);
handler_pb_remove=findobj(S.pb_remove);
handler_pb_read=findobj(S.pb_read);
handler_pb_save=findobj(S.pb_save);
handler_pulldown_list_strip=findobj(S.pulldown_list_strip);
handler_pb_calculate=findobj(S.pb_calculate);
handler_text_rectangles=findobj(S.text_rectangular);
handler_text_method=findobj(S.text_algorithm);
handler_text_area=findobj(S.text_area);
handler_text_method=findobj(S.text_width);
handler_text_height=findobj(S.text_height);
handler_pb_back_2_1=findobj(S.pb_back_2_1);
handler_pb_back_3_2=findobj(S.pb_back_3_2);
handler_pb_next_1_2=findobj(S.pb_next_1_2);
handler_pb_next_2_3=findobj(S.pb_next_2_3);
handler_pb_save_img=findobj(S.pb_save_img);
handler_text_area_total=findobj(S.text_area_total);
handler_text_area_list=findobj(S.text_area_list);

if bin==1
set(handler_text_area_levels,'Visible','on');
end
set(handler_text_area_total,'Visible','on');
set(handler_save_all,'Visible','on');
set(handler_strip_packing,'Visible','off');
set(handler_bin_packing,'Visible','off');
set(handler_listbox,'Visible','off');
set(handler_edit,'Visible','off');
set(handler_ed_width,'Visible','off');
set(handler_ed_height,'Visible','off');
set(handler_pb_add,'Visible','off');
set(handler_pb_remove,'Visible','off');
set(handler_pb_read,'Visible','off');
set(handler_pb_save,'Visible','off');
set(handler_pb_calculate,'Visible','off');
set(handler_pulldown_list_strip,'Visible','off');
set(handler_text_rectangles,'Visible','off');
set(handler_text_method,'Visible','off');
set(handler_text_width,'Visible','off');
set(handler_text_height,'Visible','off');
set(handler_pb_back_2_1,'Visible','off');
set(handler_pb_back_3_2,'Visible','on');
set(handler_pb_next_1_2,'Visible','off');
set(handler_pb_next_2_3,'Visible','off');
set(handler_pb_save_img,'Visible','on');
set(handler_text_area,'Visible','on');

if bin==0
   set(handler_pulldown_list_strip,'Value',1);
if no_algorithm==1
    [c_area,wys]=function_NFDH(input,W)
    set(gca,'Position',[0.1,0.4,0.85,0.55]);
elseif no_algorithm==2;
    [c_area,wys]=function_FFDH(input,W)
    set(gca,'Position',[0.1,0.4,0.85,0.55]);
elseif no_algorithm==3;
    [c_area,wys]=function_BFDH(input,W);
    set(gca,'Position',[0.1,0.4,0.85,0.55]);
elseif no_algorithm==4
    [c_area,wys]=function_BL(input,W);
    set(gca,'Position',[0.1,0.4,0.85,0.55]);
end
elseif bin==1
    set(handler_no_board,'Visible','on');
    if no_algorithm==1
    [nkp,ind,x_fig,maximal_,input_function,c_area]=function_HFF(input,W,H)
    set(gca,'Position',[0.1,0.4,0.85,0.55]);
    assignin('base','nkp',nkp);
    assignin('base','ind',ind);
    assignin('base','x_fig',x_fig);
    assignin('base','maximal_',maximal_);
    assignin('base','input_function',input_function);
    data=[]
    for i=1:1:max(nkp)
        data = [data ; num2str(i)];
        set(handler_no_board,'String',data);
    end
        
    elseif no_algorithm==2;
        [nkp,x_fig,y_fig,input_function,c_area]=function_FFF(input,W,H)
        set(gca,'Position',[0.1,0.4,0.85,0.55]);
        assignin('base','nkp',nkp);
        assignin('base','x_fig',x_fig);
        assignin('base','y_fig',y_fig);
        assignin('base','input_function',input_function);
        data=[]
        for i=1:1:max(nkp)
            data = [data ; num2str(i)];
            set(handler_no_board,'String',data);
        end
    
    elseif no_algorithm==3;
        [nkp,ind,x_fig,y_fig,input_function,c_area]=function_FBL(input,W,H);
        set(gca,'Position',[0.1,0.4,0.85,0.55]);
        assignin('base','nkp',nkp);
        assignin('base','ind',ind);
        assignin('base','x_fig',x_fig);
        assignin('base','y_fig',y_fig);
        assignin('base','input_function',input_function);
        data=[]
        for i=1:1:max(nkp)
            data = [data ; num2str(i)];
            set(handler_no_board,'String',data);
        end
    end
end
    assignin('base','area',c_area);
if bin==1
do_pick;
end
for i=1:1:length(c_area)
    try
    oldstr = get(handler_text_area,'string'); % The string as it is now.
    if bin==0
        addstr=strcat('Level ',num2str(i));
    else
        addstr=strcat('Unit ',num2str(i));
    end
    addstr=strcat(addstr,' - ');
    addstr = strcat(addstr,num2str(c_area(i))); % The string to add to the stack.
    % The order of the args to cat puts the new string either on top or bottom.
    data1=strvcat(oldstr,addstr)
    set(handler_text_area,'String',data1);  % Put the new string on bottom.
    catch
    if bin==0
        addstr=strcat('Level ',num2str(i));
    else
        addstr=strcat('Unit ',num2str(i));
    end
    addstr=strcat(addstr,' - ');
    class(addstr)
    addstr = strcat(addstr,num2str(c_area(i)));
    class(addstr)
    set(handler_text_area,'String',addstr);
    end
end
    string_c_area=sprintf('Total area:\n\n');
    calkowitec_area=strcat(string_c_area,num2str(sum(c_area)));
    if bin==0
        percent_=sprintf('(%.2f%%)',sum(c_area)/(wys*W)*100);
        assignin('base','percent',percent_);
    elseif bin==1
        percent_=sprintf('(%.2f%%)',sum(c_area)/(max(nkp)*W*H)*100);
        assignin('base','percent',percent_);
    end
    total_area1=strvcat(calkowitec_area,percent_);
    set(handler_text_area_total,'String',total_area1);
end

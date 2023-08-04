function [] = strip_packing(varargin)
global bin;
bin=0;
global plot_no;
plot_no=0;
%S=varargin{3};
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

set(handler_strip_packing,'Visible','off');
set(handler_bin_packing,'Visible','off');
set(handler_listbox,'Visible','on');
set(handler_edit,'Visible','on');
set(handler_ed_width,'Visible','on');
set(handler_ed_height,'Visible','off');
set(handler_pb_add,'Visible','on');
set(handler_pb_remove,'Visible','on');
set(handler_pb_read,'Visible','on');
set(handler_pb_save,'Visible','on');
set(handler_pb_calculate,'Visible','on');
set(handler_pulldown_list_strip,'string',{'NFDH','FFDH','BFDH','BL'});
set(handler_pulldown_list_strip,'Visible','on');
set(handler_text_rectangles,'Visible','on');
set(handler_text_method,'Visible','on');
set(handler_text_area,'Visible','off');
set(handler_text_width,'Visible','on');
set(handler_text_height,'Visible','off');
set(handler_pb_back_2_1,'Visible','on');
set(handler_pb_back_3_2,'Visible','off');
set(handler_pb_next_1_2,'Visible','off');
set(handler_pb_next_2_3,'Visible','off');
set(handler_pb_save_img,'Visible','off');
set(handler_no_board,'Visible','off');
end
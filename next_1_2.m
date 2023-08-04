function [] = next_1_2(varargin)
global bin;
%S=varargin{3};
handler_save_all=evalin('base','handler_save_all');
handler_text_area_levels=evalin('base','handler_text_area_levels');
handler_strip_packing=evalin('base','handler_strip_packing');
handler_bin_packing=evalin('base','handler_bin_packing');
handler_listbox=evalin('base','handler_listbox');
handler_edit=evalin('base','handler_edit');
handler_ed_width=evalin('base','handler_ed_width');
if bin==1
handler_ed_height=evalin('base','handler_ed_height');
end
handler_pb_add=evalin('base','handler_pb_add');
handler_pb_remove=evalin('base','handler_pb_remove');
handler_pb_read=evalin('base','handler_pb_read');
handler_pb_save=evalin('base','handler_pb_save');
handler_pulldown_list_strip=evalin('base','handler_pulldown_list_strip');
handler_pb_calculate=evalin('base','handler_pb_calculate');
handler_text_rectangles=evalin('base','handler_text_rectangles');
handler_text_method=evalin('base','handler_text_method');
handler_text_area=evalin('base','handler_text_area');
handler_text_width=evalin('base','handler_text_width');
if bin==1
handler_text_height=evalin('base','handler_text_height');
end
handler_pb_back_2_1=evalin('base','handler_pb_back_2_1');
handler_pb_back_3_2=evalin('base','handler_pb_back_3_2');
handler_pb_next_2_3=evalin('base','handler_pb_next_2_3');
handler_pb_next_1_2=evalin('base','handler_pb_next_1_2');
handler_pb_save_img=evalin('base','handler_pb_save_img');
handler_no_board=evalin('base','handler_no_board');
handler_text_area_total=evalin('base','handler_text_area_total');
handler_text_area_list=evalin('base','handler_text_area_list');

set(handler_text_area_list,'Visible','off');
set(handler_text_area_levels,'Visible','off');
set(handler_text_area_total,'Visible','off');
set(handler_save_all,'Visible','off');
set(handler_strip_packing,'Visible','off');
set(handler_bin_packing,'Visible','off');
set(handler_listbox,'Visible','on');
set(handler_edit,'Visible','on');
set(handler_ed_width,'Visible','on');
if bin==1
set(handler_ed_height,'Visible','on');
end
set(handler_pb_add,'Visible','on');
set(handler_pb_remove,'Visible','on');
set(handler_pb_read,'Visible','on');
set(handler_pb_save,'Visible','on');
set(handler_pb_calculate,'Visible','on');
set(handler_pulldown_list_strip,'Visible','on');
set(handler_text_rectangles,'Visible','on');
set(handler_text_method,'Visible','on');
set(handler_text_area,'Visible','off');
set(handler_text_width,'Visible','on');
if bin==1
set(handler_text_height,'Visible','on');
end
set(handler_pb_back_2_1,'Visible','on');
set(handler_pb_back_3_2,'Visible','off');
set(handler_pb_next_2_3,'Visible','on');
set(handler_pb_next_1_2,'Visible','off');
set(handler_pb_save_img,'Visible','off');
set(handler_no_board,'Visible','off');
try
set(gca,'visible','off') %hide the current axes
set(get(gca,'children'),'visible','off') %hide the current axes contents
catch
end
end
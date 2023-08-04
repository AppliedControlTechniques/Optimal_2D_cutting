clear all
close all
global bin;
global S; 
bin=0;
a=figure('units','pixels',...
              'position',[350 150 480 480],...
              'menubar','none',...
              'resize','off',...
              'numbertitle','off',...
              'name','2D cutting'); 
          
S.pb_strip_packing=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[140 280 200 50],...
                 'HorizontalAlign','left',...
                 'string','Strip packing',...
                 'fontsize',20,...
                 'callback',{@strip_packing});     
             
S.pb_bin_packing=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[140 200 200 50],...
                 'HorizontalAlign','left',...
                 'string','Bin packing',...
                 'fontsize',20,...
                 'callback',{@bin_packing});

%% listbox
 S.ls=uicontrol('style','list',...
              'units','pix',...
              'Userdata','input',...
              'fontname','courier',...
              'position',[20 280 190 120],...
              'backgroundcolor','w',...
              'visible','off',...
              'HorizontalAlign','left');            
%% editboxy
S.text_rectangular=uicontrol('style','text',...
                 'units','pix',...
                 'position',[20 420 200 50],...
                 'HorizontalAlign','left',...
                 'string','Input data [H, W, D]:',...
                 'fontsize',11,...
                 'visible','off');
S.ed=uicontrol('style','edit',...
                 'units','pix',...
                 'position',[20 410 190 20],...
                 'min',0,'max',1,...  % This is the key to multiline edits.                 
                 'horizontalalign','center',...
                 'visible','off',...
                 'fontsize',11);

S.text_width=uicontrol('style','text',...
                 'units','pix',...
                 'position',[20 135 150 50],...
                 'HorizontalAlign','left',...
                 'string','Unit width:',...
                 'fontsize',11,...
                 'visible','off');             
             
S.ed_width=uicontrol('style','edit',...
                 'units','pix',...
                 'position',[20 140 50 20],...
                 'min',0,'max',1,...  % This is the key to multiline edits.
                 'visible','off',...
                 'horizontalalign','center',...
                 'fontsize',11);

S.text_height=uicontrol('style','text',...
                 'units','pix',...
                 'position',[170 135 150 50],...
                 'HorizontalAlign','left',...
                 'string','Unit height:',...
                 'fontsize',11,...
                 'visible','off');             
             
S.ed_height=uicontrol('style','edit',...
                 'units','pix',...
                 'position',[170 140 50 20],...
                 'min',0,'max',1,...  % This is the key to multiline edits.
                 'visible','off',...
                 'horizontalalign','center',...
                 'fontsize',11);
%% pushbuttony
S.pb_next_2_3=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[420 20 50 30],...
                 'HorizontalAlign','left',...
                 'string','>>',...
                 'fontsize',20,...
                 'visible','off',...
                 'callback',{@next_2_3});
             
S.pb_next_1_2=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[420 20 50 30],...
                 'HorizontalAlign','left',...
                 'string','>>',...
                 'fontsize',20,...
                 'visible','off',...
                 'callback',{@next_1_2});
             
S.pb_back_2_1=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[10 20 50 30],...
                 'HorizontalAlign','left',...
                 'string','<<',...
                 'fontsize',20,...
                 'visible','off',...
                 'callback',{@back_2_1});
             
S.pb_back_3_2=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[10 20 50 30],...
                 'HorizontalAlign','left',...
                 'string','<<',...
                 'fontsize',20,...
                 'visible','off',...
                 'callback',{@back_3_2});             
             
S.pb_add=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[220 400 150 30],...
                 'HorizontalAlign','left',...
                 'string','Add',...
                 'fontsize',11,...
                 'visible','off',...
                 'callback',{@add_,S});

S.pb_remove=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[220 360 150 30],...
                 'HorizontalAlign','left',...
                 'string','Remove',...
                 'fontsize',11,...
                 'visible','off',...
                 'callback',{@remove_,S});  

S.pb_save=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[220 320 150 30],...
                 'HorizontalAlign','left',...
                 'string','Save to file',...
                 'fontsize',11,...
                 'visible','off',...
                 'callback',{@save_,S}); 
             
S.pb_read=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[220 280 150 30],...
                 'HorizontalAlign','left',...
                 'string','Read from file',...
                 'fontsize',11,...
                 'visible','off',...
                 'callback',{@read_,S}); 
             
S.pb_calculate=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[20 80 150 30],...
                 'HorizontalAlign','left',...
                 'string','Optimize!',...
                 'fontsize',15,...
                 'visible','off',...
                 'callback',{@algorithm_calculations,S});
             
S.pb_save_img=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[300 130 150 30],...
                 'HorizontalAlign','left',...
                 'string','Zapisz obraz',...
                 'fontsize',12,...
                 'visible','off',...
                 'callback',{@save_img});
             
S.pb_save_all=uicontrol('style','pushbutton',...
                 'units','pix',...
                 'position',[300 80 150 30],...
                 'HorizontalAlign','left',...
                 'string','Save all data',...
                 'fontsize',12,...
                 'visible','off',...
                 'callback',{@save_all});

%% rozwijana lista
S.text_algorithm=uicontrol('style','text',...
                 'units','pix',...
                 'position',[20 195 150 50],...
                 'HorizontalAlign','left',...
                 'string','Select algorithm:',...
                 'fontsize',11,...
                 'visible','off');
S.pulldown_list_strip = uicontrol('Style', 'popup',...
                   'String', {'NFDH','FFDH','BFDH','BL'},...
                   'visible','off',...
                   'Position', [20 170 100 50]);   
               
S.text_area=uicontrol('style','list',...
              'units','pix',...
              'Userdata','input',...
              'position',[70 30 100 100],...
              'backgroundcolor','w',...
              'visible','off',...
              'HorizontalAlign','left');  

          S.text_area_total=uicontrol('style','text',...
                 'units','pix',...
                 'position',[180 40 120 50],...
                 'HorizontalAlign','left',...
                 'string','Total area:',...
                 'fontsize',11,...
                 'visible','off');
             
           S.text_area_levels=uicontrol('style','text',...
                 'units','pix',...
                 'position',[180 100 120 50],...
                 'HorizontalAlign','left',...
                 'string','Select unit:',...
                 'fontsize',11,...
                 'visible','off');
             
           S.text_area_list=uicontrol('style','text',...
                 'units','pix',...
                 'position',[70 130 50 20],...
                 'HorizontalAlign','left',...
                 'string','Area:',...
                 'fontsize',11,...
                 'visible','off');
          
S.which_board=uicontrol('style','popup',...
              'units','pix',...
              'Userdata','input',...
              'position',[180 30 100 100],...
              'backgroundcolor','w',...
              'visible','off',...
              'HorizontalAlign','left',...
              'callback',{@do_pick});  
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
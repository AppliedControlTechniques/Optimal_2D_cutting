function [] = do_pick(varargin)
handler_no_board=evalin('base','handler_no_board');
handler_ed_width=evalin('base','handler_ed_width');
handler_ed_height=evalin('base','handler_ed_height');
handler_pulldown_list_strip=evalin('base','handler_pulldown_list_strip');
no_algorithm = handler_pulldown_list_strip.Value;
W=get(handler_ed_width,'String');
W=str2num(W);
try
    H=get(handler_ed_height,'String');
    H=str2num(H);
    cla(gca,'reset');
catch
end

try
board_number=get(handler_no_board,'Value');
catch
    board_number=1;
end

%% HFF
if no_algorithm==1
    nkp=evalin('base','nkp');
    ind=evalin('base','ind');
    x_fig=evalin('base','x_fig');
    maximal_=evalin('base','maximal_');
    input_function=evalin('base','input_function');

        y_for_plotting_board=0;
        m=find(nkp==board_number); 
        for id_row__=m
            n=find(ind==id_row__); 
            for id_column__=n
                rectangle('Position',[x_fig(id_row__,id_column__) y_for_plotting_board input_function(id_column__,2) input_function(id_column__,1)],'FaceColor','b')
                axis([0 W 0 H])
               
            end
            y_for_plotting_board=y_for_plotting_board+maximal_(id_row__); 
        end
%%FFF        
elseif no_algorithm==2
    nkp=evalin('base','nkp');
    x_fig=evalin('base','x_fig');
    y_fig=evalin('base','y_fig');
    input_function=evalin('base','input_function');
    n=find(nkp==board_number); 

    for p=n
       rectangle('Position',[x_fig(p) y_fig(p) input_function(p,2) input_function(p,1)],'FaceColor','b')
       axis([0 W 0 H])
    end
    
elseif no_algorithm==3
    nkp=evalin('base','nkp');
    ind=evalin('base','ind');
    x_fig=evalin('base','x_fig');
    y_fig=evalin('base','y_fig');
    input_function=evalin('base','input_function');
    n=find(ind==board_number); 
    for p=n
       rectangle('Position',[x_fig(p) y_fig(p) input_function(p,2) input_function(p,1)],'FaceColor','b')
       axis([0 W 0 H])
    end
end
end
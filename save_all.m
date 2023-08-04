function [] = save_all(varargin)
% % Callback for pushbutton, adds new string from edit box.
%S = varargin{3};  % Get the structure.
global bin;
handler_ed_width=evalin('base','handler_ed_width');
handler_ed_height=evalin('base','handler_ed_height');
handler_text_area=evalin('base','handler_text_area');
c_area=evalin('base','c_area');
handler_pulldown_list_strip=evalin('base','handler_pulldown_list_strip');
try
    input=evalin('base','input');
    Width=get(handler_ed_width,'string');
    if bin==1
        Height=get(handler_ed_height,'string');
    end
catch
end
if bin==1
    metoda=sprintf('Selected problem: \nBin packing');
    no_algorithm = handler_pulldown_list_strip.Value;
    if no_algorithm==1
        algorytm=sprintf('\n\nAlgorithm: \nHFF\n');
    elseif no_algorithm==2
        algorytm=sprintf('\n\nAlgorithm: \nFFF\n');
    elseif no_algorithm==3
        algorytm=sprintf('\n\nAlgorithm: \nFBL\n');
    end
    text_rectangular=sprintf('\n\nInput data:\n');
    [r,c]=size(input);
    prostokaty=[];
    for i=1:1:r
        prostokaty_pomocnicze=sprintf('\n%s',num2str(input(i,:)));
        prostokaty=[prostokaty prostokaty_pomocnicze];
    end
    Width_tekst=sprintf('\n\nUnit width:\n%s',Width)
    Height_tekst=sprintf('\n\nUnit height:\n%s',Height)
    id_row__=[];
    napis_c_area=sprintf('\n\nArea:');
    for i=1:1:length(c_area)
        c_area_tekst=sprintf('\nUnit %d - ',i)
        c_area_pomocnicze=sprintf('%s',num2str(c_area(i)))
        id_row__=horzcat(id_row__,c_area_tekst,c_area_pomocnicze)
    end
    cale_c_area=sprintf('\n\nTotal area:\n%d',sum(c_area));
    percent_1=evalin('base','percent');
    percent_owo=strcat(cale_c_area,percent_1)
    finalString1 = strcat(metoda,algorytm,text_rectangular,prostokaty,Width_tekst,Height_tekst,napis_c_area, id_row__)
    finalString=strcat(finalString1,percent_owo)
else
    metoda=sprintf('Selected problem: \nStrip packing');
        no_algorithm = handler_pulldown_list_strip.Value;
    if no_algorithm==1
        algorytm=sprintf('\n\nAlgorithm: \nNFDH\n');
    elseif no_algorithm==2
        algorytm=sprintf('\n\nAlgorithm: \nFFDH\n');
    elseif no_algorithm==3
        algorytm=sprintf('\n\nAlgorithm: \nBFDH\n');
    elseif no_algorithm==4
        algorytm=sprintf('\n\nAlgorithm: \nBL\n');
    end
    text_rectangular=sprintf('\n\nInput data:\n');
    [r,c]=size(input);
    prostokaty=[];
    for i=1:1:r
        prostokaty_pomocnicze=sprintf('\n%s',num2str(input(i,:)))
        prostokaty=[prostokaty prostokaty_pomocnicze]
    end
    Width_tekst=sprintf('\n\nUnit width:\n%s',Width)
        napis_c_area=sprintf('\n\nArea:');
        id_row__=[];
    for i=1:1:length(c_area)
        c_area_tekst=sprintf('\nLevel %d - ',i)
        c_area_pomocnicze=sprintf('%s',num2str(c_area(i)))
        id_row__=horzcat(id_row__,c_area_tekst,c_area_pomocnicze)
    end
    cale_c_area=sprintf('\n\nTotal area:\n%d',sum(c_area));
    percent_1=evalin('base','percent');
    percent_owo=strcat(cale_c_area,percent_1)
    finalString1 = strcat(metoda,algorytm,text_rectangular,prostokaty,Width_tekst,napis_c_area,id_row__);
    finalString=strcat(finalString1,percent_owo)
end
 [fname,pth] = uiputfile('.txt'); % Type in name of file.

fid = fopen([pth,fname],'wt');
fprintf(fid, finalString);
fclose(fid);
end

function [] = save_(varargin)
% % Callback for pushbutton, adds new string from edit box.
S = varargin{3};  % Get the structure.
try
    B=evalin('base','input');
catch
end

[fname,pth] = uiputfile('.txt'); % Type in name of file.
dlmwrite([pth,fname],B)
end

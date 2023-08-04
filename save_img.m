function [] = save_img(varargin)
global bin;
%S=varargin{3};
F = getframe(gcf,[20 160 450 310]);
Image = frame2im(F);
[fname,pth] = uiputfile('.bmp'); % Type in name of file.
imwrite(Image,[pth,fname]);

end
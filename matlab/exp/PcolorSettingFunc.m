function [output] = PcolorSettingFunc(pp,tlt,cc)

%%% Graph size

x0=50;
y0=50;
height = 800;
width=height*(4/3);

set(gcf,'position',[x0,y0,width,height])


%%% axis and label
ax = gca;
ax.YColor = 'k';
ax.FontSize = 32;
ax.FontName = 'Times New Roman';
ax.FontWeight = 'bold';
box on
ax.LineWidth = 4;
% grid on

ax.XLabel.FontSize = 48;
ax.YLabel.FontSize = 48;
% ax.XLabel.FontWeight = 'bold';
% ax.YLabel.FontWeight = 'bold';
ax.XLabel.Color = [0, 0, 0];
ax.YLabel.Color = [0, 0, 0];



%%% title
if tlt ==0
tlt = 0;
else
tlt.FontSize = 32; 
end

%%% colormap
load('vik.mat')
colormap(vik)
shading interp

%%% colorbar
cc.Label.FontSize = 32


%%%
output= 0;


end

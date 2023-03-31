% clear all

load('CalPowTransCoef_230302C_PrsVoid.mat');
fn = mfilename;

c_data_max = max(max(c_data));
save exp\data\c_data_max.mat c_data_max 
%%

fig = figure;
pp = pcolor(x_data, y_data, c_data/c_data_max);

xlabel('$x$ (mm)', 'Interpreter','latex');
ylabel('$y$ (mm)', 'Interpreter','latex');

clim([0, 1]);
tit = title('Nothing');

cc = colorbar;
cc.Label.String = 'Normalized digital siginal';


AAA = PcolorSettingFunc(pp,tit,cc)

print(sprintf('exp/fig/%s.jpg', fn),'-djpeg', sprintf('-r%s',num2str(300)));

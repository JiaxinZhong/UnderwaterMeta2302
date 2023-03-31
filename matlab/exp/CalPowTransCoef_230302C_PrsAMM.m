clear all

load('CalPowTransCoef_230302C_PrsAMM.mat');
load('c_data_max.mat')

fn = mfilename;

fig = figure;
pp = pcolor(x_data, y_data, c_data/c_data_max);

xlabel('$x$ (mm)', 'Interpreter','latex');
ylabel('$y$ (mm)', 'Interpreter','latex');

clim([0, 1]);
tit = title('Plate w/ AMM');

cc = colorbar;
cc.Label.String = 'Normalized digital siginal';


AAA = PcolorSettingFunc(pp,tit,cc)
%%
print(sprintf('exp/fig/%s.jpg', fn),'-djpeg', sprintf('-r%s',num2str(300)));

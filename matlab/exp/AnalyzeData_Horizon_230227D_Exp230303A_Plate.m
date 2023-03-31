%% sound pressure at 445 kHz in the x-z plane with plate 
clear all

load('AnalyzeData_Horizon_230227D_Exp230303A_Plate.mat');
load('vik.mat')
fn = mfilename;

fig = figure;
pcolor(x_data, y_data, c_data);
colormap(vik)
shading interp
xlabel('x (mm)');
ylabel('z (mm)');
colorbar

print(sprintf('exp/fig/%s.jpg', fn),'-djpeg', sprintf('-r%s',num2str(300)));

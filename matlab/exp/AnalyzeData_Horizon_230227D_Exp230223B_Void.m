%% sound pressure at 445 kHz in the x-z plane without plate and AMM
clear all

load('AnalyzeData_Horizon_230227D_Exp230223B_Void.mat');
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

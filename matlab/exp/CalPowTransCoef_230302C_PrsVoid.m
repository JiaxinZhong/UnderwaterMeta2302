% clear all

load('CalPowTransCoef_230302C_PrsVoid.mat');
load('vik.mat')
fn = mfilename;

fig = figure;
pcolor(x_data, y_data, c_data);
colormap(vik)
shading interp
xlabel('x (mm)');
ylabel('z (mm)');
colorbar
clim([0, 3.8e-3]);

print(sprintf('exp/fig/%s.jpg', fn),'-djpeg', sprintf('-r%s',num2str(300)));

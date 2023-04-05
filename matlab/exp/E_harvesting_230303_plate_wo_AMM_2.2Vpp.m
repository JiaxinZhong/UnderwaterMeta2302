% function createfigure(X1, YMatrix1)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  vector of plot x data
%  YMATRIX1:  matrix of plot y data

%  Auto-generated by MATLAB on 04-Apr-2023 11:29:20

clear all

% load data
load('E_harvesting_230303_plate_wo_AMM_10Vpp.mat');

% Create figure
figure1 = figure;

% figure size setting
x0=50;
y0=50;

height = 800;
width=height*(4/3);

set(gcf,'position',[x0,y0,width,height])

% Create axes
axes1 = axes('Parent',figure1,...
    'YTickLabel',{'-2.5','-2','-1','0','1','2','2.5'},...
    'YTick',[-2.5 -2 -1 0 1 2 2.5]);
hold(axes1,'on');
colororder([0 0.447 0.741]);

% Activate the left side of the axes
yyaxis(axes1,'left');
% Create plot
plot(X1,YMatrix1(:,1),'DisplayName','Input','LineWidth',3,...
    'Color',[0 0.447058826684952 0.74117648601532]);

% Create ylabel
ylabel('Input signal (V)');
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[-2.5 2.5]);

% Set the remaining axes properties
set(axes1,'YColor',[0 0.447 0.741],'YMinorTick','on','YTick',...
    [-2 -1 0 1 2],'YTickLabel',{'-2','-1','0','1','2'});

% Activate the right side of the axes
yyaxis(axes1,'right');
% Create plot
plot(X1,YMatrix1(:,2),'DisplayName','Output','LineWidth',3,...
    'Color',[0.850980401039124 0.325490206480026 0.0980392172932625]);

% Create ylabel
ylabel('Output signal (V)');
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[-0.4 0.4]);

% Create line (y = 0)
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k');

% Set the remaining axes properties
set(axes1,'YColor',[0.85 0.325 0.098],'YMinorTick','on','YTick',...
    [-0.4 -0.2 0 0.2 0.4],'YTickLabel',{'-0.4','-0.2','0','0.2','0.4'});
% Create xlabel
xlabel('Time (\mus)');

% Create title
title('Plate w/o AMM');

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',32,'FontWeight','bold',...
    'LineWidth',4,'XGrid','off','XTick',[-4e-06 -2e-06 0 2e-06 4e-06],...
    'XTickLabel',{'0','2','4','6','8'});

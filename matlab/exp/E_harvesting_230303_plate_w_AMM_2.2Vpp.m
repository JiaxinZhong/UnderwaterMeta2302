% function createfigure(X1, YMatrix1)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  vector of plot x data
%  YMATRIX1:  matrix of plot y data

%  Auto-generated by MATLAB on 04-Apr-2023 11:29:20

% load data
load('E_harvesting_230303_plate_w_AMM_2.2Vpp.mat');

% Create figure
figure;

% figure size setting
x0=50;
y0=50;

height = 800;
width=height*(4/3);

set(gcf,'position',[x0,y0,width,height])

% Create axes
axes1 = axes;
hold(axes1,'on');

% Create multiple line objects using matrix input to plot
plot1 = plot(X1,YMatrix1);
set(plot1(1),'DisplayName','Input',...
    'Color',[0 0.447058826684952 0.74117648601532]);
set(plot1(2),'DisplayName','Output',...
    'Color',[0.850980401039124 0.325490206480026 0.0980392172932625]);

% Create line (y = 0)
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k');

% Create ylabel
ylabel('Digital signal ({\itV})','FontWeight','bold','FontSize',32,...
    'FontName','Times New Roman');

% Create xlabel
xlabel('Time ({\mus})','FontWeight','bold','FontSize',32,...
    'FontName','Times New Roman');

% Create title
title('Plate w/ AMM');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[-4e-06 4e-06]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[-2.5 2.5]);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',32,'FontWeight','bold',...
    'LineWidth',4,'XGrid','off','XTick',[-4e-06 -2e-06 0 2e-06 4e-06],...
    'XTickLabel',{'-4','-2','0','2','4'},'YColor',[0 0 0],'YGrid','off','ZGrid',...
    'on');
% Create legend
legend(axes1,'show');
legend box off
set(legend1,'Location','northwest');


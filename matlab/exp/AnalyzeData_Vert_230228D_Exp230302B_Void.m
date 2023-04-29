%% the time signals at the center point; nothing
clear all

load('AnalyzeData_Vert_230228D_Exp230302B_Void2.mat');
fn = mfilename;

fig = figure;
subplot(211)
yyaxis left
plot(t, sig_emit, 'linewidth', 2);
ylabel('Voltage (V)')
yyaxis right
plot(t, sig_rec, 'linewidth', 2);
leg = legend({'Emitting', 'Received'});
xlabel('Time (ms)')
ylabel('Voltage (V)')
ax = gca;
ax.FontSize = 12;
ax.LineWidth = 2;
ax.XLabel.FontSize = 16;
ax.YLabel.FontSize = 16;
ax.FontName = 'Times New Roman';
leg.Box = 'off';
leg.FontName = 'Times New Roman';
leg.FontSize = 14;
ax.FontWeight = 'bold';
leg.FontWeight = 'bold';

subplot(212)
yyaxis left
plot(t, sig_emit, 'linewidth', 2);
ylabel('Voltage (V)')
yyaxis right
plot(t, sig_rec, 'linewidth', 2);
ylabel('Voltage (V)')
leg = legend({'Emitting', 'Received'});
xlabel('Time (ms)')
xlim([0.3,0.4]);
ax = gca;
ax.FontSize = 12;
ax.LineWidth = 2;
ax.XLabel.FontSize = 16;
ax.YLabel.FontSize = 16;
ax.FontName = 'Times New Roman';
leg.Box = 'off';
leg.FontName = 'Times New Roman';
leg.FontSize = 14;
ax.FontWeight = 'bold';
leg.FontWeight = 'bold';
print(sprintf('exp/fig/%s.jpg', fn),'-djpeg', sprintf('-r%s',num2str(300)));


fig2 = figure;
yyaxis left
plot(f, y1, 'linewidth', 2)
ylabel('Amplitude')
yyaxis right
plot(f, y2, 'linewidth', 2)
leg = legend({'Emitting', 'Received'});
xlabel('Frequency (kHz)')
ylabel('Amplitude')
xlim([420,480])
ax = gca;
ax.FontSize = 12;
ax.LineWidth = 2;
ax.XLabel.FontSize = 16;
ax.YLabel.FontSize = 16;
ax.FontName = 'Times New Roman';
leg.Box = 'off';
leg.FontName = 'Times New Roman';
leg.FontSize = 16;
ax.FontWeight = 'bold';
leg.FontWeight = 'bold';

print(sprintf('exp/fig/%s_Spectrum.jpg', fn),'-djpeg', sprintf('-r%s',num2str(300)));

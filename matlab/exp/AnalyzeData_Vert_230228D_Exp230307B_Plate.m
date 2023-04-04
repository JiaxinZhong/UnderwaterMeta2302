 %% the time signals at the center point; plate
clear all

load('AnalyzeData_Vert_230228D_Exp230307B_Plate.mat');
fn = mfilename;

fig = figure;
subplot(211)
yyaxis left
plot(t, sig_emit);
ylabel('Voltage (V)')
yyaxis right
plot(t, sig_rec);
legend({'Emitting', 'Received'})
xlabel('Time (ms)')
ylabel('Voltage (V)')

subplot(212)
yyaxis left
plot(t, sig_emit);
ylabel('Voltage (V)')
yyaxis right
plot(t, sig_rec);
ylabel('Voltage (V)')
legend({'Emitting', 'Received'})
xlabel('Time (ms)')
xlim([0.3,0.4]);

print(sprintf('exp/fig/%s.jpg', fn),'-djpeg', sprintf('-r%s',num2str(300)));

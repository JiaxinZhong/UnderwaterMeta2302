% Analyze horizontal plane
% clear all
% fn_exp = 'Exp230223B'; % Void
% fn_exp = 'Exp230227B'; % AMM
fn_exp = 'Exp230303A'; % with plate
fn = sprintf('data/%s.mat', fn_exp);
data = load(fn);

f_des = 445e3;
[~, idx_f] = min(abs(data.f - f_des));

y_shift = 35;
x_shift = 0;

x = x_shift + data.x;
y = y_shift + data.y;

fig_rec = Figure;
pcolor(x.', y.', data.prs_rec(:,:,idx_f).');
fig_rec.Init;
title(sprintf('Pressure, %d kHz', f_des/1e3));
xlabel('x (mm)');
ylabel('y (mm)');
% caxis([0, 8e-5])
% fig_rec.Print(sprintf('fig/AnalyzeData_230227D_%s_RecPrs_', fn_exp));

fig_emit = Figure;
pcolor(x.', y.', data.prs_emit(:,:,idx_f).');
fig_emit.Init;
title(sprintf('Emit, %d kHz', f_des/1e3));
xlabel('x (mm)')
ylabel('y (mm)')
% caxis([0,0.03])
% fig_emit.Print(sprintf('fig/AnalyzeData_230227D_%s_EmitPrs_', fn_exp));

%% sound power along a line y = constant
pow_y = sum(abs(data.prs_rec).^2, 1);
fig_pow = Figure;
plot(data.y, pow_y(1,:,idx_f));
title(sprintf('Power, f = %d kHz', f_des/1e3));
xlabel('y (mm)')
ylabel('Power')

%% calibrated sound pressure
prs_rec_cal = data.prs_rec ./ data.prs_emit;
fig_rec_cal = Figure;
pcolor(x.', y.', prs_rec_cal(:,:,idx_f).');
fig_rec_cal.Init;
title(sprintf('Cali. pressure, %d kHz', f_des/1e3));
xlabel('x (mm)');
ylabel('z (mm)');
% caxis([0, 3.8e-3]);
% fig_rec_cal.Print(sprintf('fig/AnalyzeData_230227D_%s_CaliRecPrs_', fn_exp));
[x_data, y_data, ~, c_data] = fig_rec_cal.ExtractData();
% save('exp/data/AnalyzeData_Horizon_230227D_.mat', 'x_data', 'y_data', 'c_data');

%% calicated sound power
pow_y_cali = sum(abs(prs_rec_cal).^2, 1);
fig_pow_cal = Figure;
plot(data.y, pow_y_cali(1,:,idx_f));
title(sprintf('Calibrated power, f = %d kHz', f_des/1e3));
xlabel('y (mm)')
ylabel('Power')
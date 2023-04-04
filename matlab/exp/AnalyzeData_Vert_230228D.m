%% analyze data over the vertical plane
% clear all
% fn_exp = 'Exp230228A';
% fn_exp = 'Exp230228F'; % AMM
% fn_exp = 'Exp230301D';
% fn_exp = 'Exp230302A';
% fn_exp = 'Exp230302B'; % void
% fn_exp = 'Exp230302G';
% fn_exp = 'Exp230306B'; % plate
fn_exp = 'Exp230307B';
fn = sprintf('data/%s.mat', fn_exp);
data = load(fn);

% specify a frequency
f_des = 445e3;
% f_des = 420e3;
[~, idx_f] = min(abs(data.f - f_des));

% specify a field point
x_sel = 0;
z_sel = 0;
[~, idx_x_sel] = min(abs(x_sel - data.x));
[~, idx_z_sel] = min(abs(z_sel - data.z));

%% 
fig_rec = Figure;
pcolor(data.fp_abs.x.', data.fp_abs.z(:), squeeze(data.prs_rec(:,1,:,idx_f)).');
fig_rec.Init;
title(sprintf('Pressure, %d kHz', f_des/1e3));
xlabel('x (mm)');
ylabel('z (mm)');
% caxis([0, 8e-5])
% fig_rec.Print(sprintf('fig/AnalyzeData_230227D_%s_RecPrs_', fn_exp));

%% emitted sound pressure distribution
fig_emit = Figure;
pcolor(data.fp_abs.x.', data.fp_abs.z(:), squeeze(data.prs_emit(:,1,:,idx_f)).');
fig_emit.Init;
title(sprintf('Emit, %d kHz', f_des/1e3));
xlabel('x (mm)')
ylabel('z (mm)')
% caxis([0,0.03])
% fig_emit.Print(sprintf('fig/AnalyzeData_230227D_%s_EmitPrs_', fn_exp));

%% emitted sound power
emit_pow_y = sum(abs(data.prs_emit).^2, [1,3]);
fig_emit_pow = Figure;
% plot(data.f/1e3, smooth(squeeze(data.pow_y)));
plot(data.f/1e3, 10*log10(smooth(smooth(squeeze(emit_pow_y)))));
title(sprintf('Power'));
xlabel('Freq (kHz)')
ylabel('Power')
xlim([400,500])

%% calibrated sound pressure
fig_rec_cal = Figure;
pcolor(data.fp_abs.x.', data.fp_abs.z(:), squeeze(data.prs_rec_cal(:,1,:,idx_f)).');
fig_rec_cal.Init;
title(sprintf('Cali. pressure, %d kHz', f_des/1e3));
xlabel('x (mm)');
ylabel('z (mm)');
% caxis([0, 3.8e-3]);
% fig_rec_cal.Print(sprintf('fig/AnalyzeData_230227D_%s_CaliRecPrs_', fn_exp));

%% sound power along a line y = constant
fig_pow = Figure;
plot(data.f/1e3, smooth(squeeze(data.pow_y)));
% plot(data.f/1e3, 10*log10(smooth(smooth(squeeze(data.pow_y)))));
title(sprintf('Power'));
xlabel('Freq (kHz)')
ylabel('Power')
xlim([400,500])

%% calicated sound power
fig_pow_cal = Figure;
plot(data.f/1e3, squeeze(data.pow_y_cali));
title(sprintf('Power'));
xlabel('Freq (kHz)')
ylabel('Power')
xlim([400,500])

%% show time signal at a specificed point
fig_time_fp = Figure;
subplot(211)
yyaxis left
plot(data.t*1e3, squeeze(data.sig_emit(idx_x_sel, 1, idx_z_sel, :)));
ylabel('Voltage (V)')
yyaxis right
plot(data.t*1e3, squeeze(data.sig_rec(idx_x_sel, 1, idx_z_sel, :)));
legend({'Emitting', 'Received'})
xlabel('Time (ms)')
ylabel('Voltage (V)')

subplot(212)
yyaxis left
plot(data.t*1e3, squeeze(data.sig_emit(idx_x_sel, 1, idx_z_sel, :)));
ylabel('Voltage (V)')
yyaxis right
plot(data.t*1e3, squeeze(data.sig_rec(idx_x_sel, 1, idx_z_sel, :)));
ylabel('Voltage (V)')
legend({'Emitting', 'Received'})
xlabel('Time (ms)')
xlim([0.3,0.4]);

%% save the data for the above figure
t = data.t*1e3;
sig_emit = squeeze(data.sig_emit(idx_x_sel, 1, idx_z_sel, :));
sig_rec = squeeze(data.sig_rec(idx_x_sel, 1, idx_z_sel, :));
save('exp/data/AnalyzeData_Vert_230228D_.mat', 't', 'sig_emit', 'sig_rec')
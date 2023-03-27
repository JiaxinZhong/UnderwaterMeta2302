%% calculate the sound power by p^2 method

clear all
% without AMM and plate
% fn_exp_void = 'Exp230302A';
fn_exp_void = 'Exp230302B'; % 45.75
% fn_exp_void = 'Exp230302G'; % 45.5
% with AMM 
% fn_exp_AMM = 'Exp230228A';
fn_exp_AMM = 'Exp230228F';  % 45.75
% fn_exp_AMM = 'Exp230301D'; % 45.5
% with plate
fn_exp_plate = 'Exp230307B'; % 45.75

% import data
fn_void = sprintf('exp/data/%s.mat', fn_exp_void);
fn_AMM = sprintf('exp/data/%s.mat', fn_exp_AMM);
fn_plate = sprintf('exp/data/%s.mat', fn_exp_plate);
data_AMM = load(fn_AMM);
data_void = load(fn_void);
data_plate = load(fn_plate);

pow_coef_p2_AMM = data_AMM.pow_y_cali ./ data_void.pow_y_cali;
pow_coef_p2_plate = data_plate.pow_y_cali ./ data_void.pow_y_cali;

% select a frequency
f_des = 445e3;
[~, idx_f] = min(abs(data_AMM.f - f_des));

%% sound pressure distribution without AMM
fig_prs_void = Figure;
pcolor(data_void.fp_abs.x.', data_void.fp_abs.z(:), squeeze(data_void.prs_rec_cal(:,1,:,idx_f)).');
pcolor(x_data, y_data, c_data)
fig_prs_void.Init;
title(sprintf('Without AMM, prsesure, %d kHz', f_des/1e3));
xlabel('x (mm)');
ylabel('z (mm)');
clim([0, 3.8e-3]);
% fig_prs_void.Print('exp/fig/CalPowTransCoef_230302C_PrsVoid_')
% extract data
[x_data, y_data, ~, c_data] = fig_prs_void.ExtractData();
save('exp/data/CalPowTransCoef_230302C_PrsVoid_.mat', 'x_data', 'y_data', 'c_data');

%% sound pressure distribution With AMM
fig_prs_AMM = Figure;
pcolor(data_AMM.fp_abs.x.', data_AMM.fp_abs.z(:), squeeze(data_AMM.prs_rec_cal(:,1,:,idx_f)).');
fig_prs_AMM.Init;
title(sprintf('With AMM, prsesure, %d kHz', f_des/1e3));
xlabel('x (mm)');
ylabel('z (mm)');
% caxis([0, 3.8e-3]);
% fig_prs_AMM.ExportTikz('filename', 'exp/fig/CalPowTransCoef_230302C_PrsAMM_.tex')
% fig_prs_AMM.Print('exp/fig/CalPowTransCoef_230302C_PrsAMM_')

%% sound pressure distribution With plate
fig_prs_plate = Figure;
pcolor(data_plate.fp_abs.x.', data_plate.fp_abs.z(:), squeeze(data_plate.prs_rec_cal(:,1,:,idx_f)).');
fig_prs_plate.Init;
title(sprintf('With plate, prsesure, %d kHz', f_des/1e3));
xlabel('x (mm)');
ylabel('z (mm)');
% caxis([0, 3.8e-3]);
% fig_prs_AMM.ExportTikz('filename', 'exp/fig/CalPowTransCoef_230302C_PrsAMM_.tex')
% fig_prs_AMM.Print('exp/fig/CalPowTransCoef_230302C_PrsAMM_')


%% power without AMM
fig_pow_void = Figure;
plot(data_AMM.f/1e3, squeeze(data_void.pow_y));
title(sprintf('Without AMM, %g kHz', f_des/1e3));
xlabel('Freq (kHz)')
ylabel('Power')
xlim([420,460])
fig_pow_void.Init;
% fig_pow_void.Print('exp/fig/CalPowTransCoef_230302C_PowVoid_')

%% power with AMM
fig_pow_AMM = Figure;
plot(data_AMM.f/1e3, squeeze(data_AMM.pow_y_cali));
title(sprintf('With AMM, %g kHz', f_des/1e3));
xlabel('Freq (kHz)')
ylabel('Power')
xlim([420,460])
fig_pow_AMM.Init;
% fig_pow_AMM.Print('exp/fig/CalPowTransCoef_230302C_PowAMM_')

%% power with plate
fig_pow_plate = Figure;
plot(data_plate.f/1e3, squeeze(data_plate.pow_y_cali));
title(sprintf('With plate, %g kHz', f_des/1e3));
xlabel('Freq (kHz)')
ylabel('Power')
xlim([420,460])
fig_pow_plate.Init;
% fig_pow_AMM.Print('exp/fig/CalPowTransCoef_230302C_PowAMM_')

%% transmission
fig_pow_coef = Figure;
plot(data_AMM.f/1e3, squeeze(pow_coef_p2_plate));
hold on
plot(data_AMM.f/1e3, squeeze(pow_coef_p2_AMM));
% title(sprintf('Power transmission coefficient'));
legd = legend('Without AMM', 'With AMM');
xlabel('Freq (kHz)')
ylabel('Power transmission coefficient')
xlim([420,460])
ylim([0,1])
fig_pow_coef.Init;
fig_pow_coef.Print('exp/fig/CalPowTransCoef_230302C_Res_')


%% save data
f = data_AMM.f/1e3;
pow_coef_plate = squeeze(pow_coef_p2_plate);
pow_coef_AMM = squeeze(pow_coef_p2_AMM);
save('exp/data/CalPowTransCoef_230302C_Res_.mat', 'f', 'pow_coef_plate', 'pow_coef_AMM');

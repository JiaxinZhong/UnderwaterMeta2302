% clear all
fn_void_exp = 'Exp230223B';
fn_amm_exp = 'Exp230227B';

fn_void = sprintf('data/%s.mat', fn_void_exp);
fn_amm = sprintf('data/%s.mat', fn_amm_exp);

data_void = load(fn_void);
data_amm = load(fn_amm);

f_des = 445e3;
[~, idx_f] = min(abs(data_void.f - f_des));

y_shift = 35;
x_shift = 0;

x = x_shift + data_void.x;
y = y_shift + data_void.y;

%% select a field point 
x_sel = 0;
y_sel = 26;
[~, idx_x_sel] = min(abs(x - x_sel));
[~, idx_y_sel] = max(abs(y - y_sel));


%% calibration
data_void.prs_rec_cal = data_void.prs_rec ./ data_void.prs_emit;
data_amm.prs_rec_cal = data_amm.prs_rec ./ data_amm.prs_emit;

% data_void.pow_y_cali = sum(abs(data_void.prs_rec_cal).^2, 1);
% data_amm.pow_y_cali = sum(abs(data_amm.prs_rec_cal).^2, 1);

%% plot the spectrum at a field piont
fig_rec_spec = Figure;
plot(data_void.f/1e3, smooth(20*log10(squeeze(data_void.prs_rec_cal(idx_x_sel, idx_y_sel, :)))));
xlim([300,600])
ylabel('Pressure (dB)')
xlabel('Freq (kHz)')
title(sprintf('Without AMM, field point (x,y) = (%gmm, %gmm)', x_sel, y_sel));


%% plot the spectrum at a field piont
fig_rec_spec_amm = Figure;
plot(data_void.f/1e3, smooth(20*log10(squeeze(data_amm.prs_rec_cal(idx_x_sel, idx_y_sel, :)))));
xlim([300,600])
ylabel('Pressure (dB)')
xlabel('Freq (kHz)')
title(sprintf('With AMM, field point (x,y) = (%gmm, %gmm)', x_sel, y_sel));
%
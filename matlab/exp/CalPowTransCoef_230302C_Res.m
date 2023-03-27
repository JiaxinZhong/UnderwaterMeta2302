clear all
load('CalPowTransCoef_230302C_Res.mat');

fig = figure;
plot(f, pow_coef_plate);
hold on
plot(f, pow_coef_AMM);
legd = legend('Without AMM', 'With AMM');
xlabel('Freq (kHz)')
ylabel('Power transmission coefficient')
xlim([420,460])
ylim([0,1])
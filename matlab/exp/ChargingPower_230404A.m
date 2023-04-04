clear
%% Voltage for each capacitor 
% nothing, 7 cap, 2.2Vpp; 
%   AMM, 10 cap, 2.2Vpp
%   noamm, 10cap, 2.2Vpp
%   noamm, 10cap, 10Vpp
v = [0.317, 0.22, 0.012, 0.123];
num = [7, 10, 10, 10];

%% Capacitance
C = 220e-6;

%% Charged energy
E = 1/2 * C * v.^2 .* num;

%% charging time
t = [424, 461, 484, 513];

%% averaging charged power
W = E ./ t;

%% plot the charged energy
void = zeros(1,4);

fig_E = figure;
yyaxis left
bar([1:4], [v; void], 'grouped')
ylabel('Voltage on capcitors (V)')
yyaxis right
bar([1:4], [void; W*1e9], 'grouped')
ylabel('Power (nW)')
set(gca, 'xticklabel', {'Nothing; 2.2Vpp', 'Plate w/ AMM; 2.2Vpp', ...
    'Plate w/o AMM; 2.2Vpp', 'Plate w/o AMM; 10 Vpp'});

print('ChargingPower_230404A.jpg','-djpeg', '-r300');
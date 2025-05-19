% Load Hvector2D data
H = load('/Users/mananbhatt/Downloads/Hvector2D.txt');  % 2500 x 2 matrix

% Define lead vectors (Lx, Ly for each lead)
L = [54.7638, 27.3375, -27.4263, -41.0507, 41.0950, -0.0444;  % Lx
     -0.0204, 47.3917, 47.4120, -23.6856, -23.7162, 47.4019]; % Ly

lead_labels = {'LI', 'LII', 'LIII', 'LaR', 'LaL', 'LaF'};

% Multiply to get voltages
V = H * L; % 2500x6 matrix

% Create time vector
t = (0:2499) / 1000; % seconds (since fs = 1000 Hz)

% Plot all 6 leads in a 3x2 layout
figure;
for i = 1:3
    subplot(3,2,2*i-1) % Left column (LI, LII, LIII)
    plot(t, V(:,i))
    xlabel('Time (s)')
    ylabel('Voltage (V)')
    title(['Lead ', lead_labels{i}])
    grid on
end

for i = 4:6
    subplot(3,2,2*(i-3)) % Right column (LaR, LaL, LaF)
    plot(t, V(:,i))
    xlabel('Time (s)')
    ylabel('Voltage (V)')
    title(['Lead ', lead_labels{i}])
    grid on
end
sgtitle('ECG Signals from Heart Dipole')

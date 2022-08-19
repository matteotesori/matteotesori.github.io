clc
clear

D1 = [5 3 4 1 2 4];
D2 = [0 0 0 0 0 0];
D3 = [8 2 1 4 6 5];
P = [D1; D2; D3];

% Spider plot
figure();

spider_plot_R2019b(D1,...
    'AxesLabels', {'S1', 'S2', 'S3', 'S4', 'S5', 'S6'},...
    'AxesInterval', 2,...
    'FillOption', 'on',...
    'AxesLimits', [0, 0, 0, 0, 0, 0; 5, 5, 5, 5, 5, 5],...
    'Color', [1, 0, 0; 0, 1, 0],...
    'AxesShadedLimits', [0, 0, 0, 0, 0, 0; 5, 5, 5, 5, 5, 5],...
    'Color', [1, 0, 0; 0, 1, 0],...
    'FillTransparency', 0.2);

ax = gca;
ax.Color  = [35 55 59]/255;     % background color
ax.XColor = 'none';        % horizontal axis color
ax.YColor = 'none';        % horizontal axis color

exportgraphics(gcf, 'spider_W.png', 'BackgroundColor', [35 55 59]/255, 'Resolution', 500);

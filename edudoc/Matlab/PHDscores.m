clc
clear

c37 = [111 110 108 106 105 104 103 102 101 100 ...
        99  98  97  96  95  94  93  92  92  92 ...
        91  91  90  89  88  87  86  84  84  83];
c36 = [117 112 111 110 108 107 106 105 104 103 ...
       102 101 100  99  98  97  96  95  94  93 ...
        92  91  90  89  83];
c35 = [120 119 119 119 117 114 113 112 109 108 ...
       107 106 105 104 103 102 101 100  99  99 ...
        99  99  98  98  98  97  97  97  97  96 ...
        96  95  95  94  93  90  88  86  84];
c34 = [120 118 115 114 114 111 110 109 108 107 ...
       106 105 105 103 102 101  99  97  97  95 ...
        87];
c33 = [114 114 114 114 112 111 110 110 110 109 ...
       108 107 106 105 104 103 100  96  94  92 ...
        89  89  88  81  81  81  81];
    
c32 = [110.5 110.0 109.5 109.0 108.5 108.0 105.0 104.5 103.0 102.8 ...
       102.5 102.0 101.0 100.0  98.2  98.0  96.0  95.5  95.0  94.5 ...
        94.0  93.5  93.0  92.5  92.0  90.0  89.5  89.0  88.5  87.5 ...
        87.0  82.0];
    
c31 = [115 114 110 109 108 107 100  98  97  96 ...
        94  93  92  91  90  89  88  86  85  83];

cc  = [c37 c36 c35 c34 round(c32) c33 c31];

fig = figure('MenuBar', 'none', 'ToolBar', 'none',  'units', 'pixels', 'outerposition', [75 5 1450 850]);

subplot(2,1,1);
histogram(c37, 'Normalization', 'probability','FaceColor', 'white', 'EdgeColor', 'none');
hold on
plot(110, 0, 'r.', 'MarkerSize', 40)
axis([79.5 120.5 0 0.1]);
set(gca,'FontSize',22);

set(gca,'XTick',[80:1:120]);
yticks([.0 0.05 0.1]);

title('4', 'color', [35 55 59]/255, 'FontName', 'SansSerif');
ylabel('relative frequency');
xlabel('score');

lgd = legend('\color{white} histogram',...
             ['\color{white} my score = ' num2str(110)],... 
             'color', 'none');
set(lgd, 'location', 'northeast', 'box', 'on', 'edgecolor', 'w');

ax = gca;
ax.Color  = 'none';     % background color
ax.XColor = 'w';        % horizontal axis color
ax.YColor = 'w';        % horizontal axis color
set(ax, 'TickLabelInterpreter', 'latex');

subplot(2,1,2);
histogram(cc, 'Normalization', 'probability','FaceColor', 'white', 'EdgeColor', 'none');
hold on
plot(110, 0, 'r.', 'MarkerSize', 40)
pd = fitdist(cc','Normal');
mu    = pd.mu;
sigma = pd.sigma;
xi    = linspace(79.5, 120.5, 10000);
PDFi  = 1/ sqrt(2 * pi * sigma^2) .* exp(-0.5 * ((xi-mu)/sigma).^2);
plot(xi, PDFi, 'y' ,'LineWidth', 2)

axis([79.5 120.5 0 0.1]);
set(gca,'FontSize',22);

set(gca,'XTick', [80:1:120]);
yticks([0 0.05 0.1]);

ylabel('relative frequency');
xlabel('score');

lgd = legend('\color{white} histogram',...
             ['\color{white} my score = ' num2str(110)],...
             '\color{white} Gaussian fit',...
             'color', 'none');
set(lgd, 'location', 'northeast', 'box', 'on', 'edgecolor', 'w');

ax = gca;
ax.Color  = 'none';     % background color
ax.XColor = 'w';        % horizontal axis color
ax.YColor = 'w';        % horizontal axis color
set(ax, 'TickLabelInterpreter', 'latex');

exportgraphics(fig, 'PHDscores_W.png', 'BackgroundColor', [35 55 59]/255, 'Resolution', 500);

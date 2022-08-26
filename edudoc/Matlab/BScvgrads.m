clc
clear

wv=flip([
26 * ones(9,1)
27 * ones(6,1)
24 * ones(6,1)
27 * ones(9,1)
30 * ones(9,1)
30 * ones(9,1)
27 * ones(6,1)
27 * ones(9,1)
30 * ones(6,1)
27 * ones(6,1)
26 * ones(6,1)
27 * ones(6,1)
30 * ones(9,1)
28 * ones(9,1)
24 * ones(6,1)
26 * ones(12,1)
27 * ones(9,1)
22 * ones(12,1)
23 * ones(12,1)
20 * ones(6,1)]);

CFU = flip([9
6
6
9
9
9
6
9
6
6
6
6
9
9
6
12
9
12
12
6]);

v=flip([
26 
27 
24 
27 
30 
30 
27 
27 
30 
27 
26 
27 
30 
28 
24 
26 
27
22 
23 
20]);

fig = figure('MenuBar', 'none', 'ToolBar', 'none',  'units', 'pixels', 'outerposition', [75 5 1450 850]);

subplot(2,1,1);
histogram(wv, 'Normalization', 'probability','FaceColor', 'white', 'EdgeColor', 'none');
hold on
plot(mean(wv), 0, 'r.', 'MarkerSize', 40)
axis([17.5 30.5 0 0.5]);
set(gca,'FontSize',22);

set(gca,'XTick',[18:1:30]);
yticks([.0 .1 .2 .3 .4 .5]);

%title('Gradegrams (over all 20 exams)', 'color', 'w', 'FontName', 'SansSerif', 'Units', 'normalized', 'Position', [0.5, 1.05, 0], 'fontweight','bold');
title('2', 'color', [35 55 59]/255, 'FontName', 'SansSerif');
ylabel('relative frequency');
xlabel('grade');

lgd = legend('\color{white} weighted histogram',...
             ['\color{white} weighted mean = ' num2str(mean(wv))],... 
             'color', 'none');
set(lgd, 'location', 'northwest', 'box', 'on', 'edgecolor', 'w');

ax = gca;
ax.Color  = 'none';     % background color
ax.XColor = 'w';        % horizontal axis color
ax.YColor = 'w';        % horizontal axis color
set(ax, 'TickLabelInterpreter', 'latex');

subplot(2,1,2);
t1=[1:1:length(wv)]';
m  = wv;
M  =[ones(length(m),1) t1];
B  = M\m;             % regressione lineare
t1 = [1:1:length(v)]';
r  = B(1,1)+B(2,1)*t1;
hold on
for i = 1 : length(v)
    plot(i, v(i), 'color', 'r', 'Marker', '.', 'MarkerSize', 60 * CFU(i)/6,'HandleVisibility','off');
end   
plot(22, 20, 'color', 'r', 'Marker', '.', 'MarkerSize', 40);
plot(t1, v, 'color', 'w', 'LineWidth', 2 , 'Marker', '.', 'MarkerSize', 40);
%plot(t1, v, 'color', 'w', 'LineWidth', 2);
 

axis([1 length(v) 18 30]);
set(gca,'FontSize',22);
%set(gca,'FontName','Times');

set(gca,'YTick',[18:2:30]);
set(gca,'XTick',[1:1:length(v)]);

ylabel('grade');
xlabel('i-th exam');

plot(t1,r, 'color', 'y', 'LineWidth', 2);
grid on
lgd = legend('\color{white} weight (CFU)',...
             '\color{white} linear interpolation',...
             '\color{white} weighted linear regression',... 
             'color', 'none', 'Orientation','horizontal');
set(lgd, 'location', 'southeast', 'box', 'on', 'edgecolor', 'w');

ax = gca;
ax.Color  = 'none';     % background color
ax.XColor = 'w';        % horizontal axis color
ax.YColor = 'w';        % horizontal axis color
set(ax, 'TickLabelInterpreter', 'latex');

exportgraphics(fig, 'BSgrades_W.png', 'BackgroundColor', [35 55 59]/255, 'Resolution', 500);

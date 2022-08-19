v1=[7 7 7 7 6 7 7 7 6 6 9 8]';
v2=[7 7 7 6 6 8 6 6 6 9 8]';
v3=[6 6 6 7 8 6 7 6 8 8]';
v4=[7 8 6 7 6 6 7 6 9 9]';
v5=[7 7 6 7 7 6 7 7 9 8]';

v=[v1;v2;v3;v4;v5];

fig = figure('MenuBar', 'none', 'ToolBar', 'none',  'units', 'pixels', 'outerposition', [75 5 1450 850]);

subplot(2,1,1);
histogram(v, 'Normalization', 'probability','FaceColor', 'white', 'EdgeColor', 'none');
hold on
plot(mean(v), 0, 'r.', 'MarkerSize', 40)
axis([5.5 10.5 0 0.5]);
set(gca,'FontSize',22);
%set(gca,'FontName','Times');

set(gca,'XTick',[6:1:10]);
yticks([.0 .1 .2 .3 .4 .5]);

title('1', 'color', [35 55 59]/255, 'FontName', 'SansSerif');
ylabel('relative frequency');
xlabel('grade');

lgd = legend('\color{white} histogram',...
             ['\color{white} mean = ' num2str(mean(v))],... 
             'color', 'none');
set(lgd, 'location', 'northeast', 'box', 'on', 'edgecolor', 'w');

ax = gca;
ax.Color  = 'none';     % background color
ax.XColor = 'w';        % horizontal axis color
ax.YColor = 'w';        % horizontal axis color
set(ax, 'TickLabelInterpreter', 'latex');

subplot(2,1,2);
t1=[1:1:5]';
m=[6.91 6.8 6.67 7.1 7.1]';
M=[ones(length(m),1) t1];
B=M\m;             % regressione lineare
r=B(1,1)+B(2,1)*t1;
plot(t1,m, 'color', 'w', 'LineWidth', 2 , 'Marker', '.', 'MarkerSize', 40);
axis([1 length(m) 6 10]);
set(gca,'FontSize',20);
%set(gca,'FontName','Times');

set(gca,'YTick',[6:1:10]);
set(gca,'XTick',[1:1:5]);

%title('mean evolution (year by year)', 'color', 'w', 'FontName', 'SansSerif');
ylabel('mean');
xlabel('year');
hold on
plot(t1,r, 'color', 'y', 'LineWidth', 2);
grid on
lgd = legend('\color{white} linear interpolation',...
             '\color{white} linear regression',... 
             'color', 'none');
set(lgd, 'location', 'northeast', 'box', 'on', 'edgecolor', 'w');

ax = gca;
ax.Color  = 'none';     % background color
ax.XColor = 'w';        % horizontal axis color
ax.YColor = 'w';        % horizontal axis color
set(ax, 'TickLabelInterpreter', 'latex');

exportgraphics(fig, 'HSgrades_W.png', 'BackgroundColor', [35 55 59]/255, 'Resolution', 500);

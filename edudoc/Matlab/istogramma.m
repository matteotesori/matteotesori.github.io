x=[30
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
20];

t=[1:1:21];
X=[ones(21,1) t'];

B=X\(flipud(x));              % regressione lineare
r=B(1,1)+B(2,1)*t;

figure
subplot(2,1,1);
histogram(x)
axis([17.5 30.5 0 7]);
set(gca,'FontSize',18)
% set(gca,'FontName','Times')

set(gca,'XTick',[18:1:30])
set(gca,'YTick',[0:1:7])

% title('\textbf{Istogramma dei voti}','Interpreter','LaTex');
% ylabel('frequenza','Interpreter','LaTex');
% xlabel('voto','Interpreter','LaTex');

title('Istogramma dei voti');
ylabel('frequenza');
xlabel('voto');

subplot(2,1,2);
plot(t,flipud(x));
axis([1 21 18 30]);
set(gca,'FontSize',18)
% set(gca,'FontName','Times')

set(gca,'YTick',[18:2:30])
set(gca,'XTick',[1:1:21])

% title('\textbf{Andamento temporale del rendimento}','Interpreter','LaTex');
% ylabel('voto','Interpreter','LaTex');
% xlabel('$n$-esimo esame','Interpreter','LaTex');

title('Andamento temporale del rendimento');
ylabel('voto');
xlabel('n-esimo esame');

hold on
plot(t,r);
grid on
legend({'rendimento','regressione lineare'},'interpreter','latex');
legend('Location','southeast');




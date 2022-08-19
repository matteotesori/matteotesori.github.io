v=[30 29]';

t=[1:1:length(v)];
M=[ones(length(v),1) t'];

B=M\v              % regressione lineare
r=B(1,1)+B(2,1)*t;

figure
subplot(2,1,1);
histogram(v);
axis([17.5 30.5 0 1]);
set(gca,'FontSize',18);
set(gca,'FontName','Times');

set(gca,'XTick',[18:1:30]);
set(gca,'YTick',[0:1:7]);

title('\textbf{Istogramma dei voti}','Interpreter','LaTex');
ylabel('frequenza','Interpreter','LaTex');
xlabel('voto','Interpreter','LaTex');

subplot(2,1,2);
plot(t,v);
axis([1 length(v) 18 30]);
set(gca,'FontSize',18);
set(gca,'FontName','Times');

set(gca,'YTick',[18:2:30]);
set(gca,'XTick',[1:1:length(v)]);

title('\textbf{Andamento temporale del rendimento}','Interpreter','LaTex');
ylabel('voto','Interpreter','LaTex');
xlabel('$n$-esimo esame','Interpreter','LaTex');
hold on
plot(t,r);
grid on
legend({'rendimento','regressione lineare'},'interpreter','latex');
legend('Location','southeast');




%sledzenie
% figure(1)
% plot(q(:,2), q(:,3))
% hold on;
% plot(zadana(:,2), zadana(:,3), 'r--', 'LineWidth', 1)
% hold on;
% CartPlot2
% grid on;
% xlabel('x [m]');
% ylabel('y [m]');
% legend('Trajektoria robota', 'Trajektoria zadana', 'Pozycja robota');
% set(gcf, 'Position',  [350, 350, 680, 580]);
% 
% %uchyby sledzenie
% e_theta = zadana(:,1) - q(:,1);
% e_x = zadana(:,2) - q(:,2);
% e_y = zadana(:,3) - q(:,3);
% 
% figure(2)
% plot(t, e_theta, 'g')
% hold on;
% plot(t, e_x, 'r')
% hold on;
% plot(t, e_y, 'b')
% xlabel('czas [s]');
% ylabel('uchyb');
% legend('Uchyb theta [rad]', 'Uchyb x [m]', 'Uchyb y [m]');
% grid on;
% set(gcf, 'Position',  [350, 350, 680, 580]);
% 
% 
% % figure(3)
% % plot(t, e_x)
% % hold on;
% % plot(t, e_y)
% % ylim([min(min(e_x), min(e_y))-0.1; max(max(e_x), max(e_y))+0.1]);
% % xlabel('czas [s]');
% % ylabel('uchyb [m]');
% % legend('Uchyb x', 'Uchyb y');
% % grid on;
% % set(gcf, 'Position',  [350, 350, 680, 580]);
% 
% figure(4)
% %sygnaly sterujace sledzenie
% for i = 1:length(t)
%     w(i,1:2) = inv(J)*[u1(i); u2(i)];
% 
%     wds(i,1:2) = BSP([w(i,1); w(i,2)]);
%     uds(i,1:2) = J*[wds(i,1); wds(i,2)];
% end
% 
% plot(t, uds(:,1))
% hold on;
% plot(t, uds(:,2))
% xlabel('czas [s]');
% ylabel('w [rad/s], v [m/s]');
% legend('Sygna³ steruj¹cy w', 'Sygna³ steruj¹cy v');
% grid on;
% ylim([min(min(uds(:,1)), min(uds(:,2)))-0.1; max(max(uds(:,1)), max(uds(:,2)))+0.1]);
% set(gcf, 'Position',  [350, 350, 680, 580]);


%do punktu
figure(1)
plot(q(:,2), q(:,3))
hold on;
plot(zadana(:,1), zadana(:,2), 'r*', 'LineWidth', 2)

hold on;
CartPlot2
grid on;
axis equal;
axis square;
xlim([min(min(q(:,2)), min(zadana(:,1)))-0.1; max(max(q(:,2)), max(zadana(:,1)))+0.1]); %xpunktu +-0.1
ylim([min(min(q(:,3)), min(zadana(:,2)))-0.1; max(max(q(:,3)), max(zadana(:,2)))+0.1]); %ypunktu +-0.1
xlabel('x [m]');
ylabel('y [m]');
legend('Trajektoria robota', 'Pozycja zadana', 'Pozycja robota');
set(gcf, 'Position',  [350, 350, 680, 580]);

%uchyby punkt
e_x = zadana(:,1) - q(:,2);
e_y = zadana(:,2) - q(:,3);

figure(2)
plot(t, e_x)
hold on;
plot(t, e_y)
ylim([min(min(e_x), min(e_y))-0.1; max(max(e_x), max(e_y))+0.1]);
xlabel('czas [s]');
ylabel('uchyb [m]');
legend('Uchyb x', 'Uchyb y');
grid on;
set(gcf, 'Position',  [350, 350, 680, 580]);

figure(3)
%sygnaly sterujace punkt
for i = 1:length(t)
    w(i,1:2) = inv(J)*[u1(i); u2(i)];

    wds(i,1:2) = BSP([w(i,1); w(i,2)]);
    uds(i,1:2) = J*[wds(i,1); wds(i,2)];
end

plot(t, uds(:,1))
hold on;
plot(t, uds(:,2))
xlabel('czas [s]');
ylabel('w [rad/s], v [m/s]');
legend('Sygna³ steruj¹cy w', 'Sygna³ steruj¹cy v');
grid on;
ylim([min(min(uds(:,1)), min(uds(:,2)))-0.1; max(max(uds(:,1)), max(uds(:,2)))+0.1]);
set(gcf, 'Position',  [350, 350, 680, 580]);

%do punktu Pomet i VFO

% figure(1)
% plot(q(:,2), q(:,3))
% hold on;
% plot(zadana(:,2), zadana(:,3), 'r*', 'LineWidth', 10)
% hold on;
% CartPlot2
% grid on;
% xlim([min(min(q(:,2)), min(zadana(:,2)))-0.1; max(max(q(:,2)), max(zadana(:,2)))+0.1]); %xpunktu +-0.1
% ylim([min(min(q(:,3)), min(zadana(:,3)))-0.1; max(max(q(:,3)), max(zadana(:,3)))+0.1]); %ypunktu +-0.1
% xlabel('x [m]');
% ylabel('y [m]');
% legend('Trajektoria robota', 'Pozycja zadana', 'Pozycja robota');
% set(gcf, 'Position',  [350, 350, 680, 580]);
% 
% 
% %uchyby Pomet
% % e_theta = zadana(:,1) - q(:,1);
% % e_x = zadana(:,2) - q(:,2);
% % e_y = zadana(:,3) - q(:,3);
% % 
% % figure(2)
% % plot(t, e_theta, 'g')
% % hold on;
% % plot(t, e_x, 'r')
% % hold on;
% % plot(t, e_y, 'b')
% % xlabel('czas [s]');
% % ylabel('uchyb');
% % legend('Uchyb theta [rad]', 'Uchyb x [m]', 'Uchyb y [m]');
% % grid on;
% % set(gcf, 'Position',  [350, 350, 680, 580]);
% % set(gca, 'YScale', 'log')
% 
% %uchyby VFO do punktu
% e_theta = abs(zadana(:,1) - q(:,1));
% e_x = abs(zadana(:,2) - q(:,2));
% e_y = abs(zadana(:,3) - q(:,3));
% 
% figure(2)
% plot(t, e_theta, 'g')
% hold on;
% plot(t, e_x, 'r')
% hold on;
% plot(t, e_y, 'b')
% xlabel('czas [s]');
% ylabel('uchyb');
% legend('Uchyb theta [rad]', 'Uchyb x [m]', 'Uchyb y [m]');
% grid on;
% set(gcf, 'Position',  [350, 350, 680, 580]);
% % set(gca, 'YScale', 'log')
% 
% figure(4)
% %sygnaly sterujace do punktu Pomet i VFO
% for i = 1:length(t)
%     w(i,1:2) = inv(J)*[u1(i); u2(i)];
% 
%     wds(i,1:2) = BSP([w(i,1); w(i,2)]);
%     uds(i,1:2) = J*[wds(i,1); wds(i,2)];
% end
% 
% plot(t, uds(:,1))
% hold on;
% plot(t, uds(:,2))
% xlabel('czas [s]');
% ylabel('w [rad/s], v [m/s]');
% legend('Sygna³ steruj¹cy w', 'Sygna³ steruj¹cy v');
% grid on;
% ylim([min(min(uds(:,1)), min(uds(:,2)))-0.1; max(max(uds(:,1)), max(uds(:,2)))+0.1]);
% set(gcf, 'Position',  [350, 350, 680, 580]);


%sciezka param
% figure(1)
% plot(q(:,2), q(:,3))
% hold on;
% plot(zadana(:,5), zadana(:,6), 'r--', 'LineWidth', 1)
% hold on;
% CartPlot2
% grid on;
% axis square;
% xlabel('x [m]');
% ylabel('y [m]');
% legend('Trajektoria robota', 'Sciezka', 'Pozycja robota');
% set(gcf, 'Position',  [350, 350, 680, 580]);
% 
% %uchyby sciezka param
% e_theta = abs(zadana(:,2));
% e_x = abs(zadana(:,5) - q(:,2));
% e_y = abs(zadana(:,6) - q(:,3));
% 
% 
% figure(2)
% plot(t, e_theta, 'g')
% hold on;
% plot(t, e_x, 'r')
% hold on;
% plot(t, e_y, 'b')
% xlabel('czas [s]');
% ylabel('uchyb');
% legend('Uchyb theta [rad]', 'Uchyb x [m]', 'Uchyb y [m]');
% grid on;
% set(gcf, 'Position',  [350, 350, 680, 580]);
% set(gca, 'YScale', 'log')
% 
% % figure(3)
% % plot(t, e_x)
% % hold on;
% % plot(t, e_y)
% % ylim([min(min(e_x), min(e_y))-0.1; max(max(e_x), max(e_y))+0.1]);
% % xlabel('czas [s]');
% % ylabel('uchyb [m]');
% % legend('Uchyb x', 'Uchyb y');
% % grid on;
% % set(gcf, 'Position',  [350, 350, 680, 580]);
% 
% figure(4)
% %sygnaly sterujace sciezka param
% for i = 1:length(t)
%     w(i,1:2) = inv(J)*[u1(i); u2(i)];
% 
%     wds(i,1:2) = BSP([w(i,1); w(i,2)]);
%     uds(i,1:2) = J*[wds(i,1); wds(i,2)];
% end
% 
% plot(t, uds(:,1))
% hold on;
% plot(t, uds(:,2))
% xlabel('czas [s]');
% ylabel('w [rad/s], v [m/s]');
% legend('Sygna³ steruj¹cy w', 'Sygna³ steruj¹cy v');
% grid on;
% ylim([min(min(uds(:,1)), min(uds(:,2)))-0.1; max(max(uds(:,1)), max(uds(:,2)))+0.1]);
% set(gcf, 'Position',  [350, 350, 680, 580]);

%sciezka bez
% figure(1)
% plot(q(:,2), q(:,3))
% hold on;
% rysowanie_sciezki; %zmienic w zaleznosci od sciezki
% hold on;
% CartPlot2
% grid on;
% axis square;
% xlabel('x [m]');
% ylabel('y [m]');
% legend('Trajektoria robota', 'Sciezka', 'Pozycja robota');
% set(gcf, 'Position',  [350, 350, 680, 580]);
% 
% %uchyby sciezka bez
% figure(2)
% %Uchyby
% plot(t, zadana(:,1))
% hold on;
% % wyjscie_z_generatora;
% % wyliczenie_e_a;
% % plot(t, wyj(:,3))
% plot(t, e_theta);
% xlabel('czas [s]');
% ylabel('uchyb');
% legend('Odleg³oœæ od œcie¿ki [m]', 'Uchyb [rad]');
% grid on;
% set(gcf, 'Position',  [350, 350, 680, 580]);
% % set(gca, 'YScale', 'log')
% 
% % figure(3)
% % %odpowiednio trzeba zmienic zaleznie od trajektorii
% % %Uchyb ea
% % wyjscie_z_generatora;
% % wyliczenie_e_a;
% % plot(t, wyj(:,3))
% % xlabel('czas [s]');
% % ylabel('uchyb [rad]');
% % legend('Uchyb pomocniczy e_a');
% % grid on;
% % set(gcf, 'Position',  [350, 350, 680, 580]);
% 
% figure(4)
% %sygnaly sterujace sciezka param
% for i = 1:length(t)
%     w(i,1:2) = inv(J)*[u1(i); u2(i)];
% 
%     wds(i,1:2) = BSP([w(i,1); w(i,2)]);
%     uds(i,1:2) = J*[wds(i,1); wds(i,2)];
% end
% 
% plot(t, uds(:,1))
% hold on;
% plot(t, uds(:,2))
% xlabel('czas [s]');
% ylabel('w [rad/s], v [m/s]');
% legend('Sygna³ steruj¹cy w', 'Sygna³ steruj¹cy v');
% grid on;
% ylim([min(min(uds(:,1)), min(uds(:,2)))-0.1; max(max(uds(:,1)), max(uds(:,2)))+0.1]);
% set(gcf, 'Position',  [350, 350, 680, 580]);





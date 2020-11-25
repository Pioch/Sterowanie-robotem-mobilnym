%prostoliniowa

a = 0.2;
b = 0;

x = min(q(:,2)):0.01:max(q(:,2));
y = a*x + b;

plot(x, y, 'r--', 'LineWidth', 1)


%super elipsa
% sigma = -1;
% a = 0.2;
% b = 0.4;
% n = 4;
% i = 1;
% 
% th1 = 0:0.01:pi/2;  
% th2 = pi/2:-0.01:0;
% 
% x1 = -sigma*a*cos(th1).^(2/n);
% x2 = sigma*a*cos(th1).^(2/n);
% x3 = sigma*a*cos(th2).^(2/n);
% x4 = -sigma*a*cos(th2).^(2/n);
% y1 = -sigma*b*sin(th1).^(2/n);
% y2 = sigma*b*sin(th1).^(2/n);
% y3 = -sigma*b*sin(th2).^(2/n);
% y4 = sigma*b*sin(th2).^(2/n);
% 
% x = [x1, x3, x2, x4];
% y = [y1, y3, y2, y4];
% 
% plot(x, y, 'r--', 'LineWidth', 1)

%krzywa s
% a = 0.5;
% b = 3;
% x = min(q(:,2)):0.01:max(q(:,2));
% y = a*tanh(b*x);
% 
% plot(x, y, 'r--', 'LineWidth', 1)








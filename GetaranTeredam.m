clc; clear all; close all; format short;
h = 0.1;
t = 0:h:40;
N = length(t);
x(1) = 0.5;
v(1) = 10;
y(1,:) = [x(1) v(1)];
for i = 1:N-1
    k1 = fungsi(t(i),y(i,:));
    k2 = fungsi((t(i)+0.5*h),(y(i,:)+(0.5*k1*h)));
    k3 = fungsi((t(i)+0.5*h),(y(i,:)+(0.5*k2*h)));
    k4 = fungsi((t(i)+h),(y(i,:)+(k3*h)));
    y(i+1,:) = y(i,:)+(h/6)*(k1+2*k2+2*k3+k4);
end

%Metode Analitik
b = 0.9;
k = 26.8;
m = 1.5;
gamma = b/(2*m);
omega = sqrt(k/m);
p = sqrt((omega^2)-(gamma^2));
B = x(1);
A = (v(1)+gamma*B)/p;
C = 1/(m-b+k);
g = @(t) ((exp(-gamma*t).*(A*sin(p*t) + B*cos(p*t))) + C*exp(-t));

matriks_eigen=[0 1; -k/m -b/m];
nilai_eigen=eig(matriks_eigen)

disp('      t        y_RK    y_Analitik ')
disp([t' y(:,1) g(t)'])

figure
plot(t,y(:,1),'-r');
ylabel('y(t)','fontsize',12,'fontweight','bold','fontname','Times')
xlabel('t','fontsize',12,'fontweight','bold','fontname','Times')
hold on
plot(t,g(t),'-k');
legend('Runge Kutta','Analitik')
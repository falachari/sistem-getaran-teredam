function f=fungsi(t,y)
x = y(1);
v = y(2);

b = 0.9;
k = 26.8;
m = 1.5;

f1 = v;
f2 = (-b/m)*v-(k/m)*x-(k/m)*exp(-t);
f = [f1 f2];
end
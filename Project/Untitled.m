figure
Y = linspace(-2*pi,2*pi,50);
stem(Y)
figure
X = linspace(0,2*pi,50)';
Y = [cos(X), 0.5*sin(X)];
stem(Y)

I = ((10-9)*255)/(20-9);
%ECE 102 PROJECT PART 2
%Marc Abou Jaoude
%Variables
f = 10:10:1e5;
w = 2 * pi * f;
%Low pass
fc1 = 300;
wc1 = fc1 * 2 * pi;
%First section
H1 = -(wc1)./(w*j+wc1);
%Second section
R = 10e3;
c1 = 2/(R*wc1);
c2 = 0.5/(R*wc1);
H2 = (1/(R^2*c1*c2))./((w*j).^2+2/(R*c1)*(w*j)+1/(c1*c2*R^2));
%High pass
c = 15e-9;
fc2 = 4500;
wc2 = 2 * pi * fc2;
km = 1 / (c * wc2);
R1 = 0.5*km;
R2 = 2*km;
H3 = ((w*j).^2)./((w*j).^2+2/(R2*c)*(w*j)+1/(R1*R2*c^2));
H = (H1.*H2+H3)*10;
%Graph
subplot(2,1,1)
semilogx(f, 20*log10(abs(H)))
grid
xlabel('f (Hz)')
ylabel(' |H(f)| dB ')
subplot(2,1,2)
semilogx(f, angle(H))
grid
xlabel('f (Hz)')
ylabel('H(f)')

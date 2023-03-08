%Pierwszy etap z pierwszym wykresem 
N = 10000;
x = rand(N,1);
y = rand(N,1);
rr=x.^2+y.^2;
xunit=0:1/10000:1;
yunit=sqrt(1-xunit.^2);
pod = rr < 1;
nad = rr >= 1;
subplot(2,3,1);
plot(xunit, yunit, 'k', 'LineWidth', 1.5);
hold on;
plot(x(pod),y(pod),'.r');
hold on;
plot(x(nad),y(nad),'.b');
axis([0 1 0 1])
title('Losowe X Y')
ylabel('Y')
xlabel('X')

%Drugi etap z drugim wykresem
subplot(2,3,[2,3]);
for i=1:10
    xn = rand(1,1);
    yn = rand(1,1);
    rrn=xn.^2+yn.^2;
    podn = rrn < 1;
    stosunekn=sum(podn);
    piprzyn=4*stosunekn;
    Tab(10,10000)=0;
    Tab(i,1)=piprzyn;
    x = [];
    y = [];
    for n=2:N
        x(end+1) = rand;
        y(end+1) = rand;
        rr=x.^2+y.^2;
        pod = rr < 1;
        stosunek=sum(pod)/n;
        piprzy=4*stosunek;
        Tab(i,n-1)=piprzy;
    end
    yp=Tab(i,:);
    xp=1:10000;
    plot(xp,yp, 'b');
    axis([0 10000 2 4]);
    hold on;
end
pip=pi;
plot(xp,pip, 'k.')
title('Estymacja Pi: 3.1466 po 10000 losowań')
ylabel('Estymacja pi')
xlabel('n')

%Trzeci etap i wykresy na dole
subplot(2,3,4);
Dane1 = Tab(:, 100:1:109);
boxplot(Dane1)
xlim([0 11]);
ylim([2 4]);
hold on;
line([0, 20], [pi, pi], 'Color', 'k', 'LineStyle', '-');
title('Po 100 losowaniach')
ylabel('Estymacja pi')
xlabel('Seria')

subplot(2,3,5);
Dane2 = Tab(:, 1000:1:1009);
boxplot(Dane2)
xlim([0 11]);
ylim([2 4]);
hold on;
line([0, 20], [pi, pi], 'Color', 'k', 'LineStyle', '-');
title('Po 1000 losowań')
ylabel('Estymacja pi')
xlabel('Seria')

subplot(2,3,6);
Dane3 = Tab(:, 9990:1:9999);
boxplot(Dane3)
xlim([0 11]);
ylim([2 4]);
hold on;
line([0, 20], [pi, pi], 'Color', 'k', 'LineStyle', '-');
title('Po 10000 losowań')
ylabel('Estymacja pi')
xlabel('Seria')

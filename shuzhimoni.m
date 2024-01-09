clear;clc;

b1 = 0.825808857855598;
d1 = 0.338097718802172;
d2 = 0.293973053026484;
d3 = 0.746313427703679;
a11 = 0.010336618343396;
a12 = 0.048447339253222;
a13 = 0.667916121573624;
a21 = 0.603467983830770;
a22 = 0.526102465795561;
a23 = 0.729709448223228;
a31 = 0.707253485315422;
a32 = 0.781377051799277;
a33 = 0.287976975614171;


tspan = 0:0.1:100; 


x0 = [0.1; 0.1; 0.1];


[t, x] = ode45(@(t,x) food_chain_ode(t, x, b1,d1,a11,a12,a13,d2,a21,a22,a23,d3,a31,a32,a33), tspan, x0);



plot(t, x(:,1), 'r', 'LineWidth', 2);  
hold on;
plot(t, x(:,2), 'g', 'LineWidth', 2);  
plot(t, x(:,3), 'b', 'LineWidth', 2);  
xlabel('Time');
ylabel('Abundance');
legend('Species 1', 'Species 2', 'Species 3');
title('Food Chain Dynamics');
grid on;



x1= -((-a23 *a32* b1 - a22* a33 *b1 + a23* a32 *d1 + a22 *a33* d1 -...
a12 *a33 *d2 + a12* a23* d3)/(...
a11* a23 *a32 + a12* a21* a33 + a11* a22* a33));

x2 = -((-a21* a33* b1 +...
a21 *a33 *d1 + a11* a33 *d2 - a11* a23* d3)/(...
a11 *a23* a32 + a12* a21* a33 + a11* a22* a33));

x3 = -((-a21* a32 *b1 +...
a21 *a32* d1 + a11* a32* d2 + a12* a21* d3 + a11* a22* d3)/(...
a11 *a23* a32 + a12 *a21 *a33 + a11* a22 *a33));

zhao1 = find(round(x(:,1), 4)-round(x1, 4)==0);
zhao2 = find(round(x(123:end,2), 4)-round(x2, 4)==0);
zhao3 = find(round(x(:,3), 4)-round(x3, 4)==0);


PIndex1= zhao1(1);
PIndex2= zhao2(1)+122;
PIndex3= zhao3(1);


ax = gca;  % 获取当前轴对象
ax_pos = ax.Position;  % 当前轴的位置和大小

x1_end = PIndex1/1001;
y1_end = x1/26;

x1_start = x1_end + 0.1;  
y1_start = y1_end + 0.1;  


annotation('arrow', [x1_start, x1_end], [y1_start, y1_end]);




x2_end = PIndex2/1001;
y2_end = x2/18;

x2_start = x2_end + 0.1;  
y2_start = y2_end + 0.1;  


annotation('arrow', [x2_start, x2_end], [y2_start, y2_end]);




x3_end = PIndex3/1001;
y3_end = x3/24;

x3_start = x3_end + 0.1;  
y3_start = y3_end + 0.1;  % 


annotation('arrow', [x3_start, x3_end], [y3_start, y3_end]);

legend1 = legend('show');
set(legend1,'Position',[0.715595235847291 0.795079362354582 0.185357145105089 0.12619047891526],'EdgeColor','none');

% Q6 (ii) and (iii)
A = [0 1 0 0;
    32.5 0 0 0;
    0 0 0 1;
    -1.5 0 0 0];
B = [0 -1 0 2]';
C = [0 0 1 0];

A_bar = [A zeros(4,1); -C 0];
B_bar = [B; 0];
C_bar = [C 0];
Q = eye(5);
R = 2;
[k, P, E] = lqr(A_bar, B_bar, Q, R);
k = -k;
kk = k(1,1:4);
ki = k(1,5);

Ak = (A_bar+B_bar*k);
t = 0:0.01:6;
[y, tout, x]=step(Ak, [zeros(4,1); 1], C_bar, 0, 1, t);
figure 
plot(t,y),grid
sgtitle('Unit step response of the design ','Interpreter','latex')
xlabel('Time [s]','Interpreter','latex')
ylabel('Unit step response','Interpreter','latex')

[y, tout, x]=step(Ak, [zeros(4,1); 1], eye(5), 0, 1, t);
x1 = [1 0 0 0 0]*y';
x2 = [0 1 0 0 0]*y';
x3 = [0 0 1 0 0]*y';
x4 = [0 0 0 1 0]*y';
x5 = [0 0 0 0 1]*y';
figure
sgtitle('Unit step response of each states ','Interpreter','latex')
subplot(5,1,1),grid
plot(t,x1)
xlabel('Time [s]','Interpreter','latex')
ylabel('Step response of $x_1$','Interpreter','latex')
subplot(5,1,2),grid
plot(t,x2)
xlabel('Time [s]','Interpreter','latex')
ylabel('Step response of $x_2$','Interpreter','latex')
subplot(5,1,3),grid
plot(t,x3)
xlabel('Time [s]','Interpreter','latex')
ylabel('Step response of $x_3$','Interpreter','latex')
subplot(5,1,4),grid
plot(t,x4)
xlabel('Time [s]','Interpreter','latex')
ylabel('Step response of $x_4$','Interpreter','latex')
subplot(5,1,5),grid
plot(t,x5)
xlabel('Time [s]','Interpreter','latex')
ylabel('Step response of $x_i$','Interpreter','latex')




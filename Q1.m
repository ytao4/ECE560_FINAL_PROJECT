A = [0 1 0 0;
    32.5 0 0 0;
    0 0 0 1;
    -1.5 0 0 0];
B = [0 -1 0 2]';
C = [0 0 1 0];
Co = ctrb(A,B);
% Q1 (i)
k = -place(A,B,[-2+2i -2-2i -3 -4]);
% Q1 (ii)
Ak = (A+B*k);
t = 0:0.01:6;
sys = ss(Ak,[],eye(4),[]);
z = initial(sys,[2; -4; 2; -3],t);
x1 = [1 0 0 0]*z';
x2 = [0 1 0 0]*z';
x3 = [0 0 1 0]*z';
x4 = [0 0 0 1]*z';
figure
sgtitle('Response to Initial Condition','Interpreter','latex')
subplot(4,1,1);plot(t,x1),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$ State\ x_1$','Interpreter','latex');
subplot(4,1,2);plot(t,x2),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$ State\ x_2$','Interpreter','latex');
subplot(4,1,3);plot(t,x3),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$ State\ x_3$','Interpreter','latex');
subplot(4,1,4);plot(t,x4),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$ State\ x_4$','Interpreter','latex');







clear, clc;
%Q5(i)
A = [0 1 0 0;
    32.5 0 0 0;
    0 0 0 1;
    -1.5 0 0 0];
B = [0 -1 0 2]';
C = [0 0 1 0];

Q = eye(4);
 % Same size as number of state variables
R = 0.1; % Same size as number of input states
[k, P, E] = lqr(A, B, Q, R);
k = -k;
[k_L, P, E] = lqr(A', C', Q, R);
k_L = -k_L;
L = k_L';
%Q5(i)
%A_new = [A+B*k*L*C, zeros(4); -L*C, A+L*C];   %system and observer 
A_new = [A B*k; -L*C A+B*k+L*C];
A_e = A+L*C;                                    %error
sys = ss(A_new, [], eye(8), []); 
sys_e = ss(A_e, [], eye(4), []);
x0 = [2 -4 2 0]';
x0_obs = [0 -1 1 2]';
x0_e = x0-x0_obs;
t = 0:0.01:6;
z = initial(sys, [x0;x0_obs],t);
z_e = initial(sys_e,x0_e,t);

x1 = [1 0 0 0 0 0 0 0]*z';
x2 = [0 1 0 0 0 0 0 0]*z';
x3 = [0 0 1 0 0 0 0 0]*z';
x4 = [0 0 0 1 0 0 0 0]*z';
x5 = [0 0 0 0 1 0 0 0]*z';
x6 = [0 0 0 0 0 1 0 0]*z';
x7 = [0 0 0 0 0 0 1 0]*z';
x8 = [0 0 0 0 0 0 0 1]*z';

e1 = [1 0 0 0]*z_e';
e2 = [0 1 0 0]*z_e';
e3 = [0 0 1 0]*z_e';
e4 = [0 0 0 1]*z_e';

figure
sgtitle('Response to Inital Condition for different states','Interpreter','latex')
subplot(4,1,1);plot(t,x1),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('State x1','Interpreter','latex');
subplot(4,1,2);plot(t,x2),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('State x2','Interpreter','latex');
subplot(4,1,3);plot(t,x3),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('State x3','Interpreter','latex');
subplot(4,1,4);plot(t,x4),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('State x4','Interpreter','latex');

figure
sgtitle('Observer response to Inital Condition for different states','Interpreter','latex')
subplot(4,1,1);plot(t,x5),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$Observer state\ \hat{x}_1$','Interpreter','latex')
subplot(4,1,2);plot(t,x6),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$Observer state\ \hat{x}_2$','Interpreter','latex')
subplot(4,1,3);plot(t,x7),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$Observer state\ \hat{x}_3$','Interpreter','latex')
subplot(4,1,4);plot(t,x8),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$Observer state\ \hat{x}_4$','Interpreter','latex')

figure
sgtitle('Observer error response to Inital Condition for different states','Interpreter','latex')
subplot(4,1,1);plot(t,e1),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$Error state\ e_1$','Interpreter','latex')
subplot(4,1,2);plot(t,e2),grid
xlabel('Time [s]','Interpreter','latex','Interpreter','latex')
ylabel('$Error state\ e_2$','Interpreter','latex')
subplot(4,1,3);plot(t,e3),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$Error state\ e_3$','Interpreter','latex')
subplot(4,1,4);plot(t,e4),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$Error state\ e_4$','Interpreter','latex')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
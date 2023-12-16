A = [0 1 0 0;
    32.5 0 0 0;
    0 0 0 1;
    -1.5 0 0 0];
B = [0 -1 0 2]';
C = [0 0 1 0];
%Q3 (i)
k_L = -place(A',C',[-1+i -1-i -2 -3]);
L = k_L';
%Q3 (ii)
AL = A+L*C;
sys = ss(AL, [], eye(4), []);
x0_e = [1 -2 2 -3]'; %x0-x0_obs = [1-0; -2-0; 2-0; -3-0]
t = 0:0.01:6;
z = initial(sys,x0_e,t);
e1 = [1 0 0 0]*z';
e2 = [0 1 0 0]*z';
e3 = [0 0 1 0]*z';
e4 = [0 0 0 1]*z';
figure
sgtitle('Observer error response to Inital Condition for different states','Interpreter','latex')
subplot(4,1,1);plot(t,e1),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$ Error state\ e_1$','Interpreter','latex')
subplot(4,1,2);plot(t,e2),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$ Error state\ e_2$','Interpreter','latex')
subplot(4,1,3);plot(t,e3),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$ Error state\ e_3$','Interpreter','latex')
subplot(4,1,4);plot(t,e4),grid
xlabel('Time [s]','Interpreter','latex')
ylabel('$ Error state\ e_4$','Interpreter','latex')


% t = 0:0.01:6;
% x0_sys = [1 -2 2 -3]';
% x0_obs = [0 0 0 0]';
% AL = A+L*C;
% % y=Cx
% As = [A, zeros(4); -L*C, AL];
% sys1 = ss(As, [], eye(8), []);
% z = initial(sys1,[x0_sys; x0_obs],t);  
% 
% z_x = z(:,1:4);
% z_x_head = z(:,5:8);
% e = z_x-z_x_head;


% figure
% title('abc')
% subplot(2,2,1);plot(t,e(:,1)),grid
% title('Observer error response to Initial Condition')
% ylabel('error x1-x1 head');
% subplot(2,2,2);plot(t,e(:,2)),grid
% title('Observer error response to Initial Condition')
% ylabel('error x1-x2 head');
% subplot(2,2,3);plot(t,e(:,3)),grid
% title('Observer error response to Initial Condition')
% ylabel('error x1-x3 head');
% subplot(2,2,4);plot(t,e(:,4)),grid
% title('Observer error response to Initial Condition')
% ylabel('error x1-x4 head');






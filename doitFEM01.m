%% 1D Elastic Rod FEM Solver
% <doitFEM.m> Mark D. Shattuck 12/10/2023
% solve -u''=delta(x-a); free-fixed w(0)=0, u(1)=0
%         Ku=f

% revision history:
% 12/10/2023 Mark D. Shattuck <mds> doitFEM.m
% 
% 12/10/2023 mds set up for PHYS 339 final
%

%%  FEM 
N=5;   % number of nodes
a=3/8; % position of delta load

dx=1/(N-1);  % size of x-spacing

% K matrix
[k,V,x]=kFEM();            % calculate k stamp
K=gKFEM(double(k),mod(0:2*(N-1)-1,2))/dx/dx;  % build global K matrix

% force vector
f=zeros(2*N,1);
for n=0:N-2
  f(2*n+(1:4))=f(2*n+(1:4))+int(V*dirac(x-(a/dx-n)),x,0,1);
end
% BC remove S0 and HN eg for N=5
%f=[0 1/8 1/2 -1/8 1/2 0 0 0]';
f=f(2:end-1);

% FEM solution
u=[0;K\f;0];

%% finite difference
[~,T]=ktbc(N-1);

% interp for delta force
ffd=zeros(N-1,1);
r=mod(a,dx);
q=fix(a/dx);
ffd(q+(1:2))=[dx-r,r]/dx;
% fd solution
u2=[T/dx/dx\ffd;0];

%% exact solution
x=0:dx/50:1;         % grid for FEM and exact
ue=((1-x).*(x>a)+(1-a).*(x<=a))*dx;

%% plot
U=evalFEM(x,u,dx);   % interp for FEM

h=plot(x,U,(0:N-1)*dx,u2,'ro--',x,ue,'k--');
set(h,'linewidth',3,'markersize',15);
set(gca,'fontsize',20);
xlabel('$x$','interp','latex');
ylabel('$u(x)$','interp','latex');
%% simple fem
N=6;  % num nodes
dx=1/(N-1); % node spacing
f=[1/2;ones(4,1)];  % force

%% build matrix
K=toeplitz([2 -1 zeros(1,N-3)]);
K(1,1)=1;

%% exact
xx=0:.01:1;
ue=(1-xx.^2)/2;

%% fem soln
x=0:dx:1;
u=K/dx^2\f;

%% plot
plot(xx,ue,x,[u;0],'o')

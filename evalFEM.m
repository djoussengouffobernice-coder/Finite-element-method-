function [U,S,H]=evalFEM(x,u,dx,H,S)
% evalFEM <Find value of C1 cubic FEM>
% Usage:: [U,S,H]=evalFEM(x,u,dx[1],...
%   H[@(x) (2*abs(x)+1).*(abs(x)-1).^2.*(abs(x)<1)],...
%   S[@(x) x.*(abs(x)-1).^2.*(abs(x)<1)])
%

% revision history:
% 12/10/2023 Mark D. Shattuck <mds> evalFEM.m

%% Parse Input
if(~exist('dx','var') || isempty(dx))
	dx=1;
end

if(~exist('H','var') || isempty(H))
	H=@(x) (2*abs(x)+1).*(abs(x)-1).^2.*(abs(x)<1);
end

if(~exist('S','var') || isempty(S))
	S=@(x) x.*(abs(x)-1).^2.*(abs(x)<1);
end

%% Main
N=length(u)/2;
U=0;
for n=0:N-1; 
  U=U+u(2*n+1)*S(x/dx-n)+u(2*n+2)*H(x/dx-n); 
end; 


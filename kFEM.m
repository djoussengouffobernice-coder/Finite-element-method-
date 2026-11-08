function [k,V,x,dV]=kFEM(V,x)
% lkFEM <Calculate local k matrix>
% Usage:: [k,V]=lkFEM(V[[x.*(x-1).^2;...
%                       (2*x+1).*(x-1).^2;...
%                       (x-1).*x.^2;...
%                      -(2*x+1).*(x-1).^2]]
%

% revision history:
% 12/10/2023 Mark D. Shattuck <mds> kFEM.m

%% Parse Input
if(~exist('x','var') || isempty(x))
  syms x;
end
if(~exist('V','var') || isempty(V))
	V=[x.*(x-1).^2;...
    (2*x+1).*(x-1).^2;...
    (x-1).*x.^2;...
   1-(2*x+1).*(x-1).^2];
end

%% Main

dV=simplify(diff(V,x));
k=int(dV*dV.',x,0,1);



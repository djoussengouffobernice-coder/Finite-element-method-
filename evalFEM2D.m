function [U,H]=evalFEM2D(x,u,T,H)
% evalFEM2D <Find value of FEM C0 tri-mesh.>
% Usage:: [U,H]=evalFEM2D(xx,u,tri,H[@(xx)])
%

% revision history:
% 12/09/2024 Mark D. Shattuck <mds> evalFEM2D.m

%% Parse Input
if(~exist('H','var') || isempty(H))
	H=@(x) x;
end

%% Main

ABC=[-1 -1]/T;
U=u*(ABC*(x+T));





function [K,T,B,C]=ktbc(N)
% ktbc <Special 2nd diff matrices(base on Strang(MIT) lecture.>
% Usage:: [K,T,B,C]=ktbc(N[5])
%

% revision history:
% 09/17/2023 Mark D. Shattuck <mds> ktbc.m
%            mds Based on G. Strang(MIT) lecture 1 18.085

%% Parse Input
if(~exist('N','var') || isempty(N))
	N=5;
end

%% Main
K=toeplitz([2 -1 zeros(1,N-2)]);
T=K; T(1,1)=1;
B=T; B(N,N)=1;
C=K; C(1,N)=-1;C(N,1)=-1;


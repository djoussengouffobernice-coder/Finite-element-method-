function K=gKFEM(k,C)
% gKFEM <Calculate global K matrix>
% Usage:: K=gKFEM(k,C[mod(0:7,2)]]
%

% revision history:
% 12/10/2023 Mark D. Shattuck <mds> gKFEM.m

%% Parse Input
if(~exist('C','var') || isempty(C))
	C=mod(0:7,2);
end

%% Main
K=conv2(diag(C),k,'same');


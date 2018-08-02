% Copyright 2018 National Institute of Advanced Industrial Science and Technology (AIST)
% 
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
% 
%    http://www.apache.org/licenses/LICENSE-2.0
% 
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

function sparsity = Sparsity_Hoyer(CoefMatrix)

% CoefMatrix_full = full(CoefMatrix);
[I,J]=size(CoefMatrix);
sqrtn = sqrt(I);
Sparsity=zeros(1,J);
for i=1:J
   norm1 = norm(CoefMatrix(:,i),1);
   norm2 = norm(CoefMatrix(:,i),2);
   if norm1==0
       Sparsity(i)=0;
   else
       Sparsity(i)=(sqrtn-norm1/norm2)/(sqrtn-1);
   end
end
sparsity = mean(Sparsity);
% CoefMatrix_full = CoefMatrix;
% norm1 = norm(abs(CoefMatrix_full(:)),1);
% norm2 = norm(CoefMatrix_full(:),2);
% num = numel(CoefMatrix_full);
% Sparsity_y1_y2=(sqrt(num)-(norm1/norm2))/(sqrt(num)-1);

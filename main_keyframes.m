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


v = VideoReader('Jumps.mp4');
num_frames = fix(v.Duration) * fix(v.FrameRate);
%num_frames = min(round(v.Duration * v.FrameRate), max_frames);
X = zeros(v.Height, v.Width, 3, num_frames, 'uint8');
vec = @(x) x(:);
scale = 1 / 10;
h = v.Height * scale;
w = v.Width * scale;
Y = zeros(h * w, num_frames);
f = 1;
while f <= num_frames && hasFrame(v)
  X(:, :, :, f) = readFrame(v);
  Y(:, f) = vec(imresize(rgb2gray(im2double(X(:, :, :, f))), scale));
  f = f + 1;
end
param.maxiter=3;
param.alpha=0;%0.5
%param.Data=normrows(Data);
%Y=Ys;
n=Y;
param.Data=n;
[dn,dm]=size(n);
coefs1=rand(dm/5,dm);
coefs2=zeros(4*dm/5,dm);
coefs=[coefs1;coefs2];
[p, q]=size(coefs1);
param.TrueDictionary=n;
param.Coefs=coefs;
param.mu=0;
param.tol =0;%1e-16;
param.pp=0;
YY=n;

%%det
[ind, D1, Z, obj, parm] = DCA_func_fastnmf_4_k(YY,param);

valid_ind = ind;%(sum(Y(:, ind)) > 0);
I = length(valid_ind);
H = h/scale;
W = w/scale;
tile = zeros(H, W * I, 3, class(X));
for i = 1:I
  tile(:, (1:W) + (i - 1) * W, :) = X(:, :, :, valid_ind(i));
end
 TT=tile(:,:,1);
 figure;
 image(tile)

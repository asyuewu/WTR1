%WTR1 Additive Gaussian white noise removing (see [1]).
%   Z = WTR1(Y, Sigma, peakval, print) estimates the noise-free image.
%
%   Dependencies:
%
%   BM3D MATLAB software v2.0 (see [2])
%
%   Input Arguments:
%
%   'Y'       - Noisy image, specified as a grayscale or color image.
%
%   'Sigma'   - Noise standard deviations, specified as a c-element vector
%               where c is the number of channels.
%
%   'peakval' - Peak signal level, specified as a scalar. The default value
%               is chosen based on the input image Y.
%
%   'print'   - Print information, specified as a logical variable. The
%               default value is 0.
%
%   Output Arguments:
%
%   'Z'       - Estimated image.
%
%   Example 1
%   ---------
%       addpath('BM3D');
%       if ~exist('BM3D.m', 'file')
%           unzip('http://www.cs.tut.fi/~foi/GCF-BM3D/BM3D.zip', 'BM3D');
%       end
%       if isempty(gcp('nocreate')); parpool(); end
%       X = double(rgb2gray(imread('onion.png')));
%       sigma = 25;
%       Y = X + randn(size(X)) * sigma;
%       Z = WTR1(Y, sigma, 255);
%       peaksnr = psnr(X, Z, 255);
%       fprintf('The PSNR value is %0.2f\n', peaksnr);
%
%   Example 2
%   ---------
%       addpath('BM3D');
%       if ~exist('BM3D.m', 'file')
%           unzip('http://www.cs.tut.fi/~foi/GCF-BM3D/BM3D.zip', 'BM3D');
%       end
%       if isempty(gcp('nocreate')); parpool(); end
%       X = double(imread('onion.png'));
%       Sigma = [25 15 35];
%       Y = zeros(size(X));
%       for c = 1 : 3
%           Y(:,:,c) = X(:,:,c) + randn(size(X(:,:,c))) * Sigma(c);
%       end
%       Z = WTR1(Y, Sigma, 255);
%       peaksnr = psnr(X, Z, 255);
%       fprintf('The PSNR value is %0.2f\n', peaksnr);
%
%   References:
%   -----------
%   [1] Y. Wu, L. Fang, and S. Li, "Weighted Tensor Rank-1 Decomposition
%       for Nonlocal Image Denoising," IEEE Transactions on Image
%       Processing, vol. 28, no. 6, pp. 2719-2730, Jun. 2019.
%   [2] K. Dabov, A. Foi, V. Katkovnik, and K. Egiazarian, "Image Denoising
%       by Sparse 3-D Transform-Domain Collaborative Filtering," IEEE
%       Transactions on Image Processing, vol. 16, no. 8, pp. 2080-2095,
%       Aug. 2007.

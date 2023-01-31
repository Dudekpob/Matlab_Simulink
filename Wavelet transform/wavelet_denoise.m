function [sigDEN,wptDEN] = wavelet_denoise(SIG)
% FUNC_DENOISE_WP1D Saved Denoising Process.
%   SIG: vector of data
%   -------------------
%   sigDEN: vector of denoised data
%   wptDEN: wavelet packet decomposition (wptree object)

%  Auto-generated by Wavelet Toolbox on 27-Jan-2023 22:29:29

% Analysis parameters.
%---------------------
Wav_Nam = 'haar';
Lev_Anal = 3;
Ent_Nam = 'shannon';
Ent_Par = 0;

% Denoising parameters.
%----------------------
% meth = 'sqtwologuwn';
sorh = 'h';    % Specified soft or hard thresholding
thrSettings = {sorh,'nobest',137.249426228308891,1};

% Decompose using WPDEC.
%----------------------
wpt = wpdec(SIG,Lev_Anal,Wav_Nam,Ent_Nam,Ent_Par);

% Nodes to merge.
%-----------------
n2m = [];
for j = 1:length(n2m)
    wpt = wpjoin(wpt,n2m(j));
end

% Denoise using WPDENCMP.
%------------------------
[sigDEN,wptDEN] = wpdencmp(wpt,thrSettings{:});

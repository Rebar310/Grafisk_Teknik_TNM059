function ut=fargraster(in, metod)
%% LAB2, TASK3
%% Rastrerar en färgbild
%
% Rastrerar färgbilden, in, antingen enligt felspridning eller IMCDP.
%
% Observera att inbilden (in) är tänkt att vara normaliserad mellan 0 och
% 1.
%% Who has done it:
%
% Author: Rebecca Arkhed - rebar310 (Same LiU-ID and name as in the Lisam submission)
% Co-author: Adna Maric - adnma186
% (You can work in groups of max 2, this is the LiU-ID/name of
% the other member of the group)
%
%% Syntax of the function
%      Input arguments:
%           in: the original input color image of type double scaled
%               between 0 and 1
%           metod: a string specifying which halftoning method should be
%           used. If method is 'errordif' then error diffusion should be
%           used. If method is 'imcdp' then IMCDP should be
%           used. Otherwise, a message has to be written.
%      Output arguments:
%            ut: The halftoned image
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: today
%
% Gives a history of your submission to Lisam.
% Version and date for this function have to be updated before each
% submission to Lisam (in case you need more than one attempt)
%
%% General rules
%
% 1) Don't change the structure of the template by removing %% lines
%
% 2) Document what you are doing using comments
%
% 3) Before submitting make the code readable by using automatic indentation
%       ctrl-a / ctrl-i
%
% 4) your code should work for any given input arguments, if they are
%    fulfilling the conditions specified in the syntax of the function
%
% 5) Often you must do something else between the given commands in the
%       template
%
%% Here starts your code.
% Write the appropriate MATLAB commands right after each comment below.
%
%% Separating the input color image into its three channels
%
R = in(:,:,1); % The red channel of the input image
G = in(:,:,2); % The green channel of the input image
B = in(:,:,3); % The blue channel of the input image
%
%
%% Check which method to be used
%
if strcmp(metod, 'errordif')
    % Halftone each channel separately by errordif (use Floyd-Steinberg's filter),
    % and then collect them in a color image, which is the output
    % of this function, called ut.
    
    % Define Floyd-Steinberg error diffusion filter
    fs_filter = [0 0 7; 3 5 1] / 16;
    
    % Apply error diffusion to each color channel separately
    R_raster = errordif(R, fs_filter);
    G_raster = errordif(G, fs_filter);
    B_raster = errordif(B, fs_filter);
    
    % Combine the halftoned channels into a color image
    ut = cat(3, R_raster, G_raster, B_raster);

elseif strcmp(metod, 'imcdp')
    % Halftone each channel separately by imcdp, and then collect them in
    % a color image, which is the output of this function, called ut.
    
    % Apply IMCDP method to each color channel separately
    R_raster = imcdp(R);
    G_raster = imcdp(G);
    B_raster = imcdp(B);
    
    % Combine the halftoned channels into a color image
    ut = cat(3, R_raster, G_raster, B_raster);

else
    % If the method is neither 'errordif' nor 'imcdp', write a message and set
    % the output ut to zero.
    ut = 0;
    disp('Error: This function can only perform halftoning using ''errordif'' or ''imcdp''.');
end

%% Test your code
% Notice that your code has to work for any color image of any size.
% Notice that your input image (in) is supposed to be normalized between 0 and
% 1, so don't forget to do that before you call this function.
%
%% MRI Fuzzy Segmentation of Brain using Neighborhood Extraction
%
% Paper Authors: Shan Shen, William Sandham, et al.
%
% Implementation by: Haseeb, Bhavishey, Dishant
%
%
%% 1) Formulation
% 
% TODO: Add clear description of problem to be solved
% 
% Precise segmentation of the brain is important for detection of tumors,
% edema, and necrotic tissues so that proper diagnosis and treatment can be 
% provided. However, segmentation techniques such as thresholding, which rely
% heavily on the high contrast resolution are prone to limitations due to the 
% complex distribution of tissue intensities in MRI images. 
% The large number of intensities makes it difficult to determinine appropriate
% thresholds.
%
% As a result of these limitations, thresholding must be combined with other 
% segmentation methods such as fuzzy-c-means (FCM) clustering or 
% expectation-maximization (EM). However, both FCM and EM are extremely prone
% to the effects of noise and statistical estimation of noise, as Gaussian, is
% invalid during MRI segmentation. In fact, the process of segmentation itself
% introduces further noise.
%
% A second problem associated with FCM is the lack of consideration for spatial 
% dependence. Pixels are associated with a cluster based solely on pixel 
% intensity values, which are heavily impacted by noise. 
% Hence, clustering that provides robust and 
% consistent segmentation in the presence of unknown noise is desired.
% 
% 
%
%
%% 2) Proposed Solution
%
% TODO: Add overall algorithmic workflow of proposed solution
%
% The proposed algorithm termed "improved fuzzy c-means" (IFCM) reduces 
% the effect of noise on FCM by considering a neighborhood of pixel intensities
% and distances to a centroid, as opposed to individual pixel 
% intensities and distances to a centroid. This algorithm improves two key
% factors in Neighborhood Attraction:
%
% * feature differences between neighboring pixels
% * relative locations of neighboring pixel
% 
% The membership function of vector $\mathbf{x}_j$ to ${i}^{th}$ cluster is given by:    
% $$ \mathbf{u}_{i_j} =\frac{1}{ \sum_{k=1}^{C}(\frac{\mathrm{d (x_j{}, v_i{})} }{\mathrm{d} (x_j{}, v_k{}) })^{2/m-1} } $$
%
% The i'th cluster center is:
% $$ \mathbf{v}_i = \frac{ \sum_{j=1}^{N}(u_{ij})^{m} \mathbf{x}_j }{ \sum_{j=1}^{N}(u_{ij})^{m} } $$
%
%
%% 3) Data Sources
% 
% TODO: description of problem synthesis/parameters
%
% A brain MRI with a tumour and noticable salt-pepper noise is acquired from 
% Figure3 of <http://www.ajnr.org/content/27/3/475/tab-figures-data>
%
% This image is then subjected to additive noise with a tunable parameter, alpha
% to produce 2 noisy copies.
      
  f1 = im2double(imread('brain-tumour-mri.gif'));
  f1 = im2double(f1);
  f1=f1(135:250,215:330);    
  subplot(1,3,1), imshow(f1);

  alpha = 0.4;
  noise = rand(size(f1));
  f2 = f1 .+ alpha*noise;
  subplot(1,3,2), imshow(f2);

  alpha = 0.7;
  f3 = f1 .+ alpha*noise;
  subplot(1,3,3), imshow(f3);
    
%% 4) Solution
% 
% TODO: Necessary details on structure of algorithm 
% TODO: Add actual implementation code
%
% 
% 

%
%
%% 5) Visualization of Results
% 
% TODO: Plot images here
%
% 
% 
%
%
%% 6) Analysis and Conclusion
% 
% TODO: Answer some questions
%
% 1) Have you been able to reproduce results reported in paper?
%           
% 2) Did algorithm behave in a predictable way (as described by authors)?
%
% 3) Do your own conclusions support those made by the authors?
%
% 4) What are the drawbacks (if any) of the proposed solution? 
% 
%
%
%% 7) Custom source files
% 
% N/A
%
% 
% 
%
%
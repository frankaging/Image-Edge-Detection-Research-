function E = edgeLink(M, J, theta)

% Arguments:
%             M  - image to be thresholded (assumed to be non-negative)
%             upper_th  - upper threshold value (will be define inside the function)
%             lower_th  - lower threshold value (will be define inside the function)
%
% Returns:
%             bw  - the thresholded image (containing values 0 or 1)

% upper_th and lower_th reversed - swap values

upper_th = 7;
lower_th = 4;

if upper_th < lower_th    
	tmp = upper_th;
	upper_th = lower_th; 
	lower_th = tmp;
end


    above_lower = M > lower_th;                     % Edge points above lower
                                           % threshold. 
    [above_upper_r, above_upper_c] = find(M > upper_th);  % Row and colum coords of points
                                           % above upper threshold.
					   
    % Obtain all connected regions in above_lower that include a point that has a
    % value above upper threshold
    E = bwselect(above_lower, above_upper_c,above_upper_r, 8);
    
end

    %% Setting Up

    %Input:
    %
    % J       - The magnitude of derivatives
    %
    % theta   - Image containing feature normal orientation angles in degrees
    %             (0-180), angles positive anti-clockwise.
    %
    %Output:
    %
    % M       - Non maximally suppressed image.
    %
    %Global Variables:
    %
    % radius  - Distance in pixel units to be looked at on each side of each
    %             pixel when determining whether it is a local maxima or not.
    %             This value cannot be less than 1.Through out research, radius
    %             is usually between 1.2~1.5

    %% Non Maximally Suppression

    function M = nonMaxSup(J, theta)
    
    % Setting Up For Function
    if any(size(J) ~= size(theta))
      error('image and orientation image are of different sizes');
    end

    [rows, cols] = size(J);
    M = zeros(rows, cols);
    radius = 1.2;
    iradius = ceil(radius);

    % Precalculate x and y offsets relative to centre pixel for each orientation angle 

    angle = [0:180].*pi/180;    % Array of angles in 1 degree increments (but in radians).
    xoff = radius*cos(angle);   % x and y offset of points at specified radius and angle
    yoff = radius*sin(angle);   % from each reference position.

    hfrac = xoff - floor(xoff); % Fractional offset of xoff relative to integer location
    vfrac = yoff - floor(yoff); % Fractional offset of yoff relative to integer location
    theta = fix(theta)+1;     % Orientations start at 0 degrees but arrays start
                                % with index 1.

    % Now run through the image interpolating grey values on each side
    % of the centre pixel to be used for the non-maximal suppression.

    for row = (iradius+1):(rows - iradius)
      for col = (iradius+1):(cols - iradius) 

        or = theta(row,col);   % Index into precomputed arrays
        x = col + xoff(or);     % x, y location on one side of the point in question
        y = row - yoff(or);

        fx = floor(x);          % Get integer pixel locations that surround location x,y
        cx = ceil(x);
        fy = floor(y);
        cy = ceil(y);
        tl = J(fy,fx);    % Value at top left integer pixel location.
        tr = J(fy,cx);    % top right
        bl = J(cy,fx);    % bottom left
        br = J(cy,cx);    % bottom right

        upperavg = tl + hfrac(or) * (tr - tl);  % Now use bilinear interpolation to
        loweravg = bl + hfrac(or) * (br - bl);  % estimate value at x,y
        v1 = upperavg + vfrac(or) * (loweravg - upperavg);

      if J(row, col) > v1 % We need to check the value on the other side...

        x = col - xoff(or);     % x, y location on the `other side' of the point in question
        y = row + yoff(or);

        fx = floor(x);
        cx = ceil(x);
        fy = floor(y);
        cy = ceil(y);
        tl = J(fy,fx);    % Value at top left integer pixel location.
        tr = J(fy,cx);    % top right
        bl = J(cy,fx);    % bottom left
        br = J(cy,cx);    % bottom right
        upperavg = tl + hfrac(or) * (tr - tl);
        loweravg = bl + hfrac(or) * (br - bl);
        v2 = upperavg + vfrac(or) * (loweravg - upperavg);

        if J(row,col) > v2            % This is a local maximum.
          M(row, col) = J(row, col); % Record value in the output
                                            % image.
        end

        end

       end
    end
      
    
    
    
    %skel = bwmorph(M>0,'skel',Inf);
    %M = M.*skel;
    end






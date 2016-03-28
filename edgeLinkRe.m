function Emap = edgeLinkRe(theta_normal_m,currentRow, currentCol, visitMap, M, lower_th, rM, cM, rr, cc, first)

theta_normal = theta_normal_m(currentRow, currentCol);




%% Recursion Stop Conditions:
if (visitMap(currentRow, currentCol) == 1 || currentRow > rr || currentCol > cc) && first ~= 1 
    
    Emap(currentRow, currentCol) = 1;
    return
end


first = 0;



%% If not visit then starts recursing
visitMap(currentRow,currentCol) = 1;


if theta_normal > 90 && theta_normal < 135
    if M(currentRow-1,currentCol) > lower_th
        Emap(currentRow, currentCol) = 1;
        Emap = Emap + ...
            edgeLinkRe(theta_normal_m,currentRow-1, currentCol, visitMap, M, lower_th, rM, cM, rr, cc, first) ;
        
    end
    if M(currentRow+1, currentCol) > lower_th
        
        Emap(currentRow, currentCol) = 1;
        Emap = Emap + ...
            edgeLinkRe(theta_normal_m,currentRow+1, currentCol, visitMap, M, lower_th, rM, cM, rr, cc, first);
    end
    
    
end




if theta_normal >= 135 && theta_normal < 180
    
    if M(currentRow-1,currentCol-1) > lower_th
        
        
                Emap(currentRow, currentCol) = 1;
        Emap = Emap  + ...
            edgeLinkRe(theta_normal_m,currentRow-1, currentCol-1, visitMap, M, lower_th, rM, cM, rr, cc, first);
    end
    
    if M(currentRow+1,currentCol+1) > lower_th
        
        edgeLinkRe(theta_normal_m,currentRow, currentCol, visitMap, M, lower_th, rM, cM, rr, cc) + ...
            edgeLinkRe(theta_normal_m,currentRow+1, currentCol+1, visitMap, M, lower_th, rM, cM, rr, cc, first);
    end
    
end



if theta_normal >= 180 && theta_normal < 225
    
    if M(currentRow,currentCol-1) > lower_th
        
        Emap(currentRow, currentCol) = 1;
        Emap = Emap + ...
            edgeLinkRe(theta_normal_m,currentRow, currentCol-1, visitMap, M, lower_th, rM, cM, rr, cc, first);
    end
    
    if M(currentRow, currentCol+1) > lower_th
         Emap(currentRow, currentCol) = 1;
        Emap = Emap + ...
            edgeLinkRe(theta_normal_m,currentRow, currentCol+1, visitMap, M, lower_th, rM, cM, rr, cc, first);
    end
    
    
    
end



if theta_normal >= 225 && theta_normal <= 270
    if M(currentRow+1,currentCol-1) > lower_th
        
             Emap(currentRow, currentCol) = 1;
        Emap = Emap + ...
            edgeLinkRe(theta_normal_m,currentRow+1, currentCol-1, visitMap, M, lower_th, rM, cM, rr, cc, first);
    end
    
    if M(currentRow-1, currentCol+1) > lower_th
        
        Emap(currentRow, currentCol) = 1;
        Emap = Emap + ...
            edgeLinkRe(theta_normal_m,currentRow-1, currentCol+1, visitMap, M, lower_th, rM, cM, rr, cc, first);
    end
    
end

end








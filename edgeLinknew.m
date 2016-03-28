        function E = edgeLinknew(M, J, theta)

        upper_th = 7;
        lower_th = 0.1;



[r,c] = size(M);
E = zeros(r,c);
        
        
    theta_normal_m = theta + 90;

    for i = 1:(r-1)
        for j = 1:(c-1)
            
            if M(i,j) > upper_th
                E(i,j) = 1;
                theta_normal= theta_normal_m(i,j);

                
                    
                    
                    if theta_normal > 90 && theta_normal < 135
                        
                        if M(i-1,j) > lower_th
                            E(i-1,j) = 1;
                        end
                        
          
                        
                        if M(i+1, j) > lower_th
                            E(i+1,j) = 1;
                        end
                        

                        
                    end
                   
                    
                            

                    if theta_normal >= 135 && theta_normal < 180 
                        
                        if M(i-1,j-1) > lower_th
                            E(i-1,j-1) = 1;
                        end
                        
 
                        
                        if M(i+1,j+1) > lower_th
                            E(i+1,j+1) = 1;
                        end
                            
                    end
                    
                        

                    if theta_normal >= 180 && theta_normal < 225 
                         
                        if M(i,j-1) > lower_th
                            E(i,j-1) = 1;
                        end
                        

                        
                        if M(i, j+1) > lower_th
                            E(i,j+1) = 1;
                        end
                        

                    end
                    
                        

                    if theta_normal >= 225 && theta_normal <= 270
                        
                        if M(i+1,j-1) > lower_th
                            E(i+1,j-1) = 1;
                        end
                        
                        if M(i+1,j) > lower_th
                            E(i+1,j) = 1;
                        end
                        
                        if M(i-1, j+1) > lower_th
                            E(i-1,j+1) = 1;
                        end
                        
                        if M(i-1, j) > lower_th
                            E(i-1,j) = 1;
                        end
                        
                    end
                    



                



        end
        end
        end
        end
        

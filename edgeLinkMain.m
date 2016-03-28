function E = edgeLinkMain(M, J, theta)


[rr,cc] = size(M);
theta_normal_m = theta + 90;
E = zeros(rr,cc);
Emap = zeros(rr,cc);
visitMap = zeros(rr,cc);


upper_th = 8;
lower_th = 6;


if upper_th < lower_th    
	tmp = upper_th;
	upper_th = lower_th; 
	lower_th = tmp;
end

[rM,cM] = (find(M > upper_th));

visitMap = M > upper_th;

for i = 1 : size(rM)

    first = 1;
    E(rM(i),cM(i)) = 1;
    E = edgeLinkRe(theta_normal_m,rM(i), cM(i), visitMap, M, lower_th,  rM, cM, rr, cc, first);
    E = E + E;
    
end






end
%% Paley type 2 construction 
% you have to make sure that N = 2^k * (p^m +1 )  is a multiple of 4
%example of N = 100 = 2 * ( 7^2 +1) 
k=1;
p=7; 
m=2;
prim_poly = gfprimdf(m,p);
field1 = gftuple([-1:p^m-2]',m,p);
[field2,expform] = gftuple([-1:p^m-2]',prim_poly,p);
%%
gfpretty(prim_poly)
%%
[tp,exp_prim] = gftuple(prim_poly,m,p) ;
field =field2;
polyresidues = [];
for i =1:p^m
    for j =1:p^m
        if (i~=j)
            sub_ij = gfsub(expform(i),expform(j), field);
            %sub_ij = gfsub(field(i,:), field(j,:), field);
            sqr_ij = gfmul(sub_ij,sub_ij, field);
            %div_ij = gfdiv(sqr_ij, exp_prim,field);
            polyresidues = vertcat(polyresidues,sqr_ij);

        end 

    end 
end 
N=p^m+1;
H = ones(N,N);
 
    for i=2:N
        H(i,i) =-1;
    end
    
    for i=2:N
        for j=2:N
            if ~ismember(gfsub(expform(j-1),expform(i-1), field),polyresidues)
                H(i,j) = -1; 
                
            end

        end
    end 
%% Jacobsthal matrix of field Fq
q=p^m;
Q = zeros(q,q);

for i=1:q
    for j=1:q
        if (i ~= j)
            if ismember(gfsub(expform(j),expform(i), field),polyresidues)
                Q(i,j) = 1;
            else
                Q(i,j) = -1; 
            end
        end 
    end
end
%%
% this is enough if N = 2*(p^m+1)
B= ones(N,N);
B(1,1) = 0 ; 
B(2:N,2:N) = Q ; 
H = kron(B,hadamard(2)) + kron(eye(N),rot90(fliplr(-hadamard(2)),-1));
%% 
% check the orthogonality of H
((H.' * H)/(length(H))) == eye(length(H))
% it should give all ones
%%
% If N = 2^k *(p^m+1) and k>=2 then 
H_new = kron(H,hadamard(2^(k-1)) ); 
%%
% check the orthogonality of H_new
((H_new.' * H_new)/(length(H_new))) == eye(length(H_new)) 
% it should give all ones
N=72;
H= paley1(72);

((H.' * H)/N) == eye(N)
%%
function H = paley1(N)
% Get largest prime number (<N)
p = primes(N-1);
p = p(end);

% Check whether N is a correct Paley type I matrix order
if (mod(N-1,4) == 3) && (p == N-1)

    % Determine quadratic residues
    qres = mod([1:N-2].^2, (N-1));
    
    H = ones(N,N);
    
    for i=2:N
        H(i,i) =-1;
    end
    
    for i=2:N
        for j=2:N
            if (j > i)
                if ~ismember(j-i,qres)
                    H(i,j) = -1; 
                else 
                    H(j,i) = -1;
                end
            end
            

        end
    end 



    
    % Check whether the computed matrix is a correct Hadamard matrix 
    % (This test may be omitted. When I tested the function for every valid 
    % matrix order N<=5000 all generated matrices were correct H-matrices.) 
    if ((H.' * H)/N) ~= eye(N)
        disp(['H_', num2str(N),' is not a correct Hadamard matrix.']);
        H = 0;
    end
    
else

    disp(['N = ', num2str(N),' is not a valid Paley type I matrix order.']);
    H = 0;
    
end



end
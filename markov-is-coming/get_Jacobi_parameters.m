function [G, c] = get_Jacobi_parameters(Link)

[nr_linii, nr_coloane] = size(Link);

% initializează matricea G cu valori nule
G = zeros(nr_linii - 2, nr_coloane - 2);

% adaugă elementele din Link în matricea G fără ultimele două linii și fără ultimele două coloane
for i = 1:nr_linii - 2
    for j = 1:nr_coloane - 2
        G(i,j) = Link(i,j);
    endfor
endfor

% inițializează vectorul c cu valori nule
c = zeros(nr_linii - 2, 1);

% adaugă penultimul rând din matricea Link în vectorul c
c = Link(nr_linii-1, 1:nr_coloane - 2)';

% adaugă penultima coloană din matricea Link în vectorul c
c = Link(1:nr_linii - 2, nr_coloane - 1);

endfunction

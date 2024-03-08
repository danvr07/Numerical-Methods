function [Link] = get_link_matrix(Labyrinth)
    % Dimensiunea matricii
    [m, n] = size(Labyrinth);

        % Numarul total de noduri din graf
    N = m * n + 2;
    % Se intializeaza matricea cu 0
    Link = zeros(N, N);


    for i = 1:m
        for j = 1:n
            nr_cai = 0;
            indx = (i - 1 ) * n + j
            % Se verifica numarul cailor posibile
            if bitget(Labyrinth(i, j), 4) == 0
                nr_cai += 1;
            endif
            if bitget(Labyrinth(i, j), 3) == 0
                nr_cai += 1;
            endif
            if bitget(Labyrinth(i, j), 2) == 0
                nr_cai += 1;
            endif
            if bitget(Labyrinth(i, j), 1) == 0
                nr_cai += 1;
            endif

    % Aici am folosit codul de la functia de adiacenta
    %Doar ca va primi valorile 1 supra numarul de cai pos.
            if bitget(Labyrinth(i, j), 4) == 0
                if i == 1
                    Link(indx, m * n + 1) = 1/nr_cai;
                else
                    Link(indx, indx -n) = 1/nr_cai;
                endif
            endif
            if bitget(Labyrinth(i, j), 3) == 0
                if i == m
                    Link(indx, m * n + 1) = 1/nr_cai;
                else
                    Link(indx, indx +n) = 1/nr_cai;
                endif
            endif
            if bitget(Labyrinth(i, j), 2) == 0
                if j == n
                    Link(indx, m * n + 2) = 1/nr_cai;
                else
                    Link(indx, indx+1) = 1/nr_cai;
                endif
            endif
            if bitget(Labyrinth(i, j), 1) == 0
                if j == 1
                    Link(indx, m * n + 2) = 1/nr_cai;
                else
                    Link(indx, indx - 1) = 1/nr_cai;
                endif
            endif
        endfor
    endfor
    Link(m * n + 1, m * n + 1) = 1;
    Link(m * n + 2, m * n + 2) = 1;

endfunction

function [Adj] = get_adjacency_matrix(Labyrinth)

% Dimensiunea matricii
    [m,n] = size(Labyrinth);
    % Numarul total de noduri din graf
    N = m * n+  2;
    % Se intializeaza matricea cu 0
    Adj = zeros(N,N);
    % Se itereaza pe linii si coloane
    for i = 1:m
        for j = 1:n
            indx = (i - 1) * n + j;
            cell = Labyrinth(i,j);
            if bitget(cell, 4) == 0 % nord
            % Verifică dacă suntem la marginea de nord a labirintului.
                if i == 1
                    Adj(indx, m * n + 1) = 1;
                else
                    Adj(indx, indx - n) = 1;
                end
            end
            if bitget(cell, 3) == 0 % sud
            % Verifică dacă suntem la marginea de sud a labirintului.
                if i == m
                    Adj(indx, m*  n + 1) = 1;
                else 
                    Adj(indx, indx + n) = 1;
                end
            end
            if bitget(cell,2) == 0 % est
                if j == n
                    Adj(indx, m * n + 2) = 1;
                else
                    Adj(indx, indx + 1) = 1;
                end
            end
            if bitget(cell,1) == 0 % vest
                if j == 1
                    Adj(indx, m * n + 2) = 1;
                else
                    Adj(indx, indx - 1) = 1;
                end
            end
        end
    end
    Adj(m*n +1, m*n +1) = 1;
    Adj(m*n +2, m*n +2) = 1;
end
